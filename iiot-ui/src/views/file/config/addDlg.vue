<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="文件名称" prop="fileConfigName">
          <el-input v-model="form.fileConfigName" placeholder="请输入文件名称" />
        </el-form-item>
        <el-form-item label="文件编码" prop="fileConfigCode">
          <el-input v-model="form.fileConfigCode" :maxlength="10" placeholder="请输入文件编码" />
        </el-form-item>
        <el-form-item label="状态" prop="fileConfigStatus">
          <el-radio-group v-model="form.fileConfigStatus">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="引用模板" prop="fileConfigTemplate">
          <el-input v-model="form.fileConfigTemplate" placeholder="请输入引用模板" />
        </el-form-item>
        <el-form-item label="备注信息" prop="fileConfigDesc">
          <el-input type="textarea" v-model="form.fileConfigDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入备注信息"></el-input>
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
import { addConfig } from "@/api/file/config";
import ActionPageMixin from '@/mixins/actionPageMixin';

export default {
  name: "addDlg",
  dicts: ['sys_normal_disable'],
  mixins: [ ActionPageMixin ],
  data() {
    return {
      initData: {},
      // 表单参数
      form: {},
      actionApi: addConfig,
      title: '新增文件配置',
      successMsg: '新增文件配置完成！',
      isDisabled: false,
      // 表单校验
      rules: {
        fileConfigName: [
          {required: true, message: "文件名称不能为空", trigger: "blur"},
          {min: 2, max: 10, message: '文件名称长度必须介于 2 和 80 之间', trigger: 'blur'}
        ],
        fileConfigCode: [
          {required: true, message: "文件编码配置不能为空", trigger: "blur"},
          {
            required: true,
            pattern: /^([0-9A-Z_]{0,10})$/,
            message: '文件编码格式不正确，只允许大写字母或数字或“_”组成。',
            trigger: 'blur'
          },
          {min: 2, max: 10, message: '文件编码长度必须介于 2 和 10 之间', trigger: 'blur'}
        ],
        fileConfigTemplate: [
          {required: true, message: "引用模板不能为空", trigger: "blur"},
        ],
        fileConfigStatus: [
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
