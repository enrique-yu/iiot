<template>
  <div>
    <div class="uploadBox">
      <div class="tableBoxTitle" v-if="isTitle">
        <div class="Titlebox1">附件名称</div>
        <div class="Titlebox2">附件要求</div>
        <div class="Titlebox3">附件信息</div>
      </div>
      <div class="tableBoxCenter" v-for="(item, index) in fileList" :key="index">
        <div class="Titlebox1">
          <div>
            <span>{{ item.fileConfigName }}</span><br />
            <span>{{ item.remark }}</span>
          </div>
        </div>
        <div class="Titlebox2" >
          <div>
           <!-- <p>
              <span>类型：</span>
              <span>{{ item.fileConfigContentType }}</span>
            </p>-->
            <p>
              <span>类型：</span>
              <span>{{ item.fileConfigSuffixName }}</span>
            </p>
            <p>
              <span>数量：</span>
              <span>{{ item.fileConfigMinNum }}个 - {{ item.fileConfigMaxNum }}个</span>
            </p>
            <p>
              <span>大小：</span>
              <span>{{ item.fileConfigMinSize }}MB - {{ item.fileConfigMaxSize }}MB</span>
            </p>
          </div>
        </div>
        <div class="Titlebox3">
          <div style="width: 100%">
              <el-upload
                v-if = "item.childrenList.length < item.fileConfigMaxNum "
                :disabled="defaultDisabled"
                ref="fileUpload"
                :multiple="multiFile"
                :action="uploadFileUrl"
                :file-list="fileList"
                :before-upload="function (file) { return handleBeforeUpload(file, item)}"
                :on-success="handleUploadSuccess"
                :show-file-list="false"
                :headers="headers"
                :data="uploadData"
                class="upload-file-uploader"
                :drag="!defaultDisabled"
              >
                <div v-if="!defaultDisabled">
                  <i class="el-icon-upload"></i>
                  <div class="el-upload__text" style="font-size:13px">将文件拖到此处，或<em>点击上传</em></div>
                </div>
              </el-upload>

              <!-- 文件列表 -->
              <div style="text-width: 100%;align: center;" >
                  <el-card class="box-card" v-for="(itemChild, inx) in item.childrenList" :key="itemChild.fileId">
                    <div class="item-info" >
                      <div class="infoIcons"  >
                        <img v-if="itemChild.fileSuffixName == 'pdf'" src="@/assets/files/file_pdf.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'txt'" src="@/assets/files/file_txt.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'xlsx' || itemChild.fileSuffixName == 'xls'" src="@/assets/files/file_xlsx.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'doc' || itemChild.fileSuffixName == 'docx'" src="@/assets/files/file_doc.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'jpg'" src="@/assets/files/file_jpg.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'png'" src="@/assets/files/file_png.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'gif'" src="@/assets/files/file_gif.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'ppt'" src="@/assets/files/file_ppt.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'rar'" src="@/assets/files/file_rar.png" />
                        <img v-else-if="itemChild.fileSuffixName == 'zip'"  src="@/assets/files/file_zip.png" />
                        <img v-else src="@/assets/files/file-unknown.png" />
                      </div>
                      <div class="infoContent">
                        <div> <span>{{ itemChild.fileName }}</span></div>
                      </div>
                    </div>
                    <div class="item-action" >
                      <div class="actionView" @click="handleFileView(itemChild, inx)">
                        <el-button type="info" icon="el-icon-view" circle></el-button>
                      </div>
                      <div class="actionDownload" @click="handleDownload(itemChild, inx)">
                        <el-button type="success" icon="el-icon-download" circle></el-button>
                      </div>
                      <div class="actionDelete" @click="handleFileRemove(item, itemChild, inx)">
                        <el-button type="danger" icon="el-icon-delete" circle></el-button>
                      </div>
                      <div class="actionEdit" @click="showEditDialog(itemChild, inx)">
                        <el-button type="primary" icon="el-icon-edit" circle></el-button>
                      </div>
                    </div>
                  </el-card>
              </div>
          </div>
        </div>
        <!-- 修改名称对话框 -->
        <el-dialog title="修改文件名" :visible.sync="editDialogVisible" width="30%" @close="closeEditDialog" :close-on-click-modal="false" >
          <el-input v-model="editedFileName" placeholder="请输入新的文件名"></el-input>
          <div class="dialog-footer">
            <el-button @click="closeEditDialog">取消</el-button>
            <el-button type="primary" @click="saveEditedName">保存</el-button>
          </div>
        </el-dialog>

      </div>
    </div>
  </div>
</template>

<script>
  import { getPublicKey } from '@/api/login';
  import { encrypt } from '@/utils/jsencrypt';
  import { getToken } from "@/utils/auth";
  import {getConfigDataList, onlinePreview} from "@/api/file/fileManage";
  const axios = require('axios');
  export default {
    props: {
      fileCatalogCode: { type: String },
      businessRecordId: { type: String },
      isTitle: { type: Boolean, default: true },
      defaultDisabled:{ type: Boolean, default: false }, // 是否禁用
      multiFile:{ type:Boolean, default: false }  // 是否支持多选文件
    },
    data() {
      return {
        loading: false,
        fileList: [], // 文件列表
        fileIds: [],
        baseUrl: process.env.VUE_APP_BASE_API,
        uploadFileUrl: process.env.VUE_APP_BASE_API + "/file/manage/upload", // 上传文件服务器地址
        headers: {
          Authorization: "Bearer " + getToken(),
        },
        uploadData: {},
        showProgress: {},
        uploadProgress: {},
        editDialogVisible: false, // 是否显示修改对话框
        editedFileName: '', // 用于编辑的文件名
        editeItem: {}, // 正在编辑的文件索引
      };
    },
    mounted() {
      this.init();
    },
    methods: {
      init() {
        if (this.fileCatalogCode) {
          getConfigDataList({
            fileCatalogCode: this.fileCatalogCode,
            businessRecordId: this.businessRecordId
          }).then((res) => {
            this.fileList = res.rows;
            this.fileList.forEach((item) => {
              this.$set(item, "uploading", false);
              this.$set(item, "uploadPercentage", 0);
              this.$set(item, "childrenList", item.fileUploadResponses ? item.fileUploadResponses : []);
              if (item.fileUploadResponses) {
                item.fileUploadResponses.forEach((obj) => {
                  this.fileIds.push(obj.fileId);
                });
              }
            });
            this.$emit("getFileData", this.fileList, this.fileIds);
          });
        }
      },
      handleBeforeUpload(file, item) {
        this.uploadData.fileConfRelId = item.fileCatalogRelationId;
        // 文件扩展名称、文件类型、大小、数量等验证
        const isSuffixNameValid = this.isSuffixNameValid(file, item);
        const isFileTypeValid = this.isFileTypeValid(file, item);
        const isFileSizeValid = this.isFileSizeValid(file, item);
        const isFileNumValid = this.isFileNumValid(file, item);

        if (!isSuffixNameValid) {
          this.$notify.error({
            title: '文件后缀名错误',
            message: `${file.name} 文件后缀名不支持，请重新选择！`,
            offset: 200
          });
          return false;
        }
        if (!isFileTypeValid) {
          this.$notify.error({
            title: '文件类型错误',
            message: `${file.name} 文件类型不支持，请重新选择！`,
            offset: 200
          });
          return false;
        }
        if (!isFileSizeValid) {
          this.$notify.error({
            title: '文件大小错误',
            message: `文件大小不能超过${this.maxFileSize}MB！`,
            offset: 200
          });
          return false;
        }
        if (!isFileNumValid) {
          this.$notify.error({
            title: '文件数量错误',
            message: `上传文件数量不能超过 ${item.fileConfigMaxNum} 个!`,
            offset: 200
          });
          return false;
        }
        this.$modal.loading("正在上传文件，请稍候...");
        return true; // 允许上传
      },

      // 文件扩展名称
      isSuffixNameValid(file, item) {
        const confSuffixName = item.fileConfigSuffixName||"";
        const fileExtension = file.name.split('.').pop().toLowerCase();
        return confSuffixName.indexOf(fileExtension) != -1;
      },
      // 文件类型
      isFileTypeValid(file, item) {
        const confContentType = item.fileConfigContentType||"";
        return confContentType.indexOf(file.type) != -1;
      },
      // 文件大小
      isFileSizeValid(file, item) {
        const confMaxSize = item.fileConfigMaxSize||5;
        return file.size / (1024 * 1024) <= confMaxSize;
      },
      isFileNumValid(file, item) {
        const fileNum = item.childrenList.length;
        const confMaxNum = item.fileConfigMaxNum||5;
        return fileNum < confMaxNum;
      },
      // 上传成功回调
      handleUploadSuccess(res, file) {
        if (res.code === 200) {
          Object.assign(this.uploadData, res.data);
          this.fileList.forEach((item) => {
            if (item.fileCatalogRelationId == res.data.fileConfRelId) {
              item.childrenList.push(this.uploadData);
            }
          });
          this.fileIds.push(this.uploadData.fileId);
          this.uploadData = {};
          this.$emit("getFileData", this.fileList, this.fileIds);
          this.$modal.closeLoading();
        } else {
          this.$notify.error({
            title: '文件上传失败',
            message: res.msg,
            dangerouslyUseHTMLString: true, // 启用 HTML 渲染
            offset: 200
          });
          this.$modal.closeLoading();
        }
      },
      handleFileRemove(item, itemChild, index) {
          this.$confirm("确定要删除上传的【"+itemChild.fileName+"】文件吗?", '删除提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            item.childrenList.splice(index, 1);
            let indexToRemove = -1;
            for (let i = 0; i < this.fileIds.length; i++) {
              if (this.fileIds[i] === itemChild.fileId) {
                indexToRemove = i;
                break;
              }
            }
            if (indexToRemove > -1) {
              this.fileIds.splice(indexToRemove, 1);
            }
            this.$emit("getFileData", this.fileList, this.fileIds);
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            });
          });
      },
      handleFileView(itemChild, inx) {
        this.getPublicKey().then(res=> {
          let publicKey = res;
          const encryptFileId = encrypt(itemChild.fileId, publicKey);
          window.open(onlinePreview(encryptFileId));
        });
       /* const Base64 = require('js-base64').Base64;
        const url ="http://182.92.199.85/group1/M00/00/2B/rBc6J2Uo_tyANg11AAgO0jg71yA815.pdf";
        window.open('http://127.0.0.1:8012/onlinePreview?url='+encodeURIComponent(Base64.encode(url)));*/

      },
      showEditDialog(item, index) {
        // 显示修改对话框
        this.editedFileName = item.fileName;
        this.editeItem = item;
        this.editDialogVisible = true;
      },
      saveEditedName() {
        // 创建请求配置
        const config =  { headers: this.headers };
        // 发送 POST 请求将数据提交给后台
        axios.post(this.baseUrl + '/file/manage/updateFileName', {
          fileId: this.editeItem.fileId,
          newFileName: this.editedFileName,
        }, config)
          .then(response => {
            if (response.data.code === 200) {
              // 保存修改后的文件名
              this.editeItem.fileName = this.editedFileName;
              this.closeEditDialog();
            } else{
              this.$notify.error({
                title: '修改文件名失败',
                message: response.data.msg,
                dangerouslyUseHTMLString: true,
                offset: 200
              });
              this.$modal.closeLoading();
            }
          })
          .catch(error => {
            console.error('修改文件名失败', error);
          });
      },
      closeEditDialog() {
        // 关闭修改对话框
        this.editDialogVisible = false;
        this.editedFileName = '';
        this.editeItem = {};
      },
      getPublicKey() {
        return new Promise((resolve, reject) => {
          getPublicKey()
            .then(res => {
              resolve(res)
            })
            .catch(error => {
              reject(error)
            })
        })
      },
    }
  };
</script>
<style lang="scss" scoped>
  ::v-deep .el-upload-dragger {
    height: 125px;
    margin: 10px;
  }

  ::v-deep .el-icon-upload {
    font-size: 67px;
    color: #409EFF;
    margin: 10px 0 16px;
    line-height: 50px;
  }

  .downloadFile {
    font-size: 13px;
    text-align: center;
    color: #1890ff;
  }

  .downloadFile:hover {
    cursor: pointer;
    text-decoration-line: underline;
  }

  .uploadBox {
    width: 100%;
    min-height: 35px;
    border-bottom: none;
    font-family: STXihei;
  }

  .tableBoxTitle {
    width: 100%;
    display: flex;
    background-color: #1c84c6;
    color: #ffffff;
    font-weight: 800;
    height: 50px;
    line-height: 35px;
    font-size: 20px;
    border: 1px solid #000000;
  }

  .Titlebox1 {
    width: 20%;
    text-align: center;
    line-height: 33px;
    border-right: 1px solid #000000;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .Titlebox1 span {
    font-size: 16px;
  }

  .Titlebox2 {
    width: 20%;
    text-align: center;
    border: none;
    line-height: 33px;
    border-right: 1px solid #000000;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .Titlebox2 p {
    margin: 0;
    padding: 0;
    line-height: 30px;
    font-size: 16px;
  }

  .Titlebox3 {
    width: 60%;
    text-align: center;
    border: none;
    line-height: 33px;
    border-right: 1px solid #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .tableBoxCenter {
    display: flex;
    border: 1px solid #000;
    //border-top: none;
  }

  .upload-file-uploader {
    width: 99%;
    margin-bottom: 5px;
    min-height: 35px;
    border-bottom: none;
  }

  .box-card {
    width: 100%;
    margin: 10px auto 10px auto;
    line-height: 28px;
    border-top: 1px solid #000000;
    border-bottom: 1px solid #000000;
  }

  .item-info {
    display: block;
    float: left;
    width: 50%;
  }

  .infoIcons {
    display: block;
    float: left;
  }

  .infoIcons img {
    width: 30px;
    height: 30px;
  }

  .infoContent {
    display: block;
    float: left;
    margin-left: 10px;
  }

  .item-action {
    display: block;
    float: right;
    width: 50%;
  }

  .actionView {
    display: block;
    float: right;
    width: 50px;
  }

  .actionDownload {
    display: block;
    float: right;
    width: 50px;
  }

  .actionDelete {
    display: block;
    float: right;
    width: 50px;
  }

  .actionEdit {
    display: block;
    float: right;
    width: 50px;
  }

  .dialog-footer{
    margin-top: 20px;
  }
</style>
