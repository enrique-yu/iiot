<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="区域名称" prop="areaName">
        <el-input
          v-model="queryParams.areaName"
          placeholder="请输入区域名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="区域状态" prop="areaStatus">
        <el-select v-model="queryParams.areaStatus" placeholder="区域状态" clearable>
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
          v-hasPermi="['system:area:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="areaList"
      row-key="areaId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column prop="areaId" label="区域编码" width="160"></el-table-column>
      <el-table-column prop="areaName" label="区域名称" width="200"></el-table-column>
      <el-table-column prop="areaStatus" label="区域状态" width="160">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.areaStatus"/>
        </template>
      </el-table-column>
      <el-table-column prop="areaDesc" label="区域描述" width="500"></el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:area:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['system:area:add']"
          >新增</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改区域对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="所属区域" prop="parentId">
              <treeselect v-model="form.parentId" :options="areaOptions" :normalizer="normalizer" placeholder="选择所属区域" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col >
            <el-form-item label="区域名称" prop="areaName">
              <el-input v-model="form.areaName"  placeholder="请输入区域名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="区域编码" prop="areaId">
              <el-input v-model="form.areaId" placeholder="请输入区域编码" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="区域状态">
              <el-radio-group v-model="form.areaStatus">
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
          <el-form-item label="区域描述" prop="areaDesc">
            <el-input v-model="form.areaDesc" type="textarea" placeholder="请输入区域描述" />
          </el-form-item>
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
  import { listArea, getArea, addArea, updateArea, listAreaExcludeChild } from "@/api/system/area";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Area",
    dicts: ['sys_normal_disable'],
    components: { Treeselect },
    data() {
      return {
        // 遮罩层
        loading: true,
        // 显示搜索条件
        showSearch: true,
        // 表格树数据
        areaList: [],
        // 区域树选项
        areaOptions: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 是否展开，默认全部展开
        isExpandAll: true,
        // 重新渲染表格状态
        refreshTable: true,
        // 查询参数
        queryParams: {
          parentId: undefined,
          areaStatus: undefined
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          parentId: [
            { required: true, message: "所属区域不能为空", trigger: "blur" }
          ],
          areaName: [
            { required: true, message: "区域名称不能为空", trigger: "blur" }
          ],
          areaId: [
            { required: true, message: "区域编码不能为空", trigger: "blur" }
          ]
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询区域列表 */
      getList() {
        this.loading = true;
        listArea(this.queryParams).then(response => {
          this.areaList = this.handleTree(response.data, "areaId");
          this.loading = false;
        });
      },
      /** 转换部门数据结构 */
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
          areaId: undefined,
          parentId: undefined,
          areaName: undefined,
          areaDesc: undefined,
          areaStatus: "0"
        };
        this.resetForm("form");
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
      /** 新增按钮操作 */
      handleAdd(row) {
        this.reset();
        if (row != undefined) {
          this.form.parentId = row.areaId;
        }
        this.open = true;
        this.title = "添加区域";
        listArea().then(response => {
          this.areaOptions = this.handleTree(response.data, "areaId");
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
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        getArea(row.areaId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改区域";
          listAreaExcludeChild(row.areaId).then(response => {
            this.areaOptions = this.handleTree(response.data, "areaId");
            if (this.areaOptions.length == 0) {
              const noResultsOptions = { areaId: this.form.parentId, areaName: this.form.areaPName, children: [] };
              this.areaOptions.push(noResultsOptions);
            }
          });
        });
      },
      /** 提交按钮 */
      submitForm: function() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.title === "修改区域") {
              updateArea(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addArea(this.form).then(response => {
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
