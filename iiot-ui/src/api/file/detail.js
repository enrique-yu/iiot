import request from '@/utils/request'

// 查询文件记录明细列表
export function listDetail(query) {
  return request({
    url: '/file/detail/list',
    method: 'get',
    params: query
  })
}

// 查询文件记录明细详细
export function getDetail(fileRecordDetailId) {
  return request({
    url: '/file/detail/' + fileRecordDetailId,
    method: 'get'
  })
}

// 新增文件记录明细
export function addDetail(data) {
  return request({
    url: '/file/detail',
    method: 'post',
    data: data
  })
}

// 修改文件记录明细
export function updateDetail(data) {
  return request({
    url: '/file/detail',
    method: 'put',
    data: data
  })
}

// 删除文件记录明细
export function delDetail(fileRecordDetailId) {
  return request({
    url: '/file/detail/' + fileRecordDetailId,
    method: 'delete'
  })
}
