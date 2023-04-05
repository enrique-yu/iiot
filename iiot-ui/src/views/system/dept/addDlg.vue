<template>
  <div>
    <el-dialog v-if="dialogVisible" :title="title" :visible.sync="dialogVisible" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="上级部门" prop="parentId">
          <treeselect v-model="form.parentId" :options="deptOptions" :normalizer="normalizer" placeholder="选择上级部门" />
        </el-form-item>
        <el-form-item label="部门名称" prop="deptName">
          <el-input v-model="form.deptName" placeholder="请输入部门名称" />
        </el-form-item>
        <el-form-item label="负责人" prop="leader">
          <el-input v-model="form.leader" placeholder="请输入负责人" maxlength="20" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" maxlength="11" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" maxlength="50" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="显示排序" prop="orderNum">
          <el-input-number v-model="form.orderNum" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="部门描述" prop="deptDesc">
          <el-input type="textarea" v-model="form.deptDesc" :maxlength="200" :autosize="{ minRows: 3, maxRows: 3}"
                    placeholder="请输入部门描述"></el-input>
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
  import {listCategory} from "@/api/device/category";
  import {addBasic} from "@/api/device/basic";
  import ActionPageMixin from '@/mixins/actionPageMixin';
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "addDlg",
    dicts: ['sys_normal_disable'],
    mixins: [ActionPageMixin],
    components: { Treeselect },
    data() {
      return {
        initData: {},
        // 表单参数
        form: {},
        actionApi: addBasic,
        title: '新增设备信息',
        successMsg: '新增设备信息完成！',
        isDisabled: false,
        categoryOptions: [],
        // 表单校验
        rules: {
          deviceCategoryId: [
            {required: true, message: "设备所属分类不能为空", trigger: "blur"}
          ],
          deviceName: [
            {required: true, message: "设备名称不能为空", trigger: "blur"},
            {min: 2, max: 30, message: '设备名称长度必须介于 2 和 30 之间', trigger: 'blur'}
          ],
          deviceSn: [
            {required: true, message: "设备编号不能为空", trigger: "blur"},
            {
              required: true,
              pattern: /^([0-9A-Z_]{0,10})$/,
              message: '设备编号格式不正确，只允许大写字母或数字或“_”组成。',
              trigger: 'blur'
            },
            {min: 2, max: 30, message: '设备编号长度必须介于 2 和 30 之间', trigger: 'blur'}
          ],
          deviceStatus: [
            {required: true, message: "状态不能为空", trigger: "blur"}
          ],
          deviceType: [
            {required: true, message: "设备类型不能为空", trigger: "blur"}
          ],
          deviceModel: [
            {required: true, message: "设备规格型号不能为空", trigger: "blur"}
          ],
          deviceBrand: [
            {required: true, message: "品牌不能为空", trigger: "blur"}
          ],
          deviceFactory: [
            {required: true, message: "生产厂家不能为空", trigger: "blur"}
          ],
        }
      };
    },
    created() {
      this.init();
    },
    methods: {
      init() {
        listCategory().then(response => {
          this.categoryOptions = this.handleTree(response.data, "deviceCategoryId", "categoryParentId");
        });
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

    },
    computed: {
      dialogVisible: {
        get: function () {
          return this.option.isVisible
        },
        set: function (val) {
          this.option.isVisible = val
        }
      },
    }
  };
</script>
