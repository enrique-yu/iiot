import request from '@/utils/request'

// 查询系统组织账户列表
export function listDomain(query) {
  return request({
    url: '/system/domain/list',
    method: 'get',
    params: query
  })
}

// 查询系统组织账户详细
export function getDomain(domainId) {
  return request({
    url: '/system/domain/' + domainId,
    method: 'get'
  })
}

// 新增系统组织账户
export function addDomain(data) {
  return request({
    url: '/system/domain',
    method: 'post',
    data: data
  })
}

// 修改系统组织账户
export function updateDomain(data) {
  return request({
    url: '/system/domain',
    method: 'put',
    data: data
  })
}

// 删除系统组织账户
export function delDomain(domainId) {
  return request({
    url: '/system/domain/' + domainId,
    method: 'delete'
  })
}
