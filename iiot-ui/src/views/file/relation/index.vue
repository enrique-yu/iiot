<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="文件目录名称" prop="fileCatalogName">
        <el-input
          v-model="queryParams.fileCatalogName"
          placeholder="请输入文件目录名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件配置名称" prop="fileConfigName">
        <el-input
          v-model="queryParams.fileConfigName"
          placeholder="请输入文件配置名称"
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
          @click="handleAdd"
          v-hasPermi="['file:relation:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['file:relation:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['file:relation:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['file:relation:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="relationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="状态" align="center" prop="fileCatalogRelationStatus" />
      <el-table-column label="文件目录名称" align="center" prop="fileCatalogConfig.fileCatalogName" />
      <el-table-column label="文件名称" align="center" prop="fileConfig.fileConfigName" />
      <el-table-column label="文件类型" align="center" prop="fileConfigType" />
      <el-table-column label="是否必传【0非必须 1必须】" align="center" prop="fileConfigMust" />
      <el-table-column label="最小文件数量" align="center" prop="fileConfigMinNum" />
      <el-table-column label="最大文件数量" align="center" prop="fileConfigMaxNum" />
      <el-table-column label="最小文件大小" align="center" prop="fileConfigMinSize" />
      <el-table-column label="最大文件大小" align="center" prop="fileConfigMaxSize" />
      <el-table-column label="排序序号" align="center" prop="fileConfigSortNum" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['file:relation:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['file:relation:remove']"
          >删除</el-button>
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

    <!-- 添加或修改文件与目录关系对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件目录编码" prop="fileCatalogCode">
          <el-input v-model="form.fileCatalogCode" placeholder="请输入文件目录编码" />
        </el-form-item>
        <el-form-item label="文件配置代码" prop="fileConfigCode">
          <el-input v-model="form.fileConfigCode" placeholder="请输入文件配置代码" />
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
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRelation, getRelation, delRelation, addRelation, updateRelation } from "@/api/file/relation";

export default {
  name: "Relation",
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
      // 文件与目录关系表格数据
      relationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileCatalogCode: null,
        fileConfigCode: null,
        fileConfigType: null,
        fileConfigMust: null,
        fileConfigMinNum: null,
        fileConfigMaxNum: null,
        fileConfigMinSize: null,
        fileConfigMaxSize: null,
        fileConfigSortNum: null,
        fileCatalogRelationStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        fileCatalogCode: [
          { required: true, message: "文件目录编码不能为空", trigger: "blur" }
        ],
        fileConfigCode: [
          { required: true, message: "文件配置代码不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文件与目录关系列表 */
    getList() {
      this.loading = true;
      listRelation(this.queryParams).then(response => {
        this.relationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        fileCatalogRelationId: null,
        fileCatalogCode: null,
        fileConfigCode: null,
        fileConfigType: null,
        fileConfigMust: null,
        fileConfigMinNum: null,
        fileConfigMaxNum: null,
        fileConfigMinSize: null,
        fileConfigMaxSize: null,
        fileConfigSortNum: null,
        fileCatalogRelationStatus: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.fileCatalogRelationId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文件与目录关系";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const fileCatalogRelationId = row.fileCatalogRelationId || this.ids
      getRelation(fileCatalogRelationId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文件与目录关系";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.fileCatalogRelationId != null) {
            updateRelation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRelation(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const fileCatalogRelationIds = row.fileCatalogRelationId || this.ids;
      this.$modal.confirm('是否确认删除文件与目录关系编号为"' + fileCatalogRelationIds + '"的数据项？').then(function() {
        return delRelation(fileCatalogRelationIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('file/relation/export', {
        ...this.queryParams
      }, `relation_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
