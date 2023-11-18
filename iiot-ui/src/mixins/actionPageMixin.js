const mixin = {
  props: {
    option: {
      type: Object,
      default: () => ({})
    },
  },
  data() {
    return {
      saveData: {},
      successMessage: '信息提交成功',
      warningMessage: '信息尚未完善完整，请完善后再进行提交！'
    };
  },
  methods: {
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.submitInfo();
        } else {
          this.$message({ message: this.warningMessage, type: 'warning' });
        }
      });
    },

    // 取消方法
    cancel() {
      this.dialogVisible = false
    },

    cloneFormData() {
      this.saveData = _.cloneDeep(this.form);
    },

    async submitInfo() {
      try {
        this.cloneFormData();
        await this.actionApi(this.saveData);
        this.$message({ message: this.successMessage, type: 'success' });
        this.$emit('getList', '');
        this.dialogVisible = false;
      } catch (error) {
        // 处理保存和提交失败的情况
        console.error('保存和提交失败', error);
      }
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

export default mixin;
