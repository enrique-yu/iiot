import request from '@/utils/request'

// 加载附件配置
export function getConfigDataList(query) {
  return request({
    url: '/file/manage/getConfigDataList',
    method: 'get',
    params: query
  })
}

// 附件在线查看
export function onlinePreview(encryptFileId) {
  const data = { encryptFileId };
  return request({
    url: '/file/online/preview',
    method: 'post',
    params: data
  })
}

