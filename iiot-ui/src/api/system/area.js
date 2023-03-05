import request from '@/utils/request'

// 查询系统区域配置列表
export function listArea(query) {
  return request({
    url: '/system/area/list',
    method: 'get',
    params: query
  })
}

// 查询系统区域配置详细
export function getArea(areaCode) {
  return request({
    url: '/system/area/' + areaCode,
    method: 'get'
  })
}

// 新增系统区域配置
export function addArea(data) {
  return request({
    url: '/system/area',
    method: 'post',
    data: data
  })
}

// 修改系统区域配置
export function updateArea(data) {
  return request({
    url: '/system/area',
    method: 'put',
    data: data
  })
}

// 删除系统区域配置
export function delArea(areaCode) {
  return request({
    url: '/system/area/' + areaCode,
    method: 'delete'
  })
}
