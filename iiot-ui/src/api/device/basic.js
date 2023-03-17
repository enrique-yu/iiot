import request from '@/utils/request'

// 查询设备基础列表
export function listBasic(query) {
  return request({
    url: '/device/basic/list',
    method: 'get',
    params: query
  })
}

// 查询设备基础详细
export function getBasic(deviceBasicId) {
  return request({
    url: '/device/basic/' + deviceBasicId,
    method: 'get'
  })
}

// 新增设备基础
export function addBasic(data) {
  return request({
    url: '/device/basic',
    method: 'post',
    data: data
  })
}

// 修改设备基础
export function updateBasic(data) {
  return request({
    url: '/device/basic',
    method: 'put',
    data: data
  })
}

// 删除设备基础
export function delBasic(deviceBasicId) {
  return request({
    url: '/device/basic/' + deviceBasicId,
    method: 'delete'
  })
}
