import request from '@/utils/request'

// 查询部门列表
export function listDept(query) {
  return request({
    url: '/oa/dept/list',
    method: 'get',
    params: query
  })
}

// 新增部门
export function addDept(data) {
  return request({
    url: '/oa/dept',
    method: 'post',
    data: data
  })
}

// 修改部门
export function updateDept(data) {
  return request({
    url: '/oa/dept',
    method: 'put',
    data: data
  })
}

// 删除部门
export function delDept(deptId) {
  return request({
    url: '/oa/dept/' + deptId,
    method: 'delete'
  })
}
