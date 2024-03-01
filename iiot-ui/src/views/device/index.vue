<template>
  <div class="app-container">
    
    <el-form :model="queryParams" ref="queryParams" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="设备名称" prop="name">
        <el-input
          v-model="queryParams.roleName"
          placeholder="请输入设备名称"
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
          v-hasPermi="['device:add']"
        >新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :toggleCard="true"  :showCard.sync="showCard"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" v-if="!showCard">
      <el-table-column prop="deviceId" label="ID" width="60"></el-table-column>
      <el-table-column prop="deviceName" label="设备名称" width="160"></el-table-column>
      <el-table-column prop="productName" label="产品名称" width="160"></el-table-column>
      <el-table-column prop="status" label="状态" width="80">
        <template slot-scope="{row}">
          <el-tag type="info">
            {{ row.status | deviceStatusEscape }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="desc" label="说明"></el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleEdit(scope.row)" v-hasPermi="['device:device:edit']" >修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-circle-close" @click="toggleDevice(scope.row)" v-hasPermi="['device:device:toggle']" >停用</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="deleteDevice(scope.row)" v-hasPermi="['device:device:delete']" >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="card-table" v-show="showCard">
      <div class="card-item" v-bind:key="index" v-for="(item, index) in dataList">
          <div class="card-item-content">
            <div class="card-item-avatar">
              <img width="80" height="80" src="https://demo.jetlinks.cn/images/device/instance/device-card.png" />
            </div>
            <div class="card-item-body">
              <div style="margin-left:1em;">
                <span style="font-size: 16px; font-weight: 600;">{{item.deviceName}}</span>
              </div>
              <div class="card-item-status"><div class="card-teim-status-content">{{item.status | deviceStatusEscape}}</div></div>
              <div style="padding:1em;">
                <div class="ant-col">
                  <div class="ant-col-head">设备类型</div>
                  <div class="ant-col-body">{{item.deviceType}}</div>
                </div>
                <div class="ant-col">
                  <div class="ant-col-head">接入方式</div>
                  <div class="ant-col-body">{{item.accessMode}}</div>
                </div>
              </div>
              <div class="card-item-bg bg1"></div>
              <div class="card-item-bg bg2"></div>
            </div>
          </div>
          <div class="cart-item-operate">
          <el-button size="mini" icon="el-icon-edit" @click="handleEdit(item)" v-hasPermi="['device:device:edit']" >修改</el-button>
          <el-button size="mini" icon="el-icon-circle-close" @click="toggleDevice(item)" v-hasPermi="['device:device:toggle']" >停用</el-button>
          <el-button size="mini" icon="el-icon-delete" @click="deleteDevice(item)" v-hasPermi="['device:device:delete']" >删除</el-button>
          </div>
      </div>
    </div>
    <pagination v-show="total>10" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
      
    <!-- 添加或修改设备分类对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="产品" prop="productId">
          <el-select v-model="form.productId" placeholder="请选择产品">
            <el-option v-bind:key="item.productId" v-for="item in categoryList" :value="item.productId" :label="item.productName"/>
          </el-select>
        </el-form-item>
        <el-form-item label="设备名称" prop="deviceName">
          <el-input v-model="form.deviceName" placeholder="请输入设备名称" />
        </el-form-item>
        <el-form-item label="说明" prop="desc">
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

  import { listDevice, addDevice, editDevice, toggleDevice, deleteDevice, 
            listCategory, deviceStatusEscape, deviceAccessMode, deviceDeviceType} from "@/api/device";

  export default {
    filters: {
      deviceStatusEscape: function(code) {
        return deviceStatusEscape(code);
      }
    },
    data() {
      return {
        accessModeList:deviceAccessMode,
        deviceTypeList:deviceDeviceType,
        // 遮罩层
        loading: true,
        // 显示搜索条件
        showSearch: true,
        // 表格式展示/卡片式展示切换
        toggleCard: true,
        showCard: false,
        //产品分类数据
        categoryList:[],
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
          productId: [ { required: true, message: "产品不能为空", trigger: "blur" } ],
          deviceName: [ { required: true, message: "设备名称不能为空", trigger: "blur" } ]
        }
      };
    },
    created() {
      this.getList();
      this.getCategoryList();
    },
    methods: {
      /** 查询设备分类列表 */
      getList() {
        this.loading = true;
        listDevice(this.queryParams).then(response => {
          this.dataList = response.data;
          this.total = response.total;
          this.loading = false;
        });
      },
      /** 查询产品列表 */
      getCategoryList() {
        this.loading = true;
        listCategory().then(response => {
          this.categoryList = response.data;
        });
      },
      handleQuery(){
        this.getList();
      },
      resetQuery(){
        this.queryParams = {}
      },
      handleAdd(){
        this.form = {}
        this.isEdit = false;
        this.open = true;
      },
      handleEdit(row){
        this.form = Object.assign({},row);
        this.isEdit = true;
        this.open = true;
      },
      deleteDevice(row){
        this.$modal.confirm('是否确认删除设备类型："' + row.productName + '"？').then(function() {
          return deleteDevice(row.productId);
        }).then((response) => {
          this.getList();
          this.$modal.msgSuccess(response.msg);
        }).catch((throwable) => {
        });
      },
      toggleDevice(row){
        const status = deviceStatusEscape(1-row.status);
        this.$modal.confirm('是否确认'+status+'设备类型："' + row.productName + '"？').then(function() {
          return toggleDevice(row.productId);
        }).then((response) => {
          this.getList();
          this.$modal.msgSuccess(response.msg);
        }).catch((throwable) => {
        });
      },
      submitForm(){
        this.$refs['form'].validate((valid) => {
          if (!valid) {
            return false;
          }
          if(this.isEdit) {
            editDevice(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }else {
            addDevice(this.form).then(response => {
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

<style>
.card-item {
  float:left;
  margin: 1em 1.5em;
  min-width:400px;
  width:43%;
  max-width: 600px;
}
.card-item-content {
  padding: 1em 1.5em;
  border:1px solid #DCDFE6;
  border-radius: 5px;
  position: relative;
  overflow: hidden;
}
.card-item:hover {
  box-shadow: -1px -1px 5px 5px #DCDFE6;
}
.card-item-avatar,.card-item-body{
  display: inline-block;
}
.card-item-body .ant-col{
  margin: auto 2em;
  line-height:1.5em;
  text-align: center;
  vertical-align:0px;
  display: inline-block;
}
.card-item-body .ant-col .ant-col-head{
  font-size: 12px;
}
.card-item-body .ant-col .ant-col-body{
  font-size: 14px;
}
.card-item-status {
  display: flex;
  width:90px;
  top:1.3em;
  text-align: right;
  right:-1em;
  background-color: rgba(9, 46, 231, 0.1);
  position: absolute;
  transform:skew(35deg)
}
.card-teim-status-content {
  margin-right:1.5em;
  font-size: 14px;
  margin-left:auto;
  padding:0.5em;
  transform:skew(-35deg)
}
.card-item-bg {
  position:absolute;
  top:0;
  right:0;
  height: 100%;
  background: linear-gradient(188.4deg, rgba(9, 46, 231, 0.03) 50%, rgba(9, 46, 231, 0) 80%);
  transform:skew(-35deg)
}
.bg1 {
  width:300px;
}
.bg2 {
  width:200px;
}
</style>