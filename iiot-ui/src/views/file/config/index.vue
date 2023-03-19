<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
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
      <el-form-item label="状态" prop="fileConfigStatus">
        <el-select v-model="queryParams.fileConfigStatus" placeholder="状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['file:config:add']"
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
          v-hasPermi="['file:config:edit']"
        >修改</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="configList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column prop="fileConfigStatus" align="center"  label="状态" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.fileConfigStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="文件名称" align="center" prop="fileConfigName" />
      <el-table-column label="文件编码" align="center" prop="fileConfigCode" />
      <el-table-column label="引用模板" align="center" prop="fileConfigTemplate" />
      <el-table-column label="备注信息" align="center" prop="fileConfigDesc" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['file:config:edit']"
          >修改</el-button>
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

    <!-- 添加或修改文件配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="文件名称" prop="fileConfigName">
          <el-input v-model="form.fileConfigName" placeholder="请输入文件名称" />
        </el-form-item>
        <el-form-item label="文件编码" prop="fileConfigCode">
          <el-input v-model="form.fileConfigCode"  :maxlength="10" placeholder="请输入文件编码" />
        </el-form-item>
        <el-form-item label="状态" prop="fileConfigStatus">
          <el-radio-group v-model="form.fileConfigStatus">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="引用模板" prop="fileConfigTemplate">
          <el-input v-model="form.fileConfigTemplate" placeholder="请输入引用模板" />
        </el-form-item>
        <el-form-item label="备注信息" prop="fileConfigDesc">
          <el-input type="textarea" v-model="form.fileConfigDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入备注信息"></el-input>
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
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/file/config";

export default {
  name: "Config",
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
      // 文件配置表格数据
      configList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileConfigName: null,
        fileConfigTemplate: null,
        fileConfigDesc: null,
        fileConfigStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        fileConfigName: [
          {required: true, message: "文件名称不能为空", trigger: "blur"},
          {min: 2, max: 10, message: '文件名称长度必须介于 2 和 80 之间', trigger: 'blur'}
        ],
        fileConfigCode: [
          {required: true, message: "文件编码配置不能为空", trigger: "blur"},
          {
            required: true,
            pattern: /^[0-9A-HJ-NPQRTUWXY_]{0,10}$/,
            message: '文件编码格式不正确，只允许大写字母或数字或“_”组成。',
            trigger: 'blur'
          },
          {min: 2, max: 10, message: '文件编码长度必须介于 2 和 10 之间', trigger: 'blur'}
        ],
        fileConfigTemplate: [
          {required: true, message: "引用模板不能为空", trigger: "blur"},
        ],
        fileConfigStatus: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文件配置列表 */
    getList() {
      this.loading = true;
      listConfig(this.queryParams).then(response => {
        this.configList = response.rows;
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
        fileConfigCode: null,
        fileConfigName: null,
        fileConfigTemplate: null,
        fileConfigDesc: null,
        fileConfigStatus: null,
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
      this.ids = selection.map(item => item.fileConfigCode)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文件配置";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const fileConfigCode = row.fileConfigCode || this.ids
      getConfig(fileConfigCode).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文件配置";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.title === "修改文件配置") {
            updateConfig(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addConfig(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
  }
};
</script>
