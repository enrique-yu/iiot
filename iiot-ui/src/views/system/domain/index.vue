<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="组织账户名称" prop="domainName">
        <el-input
          v-model="queryParams.domainName"
          placeholder="请输入组织账户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="组织账号状态" prop="domainStatus">
        <el-select
          v-model="queryParams.domainStatus"
          placeholder="组织账号状态"
          clearable
          style="width: 240px"
        >
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
      <el-table-column label="组织角色编号" align="center" prop="drolesId" />
      <el-table-column label="组织账户名称" align="center" prop="domainName" />
      <el-table-column label="组织账号" align="center" prop="domainAccount" />
      <el-table-column label="组织账号状态" align="center" prop="domainStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.domainStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="组织账户有效期" align="center" prop="domainIndate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.domainIndate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="组织可管区域" align="center" prop="domainRegion" />
      <el-table-column label="组织管理员手机" align="center" prop="domainPhone" />
      <el-table-column label="组织管理员邮箱" align="center" prop="domainEmail" />
      <el-table-column label="入库时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:domain:edit']"
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

    <!-- 添加或修改系统组织账户对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="组织角色" prop="drolesId">
              <el-select v-model="form.drolesId"  placeholder="请选择组织角色">
                <el-option
                  v-for="item in drolesOptions"
                  :key="item.drolesId"
                  :label="item.drolesName"
                  :value="item.drolesId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="组织账号" prop="domainAccount">
              <el-input v-model="form.domainAccount" placeholder="请输入组织账号" maxlength="30" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="组织账户名称" prop="domainName">
              <el-input v-model="form.domainName" placeholder="请输入组织账户名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="有效期至" prop="domainIndate">
              <el-date-picker clearable
                              v-model="form.domainIndate"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="请选择组织账户有效期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="domainStatus">
              <el-radio-group v-model="form.domainStatus">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="管理区域" prop="domainRegion">
              <treeselect v-model="form.domainRegion" :options="areaOptions" :normalizer="normalizer" placeholder="请选择管理区域" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="管理员手机" prop="domainPhone">
              <el-input v-model="form.domainPhone" placeholder="请输入组织管理员手机" maxlength="11" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="管理员邮箱" prop="domainEmail">
              <el-input v-model="form.domainEmail" placeholder="请输入组织管理员邮箱" maxlength="50" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="组织账户描述" prop="domainDesc">
              <el-input v-model="form.domainDesc" type="textarea" placeholder="请输入组织账户描述"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
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
  import { listArea } from "@/api/system/area";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Domain",
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
        // 系统组织账户表格数据
        domainList: [],
        // 组织角色选项
        drolesOptions: [],
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
          domainName: null,
          domainAccount: null,
          domainStatus: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          drolesId: [
            { required: true, message: "组织角色不能为空", trigger: "blur" }
          ],
          domainName: [
            { required: true, message: "组织账户名称不能为空", trigger: "blur" },
            { min: 2, max: 300, message: '组织账号长度必须介于 2 和 300 之间', trigger: 'blur' }
          ],
          domainAccount: [
            { required: true, message: "组织账号不能为空", trigger: "blur" },
            { min: 2, max: 20, message: '组织账号长度必须介于 2 和 20 之间', trigger: 'blur' }
          ],
          domainStatus: [
            { required: true, message: "组织账号有效状态不能为空", trigger: "blur" }
          ],
          domainIndate: [
            { required: true, message: "组织账户有效期不能为空", trigger: "blur" }
          ],
          domainRegion: [
            { required: true, message: "组织可管区域不能为空", trigger: "blur" }
          ],
          domainEmail: [
            {
              type: "email",
              message: "请输入正确的邮箱地址",
              trigger: ["blur", "change"]
            }
          ],
          domainPhone: [
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ]
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
        listArea().then(response => {
          this.areaOptions = this.handleTree(response.data, "areaId", "parentId");
        });
        listDomain(this.queryParams).then(response => {
          this.domainList = response.rows;
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
          domainId: null,
          domainParentId: null,
          drolesId: null,
          domainName: null,
          domainAccount: null,
          domainStatus: null,
          domainIndate: null,
          domainRegion: null,
          domainPhone: null,
          domainEmail: null,
          domainDesc: null,
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
        getDomain().then(response => {
          this.drolesOptions = response.domainRoles;
          this.open = true;
          this.title = "添加系统组织账户";
        });
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
      /** 导出按钮操作 */
      handleExport() {
        this.download('system/domain/export', {
          ...this.queryParams
        }, `domain_${new Date().getTime()}.xlsx`)
      }
    }
  };
</script>
