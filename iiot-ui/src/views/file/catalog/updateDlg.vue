<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title"  :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="文件目录名称" prop="fileCatalogName">
          <el-input v-model="form.fileCatalogName" placeholder="请输入文件目录名称" />
        </el-form-item>
        <el-form-item label="文件目录编码" prop="fileCatalogCode">
          <el-input v-model="form.fileCatalogCode" disabled :maxlength="10" placeholder="请输入文件目录编码" />
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
  </div>
</template>

<script>
import { updateCatalog } from "@/api/file/catalog";
import ActionPageMixin from '@/mixins/actionPageMixin';

export default {
  name: "updateDlg",
  dicts: ['sys_normal_disable'],
  mixins: [ ActionPageMixin ],
  data() {
    return {
      initData: {},
      // 表单参数
      form: {},
      actionApi: updateCatalog,
      title: '修改文件目录配置',
      successMsg: '修改文件目录配置完成！',
      isDisabled: false,
      // 表单校验
      rules: {
        fileCatalogName: [
          {required: true, message: "文件目录名称不能为空", trigger: "blur"},
          {min: 2, max: 10, message: '文件目录名称长度必须介于 2 和 80 之间', trigger: 'blur'}
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
      }
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
