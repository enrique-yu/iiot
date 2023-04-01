import request from '@/utils/request'

// 查询设备分类信息列表
export function listCategory(query) {
  return request({
    url: '/device/category/list',
    method: 'get',
    params: query
  })
}

// 查询设备分类信息详细
export function getCategory(deviceCategoryId) {
  return request({
    url: '/device/category/' + deviceCategoryId,
    method: 'get'
  })
}

export function getSysDefalutCategory() {
  return request({
    url: '/device/category/getSysDefalutCategory',
    method: 'get',
  })
}

// 新增设备分类信息
export function addCategory(data) {
  return request({
    url: '/device/category',
    method: 'post',
    data: data
  })
}

// 修改设备分类信息
export function updateCategory(data) {
  return request({
    url: '/device/category',
    method: 'put',
    data: data
  })
}

// 删除设备分类信息
export function delCategory(deviceCategoryId) {
  return request({
    url: '/device/category/' + deviceCategoryId,
    method: 'delete'
  })
}
