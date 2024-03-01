<template>
  <div class="app-container">
    
    <el-form :model="queryParams" ref="queryParams" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="名称" prop="typeName">
        <el-input
          v-model="queryParams.typeName"
          placeholder="请输入名称"
          clearable
          style="width: 240px"
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
          v-hasPermi="['device:products:add']"
        >新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" row-key="typeId"
      :default-expand-all="isExpandAll" :tree-props="{children: 'children'}">
      <el-table-column prop="typeName" label="名称" width="160"></el-table-column>
      <el-table-column prop="sort" label="排序" width="200"></el-table-column>
      <el-table-column prop="desc" label="描述" width="500"></el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleEdit(scope.row)"
            v-hasPermi="['device:products:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['device:products:add']"
          >新增</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>10" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
      
    <!-- 添加或修改产品分类对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item v-if="form.hasParent" label="上级分类" prop="parentId" >
          <el-input v-model="form.parentName" placeholder="请选择上级分类" disabled/>
        </el-form-item>
        <el-form-item label="名称" prop="typeName">
          <el-input v-model="form.typeName" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="顺序" prop="sort">
          <el-input-number v-model="form.sort" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="描述" prop="desc">
          <el-input v-model="form.desc" type="textarea" placeholder="请输入内容"></el-input>
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

  import { treeProducts, addProducts, editProducts} from "@/api/device";

  export default {
    data() {
      return {
        // 遮罩层
        loading: true,
        // 显示搜索条件
        showSearch: true,
        // 是否展开，默认全部展开
        isExpandAll: true,
        // 表格数据
        dataList: [],
        // 表格数据数量
        total: 0,
        // 查询参数
        queryParams: {},
        //弹出框
        open:false,
        //弹出框标题
        title:'',
        //true:编辑 false:新增
        isEdit: false,
        //弹出框表单
        form:{},
        //弹出框表单验证
        rules:{
          typeName: [
            { required: true, message: "名称不能为空", trigger: "blur" }
          ],
          sort: [
            { required: true, message: "顺序不能为空", trigger: "blur" }
          ]
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询产品分类列表 */
      getList() {
        this.loading = true;
        treeProducts(this.queryParams).then(response => {
          // console.log(JSON.stringify(response.data))
          this.dataList = response.data;
          this.total = response.total;
          this.loading = false;
        });
      },
      handleQuery(){
        this.getList();
      },
      resetQuery(){
        this.queryParams = {}
      },
      handleAdd(row){
          this.form = {hasParent:false}
        if(row.typeId) {
          this.form.hasParent = true,
          this.form.parentId = row.typeId;
          this.form.parentName = row.typeName;
          this.form.sort = 0;
        }
        this.isEdit = false
        this.open = true;
      },
      handleEdit(row){
        this.form = Object.assign({}, row);
        console.log(this.form)
        if(this.form.parentId) {
          this.form.hasParent = true;
        }else {
          this.form.hasParent = false;
        }
        this.isEdit = true
        this.open = true;
      },
      submitForm(){
        this.$refs['form'].validate((valid) => {
          if (!valid) {
            return false;
          }
          console.log('submit form', this.form)
          if(this.isEdit) {
            editProducts(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }else {
            addProducts(this.form).then(response => {
              this.$modal.msgSuccess("新建成功");
              this.open = false;
              this.getList();
            });
          }
        });
      },
      cancel(){
        this.form = {},
        this.open = false;
      }
    }
  };
</script>