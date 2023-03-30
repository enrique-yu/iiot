<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="文件目录名称" prop="fileCatalogName">
          <el-input v-model="form.fileConfigCode"  style="display: none" />
          <el-input v-model="form.fileCatalogName"  disabled />
        </el-form-item>
        <el-form-item label="文件配置名称" prop="fileConfigName">
          <el-input v-model="form.fileConfigCode" style="display: none" />
          <el-input v-model="form.fileConfigName" placeholder="请输入文件配置名称" style="width:80%"  disabled />
          <el-button size="mini" type="primary" @click="handleSelectFile" style="margin-left: 5%;" >选择文件</el-button>
        </el-form-item>
        <el-form-item label="文件类型" prop="fileConfigType">
          <el-select
            v-model="form.fileConfigType"
            placeholder="请选择文件类型"
            multiple
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="dict in dict.type.file_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="是否必传" prop="fileConfigMust">
          <el-input v-model="form.fileConfigMust" placeholder="请输入是否必传【0非必须 1必须】" />
        </el-form-item>
        <el-form-item label="最小文件数量" prop="fileConfigMinNum">
          <el-input v-model="form.fileConfigMinNum" placeholder="请输入最小文件数量" />
        </el-form-item>
        <el-form-item label="最大文件数量" prop="fileConfigMaxNum">
          <el-input v-model="form.fileConfigMaxNum" placeholder="请输入最大文件数量" />
        </el-form-item>
        <el-form-item label="最小文件大小" prop="fileConfigMinSize">
          <el-input v-model="form.fileConfigMinSize" placeholder="请输入最小文件大小" />
        </el-form-item>
        <el-form-item label="最大文件大小" prop="fileConfigMaxSize">
          <el-input v-model="form.fileConfigMaxSize" placeholder="请输入最大文件大小" />
        </el-form-item>
        <el-form-item label="排序序号" prop="fileConfigSortNum">
          <el-input v-model="form.fileConfigSortNum" placeholder="请输入排序序号" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitSaveForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <selectFile v-if="selectFileDlgOption.isVisible" @getFile="getFile" :option="selectFileDlgOption"></selectFile>

  </div>
</template>

<script>
  import { getCatalog } from "@/api/file/catalog";
  import { addRelation } from "@/api/file/relation";
  import ActionPageMixin from '@/mixins/actionPageMixin';
  import selectFile from "./selectFile";

  export default {
    name: "addDlg",
    dicts: ['sys_normal_disable', 'file_type'],
    mixins: [ ActionPageMixin ],
    components: { selectFile },
    data() {
      return {
        initData: {},
        // 表单参数
        form: {},
        actionApi: addRelation,
        title: '配置目录文件',
        successMsg: '配置目录文件完成！',
        isDisabled: false,
        // 目录信息
        catalog: {},
        // 表单校验
        rules: {
          fileCatalogCode: [
            {required: true, message: "文件目录编码配置不能为空", trigger: "blur"},
          ],
          fileCatalogName: [
            {required: true, message: "文件目录名称不能为空", trigger: "blur"},
          ],
          fileConfigCode: [
            {required: true, message: "文件编码配置不能为空", trigger: "blur"},
          ],
          fileConfigName: [
            {required: true, message: "文件名称不能为空", trigger: "blur"},
          ],
          fileConfigType: [
            {required: true, message: "文件类型不能为空", trigger: "blur"},
          ],
          fileConfigMust: [
            {required: true, message: "是否必传不能为空", trigger: "blur"},
          ],
          fileConfigMinNum: [
            {required: true, message: "最小文件数量不能为空", trigger: "blur"},
          ],
          fileConfigMaxNum: [
            {required: true, message: "最大文件数量不能为空", trigger: "blur"},
          ],
          fileConfigMinSize: [
            {required: true, message: "最小文件大小不能为空", trigger: "blur"},
          ],
          fileConfigMaxSize: [
            {required: true, message: "最大文件大小不能为空", trigger: "blur"},
          ],
          fileConfigSortNum: [
            {required: true, message: "排序序号不能为空", trigger: "blur"},
          ],
          fileCatalogRelationStatus: [
            { required: true, message: "状态不能为空", trigger: "blur" }
          ],
        },
        selectFileDlgOption:{
          isVisible:false,
          initData:{}
        },
      };
    },
    created() {
      this.init();
    },
    methods: {
      init() {
        const initData = this.option.initData || {};
        this.form = initData;
        this.form.fileCatalogCode = this.$route.params && this.$route.params.fileCatalogCode;
        getCatalog(this.form.fileCatalogCode).then(response => {
          this.catalog = response.data;
          this.form.fileCatalogName = this.catalog.fileCatalogName;
          console.log(this.form.fileCatalogName)
        });
      },
      handleSelectFile () {
        this.selectFileDlgOption.isVisible = true
      },
      getFile (row) {
        if (row) {
          this.$set(this.form,'fileConfigCode',row.fileConfigCode)
          this.$set(this.form,'fileConfigName',row.fileConfigName)
        }
      },
      submitSaveForm() {
        this.$refs['form'].validate((valid) => {
          if (valid) {
            this.form.fileConfigType = this.form.fileConfigType.toString();
            this.presetSaveData();
            this.actionApi(this.saveData).then(res => {
              this.$message({
                message: `${this.successMsg}`,
                type: 'success'
              });
              this.dialogVisible = false
              this.$emit('getList', '');
            })
          } else {
            this.$message({message: '信息尚未完善完整，请完善后再进行提交！', type: 'warning'});
            return false;
          }
        });
      },
    },
  };
</script>
