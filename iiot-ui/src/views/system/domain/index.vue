<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="父级组织编号" prop="domainParentId">
        <el-input
          v-model="queryParams.domainParentId"
          placeholder="请输入父级组织编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织角色编号" prop="drolesId">
        <el-input
          v-model="queryParams.drolesId"
          placeholder="请输入组织角色编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账户名称" prop="domainName">
        <el-input
          v-model="queryParams.domainName"
          placeholder="请输入组织账户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账号" prop="domainAccount">
        <el-input
          v-model="queryParams.domainAccount"
          placeholder="请输入组织账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账户有效期" prop="domainIndate">
        <el-date-picker clearable
          v-model="queryParams.domainIndate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择组织账户有效期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="组织可管区域" prop="domainRegion">
        <el-input
          v-model="queryParams.domainRegion"
          placeholder="请输入组织可管区域"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织管理员手机" prop="domainPhone">
        <el-input
          v-model="queryParams.domainPhone"
          placeholder="请输入组织管理员手机"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织管理员邮箱" prop="domainEmail">
        <el-input
          v-model="queryParams.domainEmail"
          placeholder="请输入组织管理员邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账户描述" prop="domainDesc">
        <el-input
          v-model="queryParams.domainDesc"
          placeholder="请输入组织账户描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账号与业务关系ID" prop="domainRelationId">
        <el-input
          v-model="queryParams.domainRelationId"
          placeholder="请输入组织账号与业务关系ID"
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
          v-hasPermi="['system:domain:add']"
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
          v-hasPermi="['system:domain:edit']"
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
          v-hasPermi="['system:domain:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:domain:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="domainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="组织编号" align="center" prop="domainId" />
      <el-table-column label="父级组织编号" align="center" prop="domainParentId" />
      <el-table-column label="组织角色编号" align="center" prop="drolesId" />
      <el-table-column label="组织账户名称" align="center" prop="domainName" />
      <el-table-column label="组织账号" align="center" prop="domainAccount" />
      <el-table-column label="组织账户有效期" align="center" prop="domainIndate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.domainIndate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="组织可管区域" align="center" prop="domainRegion" />
      <el-table-column label="组织管理员手机" align="center" prop="domainPhone" />
      <el-table-column label="组织管理员邮箱" align="center" prop="domainEmail" />
      <el-table-column label="组织账户描述" align="center" prop="domainDesc" />
      <el-table-column label="组织账号与业务关系ID" align="center" prop="domainRelationId" />
      <el-table-column label="组织账号状态" align="center" prop="domainStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:domain:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:domain:remove']"
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

    <!-- 添加或修改系统组织账户对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="父级组织编号" prop="domainParentId">
          <el-input v-model="form.domainParentId" placeholder="请输入父级组织编号" />
        </el-form-item>
        <el-form-item label="组织角色编号" prop="drolesId">
          <el-input v-model="form.drolesId" placeholder="请输入组织角色编号" />
        </el-form-item>
        <el-form-item label="组织账户名称" prop="domainName">
          <el-input v-model="form.domainName" placeholder="请输入组织账户名称" />
        </el-form-item>
        <el-form-item label="组织账号" prop="domainAccount">
          <el-input v-model="form.domainAccount" placeholder="请输入组织账号" />
        </el-form-item>
        <el-form-item label="组织账户有效期" prop="domainIndate">
          <el-date-picker clearable
            v-model="form.domainIndate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择组织账户有效期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="组织可管区域" prop="domainRegion">
          <el-input v-model="form.domainRegion" placeholder="请输入组织可管区域" />
        </el-form-item>
        <el-form-item label="组织管理员手机" prop="domainPhone">
          <el-input v-model="form.domainPhone" placeholder="请输入组织管理员手机" />
        </el-form-item>
        <el-form-item label="组织管理员邮箱" prop="domainEmail">
          <el-input v-model="form.domainEmail" placeholder="请输入组织管理员邮箱" />
        </el-form-item>
        <el-form-item label="组织账户描述" prop="domainDesc">
          <el-input v-model="form.domainDesc" placeholder="请输入组织账户描述" />
        </el-form-item>
        <el-form-item label="组织账号与业务关系ID" prop="domainRelationId">
          <el-input v-model="form.domainRelationId" placeholder="请输入组织账号与业务关系ID" />
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
import { listDomain, getDomain, delDomain, addDomain, updateDomain } from "@/api/system/domain";

export default {
  name: "Domain",
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
      // 系统组织账户表格数据
      domainList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        domainParentId: null,
        drolesId: null,
        domainName: null,
        domainAccount: null,
        domainIndate: null,
        domainRegion: null,
        domainPhone: null,
        domainEmail: null,
        domainDesc: null,
        domainRelationId: null,
        domainStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        drolesId: [
          { required: true, message: "组织角色编号不能为空", trigger: "blur" }
        ],
        domainName: [
          { required: true, message: "组织账户名称不能为空", trigger: "blur" }
        ],
        domainAccount: [
          { required: true, message: "组织账号不能为空", trigger: "blur" }
        ],
        domainIndate: [
          { required: true, message: "组织账户有效期不能为空", trigger: "blur" }
        ],
        domainRegion: [
          { required: true, message: "组织可管区域不能为空", trigger: "blur" }
        ],
        domainStatus: [
          { required: true, message: "组织账号状态不能为空", trigger: "change" }
        ],
        delFlag: [
          { required: true, message: "删除标记不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询系统组织账户列表 */
    getList() {
      this.loading = true;
      listDomain(this.queryParams).then(response => {
        this.domainList = response.rows;
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
        domainId: null,
        domainParentId: null,
        drolesId: null,
        domainName: null,
        domainAccount: null,
        domainIndate: null,
        domainRegion: null,
        domainPhone: null,
        domainEmail: null,
        domainDesc: null,
        domainRelationId: null,
        domainStatus: null,
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
      this.ids = selection.map(item => item.domainId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加系统组织账户";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const domainId = row.domainId || this.ids
      getDomain(domainId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改系统组织账户";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.domainId != null) {
            updateDomain(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDomain(this.form).then(response => {
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
      const domainIds = row.domainId || this.ids;
      this.$modal.confirm('是否确认删除系统组织账户编号为"' + domainIds + '"的数据项？').then(function() {
        return delDomain(domainIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/domain/export', {
        ...this.queryParams
      }, `domain_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
