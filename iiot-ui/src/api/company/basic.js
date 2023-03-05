import request from '@/utils/request'

// 查询企业基本信息列表
export function listBasic(query) {
  return request({
    url: '/company/basic/list',
    method: 'get',
    params: query
  })
}

// 查询企业基本信息详细
export function getBasic(compBasicId) {
  return request({
    url: '/company/basic/' + compBasicId,
    method: 'get'
  })
}

// 新增企业基本信息
export function addBasic(data) {
  return request({
    url: '/company/basic',
    method: 'post',
    data: data
  })
}

// 修改企业基本信息
export function updateBasic(data) {
  return request({
    url: '/company/basic',
    method: 'put',
    data: data
  })
}

// 删除企业基本信息
export function delBasic(compBasicId) {
  return request({
    url: '/system/basic/' + compBasicId,
    method: 'delete'
  })
}
