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
