<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="企业名称" prop="compName">
        <el-input
          v-model="queryParams.compName"
          placeholder="请输入企业名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="企业统一社会信用代码" prop="compCreditCode">
        <el-input
          v-model="queryParams.compCreditCode"
          placeholder="请输入企业统一社会信用代码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="企业法人" prop="compFr">
        <el-input
          v-model="queryParams.compFr"
          placeholder="请输入企业法人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="行政区划" prop="compArea">
        <el-input
          v-model="queryParams.compArea"
          placeholder="请输入行政区划"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="注册地址" prop="compAddr">
        <el-input
          v-model="queryParams.compAddr"
          placeholder="请输入注册地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="经度" prop="compLng">
        <el-input
          v-model="queryParams.compLng"
          placeholder="请输入经度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="维度" prop="compLat">
        <el-input
          v-model="queryParams.compLat"
          placeholder="请输入维度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成立日期" prop="compRegDate">
        <el-date-picker clearable
          v-model="queryParams.compRegDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择成立日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="营业期限" prop="compBusinessTerm">
        <el-input
          v-model="queryParams.compBusinessTerm"
          placeholder="请输入营业期限"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="核准日期" prop="compApproveDate">
        <el-date-picker clearable
          v-model="queryParams.compApproveDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择核准日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="登记机关" prop="compApproveOffice">
        <el-input
          v-model="queryParams.compApproveOffice"
          placeholder="请输入登记机关"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="注册资本" prop="compRegCapital">
        <el-input
          v-model="queryParams.compRegCapital"
          placeholder="请输入注册资本"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="实缴资本" prop="compPaidCapital">
        <el-input
          v-model="queryParams.compPaidCapital"
          placeholder="请输入实缴资本"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="经营范围" prop="compManageScope">
        <el-input
          v-model="queryParams.compManageScope"
          placeholder="请输入经营范围"
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
          v-hasPermi="['system:basic:add']"
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
          v-hasPermi="['system:basic:edit']"
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
          v-hasPermi="['system:basic:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:basic:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="basicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="comp_basic_id" align="center" prop="compBasicId" />
      <el-table-column label="企业名称" align="center" prop="compName" />
      <el-table-column label="企业统一社会信用代码" align="center" prop="compCreditCode" />
      <el-table-column label="企业类型" align="center" prop="compType" />
      <el-table-column label="企业法人" align="center" prop="compFr" />
      <el-table-column label="行政区划" align="center" prop="compArea" />
      <el-table-column label="注册地址" align="center" prop="compAddr" />
      <el-table-column label="经度" align="center" prop="compLng" />
      <el-table-column label="维度" align="center" prop="compLat" />
      <el-table-column label="成立日期" align="center" prop="compRegDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.compRegDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="营业期限" align="center" prop="compBusinessTerm" />
      <el-table-column label="经营状态" align="center" prop="compManageStatus" />
      <el-table-column label="核准日期" align="center" prop="compApproveDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.compApproveDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="登记机关" align="center" prop="compApproveOffice" />
      <el-table-column label="注册资本" align="center" prop="compRegCapital" />
      <el-table-column label="实缴资本" align="center" prop="compPaidCapital" />
      <el-table-column label="经营范围" align="center" prop="compManageScope" />
      <el-table-column label="状态【0停用，1正常】" align="center" prop="compStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:basic:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:basic:remove']"
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

    <!-- 添加或修改企业基本信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="企业名称" prop="compName">
          <el-input v-model="form.compName" placeholder="请输入企业名称" />
        </el-form-item>
        <el-form-item label="企业统一社会信用代码" prop="compCreditCode">
          <el-input v-model="form.compCreditCode" placeholder="请输入企业统一社会信用代码" />
        </el-form-item>
        <el-form-item label="企业法人" prop="compFr">
          <el-input v-model="form.compFr" placeholder="请输入企业法人" />
        </el-form-item>
        <el-form-item label="行政区划" prop="compArea">
          <el-input v-model="form.compArea" placeholder="请输入行政区划" />
        </el-form-item>
        <el-form-item label="注册地址" prop="compAddr">
          <el-input v-model="form.compAddr" placeholder="请输入注册地址" />
        </el-form-item>
        <el-form-item label="经度" prop="compLng">
          <el-input v-model="form.compLng" placeholder="请输入经度" />
        </el-form-item>
        <el-form-item label="维度" prop="compLat">
          <el-input v-model="form.compLat" placeholder="请输入维度" />
        </el-form-item>
        <el-form-item label="成立日期" prop="compRegDate">
          <el-date-picker clearable
            v-model="form.compRegDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择成立日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="营业期限" prop="compBusinessTerm">
          <el-input v-model="form.compBusinessTerm" placeholder="请输入营业期限" />
        </el-form-item>
        <el-form-item label="核准日期" prop="compApproveDate">
          <el-date-picker clearable
            v-model="form.compApproveDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择核准日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="登记机关" prop="compApproveOffice">
          <el-input v-model="form.compApproveOffice" placeholder="请输入登记机关" />
        </el-form-item>
        <el-form-item label="注册资本" prop="compRegCapital">
          <el-input v-model="form.compRegCapital" placeholder="请输入注册资本" />
        </el-form-item>
        <el-form-item label="实缴资本" prop="compPaidCapital">
          <el-input v-model="form.compPaidCapital" placeholder="请输入实缴资本" />
        </el-form-item>
        <el-form-item label="经营范围" prop="compManageScope">
          <el-input v-model="form.compManageScope" placeholder="请输入经营范围" />
        </el-form-item>
        <el-form-item label="删除标记【0删除，1存在】" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标记【0删除，1存在】" />
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
import { listBasic, getBasic, delBasic, addBasic, updateBasic } from "@/api/company/basic";

export default {
  name: "Basic",
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
      // 企业基本信息表格数据
      basicList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        compName: null,
        compCreditCode: null,
        compType: null,
        compFr: null,
        compArea: null,
        compAddr: null,
        compLng: null,
        compLat: null,
        compRegDate: null,
        compBusinessTerm: null,
        compManageStatus: null,
        compApproveDate: null,
        compApproveOffice: null,
        compRegCapital: null,
        compPaidCapital: null,
        compManageScope: null,
        compStatus: null,
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
    /** 查询企业基本信息列表 */
    getList() {
      this.loading = true;
      listBasic(this.queryParams).then(response => {
        this.basicList = response.rows;
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
        compBasicId: null,
        compName: null,
        compCreditCode: null,
        compType: null,
        compFr: null,
        compArea: null,
        compAddr: null,
        compLng: null,
        compLat: null,
        compRegDate: null,
        compBusinessTerm: null,
        compManageStatus: null,
        compApproveDate: null,
        compApproveOffice: null,
        compRegCapital: null,
        compPaidCapital: null,
        compManageScope: null,
        compStatus: null,
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
      this.ids = selection.map(item => item.compBasicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加企业基本信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const compBasicId = row.compBasicId || this.ids
      getBasic(compBasicId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改企业基本信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.compBasicId != null) {
            updateBasic(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBasic(this.form).then(response => {
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
      const compBasicIds = row.compBasicId || this.ids;
      this.$modal.confirm('是否确认删除企业基本信息编号为"' + compBasicIds + '"的数据项？').then(function() {
        return delBasic(compBasicIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/basic/export', {
        ...this.queryParams
      }, `basic_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
