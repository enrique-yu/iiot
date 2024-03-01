<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="文件配置名称" prop="fileConfigName">
        <el-input
          v-model="queryParams.fileConfigName"
          placeholder="请输入所属文件配置名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传文件名称" prop="uploadName">
        <el-input
          v-model="queryParams.uploadName"
          placeholder="请输入上传文件名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="detailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文件配置名称" align="center" prop="fileConfigName" min-width="100" />
      <el-table-column label="文件配置编码" align="center" prop="fileConfigCode" min-width="100" />
      <el-table-column label="上传文件名称" align="center" prop="uploadName" min-width="100"  />
      <el-table-column label="上传文件原始名称" align="center" prop="uploadOriginalName" min-width="100"  />
      <el-table-column label="上传文件类型" align="center" prop="uploadContentType" min-width="100"  />
      <el-table-column label="上传文件大小" align="center" prop="uploadSize" min-width="100"  />
      <el-table-column label="上传时间" align="center" prop="uploadTime" min-width="120" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.uploadTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="80">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleFileView(scope.row)"
            v-hasPermi="['file:detail:view']"
          >查看</el-button>
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

  </div>
</template>

<script>
import { listDetail, getDetail } from "@/api/file/detail";

export default {
  name: "Detail",
  dicts: ['sys_normal_disable'],
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
      // 文件记录明细表格数据
      detailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileConfigName: null,
        fileConfigCode: null,
        uploadName: null,
        uploadOriginalName: null,
        uploadType: null,
        uploadSize: null,
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文件记录明细列表 */
    getList() {
      this.loading = true;
      listDetail(this.queryParams).then(response => {
        this.detailList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.fileRecordDetailId);
      this.single = selection.length!==1;
      this.multiple = !selection.length
    },
    handleFileView(row) {
      window.open(row.uploadParentPath + row.uploadPath);
    },
  }
};
</script>
