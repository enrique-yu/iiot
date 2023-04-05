<template>
  <div >
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="父级部门" prop="parentId">
          <el-input v-model="form.parentDeptName" disabled placeholder="选择父级部门" />
        </el-form-item>
        <el-form-item label="部门名称" prop="deptName">
          <el-input v-model="form.deptName" placeholder="请输入部门名称"  :maxlength="20" />
        </el-form-item>
        <el-form-item label="部门负责人" prop="leader">
          <el-input v-model="form.leader" placeholder="请输入部门负责人"  :maxlength="20" />
        </el-form-item>
        <el-form-item label="部门负责人手机" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入部门负责人手机" :maxlength="11" />
        </el-form-item>
        <el-form-item label="部门负责人邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入部门负责人邮箱" :maxlength="60" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" :maxlength="6" />
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
import { addDept} from "@/api/oa/dept";
import ActionPageMixin from '@/mixins/actionPageMixin';
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "addDept",
  dicts: ['sys_normal_disable'],
  mixins: [ ActionPageMixin ],
  components: {Treeselect},
  data() {
    return {
      initData: {},
      // 表单参数
      form: {},
      actionApi: addDept,
      title: '新增部门',
      successMsg: '新增部门完成！',
      isDisabled: false,
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: "父级部门不能为空", trigger: "blur" }
        ],
        deptName: [
          {required: true, message: "部门名称不能为空", trigger: "blur"},
          {min: 2, max: 30, message: '部门名称长度必须介于 2 和 30 之间', trigger: 'blur'}
        ],
        leader: [
          {required: true, message: "部门负责人不能为空", trigger: "blur"},
          {min: 2, max: 30, message: '部门负责人长度必须介于 2 和 30 之间', trigger: 'blur'}
        ],
        phone: [
          {required: true, message: "部门负责人手机不能为空", trigger: "blur"},
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        email: [
          {required: true, message: "部门负责人邮箱不能为空", trigger: "blur"},
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        orderNum: [
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
