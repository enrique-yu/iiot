import request from '@/utils/request'

// 查询文件与目录关系列表
export function listRelation(query) {
  return request({
    url: '/file/relation/list',
    method: 'get',
    params: query
  })
}

// 查询文件与目录关系详细
export function getRelation(fileCatalogRelationId) {
  return request({
    url: '/file/relation/' + fileCatalogRelationId,
    method: 'get'
  })
}

// 新增文件与目录关系
export function addRelation(data) {
  return request({
    url: '/file/relation',
    method: 'post',
    data: data
  })
}

// 修改文件与目录关系
export function updateRelation(data) {
  return request({
    url: '/file/relation',
    method: 'put',
    data: data
  })
}

// 删除文件与目录关系
export function delRelation(fileCatalogRelationId) {
  return request({
    url: '/file/relation/' + fileCatalogRelationId,
    method: 'delete'
  })
}
