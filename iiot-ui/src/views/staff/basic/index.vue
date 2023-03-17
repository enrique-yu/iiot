<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="人员姓名" prop="staffName">
        <el-input
          v-model="queryParams.staffName"
          placeholder="请输入人员姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="证件号码" prop="staffCardNo">
        <el-input
          v-model="queryParams.staffCardNo"
          placeholder="请输入证件号码"
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
          v-hasPermi="['company:basic:add']"
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
          v-hasPermi="['company:basic:edit']"
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
          v-hasPermi="['company:basic:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['company:basic:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="basicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="人员姓名" align="center" prop="staffName" />
      <el-table-column label="证件类型" align="center" prop="staffCardType" />
      <el-table-column label="证件号码" align="center" prop="staffCardNo" />
      <el-table-column label="性别" align="center" prop="staffSex" />
      <el-table-column label="年龄" align="center" prop="staffAge" />
      <el-table-column label="民族" align="center" prop="staffNation" />
      <el-table-column label="出生日期" align="center" prop="staffBirthdate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.staffBirthdate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="住址" align="center" prop="staffAddr" />
      <el-table-column label="联系手机" align="center" prop="staffPhone" />
      <el-table-column label="联系邮箱" align="center" prop="staffEmail" />
      <el-table-column label="政治面貌" align="center" prop="staffPoliticsStatus" />
      <el-table-column label="状态" align="center" prop="staffStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['company:basic:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['company:basic:remove']"
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

    <!-- 添加或修改人员基本信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="22">
            <el-form-item label="人员姓名" prop="staffName">
              <el-input v-model="form.staffName" placeholder="请输入人员姓名" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="11">
            <el-form-item label="证件类型" prop="staffCardType">
              <el-input v-model="form.staffCardType" placeholder="请输入证件类型" />
            </el-form-item>
          </el-col>
          <el-col :span="11">
            <el-form-item label="证件号码" prop="staffCardNo">
              <el-input v-model="form.staffCardNo" placeholder="请输入证件号码" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="22">
            <el-form-item label="证件发证机关" prop="staffCardFzunit">
              <el-input v-model="form.staffCardFzunit" placeholder="请输入证件发证机关" />
            </el-form-item>
          </el-col>
        </el-row>



        <el-form-item label="证件有效期开始" prop="staffCardSdate">
          <el-date-picker clearable
            v-model="form.staffCardSdate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择证件有效期开始">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="证件有效期截至" prop="staffCardEdate">
          <el-date-picker clearable
            v-model="form.staffCardEdate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择证件有效期截至">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="年龄" prop="staffAge">
          <el-input v-model="form.staffAge" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="民族" prop="staffNation">
          <el-input v-model="form.staffNation" placeholder="请输入民族" />
        </el-form-item>
        <el-form-item label="出生日期" prop="staffBirthdate">
          <el-date-picker clearable
            v-model="form.staffBirthdate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择出生日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="籍贯" prop="staffBirthplace">
          <el-input v-model="form.staffBirthplace" placeholder="请输入籍贯" />
        </el-form-item>
        <el-form-item label="住址" prop="staffAddr">
          <el-input v-model="form.staffAddr" placeholder="请输入住址" />
        </el-form-item>
        <el-form-item label="联系手机" prop="staffPhone">
          <el-input v-model="form.staffPhone" placeholder="请输入联系手机" />
        </el-form-item>
        <el-form-item label="联系邮箱" prop="staffEmail">
          <el-input v-model="form.staffEmail" placeholder="请输入联系邮箱" />
        </el-form-item>
        <el-form-item label="备注信息" prop="staffRemark">
          <el-input v-model="form.staffRemark" placeholder="请输入备注信息" />
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
import { listBasic, getBasic, delBasic, addBasic, updateBasic } from "@/api/staff/basic";

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
      // 人员基本信息表格数据
      basicList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        staffName: null,
        staffCardType: null,
        staffCardNo: null,
        staffCardFzunit: null,
        staffCardStatus: null,
        staffCardSdate: null,
        staffCardEdate: null,
        staffSex: null,
        staffAge: null,
        staffNation: null,
        staffBirthdate: null,
        staffBirthplace: null,
        staffAddr: null,
        staffPhone: null,
        staffEmail: null,
        staffPoliticsStatus: null,
        staffRemark: null,
        staffStatus: null,
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
    /** 查询人员基本信息列表 */
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
        staffBasicId: null,
        staffName: null,
        staffCardType: null,
        staffCardNo: null,
        staffCardFzunit: null,
        staffCardStatus: null,
        staffCardSdate: null,
        staffCardEdate: null,
        staffSex: null,
        staffAge: null,
        staffNation: null,
        staffBirthdate: null,
        staffBirthplace: null,
        staffAddr: null,
        staffPhone: null,
        staffEmail: null,
        staffPoliticsStatus: null,
        staffRemark: null,
        staffStatus: null,
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
      this.ids = selection.map(item => item.staffBasicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加人员基本信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const staffBasicId = row.staffBasicId || this.ids
      getBasic(staffBasicId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改人员基本信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.staffBasicId != null) {
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
      const staffBasicIds = row.staffBasicId || this.ids;
      this.$modal.confirm('是否确认删除人员基本信息编号为"' + staffBasicIds + '"的数据项？').then(function() {
        return delBasic(staffBasicIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('company/basic/export', {
        ...this.queryParams
      }, `basic_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
