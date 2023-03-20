<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="deviceName">
        <el-input
          v-model="queryParams.deviceName"
          placeholder="请输入设备名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备编号" prop="deviceSn">
        <el-input
          v-model="queryParams.deviceSn"
          placeholder="请输入设备编号【设备ID】"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="生产厂家" prop="deviceFactory">
        <el-input
          v-model="queryParams.deviceFactory"
          placeholder="请输入生产厂家"
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
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column prop="deviceStatus" align="center"  label="状态" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.deviceStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="在线状态" align="center" prop="deviceOnlineStatus" />
      <el-table-column label="设备名称" align="center" prop="deviceName" />
      <el-table-column label="设备编号" align="center" prop="deviceSn" />
      <el-table-column label="设备类型" align="center" prop="deviceType" />
      <el-table-column label="设备规格型号" align="center" prop="deviceModel" />
      <el-table-column label="品牌" align="center" prop="deviceBrand" />
      <el-table-column label="生产厂家" align="center" prop="deviceFactory" />
      <el-table-column label="设备最后活动时间" align="center" prop="deviceLastActiveTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deviceLastActiveTime, '{y}-{m}-{d}') }}</span>
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

    <addDlg v-if="addDlgOption.isVisible" @getList="getList" :option="addDlgOption"></addDlg>
    <updateDlg v-if="updateDlgOption.isVisible" @getList="getList"  :option="updateDlgOption"></updateDlg>

  </div>
</template>

<script>
import { listBasic, getBasic } from "@/api/device/basic";
import addDlg from './addDlg';
import updateDlg from './updateDlg';
import ListPageMixin from '@/mixins/listPageMixin';

export default {
  name: "Basic",
  mixins: [ ListPageMixin ],
  dicts: ['sys_normal_disable'],
  data() {
    return {
      listApi: listBasic,
      // 文件配置表格数据
      configList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deviceName: null,
        deviceSn: null,
        deviceType: null,
        deviceModel: null,
        deviceBrand: null,
        deviceFactory: null,
        deviceDesc: null,
        deviceLastActiveTime: null,
        deviceOnlineStatus: null,
        deviceStatus: null,
      },
    };
  },
  components: {
    addDlg,
    updateDlg
  },
  methods: {

    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.deviceBasicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

  },

};

</script>
