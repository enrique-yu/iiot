<template>
  <div>
    <div class="uploadBox">
      <div class="tableBoxTitle" v-if="isTitle">
        <div class="Titlebox">附件名称</div>
        <div class="Titlebox">附件要求</div>
        <div class="Titlebox">附件信息</div>
      </div>
      <div class="tableBoxCenter" v-for="(item, index) in tableData" :key="index">
        <div class="Titlebox">
          <div>
                        <span style="color: #606266;font-weight: 600;margin: 0;">
                            {{ item.fileName }}
                        </span>
            <br />
            <span style="color: #999; font-size: 12px;">
                            {{ item.remark }}
                        </span>
            <br />
            <div id="test" v-if="item.flag" style="color: red">附件数量超出!</div>
            <div id="testRules" v-if="item.Dlog" style="color: red">{{item.fileName}}不能为空!</div>
          </div>
        </div>
        <div class="Titlebox" style="justify-content: left; padding-left: 10px;">
          <div v-if="item.name"></div>
          <div v-else>
            <p style="margin: 0;"><span style="color: #606266;font-weight:bold">格式：</span><span
              class="smallSpan">{{ item.fileType }}</span></p>
            <p style="margin: 0;"><span style="color: #606266;font-weight:bold">数量：</span><span
              class="smallSpan">{{ item.minCount }}-{{ item.maxCount }}</span></p>
            <p style="margin: 0;"><span style="color: #606266;font-weight:bold">大小：</span><span
              class="smallSpan">{{ item.minSizeLabel }}-{{ item.maxSizeLabel }}</span></p>
            <div v-for="(modelfiles, ind) in item.template" :key="ind" style="margin-bottom:5px">
              <p style="color: #606266;font-weight:bold">{{ modelfiles.fileName }}：</p>
              <div v-for="(files, i) in modelfiles.fileList" :key="i">
                <p @click="getdownloadFn(files.fileId)" style="text-align: center; color:#1890ff"
                   class="downloadFile">
                  {{ files.name }}({{ files.size }})</p>
              </div>
            </div>
          </div>
        </div>
        <div class="Titlebox" style="margin-bottom: 5px;">
          <div @mousedown="getCodeFn(item)" style="width:100%;margin-top:10px;"
               v-if="item.childrenList.length < item.maxCount">
            <el-upload multiple :action="uploadFileUrl" :show-file-list="false" :headers="headers"
                       class="upload-demo" ref="fileUpload" :auto-upload="false" drag :on-change="imgBroadcastChange">
              <i class="el-icon-upload"></i>
              <div class="el-upload__text" style="font-size:13px">将文件拖到此处，或<em>点击上传</em></div>
            </el-upload>
          </div>
          <div style="width: 100%; " v-for="(items, inx) in item.childrenList" :key="inx">
            <el-card style=" font-size:13px;width: 96.5%;text-align: left; margin-left:10px;margin-top: 5px;">
              <div style="display:block;float:left;width:72%;margin-top: -10px; ">
                <div style="display: block;float: left; margin-top:14px">
                  <img v-if="items.name.substring(items.name.length - 4, items.name.length) == '.pdf'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_pdf.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.txt'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_txt.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == 'xlsx' || items.name.substring(items.name.length - 4, items.name.length) == '.xls'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_xlsx.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.doc' || items.name.substring(items.name.length - 4, items.name.length) == 'docx'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_doc.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.jpg'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_jpg.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.png'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_png.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.gif'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_gif.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.ppt'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_ppt.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.rar'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_rar.png" />
                  <img v-else-if="items.name.substring(items.name.length - 4, items.name.length) == '.zip'"
                       style="width:25px;height:25px;margin-left:10px"
                       src="@/assets/files/file_zip.png" />
                </div>
                <div style="display: block;float: left;">
                  <div style="width: 100%; height:30px">
                    <el-tooltip class="item" effect="dark" :content="items.name"
                                style="margin-left: 5px;" placement="top-start">
                                            <span style="color:#000;font-size: 13px;" v-if="items.name.length > stringNum">
                                                {{ items.name.substring(0, stringNum - 1) }}...</span>
                      <span style="color:#000;font-size: 13px;" type="text" v-else> {{ items.name
                        }}</span>
                    </el-tooltip>
                  </div>
                  <div v-if="progressFlag && items.uid == uid"
                       style="width: 100%; height:1px;line-height:14px;width:210px;">
                    <el-progress style="width:85%;margin-left: 10px;"
                                 :percentage="loadProgress"></el-progress>
                  </div>
                  <div style="width: 100%; height:14px;line-height: 5px;">
                                        <span
                                          style="margin-left: 5px; height: 10px; padding-top: -20px; font-size: 12px; color:#9d9d9d">{{
                                            items.size }}</span>
                  </div>
                </div>
              </div>
              <div style="display:block;float:right; width:28%; ">
                <div style="width:100%;display: flex; justify-content:center;align-items: center ;">
                  <div style="display:block;float:left" class="activeOne" @click="handleView(item, inx)">
                    <i class="el-icon-view"></i>
                  </div>
                  <div style="display:block;float:left" class="activeTwo"
                       @click="handleDownload(item, inx)">
                    <i class="el-icon-download"></i>
                  </div>
                  <div style="display:block;float:left" class="activeThree"
                       @click="handleDelete(item, inx)">
                    <i class="el-icon-delete"></i>
                  </div>
                </div>
              </div>
            </el-card>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
import { getFileList, fileUploadAPI } from "@/api/file/file";
export default {
  props: {
    name: {
      type: String
    },
    configCode: {
      type: String
    },
    field: {
      type: String
    },
    stringNum: {
      type: Number,
      default: 25,
    },
    rule: {
      type: String
    },
    isTitle: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      number: 0,
      uploadList: [],
      baseUrl: process.env.VUE_APP_BASE_API,
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/file/upload", // 上传的图片服务器地址
      headers: {
        Authorization: "Bearer " + getToken()
      },
      fileList: [],
      fileCode: "",
      tableData: [],
      loading: false,
      constructData: [],
      fileIds: [],
      rowData: [],
      componentId: '',
      componentRule: '',
      progressFlag: false,
      loadProgress: 0,
      flag: false,
      uid: 0,
      dYStart: '',
      dYEnd: ''

    };
  },
  mounted() {
    this.init();
  },
  created() {
    this.componentId = this.name ? this.name : ''
    this.componentRule = this.rule ? this.rule : ''
  },
  methods: {
    getText(){
      console.log('显示哪些没填');
      this.tableData.forEach((item,index)=>{
        this.$set(item,'Dlog',false)
      })
      this.tableData.forEach((item,index)=>{
        console.log(item.showDlog);
        if(!item.showDlog){
          this.$set(item,'Dlog',true)
        }
      })
    },
    testRules() {
      // console.log('检查哪些没填');
      let list = [];
      this.tableData.forEach((item, index) => {
        if (!item.showDlog) {
          list.push(index)
        }
      })
      this.$emit('test', list)
    },
    handleBeforeUpload(val) {
      console.log(val);
    },
    getblank(val) {
      console.log(val);
    },
    ReloadFn(targetName, val, rule) {
      this.componentRule = rule;
      if (targetName) {
        this.componentId = targetName
      }
      if (val) {
        this.componentId = ''
      }
      this.init()
    },
    getdownloadFn(id) {
      window.open(process.env.VUE_APP_BASE_API + "/file/view/" + id, "_blank");
    },
    handleView(row, i) {
      window.open(process.env.VUE_APP_BASE_API + "/file/view/" + row.childrenList[i].id, "_blank");
    },
    handleDownload(row, i) {
      window.open(process.env.VUE_APP_BASE_API + "/file/download/" + row.childrenList[i].id, "_blank");
    },
    getCodeFn(row) {
      // console.log('选定的行');
      this.fileCode = row.fileCode;
      this.rowData = row;
    },
    imgBroadcastChange(file, fileList) {
      this.getfileFn1(file)
      if (this.rowData.childrenList.length > this.rowData.maxCount) {
        this.rowData.flag = true;
        setTimeout(() => {
          this.rowData.flag = false;
        }, 1000);
      } else {
        var formData = new FormData();
        formData.append("file", file.raw);
        formData.append("fileCode", this.fileCode);
        formData.append("fileDataId", this.componentId ? this.componentId : "");
        fileUploadAPI(formData).then((res) => {
          this.tableData.forEach(item => {
            if (item.fileCode == this.fileCode) {
              if (item.childrenList) {
                item.childrenList.forEach(obj => {
                  if (this.uid == obj.uid) {
                    obj.dYEnd = Date.parse(new Date())
                    if (obj.dYEnd - obj.dYStart < 1500) {
                      // console.log('走定时器');
                      const interval = setInterval(() => {
                        this.componentId = res.data.fileDataId;
                        this.fileIds.push(res.data.id);
                        this.$set(obj, 'id', res.data.id)
                        this.$set(obj, 'size', res.data.size)
                        this.$set(item,'Dlog',false)
                        this.$emit("getData", { fileDataId: this.componentId, fileConfigCode: this.configCode, rule: this.componentRule, fileIds: this.fileIds, field: this.field });
                        this.$set(item,'showDlog',true)
                        this.testRules()
                        this.loadProgress = 100
                        this.progressFlag = false;
                        clearInterval(interval)
                        return
                      }, 1500)
                    } else {
                      // console.log('不走定时器');
                      this.componentId = res.data.fileDataId;
                      this.fileIds.push(res.data.id);
                      this.tableData.forEach(item => {
                        if (item.fileCode == this.fileCode) {
                          if (item.childrenList) {
                            item.childrenList.forEach(obj => {
                              if (this.uid == obj.uid) {
                                this.$set(obj, 'id', res.data.id)
                                this.$set(obj, 'size', res.data.size)
                                this.$set(item,'Dlog',false)
                                this.$set(item,'showDlog',true)
                              }
                            })
                          }
                        }
                        this.$emit("getData", { fileDataId: this.componentId, fileConfigCode: this.configCode, rule: this.componentRule, fileIds: this.fileIds, field: this.field });
                        this.testRules()
                      })
                      this.loadProgress = 100
                      this.progressFlag = false;
                    }
                  }
                })
              }
            }
          })

        }).catch(
          err => {
            // console.log('删除操作');
            this.tableData.forEach((obj) => {
              if (obj.childrenList.length) {
                obj.childrenList.map((item, index) => {
                  if (item.uid == this.uid) {
                    obj.childrenList.splice(index, 1);
                  }
                });
              }
            });
          }
        );

      }

    },
    getfileFn1(val) {
      // console.log('显示进度条');
      this.progressFlag = true; // 显示进度条
      this.loadProgress = 0;
      const interval = setInterval(() => {
        if (this.loadProgress > 98) {
          clearInterval(interval)
          return
        }
        this.loadProgress += 1
      }, 10)
      this.uid = val.uid
      let arr = this.tableData;
      arr.forEach((item) => {
        if (item.childrenList.length >= item.maxCount) {
          this.$emit("getData", { fileDataId: this.componentId, fileConfigCode: this.configCode, rule: this.componentRule, fileIds: this.fileIds, field: this.field });
        }
        if (item.fileCode == this.fileCode) {
          item.childrenList.push({ name: val.name, uid: val.uid, dYStart: Date.parse(new Date()), dYEnd: '' });
        }
      });
    },
    getSeeFn(row) {
      window.open("/file/view/" + row.id, "_blank");
    },
    getOkFn() { },
    handleDelete(row, i) {
      console.log(row);
      this.fileIds.forEach((item, index) => {
        if (item == row.childrenList[i].id) {
          this.fileIds.splice(index, 1);
        }
      });
      this.tableData.forEach((obj) => {
        if (obj.childrenList.length) {
          obj.childrenList.map((item, index) => {
            if (item.id == row.childrenList[i].id) {
              obj.childrenList.splice(index, 1);
            }
          });
        }
      });
      if (!row.childrenList.length) {
        // console.log('当前行的childrenList为0');
        this.$set(row, 'showDlog', false)
        this.testRules()
      }else{
        this.testRules()
      }
      this.$emit("getData", { fileDataId: this.componentId, fileConfigCode: this.configCode, rule: this.componentRule, fileIds: this.fileIds, field: this.field });
    },
    init() {
      if (this.name) {
        this.componentId = this.name
      }
      if (this.configCode) {
        getFileList({
          configCode: this.configCode,
          fileDataId: this.componentId ? this.componentId : '',
          rule: this.componentRule ? this.componentRule : '',
          fileIds: this.fileIds ? this.fileIds.toString() : ''
        }).then((res) => {
          this.tableData = res.data;
          let list = [];
          this.tableData.forEach((item) => {
            this.$set(item, "childrenList", item.fileList ? item.fileList : []);
            this.$set(item, "flag", false);
            this.$set(item,'Dlog',false)
            this.$set(item, 'showDlog', false)
            if (item.fileList) {
              item.fileList.forEach((obj) => {
                list.push(obj.id);
              });
            }
          });
          this.testRules()
          this.fileIds = list;
          this.$emit("getData", { fileDataId: this.componentId, fileConfigCode: this.configCode, rule: this.componentRule, fileIds: this.fileIds, field: this.field });
        });
      }
    }
  }
};
</script>

<style  lang="scss" scoped>
::v-deep .el-upload-dragger {
  height: 120px;
  margin-bottom: -10px;
}

::v-deep .el-upload-dragger .el-icon-upload {
  font-size: 67px;
  color: #C0C4CC;
  margin: 14px 0 16px;
  line-height: 50px;
}

.activeOne {
  display: block;
  width: 28px;
  height: 28px;
  line-height: 28px;
  cursor: pointer;
}

.activeOne:hover {
  color: #409eff
}

.activeTwo {
  display: block;
  width: 28px;
  height: 28px;
  line-height: 28px;
  cursor: pointer;
}

.activeTwo:hover {
  color: orange
}

.activeThree {
  display: block;
  width: 28px;
  height: 28px;
  line-height: 28px;
  cursor: pointer;
}

.activeThree:hover {
  color: red
}

.smallSpan {
  font-size: 13px
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
  font-family: Microsoft YaHei;

  .tableBoxTitle {
    width: 100%;
    display: flex;
    justify-content: center;
    background-color: #90b9e4;
    color: #fff;
    font-weight: 600;
    height: 35px;
    line-height: 35px;
    font-size: 14px;
    border: 1px solid #000;

    .Titlebox:nth-child(1) {
      width: 25%;
      text-align: center;
      line-height: 33px;
      border-right: 1px solid #ccc;
    }

    .Titlebox:nth-child(2) {
      width: 25%;
      text-align: center;
      border: none;
      line-height: 33px;
      border-right: 1px solid #ccc;
    }

    .Titlebox:nth-child(3) {
      width: 50%;
      text-align: center;
      border: none;
      line-height: 33px;
      border-right: 1px solid #ccc;
    }
  }

  .tableBoxCenter {
    margin: 0;
    width: 100%;
    display: flex;
    justify-content: center;
    color: #333333;
    min-height: 28px;
    font-size: 14px;
    border: 1px solid #000;
    border-top: none;

    .Titlebox:nth-child(1) {
      width: 25%;
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      border-right: 1px solid #ccc;
      min-height: 28px;
      margin: 0;
      line-height: 20px;
    }

    .Titlebox:nth-child(2) {
      width: 25%;
      display: flex;
      justify-content: center;
      align-items: center;
      border-right: 1px solid #ccc;
      min-height: 28px;
      font-size: 14px;

      p {
        margin: 0;
        padding: 0;
        line-height: 20px;
      }
    }

    .Titlebox:nth-child(3) {
      width: 50%;
      text-align: center;
      display: flex;
      justify-content: center;
      flex-wrap: wrap;

      // min-height: 28px;
      .TitleboxMod {
        width: 100%;
        display: flex;

        .TitleboxMini:nth-child(1) {
          // width: 22%;
          // width:100%;
          border-right: 1px solid #ccc;
          border-bottom: 1px solid #ccc;
          overflow: hidden;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .TitleboxMini:nth-child(2) {
          // width: 12%;
          border-right: 1px solid #ccc;
          border-bottom: 1px solid #ccc;
          overflow: hidden;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .TitleboxMini:nth-child(3) {
          border-bottom: 1px solid #ccc;
          overflow: hidden;
          display: flex;
          align-items: center;
          justify-content: center;
          border-right: none;
        }
      }
    }
  }
}
</style>
