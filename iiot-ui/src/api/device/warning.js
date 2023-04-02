import request from '@/utils/request'

// 查询设备活动预警列表
export function activityIndex(query) {
  return request({
    url: '/device/warning/activityIndex',
    method: 'get',
    params: query
  })
}
