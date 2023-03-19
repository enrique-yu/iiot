const mixin = {
  props: {
    option: {
      type: Object,
      default: () => {
        return {}
      }
    },
    level: {
      type: Number,
      default: 1
    }
  },
  data() {
    return {
      saveData: {},
    }
  },
  created() {
  },
  mounted() {
  },
  methods: {
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.presetSaveData();
          this.actionApi(this.saveData).then(res => {
            this.$message({
              message: `${this.successMsg}`,
              type: 'success'
            });
            this.$emit('getList', '');
            this.dialogVisible = false
          })
        } else {
          this.$message({message: '信息尚未完善完整，请完善后再进行提交！', type: 'warning'});
          return false;
        }
      });
    },

    // 取消方法
    cancel() {
      this.dialogVisible = false
    },

    presetSaveData () {
      this.saveData = _.cloneDeep(this.form)
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
}

export default mixin
