<template>
  <div class="app-container">
    <el-card style="position: relative;padding-bottom: 30px;" >
      <div slot="header" class="clearfix">
        <span>企业信息完善</span>
      </div>
      <el-form :model="form" ref="form" :rules="rules" size="small" label-width="150px">
        <div class="linebox">
          <el-divider content-position="left">企业信息</el-divider>
          <el-row>
            <el-col :span="9">
              <el-form-item label="企业名称" prop="compName">
                <el-input v-model="form.compName" disabled placeholder="请输入企业名称"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="9">
              <el-form-item label="经营状态" prop="compManageStatus">
                <el-input v-model="form.compManageStatus"  placeholder="请输入经营状态"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="9">
              <el-form-item label="统一社会信用代码" prop="compCreditCode">
                <el-input v-model="form.compCreditCode" disabled placeholder="请输入统一社会信用代码"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="9">
              <el-form-item label="企业类型" prop="compType">
                <el-input v-model="form.compType"  placeholder="请输入企业类型"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="9">
              <el-form-item label="企业法人" prop="compFr">
                <el-input v-model="form.compFr" placeholder="请输入企业法人"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="9">
              <el-form-item label="企业法人手机" prop="compFrPhone">
                <el-input v-model="form.compFrPhone" placeholder="请输入企业法人手机"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="18">
              <el-form-item label="企业所属区域" prop="compArea">
                <treeselect v-model="form.compArea" :options="areaOptions" :normalizer="normalizer" placeholder="请选择企业所属区域" />
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="18">
              <el-form-item label="注册地址" prop="compAddr">
                <el-input v-model="form.compAddr" placeholder="请输入注册地址"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="8">
              <el-form-item label="经度" prop="compLng">
                <el-input v-model="form.compLng" disabled placeholder="请输入经度"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="纬度" prop="compLat">
                <el-input v-model="form.compLat" disabled placeholder="请输入纬度" style="width:80%"></el-input>
                <el-button :disabled="false" @click="mapDlg = true" style="width: 15%;margin-left: 5%;" type="primary">选择</el-button>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="8">
              <el-form-item label="成立日期" prop="compRegDate">
                <el-date-picker clearable
                                v-model="form.compRegDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="请选择成立日期">
                </el-date-picker>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="核准日期" prop="compApproveDate">
                <el-date-picker clearable
                                v-model="form.compApproveDate"
                                type="date"
                                value-format="yyyy-MM-dd"
                                placeholder="请选择核准日期">
                </el-date-picker>
              </el-form-item>
            </el-col>

          </el-row>
          <el-row>
            <el-col :span="18">
              <el-form-item label="营业期限" prop="compBusinessTerm">
                <el-input v-model="form.compBusinessTerm" placeholder="请输入营业期限"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="18">
              <el-form-item label="登记机关" prop="compApproveOffice">
                <el-input v-model="form.compApproveOffice" placeholder="请输入登记机关"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="9">
              <el-form-item label="注册资本" prop="compRegCapital">
                <el-input v-model="form.compRegCapital" placeholder="请输入注册资本"></el-input>
              </el-form-item>
            </el-col>

            <el-col :span="9">
              <el-form-item label="实缴资本" prop="compPaidCapital">
                <el-input v-model="form.compPaidCapital" placeholder="请输入实缴资本"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="6">
              <el-form-item label="联系人" prop="compLxr">
                <el-input v-model="form.compLxr" placeholder="请输入联系人"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="企业联系人手机" prop="compLxrPhone">
                <el-input v-model="form.compLxrPhone" placeholder="请输入企业联系人手机"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="6">
              <el-form-item label="企业联系人邮箱" prop="compLxrEmail">
                <el-input v-model="form.compLxrEmail" placeholder="请输入企业联系人邮箱"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="18">
              <el-form-item label="经营范围">
                <el-input type="textarea" v-model="form.compManageScope" placeholder="请输入经营范围"></el-input>
              </el-form-item>
            </el-col>
          </el-row>
        </div>
      </el-form>
      <span>
          <el-button type="primary" @click="submitForm" v-hasPermi="['company:basic:perfectInfo']">保存信息</el-button>
      </span>
    </el-card>
    <gdMapDlg :data="[form.compLng, form.compLat]" v-model="mapDlg" @selectPoint="selectPoint"></gdMapDlg>
  </div>
</template>
<script>
  import {compUserInfo, perfectInfo} from '@/api/company/perfectInfo';
  import {listArea} from "@/api/system/area";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";
  import gdMapDlg from '@/components/MapSelect/gdMapDlg'

  export default {
    name: "PerfectInfo",
    dicts: ['sys_normal_disable'],
    components: { Treeselect, gdMapDlg },
    data() {
      return {
        // 行政区域树选项
        areaOptions: [],
        // 表单参数
        form: {},
        // 表单校验
        mapDlg:false,
        rules: {
          compName: [
            {required: true, message: "企业名称不能为空", trigger: "blur"}
          ],
          compCreditCode: [
            {required: true, message: "统一社会信用代码不能为空", trigger: "blur"},
            {
              required: true,
              pattern: /^([0-9A-HJ-NPQRTUWXY]{2}\d{6}[0-9A-HJ-NPQRTUWXY]{10}|[1-9]\d{14})$/,
              message: '统一社会信用代码格式不正确',
              trigger: 'blur'
            },
          ],
          compManageStatus: [
            {required: true, message: "经营状态不能为空", trigger: "blur"}
          ],
          compType: [
            {required: true, message: "企业类型不能为空", trigger: "blur"}
          ],
          compFr: [
            {required: true, message: "企业法人不能为空", trigger: "blur"},
            {min: 2, max: 80, message: '企业法人长度必须介于 2 和 80 之间', trigger: 'blur'}
          ],
          compFrPhone: [
            {required: true, message: "企业法人手机不能为空", trigger: "blur"},
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ],
          compArea: [
            { required: true, message: "企业所属区域不能为空", trigger: "blur" }
          ],
          compAddr: [
            { required: true, message: "企业注册地址不能为空", trigger: "blur" }
          ],
          compLng: [
            {required: true, message: "经度不能为空", trigger: ['blur', 'change']}
          ],
          compLat: [
            {required: true, message: "纬度不能为空", trigger: ['blur', 'change']}
          ],
          compRegDate: [
            {required: true, message: "成立日期不能为空", trigger: "blur"}
          ],
          compApproveDate: [
            {required: true, message: "核准日期不能为空", trigger: "blur"}
          ],
          compBusinessTerm: [
            {required: true, message: "营业期限不能为空", trigger: "blur"},
          ],
          compApproveOffice: [
            {required: true, message: "登记机关不能为空", trigger: "blur"}
          ],
          compRegCapital: [
            {required: true, message: "注册资本不能为空", trigger: "blur"}
          ],
          compPaidCapital: [
            {required: true, message: "实缴资本不能为空", trigger: "blur"}
          ],
          compLxr: [
            {required: true, message: "企业联系人不能为空", trigger: "blur"},
            {min: 2, max: 80, message: '企业联系人长度必须介于 2 和 80 之间', trigger: 'blur'}
          ],
          compLxrPhone: [
            {required: true, message: "企业联系人手机不能为空", trigger: "blur"},
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ],
          compLxrEmail: [
            {required: true, message: "企业联系人邮箱不能为空", trigger: "blur"},
            {
              type: "email",
              message: "请输入正确的邮箱地址",
              trigger: ["blur", "change"]
            }
          ],
          compManageScope: [
            {required: true, message: "经营范围不能为空", trigger: "change"}
          ],
        }
      };
    },
    created() {
      this.getList()
    },
    methods: {
      getList() {
        this.loading = true;
        listArea().then(response => {
          this.areaOptions = this.handleTree(response.data, "areaId", "parentId");
        });
        compUserInfo({}).then(res => {
          if (res.data) {
            this.form = res.data
            let arr = []
            if (this.form.areaCode) {
              arr.push(this.form.areaCode.substring(0, 2))
              arr.push(this.form.areaCode.substring(0, 4))
              arr.push(this.form.areaCode.substring(0, 6))
            }
            this.$set(this.form, 'compAreaCode', arr)
          }
        })
      },
      /** 转换行政区域数据结构 */
      normalizer(node) {
        if (node.children && !node.children.length) {
          delete node.children;
        }
        return {
          id: node.areaId,
          label: node.areaName,
          children: node.children
        };
      },
      selectPoint (lngat) {
        this.mapDlg = false;
        this.form.compLng = lngat[0]
        this.form.compLat = lngat[1]
      },
      submitForm() {
        this.$refs['form'].validate((valid) => {
          if (valid) {
            perfectInfo(this.form).then(res => {
              this.$message({
                message: '企业信息完善成功！',
                type: 'success'
              });
              this.getList()
            })
          }
        });
      }
    }
  }
</script>
<style lang="scss">
  .linebox {
    border: 1px solid #eee;
    border-radius: 8px;
    margin-bottom: 20px;
    padding: 0 15px;
  }
</style>
