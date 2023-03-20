<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="form.deviceName" placeholder="请输入设备名称" />
        </el-form-item>
        <el-form-item label="设备编号" prop="deviceSn">
          <el-input v-model="form.deviceSn" placeholder="请输入设备编号" />
        </el-form-item>
        <el-form-item label="状态" prop="deviceStatus">
          <el-radio-group v-model="form.deviceStatus">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="设备类型" prop="deviceType">
          <el-input v-model="form.deviceType" placeholder="请输入设备类型" />
        </el-form-item>
        <el-form-item label="设备规格型号" prop="deviceModel">
          <el-input v-model="form.deviceModel" placeholder="请输入设备规格型号" />
        </el-form-item>
        <el-form-item label="品牌" prop="deviceBrand">
          <el-input v-model="form.deviceBrand" placeholder="请输入品牌" />
        </el-form-item>
        <el-form-item label="生产厂家" prop="deviceFactory">
          <el-input v-model="form.deviceFactory" placeholder="请输入生产厂家" />
        </el-form-item>
        <el-form-item label="设备描述" prop="deviceDesc">
          <el-input type="textarea" v-model="form.deviceDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入设备描述"></el-input>
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
import { addBasic } from "@/api/device/basic";
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
      actionApi: addBasic,
      title: '新增设备信息',
      successMsg: '新增设备信息完成！',
      isDisabled: false,
      // 表单校验
      rules: {
        deviceName: [
          {required: true, message: "设备名称不能为空", trigger: "blur"},
          {min: 2, max: 30, message: '设备名称长度必须介于 2 和 30 之间', trigger: 'blur'}
        ],
        deviceSn: [
          {required: true, message: "设备编号不能为空", trigger: "blur"},
          {
            required: true,
            pattern: /^([0-9A-Z_]{0,10})$/,
            message: '设备编号格式不正确，只允许大写字母或数字或“_”组成。',
            trigger: 'blur'
          },
          {min: 2, max: 30, message: '设备编号长度必须介于 2 和 30 之间', trigger: 'blur'}
        ],
        deviceStatus: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
        deviceType: [
          { required: true, message: "设备类型不能为空", trigger: "blur" }
        ],
        deviceModel: [
          { required: true, message: "设备规格型号不能为空", trigger: "blur" }
        ],
        deviceBrand: [
          { required: true, message: "品牌不能为空", trigger: "blur" }
        ],
        deviceFactory: [
          { required: true, message: "生产厂家不能为空", trigger: "blur" }
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
