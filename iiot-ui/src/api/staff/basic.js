import request from '@/utils/request'

// 查询人员基本信息列表
export function listBasic(query) {
  return request({
    url: '/staff/basic/list',
    method: 'get',
    params: query
  })
}

// 查询人员基本信息详细
export function getBasic(staffBasicId) {
  return request({
    url: '/staff/basic/' + staffBasicId,
    method: 'get'
  })
}

// 新增人员基本信息
export function addBasic(data) {
  return request({
    url: '/staff/basic',
    method: 'post',
    data: data
  })
}

// 修改人员基本信息
export function updateBasic(data) {
  return request({
    url: '/staff/basic',
    method: 'put',
    data: data
  })
}

// 删除人员基本信息
export function delBasic(staffBasicId) {
  return request({
    url: '/staff/basic/' + staffBasicId,
    method: 'delete'
  })
}
