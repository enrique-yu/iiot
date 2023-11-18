<script>
  export default {
    props: ["value", "data"], // * 父组件传来的value(v-param="xxx")值
    data() {
      return {
        lngat: [],
        inputAddr: null,
        thisMap: {},
      };
    },
    computed: {
      cdata: function () {
        this.lngat = this.data;
        return this.data;
      },
      hasPoi: function () {
        if (this.data[0] && this.data[1]) return true;
        if (!this.data[0] || !this.data[1]) return false;
      },
      // ! 计算更新父组件传来的value(v-param="xxx")值,控制对话框显示隐藏
      dialogVisible: {
        get: function () {
          return this.value;
        },
        set: function (n) {
          this.$emit("input", n);
        },
      },
    },
    mounted() {
      //DOM初始化完成进行地图初始化
    },
    methods: {
      // 地址搜索
      bdGEO() {
        this.thisMap.clearOverlays();
        const myGeo = new BMap.Geocoder();
        const _that = this;
        myGeo.getPoint(
          this.inputAddr,
          function (point) {
            if (point) {
              _that.lngat = [point.lng, point.lat];
              const address = new BMap.Point(point.lng, point.lat);
              _that.addMarker(
                address,
                new BMap.Label(_that.inputAddr, {
                  offset: new BMap.Size(20, -10),
                })
              );
            }
          },
          "合肥市"
        );
      },
      addMarker(point, label) {
        const marker = new BMap.Marker(point);
        this.thisMap.addOverlay(marker);
        marker.setLabel(label);
        this.thisMap.centerAndZoom(point, 15);
      },
      initMap() {
        this.createMap();
        this.setMapEvent();
      },
      setPoint(e) {
        let _this = this;
        this.thisMap.clearOverlays();
        var myMarker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
        this.thisMap.addOverlay(myMarker);
        this.lngat[0] = e.point.lng;
        this.lngat[1] = e.point.lat;
        var geocoder = new BMap.Geocoder();
        geocoder.getLocation(e.point, function (geocoderResult, LocationOptions) {
          if (
            geocoderResult.surroundingPois &&
            geocoderResult.surroundingPois.length > 0
          ) {
            _this.inputAddr =
              geocoderResult.address + geocoderResult.surroundingPois[0].title;
          } else if (geocoderResult.business) {
            var addressArray = geocoderResult.business.split(",")[2];
            _this.inputAddr = geocoderResult.address + addressArray;
          } else {
            _this.inputAddr = geocoderResult.address;
          }
        });
      },
      createMap() {
        const map = new BMap.Map(this.$refs.myMap, { enableMapClick: false });
        const point = new BMap.Point(117.238768,31.801868);
        map.centerAndZoom(point, 15);
        map.enableScrollWheelZoom(true);
        this.thisMap = map;
        map.addEventListener("click", this.setPoint);
      },
      setMapEvent() {
        this.thisMap.enableScrollWheelZoom();
        this.thisMap.enableKeyboard();
      },
      selectPoint() {
        this.$emit("selectPoint", this.lngat);
      },

      /**dialog显示时调用*/
      dlgOpen() {
        let _that = this;
        this.$nextTick(() => {
          this.initMap();

          if (this.hasPoi) {
            setTimeout(() => {
              var geocoder = new BMap.Geocoder();
              geocoder.getLocation(
                new BMap.Point(this.cdata[0], this.cdata[1]),
                function (result) {
                  _that.inputAddr = result.address;

                  const address = new BMap.Point(_that.cdata[0], _that.cdata[1]);
                  _that.addMarker(
                    address,
                    new BMap.Label(result.address, {
                      offset: new BMap.Size(20, -10),
                    })
                  );
                }
              );
            }, 200);
          }
        });
      },
      /**dialog关闭时调用 */
      dlgClose() {
        this.lngat = [];
        this.inputAddr = null;
        this.addrLAL = null;
        this.thisMap = {};
      },

      // 关闭窗口
      handleClose() {
        // * 通过默认事件"input",传递参数更新父组件v-param="xxx"绑定的值
        this.$emit("input", false);
      },
    },
  };
</script>

<template>
  <div>
    <el-dialog custom-class="mapCoordinatesDlg" :show-close="false" append-to-body @close="dlgClose"
               @open="dlgOpen" size="mini" :visible.sync="dialogVisible" width="900px">
      <div style="margin: auto">
        <div class="bdMapSearchBox">
          <span class="MapTitleSearch" >地理位置查询:</span>
          <el-input  v-model="inputAddr" placeholder="请输入查询的地理位置"
                    style="margin-right: 30px; width: 360px"></el-input>
          <el-button  type="primary" @click="bdGEO()">查询</el-button>
          <el-button :disabled="lngat.length == 0"  type="success" @click="selectPoint">
            确定</el-button>
        </div>
      </div>
      <div id="MapContainer" ref="myMap"></div>
    </el-dialog>
  </div>
</template>
<style lang="scss">
  .bdMapSearchBox {
    position: absolute;
    top: 0;
    z-index: 999999;
    margin-top: 10px;
  }

  #MapContainer {
    padding: 0px;
    margin: 0px;
    width: 100%;
    height: 800px;
  }

  .MapTitleSearch {
    font-weight: 700;
    font-size: 18px;
    margin-left: 20px;
  }
</style>
