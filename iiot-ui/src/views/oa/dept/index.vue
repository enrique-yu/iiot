<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="部门名称" prop="deptName">
        <el-input
          v-model="queryParams.deptName"
          placeholder="请输入部门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="部门状态" clearable>
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
        <el-button type="info" plain icon="el-icon-sort" size="mini" @click="toggleExpandAll">展开/折叠</el-button>
      </el-form-item>
    </el-form>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="tableList"
      row-key="deptId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column prop="deptName" label="部门名称"></el-table-column>
      <el-table-column prop="status" label="状态">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="负责人" align="center" prop="leader"/>
      <el-table-column label="联系电话" align="center" prop="phone"/>
      <el-table-column label="邮箱" align="center" prop="email"/>
      <el-table-column label="显示顺序" align="center" prop="orderNum"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['oa:dept:add']"
          >新增
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['oa:dept:edit']"
          >修改
          </el-button>
          <el-button
            v-if="scope.row.sysDeptFlag !== '1'"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['oa:dept:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <addDlg v-if="addDlgOption.isVisible" @getList="getList" :option="addDlgOption"></addDlg>
    <updateDlg v-if="updateDlgOption.isVisible" @getList="getList"  :option="updateDlgOption"></updateDlg>

  </div>
</template>

<script>
  import { listDept, delDept } from "@/api/oa/dept";
  import addDlg from './addDlg';
  import updateDlg from './updateDlg';
  import ListPageMixin from '@/mixins/listPageMixin';
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Category",
    dicts: ['sys_normal_disable'],
    mixins: [ ListPageMixin ],
    components: {Treeselect, addDlg, updateDlg},
    data() {
      return {
        listApi: listDept,
        // 是否展开，默认全部展开
        isExpandAll: true,
        // 重新渲染表格状态
        refreshTable: true,
        rowData: {},
        // 查询参数
        queryParams: {
          deptName: undefined,
          status: null
        },
      };
    },
    methods: {
      getList() {
        this.loading = true;
        listDept(this.queryParams).then(response => {
          console.log(response.data)
          this.tableList = this.handleTree(response.data, "deptId", "parentId");
          console.log(this.tableList)
          this.loading = false;
        });
      },
      /** 转换数据结构 */
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

      /** 展开/折叠操作 */
      toggleExpandAll() {
        this.refreshTable = false;
        this.isExpandAll = !this.isExpandAll;
        this.$nextTick(() => {
          this.refreshTable = true;
        });
      },

      /** 新增按钮操作 */
      handleAdd(row) {
        this.rowData.parentId = row.deptId;
        this.rowData.parentDeptName = row.deptName;
        this.addDlgOption.isVisible = true;
        this.addDlgOption.initData = Object.assign({}, this.rowData);
      },

      /** 修改按钮操作 */
      handleUpdate(row) {
        row.parentDeptName = row.parentName;
        this.updateDlgOption.isVisible = true;
        this.updateDlgOption.initData = Object.assign({}, row);
      },

      /** 删除按钮操作 */
      handleDelete(row) {
        this.$modal.confirm('是否确认删除名称为"' + row.deptName + '"的数据项？').then(function() {
          return delDept(row.deptId);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      }

    }
  };
</script>

