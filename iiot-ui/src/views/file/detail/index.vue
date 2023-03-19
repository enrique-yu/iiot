<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属文件记录" prop="fileRecordId">
        <el-input
          v-model="queryParams.fileRecordId"
          placeholder="请输入所属文件记录"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属业务记录ID" prop="businessRecordId">
        <el-input
          v-model="queryParams.businessRecordId"
          placeholder="请输入所属业务记录ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属文件目录关系ID" prop="fileCatalogRelationId">
        <el-input
          v-model="queryParams.fileCatalogRelationId"
          placeholder="请输入所属文件目录关系ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属文件配置名称" prop="fileConfigName">
        <el-input
          v-model="queryParams.fileConfigName"
          placeholder="请输入所属文件配置名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属文件配置编码" prop="fileConfigCode">
        <el-input
          v-model="queryParams.fileConfigCode"
          placeholder="请输入所属文件配置编码"
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
      <el-form-item label="上传文件原始名称" prop="uploadOriginalName">
        <el-input
          v-model="queryParams.uploadOriginalName"
          placeholder="请输入上传文件原始名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传文件大小" prop="uploadSize">
        <el-input
          v-model="queryParams.uploadSize"
          placeholder="请输入上传文件大小"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传文件服务器路径" prop="uploadParentPath">
        <el-input
          v-model="queryParams.uploadParentPath"
          placeholder="请输入上传文件服务器路径"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传文件路径" prop="uploadPath">
        <el-input
          v-model="queryParams.uploadPath"
          placeholder="请输入上传文件路径"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传时间" prop="uploadTime">
        <el-date-picker clearable
          v-model="queryParams.uploadTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择上传时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="上传备注" prop="uploadDesc">
        <el-input
          v-model="queryParams.uploadDesc"
          placeholder="请输入上传备注"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="排序序号【如果是配置，则写入配置的序号】" prop="fileSortNum">
        <el-input
          v-model="queryParams.fileSortNum"
          placeholder="请输入排序序号【如果是配置，则写入配置的序号】"
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
          v-hasPermi="['file:detail:add']"
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
          v-hasPermi="['file:detail:edit']"
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
          v-hasPermi="['file:detail:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['file:detail:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="detailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="file_record_detail_id" align="center" prop="fileRecordDetailId" />
      <el-table-column label="所属文件记录" align="center" prop="fileRecordId" />
      <el-table-column label="所属业务记录ID" align="center" prop="businessRecordId" />
      <el-table-column label="所属文件目录关系ID" align="center" prop="fileCatalogRelationId" />
      <el-table-column label="所属文件配置名称" align="center" prop="fileConfigName" />
      <el-table-column label="所属文件配置编码" align="center" prop="fileConfigCode" />
      <el-table-column label="上传文件名称" align="center" prop="uploadName" />
      <el-table-column label="上传文件原始名称" align="center" prop="uploadOriginalName" />
      <el-table-column label="上传文件类型" align="center" prop="uploadType" />
      <el-table-column label="上传文件大小" align="center" prop="uploadSize" />
      <el-table-column label="上传文件服务器路径" align="center" prop="uploadParentPath" />
      <el-table-column label="上传文件路径" align="center" prop="uploadPath" />
      <el-table-column label="上传时间" align="center" prop="uploadTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.uploadTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="上传备注" align="center" prop="uploadDesc" />
      <el-table-column label="排序序号【如果是配置，则写入配置的序号】" align="center" prop="fileSortNum" />
      <el-table-column label="状态" align="center" prop="uploadStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['file:detail:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['file:detail:remove']"
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

    <!-- 添加或修改文件记录明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属文件记录" prop="fileRecordId">
          <el-input v-model="form.fileRecordId" placeholder="请输入所属文件记录" />
        </el-form-item>
        <el-form-item label="所属业务记录ID" prop="businessRecordId">
          <el-input v-model="form.businessRecordId" placeholder="请输入所属业务记录ID" />
        </el-form-item>
        <el-form-item label="所属文件目录关系ID" prop="fileCatalogRelationId">
          <el-input v-model="form.fileCatalogRelationId" placeholder="请输入所属文件目录关系ID" />
        </el-form-item>
        <el-form-item label="所属文件配置名称" prop="fileConfigName">
          <el-input v-model="form.fileConfigName" placeholder="请输入所属文件配置名称" />
        </el-form-item>
        <el-form-item label="所属文件配置编码" prop="fileConfigCode">
          <el-input v-model="form.fileConfigCode" placeholder="请输入所属文件配置编码" />
        </el-form-item>
        <el-form-item label="上传文件名称" prop="uploadName">
          <el-input v-model="form.uploadName" placeholder="请输入上传文件名称" />
        </el-form-item>
        <el-form-item label="上传文件原始名称" prop="uploadOriginalName">
          <el-input v-model="form.uploadOriginalName" placeholder="请输入上传文件原始名称" />
        </el-form-item>
        <el-form-item label="上传文件大小" prop="uploadSize">
          <el-input v-model="form.uploadSize" placeholder="请输入上传文件大小" />
        </el-form-item>
        <el-form-item label="上传文件服务器路径" prop="uploadParentPath">
          <el-input v-model="form.uploadParentPath" placeholder="请输入上传文件服务器路径" />
        </el-form-item>
        <el-form-item label="上传文件路径" prop="uploadPath">
          <el-input v-model="form.uploadPath" placeholder="请输入上传文件路径" />
        </el-form-item>
        <el-form-item label="上传时间" prop="uploadTime">
          <el-date-picker clearable
            v-model="form.uploadTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择上传时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="上传备注" prop="uploadDesc">
          <el-input v-model="form.uploadDesc" placeholder="请输入上传备注" />
        </el-form-item>
        <el-form-item label="排序序号【如果是配置，则写入配置的序号】" prop="fileSortNum">
          <el-input v-model="form.fileSortNum" placeholder="请输入排序序号【如果是配置，则写入配置的序号】" />
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
import { listDetail, getDetail, delDetail, addDetail, updateDetail } from "@/api/file/detail";

export default {
  name: "Detail",
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
        fileRecordId: null,
        businessRecordId: null,
        fileCatalogRelationId: null,
        fileConfigName: null,
        fileConfigCode: null,
        uploadName: null,
        uploadOriginalName: null,
        uploadType: null,
        uploadSize: null,
        uploadParentPath: null,
        uploadPath: null,
        uploadTime: null,
        uploadDesc: null,
        fileSortNum: null,
        uploadStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
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
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        fileRecordDetailId: null,
        fileRecordId: null,
        businessRecordId: null,
        fileCatalogRelationId: null,
        fileConfigName: null,
        fileConfigCode: null,
        uploadName: null,
        uploadOriginalName: null,
        uploadType: null,
        uploadSize: null,
        uploadParentPath: null,
        uploadPath: null,
        uploadTime: null,
        uploadDesc: null,
        fileSortNum: null,
        uploadStatus: null,
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
      this.ids = selection.map(item => item.fileRecordDetailId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文件记录明细";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const fileRecordDetailId = row.fileRecordDetailId || this.ids
      getDetail(fileRecordDetailId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文件记录明细";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.fileRecordDetailId != null) {
            updateDetail(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDetail(this.form).then(response => {
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
      const fileRecordDetailIds = row.fileRecordDetailId || this.ids;
      this.$modal.confirm('是否确认删除文件记录明细编号为"' + fileRecordDetailIds + '"的数据项？').then(function() {
        return delDetail(fileRecordDetailIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('file/detail/export', {
        ...this.queryParams
      }, `detail_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
