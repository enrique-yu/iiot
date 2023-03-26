<template>
  <el-dialog v-if="dialogVisible" title="选择文件" :visible.sync="dialogVisible" width="800px" append-to-body>
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true">
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row>
      <el-table :data="tableList" ref="multipleTable" v-loading="loading" @select-all="handleClickRow" @select="select">
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="fileConfigStatus" align="center"  label="状态" width="80">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.fileConfigStatus"/>
          </template>
        </el-table-column>
        <el-table-column label="文件名称" align="center" prop="fileConfigName" />
        <el-table-column label="文件编码" align="center" prop="fileConfigCode" />
      </el-table>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-row>
    <div slot="footer" class="dialog-footer">
      <el-button type="primary" @click="handleSelectFile">确 定</el-button>
      <el-button size="small" @click="cancel">取 消</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { unallocatedFileList } from "@/api/file/catalog";
import ListPageMixin from '@/mixins/listPageMixin';
import ActionPageMixin from '@/mixins/actionPageMixin';

export default {
  name: "selectFile",
  dicts: ['sys_normal_disable'],
  mixins: [ ListPageMixin, ActionPageMixin ],
  data() {
    return {
      listApi: unallocatedFileList,
      fileList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileCatalogCode: undefined,
        fileConfigName: undefined,
        fileConfigCode: undefined
      }
    };
  },

  methods: {
    handleSelectFile () {
      if (this.fileList[0] == undefined) {
        this.$modal.msgError("请选择要配置的附件");
        return;
      }
      this.$emit('getFile',this.fileList[0])
      this.dialogVisible = false
    },
    handleClickRow () {
      this.$refs.multipleTable.clearSelection();
    },
    select(selection, row) {
      this.$refs.multipleTable.clearSelection();
      if (selection.length == 0) return;
      this.$refs.multipleTable.toggleRowSelection(row, true);
      if(selection.length > 0) {
        this.fileList = selection
      }
    }
  }
};
</script>
