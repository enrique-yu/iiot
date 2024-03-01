import request from '@/utils/request'
//产品分类(摄像头，电表等大类) -> 设备分类（具体型号信息） -> 设备（具体设备）

//---------产品分类------------------------------
// 查询产品分类信息列表
export function listProducts(query) {
  return request({
    url: '/device/products',
    method: 'get',
    params: query
  })
}

// 查询产品分类信息(树型结构)
export function treeProducts(query) {
  return request({
    url: '/device/products/tree',
    method: 'get',
    params: query
  })
}
// 新增产品分类信息
export function addProducts(data) {
  return request({
    url: '/device/products',
    method: 'post',
    data
  })
}

// 修改产品分类信息
export function editProducts(data) {
  return request({
    url: '/device/products',
    method: 'put',
    data
  })
}

// 删除产品分类信息
export function deleteProducts(id) {
  return request({
    url: '/device/products/'+id,
    method: 'delete'
  })
}

//---------设备分类------------------------------

// 查询设备分类列表
export function listCategory(query) {
  return request({
    url: '/device/category',
    method: 'get',
    params: query
  })
}
// 新增设备分类
export function addCategory(data) {
  return request({
    url: '/device/category',
    method: 'post',
    data
  })
}

// 修改设备分类
export function editCategory(data) {
  return request({
    url: '/device/category',
    method: 'put',
    data
  })
}

// 启用/停用设备分类
export function toggleCategory(id) {
  var url = '/device/category/toggle/' + id;
  console.log('toggle category',id, url)
  return request({
    url: url,
    method: 'post'
  })
}

// 删除设备分类信息
export function deleteCategory(id) {
  return request({
    url: '/device/category/'+id,
    method: 'delete'
  })
}

export function categoryStatusEscape(code) {
  const item = categoryStatus.find((item) => item.code === code)
  return item?item.name: code;
}

export function categoryDeviceTypeEscape(code) {
  const item = categoryDeviceType.find((item) => item.code === code)
  return item?item.name: code;
}

export const categoryStatus = [{code: 1, name: '正常'}, {code: 0, name: '停用'}]
export const categoryAccessMode = ['MQTT', 'SDK']
export const categoryDeviceType = [{code: 1, name: '直连设备'}, {code: 2, name: '外部设备'}]

//--------------设备--------------------------

// 查询设备分类列表
export function listDevice(query) {
  return request({
    url: '/device',
    method: 'get',
    params: query
  })
}
// 新增设备分类
export function addDevice(data) {
  return request({
    url: '/device',
    method: 'post',
    data
  })
}

// 修改设备分类
export function editDevice(data) {
  return request({
    url: '/device',
    method: 'put',
    data
  })
}

// 启用/停用设备分类
export function toggleDevice(id) {
  var url = '/device/toggle/' + id;
  return request({
    url: url,
    method: 'post'
  })
}

// 删除设备分类信息
export function deleteDevice(id) {
  return request({
    url: '/device/'+id,
    method: 'delete'
  })
}


export function deviceStatusEscape(code) {
  const item = deviceStatus.find((item) => item.code === code)
  return item?item.name: code;
}

export const deviceStatus = [{code: 1, name: '正常'}, {code: 0, name: '停用'}, {code: 2, name: '下线'}]