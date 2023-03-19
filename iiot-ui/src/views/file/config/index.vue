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
      <el-form-item label="文件编码"  prop="fileConfigCode">
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tableList" @selection-change="handleSelectionChange">
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

    <addDlg v-if="addDlgOption.isVisible" @getList="getList" :option="addDlgOption"></addDlg>
    <updateDlg v-if="updateDlgOption.isVisible" @getList="getList"  :option="updateDlgOption"></updateDlg>

  </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/file/config";
import addDlg from './addDlg';
import updateDlg from './updateDlg';
import ListPageMixin from '@/mixins/listPageMixin';

export default {
  name: "Config",
  mixins: [ ListPageMixin ],
  dicts: ['sys_normal_disable'],
  data() {
    return {
      listApi: listConfig,
      // 文件配置表格数据
      configList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileConfigName: null,
        fileConfigCode: null,
        fileConfigStatus: null,
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
      this.ids = selection.map(item => item.fileConfigCode)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

  },

};
</script>
