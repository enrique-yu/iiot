import request from '@/utils/request'

// 查询系统组织权限列表
export function listRoles(query) {
  return request({
    url: '/system/droles/list',
    method: 'get',
    params: query
  })
}

// 查询系统组织权限详细
export function getRoles(drolesId) {
  return request({
    url: '/system/droles/' + drolesId,
    method: 'get'
  })
}

// 新增系统组织权限
export function addRoles(data) {
  return request({
    url: '/system/droles',
    method: 'post',
    data: data
  })
}

// 修改系统组织权限
export function updateRoles(data) {
  return request({
    url: '/system/droles',
    method: 'put',
    data: data
  })
}

// 删除系统组织权限
export function delRoles(drolesId) {
  return request({
    url: '/system/droles/' + drolesId,
    method: 'delete'
  })
}
