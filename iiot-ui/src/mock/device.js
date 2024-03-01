const Mock = require('mockjs')

const addResponse = { 'code':200, 'msg':'新建成功' }
const editResponse = { 'code':200, 'msg':'修改成功' }
const deleteResponse = { 'code':200, 'msg':'删除成功' }
const optionErrorResponse = { 'code':500, 'msg':'系统异常' }
const productsTree = {
    'total': 3,
    'data': [
        {typeId: 1, typeName: '摄像头', 'desc': '摄像头一级分类', 'sort':1},
        {
            typeId: 2, typeName: '智能家居', 'desc': '智能家居一级分类', 'sort':2,
            children: [
                {typeId: 21, 'parentId': 2, 'parentName': '智能家居', typeName: '窗帘', 'desc': '智能家居——窗帘', 'sort':21},
                {typeId: 22, 'parentId': 2, 'parentName': '智能家居', typeName: '中央空调', 'desc': '智能家居——中央空调', 'sort':22},
            ]
        },
        {typeId: 3, typeName: '电表', 'desc': '智能电表', 'sort':1}
    ]
}
const productsList = {
    'total': 3,
    'data': [
        {typeId: 1, typeName: '摄像头', 'desc': '摄像头一级分类', 'sort':1},
        {typeId: 2, typeName: '智能家居', 'desc': '智能家居一级分类', 'sort':2,},
        {typeId: 21, 'parentId': 2, 'parentName': '智能家居', typeName: '窗帘', 'desc': '智能家居——窗帘', 'sort':21},
        {typeId: 22, 'parentId': 2, 'parentName': '智能家居', typeName: '中央空调', 'desc': '智能家居——中央空调', 'sort':22},
        {typeId: 3, typeName: '电表', 'desc': '智能电表', 'sort':1}
    ]
}

const categoryList = {
    'total': 4,
    'data': [
        // accessMode(接入方式)  deviceType(设备类型)
        {productId: 1, status: 1, accessMode: 'MQTT', deviceType:'直连设备', productName: '海康威视K005h6', desc:'说明', typeId:1, typeName: '摄像头'},
        {productId: 2, status: 1, accessMode: 'MQTT', deviceType:'直连设备', productName: '海康威视Jf0085h', typeId:1, typeName: '摄像头'},
        {productId: 3, status: 1, accessMode: 'SDK', deviceType:'直连设备', productName: '敬慕智能家居', typeId:21, typeName: '窗帘'},
        {productId: 4, status: 1, accessMode: 'SDK', deviceType:'直连设备', productName: '格力', typeId:22, typeName: '中央空调'}
    ]
}
    
const deviceList = {
    'total': 4,
    'data': [
        // accessMode(接入方式)  deviceType(设备类型) protocol(对接协议，用于识别接口)
        {deviceId: 1, deviceName: '客厅摄像头', protocol:'Camera_v1.2', productId: 1, status: 1, accessMode: 'MQTT', deviceType:'直连设备', productName: '海康威视K005h6', desc:'说明', typeId:1, typeName: '摄像头'},
        {deviceId: 2, deviceName: '庭院摄像头', protocol:'Camera_v1.4', productId: 2, status: 1, accessMode: 'MQTT', deviceType:'直连设备', productName: '海康威视Jf0085h', desc:'@cname', typeId:1, typeName: '摄像头'},
        {deviceId: 3, deviceName: '客厅窗帘', protocol:'Camera_v1.2', productId: 3, status: 1, accessMode: 'SDK', deviceType:'直连设备', productName: '敬慕智能家居', desc:'@cname', typeId:21, typeName: '窗帘'},
        {deviceId: 4, deviceName: '空调', protocol:'Camera_v1.2', productId: 4, status: 1, accessMode: 'SDK', deviceType:'直连设备', productName: '格力', typeId:22, typeName: '中央空调'}
    ]
}
    
module.exports = [
    
    { url: '/dev-api/device/products/tree', type: 'get', data: productsTree },
    { url: '/dev-api/device/products', type: 'get', data: productsList },
    { url: '/dev-api/device/products', type: 'post',  data: addResponse },
    { url: '/dev-api/device/products', type: 'put',  data: editResponse },
    { url: '/dev-api/device/products', type: 'delete',  data: deleteResponse },

    { url: '/dev-api/device/category', type: 'get', data: categoryList },
    { url: '/dev-api/device/category/toggle', type: 'post',  data: optionErrorResponse },
    { url: '/dev-api/device/category', type: 'post',  data: addResponse },
    { url: '/dev-api/device/category', type: 'put',  data: editResponse },
    { url: '/dev-api/device/category', type: 'delete',  data: deleteResponse },
 
    
    { url: '/dev-api/device', type: 'get', data: deviceList },
    { url: '/dev-api/device/toggle', type: 'post',  data: optionErrorResponse },
    { url: '/dev-api/device', type: 'post',  data: addResponse },
    { url: '/dev-api/device', type: 'put',  data: editResponse },
    { url: '/dev-api/device', type: 'delete',  data: deleteResponse },
 
    
 
]
  
  