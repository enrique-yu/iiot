<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="上级分类" prop="categoryParentId">
          <el-input v-model="form.parentcategoryName" disabled placeholder="选择上级分类" />
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
        <el-form-item label="排序序号" prop="categorySortNum">
          <el-input v-model="form.categorySortNum" placeholder="请输入排序序号" :maxlength="6"/>
        </el-form-item>
        <el-form-item label="备注" prop="categoryDesc">
          <el-input type="textarea" v-model="form.categoryDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}" placeholder="请输入备注"></el-input>
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
import { listCategory, addCategory} from "@/api/device/category";
import ActionPageMixin from '@/mixins/actionPageMixin';
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "addCategory",
  dicts: ['sys_normal_disable'],
  mixins: [ ActionPageMixin ],
  components: {Treeselect},
  data() {
    return {
      initData: {},
      // 表单参数
      form: {},
      actionApi: addCategory,
      title: '新增设备分类',
      successMsg: '新增设备分类完成！',
      isDisabled: false,
      // 分类树选项
      categoryOptions: [],
      // 表单校验
      rules: {
        categoryParentId: [
          { required: true, message: "上级分类不能为空", trigger: "blur" }
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
          {required: true, message: "排序序号不能为空", trigger: "blur"},
          {required: true, pattern: /^\d{1,5}(\.\d{1,2})?$|^[0-9]{1,3}$/, message: "排序序号格式不正确，整数部分长度不超过3位，最多两位小数。", trigger: "blur"},
        ],
      }
    };
  },
  created() {
    this.init();
  },
  methods: {
    init() {
      const initData = this.option.initData || {};
      this.form = initData;
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
  }
};
</script>
