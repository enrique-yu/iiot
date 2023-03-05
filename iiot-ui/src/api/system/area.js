import request from '@/utils/request'

// 查询系统区域配置列表
export function listArea(query) {
  return request({
    url: '/system/area/list',
    method: 'get',
    params: query
  })
}

// 查询区域列表（排除节点）
export function listAreaExcludeChild(areaId) {
  return request({
    url: '/system/area/list/exclude/' + areaId,
    method: 'get'
  })
}

// 查询系统区域配置详细
export function getArea(areaId) {
  return request({
    url: '/system/area/' + areaId,
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

