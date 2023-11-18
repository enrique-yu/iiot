const mixin = {
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 表格数据
      tableList: [],
      addDlgOption: {
        isVisible: false,
        initData: {}
      },
      updateDlgOption: {
        isVisible: false,
        initData: {}
      },
      viewDlgOption: {
        isVisible: false,
        initData: {}
      },
    }
  },
  mounted() {
    this.getList()
  },
  methods: {

    /** 查询列表数据 */
    getList() {
      this.loading = true;
      this.listApi(this.queryParams).then(response => {
        this.tableList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 新增按钮操作 */
    handleAdd(event, row) {
      this.addDlgOption.isVisible = true;
      this.addDlgOption.initData = this.initDataCreateEntity();
    },
    initDataCreateEntity() {
      return {}
    },

    /** 修改按钮操作 */
    handleUpdate(row) {
      this.updateDlgOption.isVisible = true;
      this.updateDlgOption.initData = Object.assign({}, row);
    },

    /** 详情按钮操作 */
    handleView(row) {
      this.viewDlgOption.isVisible = true;
      this.viewDlgOption.initData = Object.assign({}, row);
    },

    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },

    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },

  },
};

export default mixin;
