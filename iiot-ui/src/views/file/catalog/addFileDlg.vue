<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="文件目录编码" prop="fileCatalogCode">
          <el-input v-model="form.fileCatalogCode" placeholder="请输入文件目录编码" />
        </el-form-item>
        <el-form-item label="文件配置代码" prop="fileConfigCode">
          <el-input v-model="form.fileConfigCode" placeholder="请输入文件配置代码" />
          <i class="el-icon-circle-plus-outline iconAdd" :title="选择文件" @click="selectFile"></i>
        </el-form-item>
        <el-form-item label="是否必传【0非必须 1必须】" prop="fileConfigMust">
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
        <el-form-item label="删除标记" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标记" />
        </el-form-item>



        <el-form-item label="文件目录名称" prop="fileCatalogName">
          <el-input v-model="form.fileCatalogName" :maxlength="30" placeholder="请输入文件目录名称" />
        </el-form-item>
        <el-form-item label="文件目录编码" prop="fileCatalogCode">
          <el-input v-model="form.fileCatalogCode" :maxlength="10" placeholder="请输入文件目录编码" />
        </el-form-item>
        <el-form-item label="状态" prop="fileCatalogStatus">
          <el-radio-group v-model="form.fileCatalogStatus">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注信息" prop="fileCatalogDesc">
          <el-input type="textarea" v-model="form.fileCatalogDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入备注信息"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <selectFile v-if="selectFileDlgOption.isVisible" @getuint="getPerson" :option="selectFileDlgOption"></selectFile>

  </div>
</template>

<script>
import { addCatalog } from "@/api/file/catalog";
import selectFile from "./selectFile";

export default {
  name: "addDlg",
  dicts: ['sys_normal_disable'],
  components: { selectFile },
  data() {
    return {
      initData: {},
      // 表单参数
      form: {},
      actionApi: addCatalog,
      title: '新增文件目录配置',
      successMsg: '新增文件目录配置完成！',
      isDisabled: false,
      // 表单校验
      rules: {
        fileCatalogName: [
          {required: true, message: "文件目录名称不能为空", trigger: "blur"},
          {min: 2, max: 30, message: '文件目录名称长度必须介于 2 和 30 之间', trigger: 'blur'}
        ],
        fileCatalogCode: [
          {required: true, message: "文件目录编码配置不能为空", trigger: "blur"},
          {
            required: true,
            pattern: /^([0-9A-Z_]{0,10})$/,
            message: '文件目录编码格式不正确，只允许大写字母或数字或“_”组成。',
            trigger: 'blur'
          },
          {min: 2, max: 10, message: '文件目录编码长度必须介于 2 和 10 之间', trigger: 'blur'}
        ],
        fileCatalogStatus: [
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
      const initData = this.option.initData || {}
      this.form = initData
    },
    selectFile(){
      this.selectFileDlgOption.isVisible = true
    }

  },
computed: {
  dialogVisible: {
    get: function () {
      return this.option.isVisible
    },
    set: function (val) {
      this.option.isVisible = val
    }
  },
}
};
</script>
