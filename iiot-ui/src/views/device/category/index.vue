<template>
  <div class="app-container">
    <el-row :gutter="10">
      <el-col :span="12">
        <el-card style="height: calc(100vh - 125px)">
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
            <el-form-item label="分类名称" prop="categoryName">
              <el-input
                v-model="queryParams.categoryName"
                placeholder="请输入分类名称"
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
                @click="handleAdd('')"
                v-hasPermi="['device:category:add']"
              >新增
              </el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button
                type="info"
                plain
                icon="el-icon-sort"
                size="mini"
                @click="toggleExpandAll"
              >展开/折叠
              </el-button>
            </el-col>
            <!--<right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
          </el-row>

          <el-table
            v-if="refreshTable"
            v-loading="loading"
            :data="tableList"
            row-key="deviceCategoryId"
            :default-expand-all="isExpandAll"
            :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
          >
            <el-table-column prop="categoryName" label="分类名称" width="300"></el-table-column>
            <el-table-column prop="categorySn" label="分类编号" width="200"></el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-plus"
                  @click="handleAdd(scope.row)"
                  v-hasPermi="['device:category:add']"
                >新增
                </el-button>
                <el-button
                  v-if="scope.row.deviceCategoryId !== sysDefaultCategory"
                  size="mini"
                  type="text"
                  icon="el-icon-edit"
                  @click="handleUpdate(scope.row)"
                  v-hasPermi="['device:category:edit']"
                >修改</el-button>
                <el-button
                  v-if="scope.row.deviceCategoryId !== sysDefaultCategory"
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row)"
                  v-hasPermi="['device:category:remove']"
                >删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card :bordered="false" style="height: calc(100vh - 125px)">
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="上级分类" prop="categoryParentId">
              <treeselect v-model="form.categoryParentId" :options="categoryOptions" :normalizer="normalizer" placeholder="选择上级分类" />
            </el-form-item>
            <el-form-item label="分类名称" prop="categoryName">
              <el-input v-model="form.categoryName" placeholder="请输入分类名称" />
            </el-form-item>
            <el-form-item label="分类编号" prop="categorySn">
              <el-input v-model="form.categorySn" placeholder="请输入分类编号" :maxlength="10"/>
            </el-form-item>
            <el-form-item label="分类等级" prop="categoryLevel">
              <el-input v-model="form.categoryLevel" placeholder="请输入分类等级" :maxlength="5" />
            </el-form-item>
            <el-form-item label="排序序号" prop="categorySortNum" >
              <el-input-number v-model="form.categorySortNum" controls-position="right" :min="0"  />
            </el-form-item>
            <el-form-item label="备注" prop="categoryDesc">
              <el-input type="textarea" v-model="form.categoryDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入备注"></el-input>
            </el-form-item>
          </el-form>

          <div class="ic-form-btn">
            <el-button type="primary" @click="submitUpdateForm">确定修改</el-button>
          </div>

        </el-card>
      </el-col>

    </el-row>

    <addDlg v-if="addDlgOption.isVisible" @getList="getList" :option="addDlgOption"></addDlg>

  </div>
</template>

<script>
  import {
    listCategory,
    listCategoryExcludeChild,
    getCategory,
    getSysDefalutCategory,
    delCategory,
    addCategory,
    updateCategory
  } from "@/api/device/category";
  import addDlg from './addDlg';
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "Category",
    dicts: ['sys_normal_disable'],
    components: {Treeselect, addDlg},
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
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 表格数据
        tableList: [],
        // 查询参数
        queryParams: {
          categoryName: undefined,
        },
        addDlgOption: {
          isVisible: false,
          initData: {}
        },
        // 是否展开，默认全部展开
        isExpandAll: true,
        // 重新渲染表格状态
        refreshTable: true,
        categoryOptions: [],
        sysDefaultCategory: "",
        sysDefaultCategoryName: "",
        rowData: {},
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          categoryParentId: [
            {required: true, message: "上级分类不能为空", trigger: "blur"}
          ],
          categoryName: [
            {required: true, message: "分类名称不能为空", trigger: "blur"},
            {min: 2, max: 30, message: '分类名称长度必须介于 2 和 30 之间', trigger: 'blur'}
          ],
          categorySn: [
            {required: true, message: "分类编号不能为空", trigger: "blur"},
            {
              required: true,
              pattern: /^([0-9A-Z_]{0,10})$/,
              message: '分类编号格式不正确，只允许大写字母或数字或“_”组成。',
              trigger: 'blur'
            },
            {min: 2, max: 10, message: '分类编号长度必须介于 2 和 10 之间', trigger: 'blur'}
          ],
          categoryLevel: [
            {required: true, message: "分类等级不能为空", trigger: "blur"},
            {required: true, pattern: /^[1-9][0-9]{0,4}$/, message: "分类等级格式不正确，只允许数字，且长度不超过5位数。", trigger: "blur"},
          ],
          categorySortNum: [
            {required: true, message: "分类排序不能为空", trigger: "blur" },
            {required: true, pattern: /^[0-9]{1,3}$/, message: "分类排序格式不正确，整数且长度不超过3位。", trigger: "blur"}
          ],
        }
      };
    },
    created() {
      getSysDefalutCategory().then(res => {
        this.sysDefaultCategory = res.data.deviceCategoryId;
        this.sysDefaultCategoryName = res.data.categoryName;
      });
      this.getList();
    },
    methods: {
      /** 查询分类列表 */
      getList() {
        this.loading = true;
        listCategory(this.queryParams).then(response => {
          this.tableList = this.handleTree(response.data, "deviceCategoryId", "categoryParentId");
          this.loading = false;
        });
      },
      /** 转换数据结构 */
      normalizer(node) {
        if (node.children && !node.children.length) {
          delete node.children;
        }
        return {
          id: node.deviceCategoryId,
          label: node.categoryName,
          children: node.children
        };
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

      /** 展开/折叠操作 */
      toggleExpandAll() {
        this.refreshTable = false;
        this.isExpandAll = !this.isExpandAll;
        this.$nextTick(() => {
          this.refreshTable = true;
        });
      },

      // 表单重置
      reset() {
        this.form = {
          deviceCategoryId: null,
          categoryParentId: null,
          categoryName: null,
          categorySn: null,
          categoryLevel: null,
          categorySortNum: null,
          categoryDesc: null
        };
        this.resetForm("form");
      },

      /** 新增按钮操作 */
      handleAdd(row) {
        if (row != "" && row != undefined) {
          this.rowData.categoryParentId = row.deviceCategoryId;
          this.rowData.parentcategoryName = row.categoryName;
        } else {
          this.rowData.categoryParentId = this.sysDefaultCategory;
          this.rowData.parentcategoryName = this.sysDefaultCategoryName;
        }
        this.addDlgOption.isVisible = true;
        this.addDlgOption.initData = Object.assign({}, this.rowData);
      },

      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        getCategory(row.deviceCategoryId).then(response => {
          this.form = response.data;
          this.open = true;
          listCategoryExcludeChild(row.deviceCategoryId).then(response => {
            this.categoryOptions = this.handleTree(response.data, "deviceCategoryId", "categoryParentId");
            if (this.categoryOptions.length == 0) {
              const noResultsOptions = { deviceCategoryId: this.form.deviceCategoryId, categoryName: this.form.categoryName, children: [] };
              this.categoryOptions.push(noResultsOptions);
            }
          });
        });
      },

      /** 提交更新按钮 */
      submitUpdateForm() {
        this.$refs['form'].validate((valid) => {
          if (valid) {
            updateCategory(this.form).then(res => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            })
          } else {
            this.$message({message: '信息尚未完善完整，请完善后再进行提交！', type: 'warning'});
            return false;
          }
        });
      },

      /** 删除按钮操作 */
      handleDelete(row) {
        this.$modal.confirm('是否确认删除名称为"' + row.categoryName + '"的数据项？').then(function() {
          return delCategory(row.deviceCategoryId);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      }

    }
  };
</script>

<style scoped>
  .ic-form-btn {
    width: 100%;
    text-align: center;
  }
</style>
