<template>
  <div class="app-container">
    <div slot="header" style="margin-bottom: 20px;"><span>当前文件目录： <b>{{ queryParams.fileCatalogName }}</b></span></div>

    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="文件名称" prop="fileConfigName">
        <el-input
          v-model="queryParams.fileConfigName"
          placeholder="请输入文件名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件编码" prop="fileConfigCode">
        <el-input
          v-model="queryParams.fileConfigCode"
          placeholder="请输入文件编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAddFile"
          v-hasPermi="['file:catalog:add']"
        >添加文件
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-close"
          size="mini"
          @click="handleClose"
        >关闭
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="状态" align="center" prop="fileCatalogRelationStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.fileCatalogRelationStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="文件名称" align="center" prop="fileConfig.fileConfigName"/>
      <el-table-column label="文件编码" align="center" prop="fileConfig.fileConfigCode"/>
      <el-table-column label="文件类型" align="center" prop="fileConfigType"/>
      <el-table-column label="是否必传【0非必须 1必须】" align="center" prop="fileConfigMust"/>
      <el-table-column label="最小文件数量" align="center" prop="fileConfigMinNum"/>
      <el-table-column label="最大文件数量" align="center" prop="fileConfigMaxNum"/>
      <el-table-column label="最小文件大小" align="center" prop="fileConfigMinSize"/>
      <el-table-column label="最大文件大小" align="center" prop="fileConfigMaxSize"/>
      <el-table-column label="排序序号" align="center" prop="fileConfigSortNum"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-circle-close"
            @click="cancelAuthUser(scope.row)"
            v-hasPermi="['system:role:remove']"
          >取消授权
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <addFileDlg v-if="addFileDlgOption.isVisible" :fileCatalogCode="queryParams.fileCatalogCode"
                :option="addFileDlgOption"></addFileDlg>

  </div>
</template>

<script>
  import {allocatedFileList, listCatalog, getCatalog} from "@/api/file/catalog";
  import addFileDlg from "./addFileDlg";

  export default {
    name: "FileConfig",
    dicts: ['sys_normal_disable'],
    components: {addFileDlg},
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
        tableList: [],
        // 目录信息
        catalog: {},
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          fileCatalogCode: null,
          fileCatalogName: null,
          fileConfigName: null,
        },
        addFileDlgOption: {
          isVisible: false,
          initData: {}
        },
      };
    },
    created() {
      const fileCatalogCode = this.$route.params && this.$route.params.fileCatalogCode;
      if (fileCatalogCode) {
        this.queryParams.fileCatalogCode = fileCatalogCode;
        this.getList();
        getCatalog(fileCatalogCode).then(response => {
          this.catalog = response.data;
          this.queryParams.fileCatalogName = this.catalog.fileCatalogName;
        });
      }
    },
    methods: {
      /** 查询目录已配置的文件 */
      getList() {
        this.loading = true;
        allocatedFileList(this.queryParams).then(response => {
            this.tableList = response.rows;
            this.total = response.total;
            this.loading = false;
          }
        );
      },

      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.fileCatalogRelationId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },

      // 返回按钮
      handleClose() {
        const obj = {path: "/system/file/catalog"};
        this.$tab.closeOpenPage(obj);
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

      /** 添加附件 */
      handleAddFile(event, row) {
        this.addFileDlgOption.isVisible = true;
        this.addFileDlgOption.initData = this.initDataCreateEntity();
      },
      initDataCreateEntity() {
        return {}
      },
    }
  };
</script>
