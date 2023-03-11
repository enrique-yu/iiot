import request from '@/utils/request'

export function compUserInfo(query) {
  return request({
    url: '/company/basic/getCompUserInfo',
    method: 'get',
    params: query
  })
}

export function perfectInfo(data) {
  return request({
    url: '/company/basic/perfectInfo',
    method: 'put',
    data: data
  })
}
