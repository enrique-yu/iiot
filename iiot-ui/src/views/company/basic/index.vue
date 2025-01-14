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
      <el-form-item label="信用代码" prop="compCreditCode">
        <el-input
          v-model="queryParams.compCreditCode"
          placeholder="请输入统一社会信用代码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="企业状态" prop="compStatus">
        <el-select v-model="queryParams.compStatus" placeholder="企业状态" clearable>
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
          v-hasPermi="['company:basic:add']"
        >新增
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="basicList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="企业名称" align="center" prop="compName"/>
      <el-table-column label="统一社会信用代码" align="center" prop="compCreditCode"/>
      <el-table-column label="企业联系人" align="center" prop="compLxr"/>
      <el-table-column label="企业联系人手机" align="center" prop="compLxrPhone"/>
      <el-table-column label="企业联系人邮箱" align="center" prop="compLxrEmail"/>
      <el-table-column label="信息是否完善" align="center" prop="constrContactPhone"/>
      <el-table-column prop="compStatus" label="企业状态" width="160">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.compStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['company:basic:edit']"
          >修改
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

    <!-- 添加或修改企业基本信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="150px">
        <el-row>
          <el-col>
            <el-form-item label="企业名称" prop="compName">
              <el-input v-model="form.compName" placeholder="请输入企业名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="统一社会信用代码" prop="compCreditCode">
              <el-input v-model="form.compCreditCode" placeholder="请输入企业统一社会信用代码" maxlength="18"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="企业所属区域" prop="compArea">
              <treeselect v-model="form.compArea" :options="areaOptions" :normalizer="normalizer" placeholder="请选择企业所属区域" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="企业联系人" prop="compLxr">
              <el-input v-model="form.compLxr" placeholder="请输入企业联系人" maxlength="80"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="企业联系人手机" prop="compLxrPhone">
              <el-input v-model="form.compLxrPhone" placeholder="请输入企业联系人手机" maxlength="11"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="企业联系人邮箱" prop="compLxrEmail">
              <el-input v-model="form.compLxrEmail" placeholder="请输入企业联系人邮箱" maxlength="60"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="企业状态">
              <el-radio-group v-model="form.compStatus">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">保存信息</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {listBasic, getBasic, delBasic, addBasic, updateBasic} from "@/api/company/basic";
  import { listArea } from "@/api/system/area";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Basic",
    dicts: ['sys_normal_disable'],
    components: { Treeselect },
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
        // 行政区域树选项
        areaOptions: [],
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
          compStatus: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          compName: [
            {required: true, message: "企业名称不能为空", trigger: "blur"},
            {min: 2, max: 300, message: '企业联系人长度必须介于 2 和 300 之间', trigger: 'blur'}
          ],
          compCreditCode: [
            {required: true, message: "统一社会信用代码不能为空", trigger: "blur"},
            {
              required: true,
              pattern: /^([0-9A-HJ-NPQRTUWXY]{2}\d{6}[0-9A-HJ-NPQRTUWXY]{10}|[1-9]\d{14})$/,
              message: '统一社会信用代码格式不正确',
              trigger: 'blur'
            },
          ],
          compArea: [
            { required: true, message: "企业所属区域不能为空", trigger: "blur" }
          ],
          compLxr: [
            {required: true, message: "企业联系人不能为空", trigger: "blur"},
            {min: 2, max: 80, message: '企业联系人长度必须介于 2 和 80 之间', trigger: 'blur'}
          ],
          compLxrPhone: [
            {required: true, message: "企业联系人手机不能为空", trigger: "blur"},
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ],
          compLxrEmail: [
            {required: true, message: "企业联系人邮箱不能为空", trigger: "blur"},
            {
              type: "email",
              message: "请输入正确的邮箱地址",
              trigger: ["blur", "change"]
            }
          ]
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
        listArea().then(response => {
          this.areaOptions = this.handleTree(response.data, "areaId", "parentId");
        });
        listBasic(this.queryParams).then(response => {
          this.basicList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      /** 转换行政区域数据结构 */
      normalizer(node) {
        if (node.children && !node.children.length) {
          delete node.children;
        }
        return {
          id: node.areaId,
          label: node.areaName,
          children: node.children
        };
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
          compStatus: "0"
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
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "新增企业基本信息";
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
      }
    }
  };
</script>
