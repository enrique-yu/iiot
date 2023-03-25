import request from '@/utils/request'

// 查询文件目录配置列表
export function listCatalog(query) {
  return request({
    url: '/file/catalog/list',
    method: 'get',
    params: query
  })
}

// 查询文件目录配置详细
export function getCatalog(fileCatalogCode) {
  return request({
    url: '/file/catalog/' + fileCatalogCode,
    method: 'get'
  })
}

// 新增文件目录配置
export function addCatalog(data) {
  return request({
    url: '/file/catalog',
    method: 'post',
    data: data
  })
}

// 修改文件目录配置
export function updateCatalog(data) {
  return request({
    url: '/file/catalog',
    method: 'put',
    data: data
  })
}

// 删除文件目录配置
export function delCatalog(fileCatalogCode) {
  return request({
    url: '/file/catalog/' + fileCatalogCode,
    method: 'delete'
  })
}


// 查询目录已配置的文件
export function allocatedFileList(query) {
  return request({
    url: '/file/catalog/configFile/allocatedFileList',
    method: 'get',
    params: query
  })
}

// 查询目录未配置的文件
export function unallocatedFileList(query) {
  return request({
    url: '/file/catalog/configFile/unallocatedFileList',
    method: 'get',
    params: query
  })
}
