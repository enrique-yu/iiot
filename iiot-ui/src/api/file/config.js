import request from '@/utils/request'

// 查询文件配置列表
export function listConfig(query) {
  return request({
    url: '/file/config/list',
    method: 'get',
    params: query
  })
}

// 查询文件配置详细
export function getConfig(fileConfigCode) {
  return request({
    url: '/file/config/' + fileConfigCode,
    method: 'get'
  })
}

// 新增文件配置
export function addConfig(data) {
  return request({
    url: '/file/config',
    method: 'post',
    data: data
  })
}

// 修改文件配置
export function updateConfig(data) {
  return request({
    url: '/file/config',
    method: 'put',
    data: data
  })
}

// 删除文件配置
export function delConfig(fileConfigCode) {
  return request({
    url: '/file/config/' + fileConfigCode,
    method: 'delete'
  })
}
