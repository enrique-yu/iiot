<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="文件目录名称" prop="fileCatalogName">
        <el-input
          v-model="queryParams.fileCatalogName"
          placeholder="请输入文件目录名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件目录编码"  prop="fileCatalogCode">
        <el-input
          v-model="queryParams.fileCatalogCode"
          placeholder="请输入文件目录编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="fileCatalogStatus">
        <el-select v-model="queryParams.fileCatalogStatus" placeholder="状态" clearable>
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
          v-hasPermi="['file:catalog:add']"
        >新增</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column prop="fileCatalogStatus" align="center"  label="状态" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.fileCatalogStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="文件目录名称" align="center" prop="fileCatalogName" />
      <el-table-column label="文件目录编码" align="center" prop="fileCatalogCode" />
      <el-table-column label="备注信息" align="center" prop="fileCatalogDesc" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['file:catalog:edit']"
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
import { listCatalog, getCatalog } from "@/api/file/catalog";
import addDlg from './addDlg';
import updateDlg from './updateDlg';
import ListPageMixin from '@/mixins/listPageMixin';

export default {
  name: "Catalog",
  mixins: [ ListPageMixin ],
  dicts: ['sys_normal_disable'],
  data() {
    return {
      listApi: listCatalog,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileCatalogName: null,
        fileCatalogCode: null,
        fileCatalogStatus: null,
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
      this.ids = selection.map(item => item.fileCatalogCode)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

  },

};
</script>
