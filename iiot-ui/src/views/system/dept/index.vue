<template>
  <div class="app-container">
    <el-row :gutter="10">
      <el-col :span="12">
        <el-card style="height: calc(100vh - 125px)">
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
            <el-form-item label="组织账户名称" prop="domainName">
              <el-input
                v-model="queryParams.domainName"
                placeholder="请输入组织账户名称"
                clearable
                @keyup.enter.native="handleQuery"
              />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>
          <el-table v-loading="loading" :data="domainList" >
            <el-table-column prop="domainName" label="组织账户名称"></el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-star-on"
                  @click="getDepts(scope.row)"
                  v-hasPermi="['system:dept:list']"
                >管理部门
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
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card style="height: calc(100vh - 125px)">
          <el-form :model="queryParams1" ref="queryForm1" size="small" :inline="true" v-show="showSearch1">
            <el-form-item label="部门名称" prop="deptName">
              <el-input
                v-model="queryParams1.deptName"
                placeholder="请输入部门名称"
                clearable
                @keyup.enter.native="handleQuery1"
              />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery1">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery1">重置</el-button>
              <el-button type="info" plain icon="el-icon-sort" size="mini" @click="toggleExpandAll" >展开/折叠</el-button>
            </el-form-item>
          </el-form>

          <el-table
            v-if="refreshTable"
            v-loading="subLoading"
            :data="deptList"
            row-key="deptId"
            :default-expand-all="isExpandAll"
            :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
          >
            <el-table-column prop="deptName" label="部门名称" ></el-table-column>
            <el-table-column prop="status" label="状态">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
              </template>
            </el-table-column>

          </el-table>


        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { domainList, listDept } from "@/api/system/dept";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Dept",
    dicts: ['sys_normal_disable'],
    components: { Treeselect },
    data() {
      return {
        // 遮罩层
        loading: true,
        // 遮罩层
        subLoading: false,
        // 显示搜索条件
        showSearch: true,
        showSearch1: true,
        // 总条数
        total: 0,
        // 表格树数据
        domainList: [],
        // 表格树数据
        deptList: [],
        // 组织ID
        domainId: "",
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 重新渲染表格状态
        refreshTable: true,
        // 是否展开，默认全部展开
        isExpandAll: true,
        // 查询参数
        queryParams: {
          domainName: undefined,
          status: undefined
        },
        queryParams1: {
          domainId: undefined,
          deptName: undefined,
          status: undefined
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          parentId: [
            {required: true, message: "上级部门不能为空", trigger: "blur"}
          ],
          deptName: [
            {required: true, message: "部门名称不能为空", trigger: "blur"}
          ],
          orderNum: [
            {required: true, message: "显示排序不能为空", trigger: "blur"}
          ],
          email: [
            {
              type: "email",
              message: "请输入正确的邮箱地址",
              trigger: ["blur", "change"]
            }
          ],
          phone: [
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
      /** 查询部门列表 */
      getList() {
        this.loading = true;
        domainList(this.queryParams).then(response => {
          this.domainList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },

      /** 查询部门 */
      getDepts(row) {
        const domainId = row !== undefined ? row.domainId : this.domainId;
        if (domainId === "") {
          return;
        }
        this.subLoading = true;
        this.domainId = domainId;
        this.queryParams1.domainId = domainId;
        listDept(this.queryParams1).then(response => {
          this.deptList = this.handleTree(response.data, "deptId");
          this.subLoading = false;
        });
      },
      /** 展开/折叠操作 */
      toggleExpandAll() {
        this.refreshTable = false;
        this.isExpandAll = !this.isExpandAll;
        this.$nextTick(() => {
          this.refreshTable = true;
        });
      },
      /** 转换部门数据结构 */
      normalizer(node) {
        if (node.children && !node.children.length) {
          delete node.children;
        }
        return {
          id: node.deptId,
          label: node.deptName,
          children: node.children
        };
      },
      /** 搜索按钮操作 */
      handleQuery1() {
        this.getDepts();
      },
      /** 重置按钮操作 */
      resetQuery1() {
        this.resetForm("queryForm1");
        this.handleQuery1();
      },

    }
  };
</script>
