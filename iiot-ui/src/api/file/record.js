import request from '@/utils/request'

// 查询文件记录列表
export function listRecord(query) {
  return request({
    url: '/file/record/list',
    method: 'get',
    params: query
  })
}

// 查询文件记录详细
export function getRecord(fileRecordId) {
  return request({
    url: '/file/record/' + fileRecordId,
    method: 'get'
  })
}

// 新增文件记录
export function addRecord(data) {
  return request({
    url: '/file/record',
    method: 'post',
    data: data
  })
}

// 修改文件记录
export function updateRecord(data) {
  return request({
    url: '/file/record',
    method: 'put',
    data: data
  })
}

// 删除文件记录
export function delRecord(fileRecordId) {
  return request({
    url: '/file/record/' + fileRecordId,
    method: 'delete'
  })
}
