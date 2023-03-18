import request from '@/utils/request'
// 加载附件配置
export function getFileList(query) {
  return request({
    url: '/file/data/configDataList',
    method: 'get',
    params: query
  })
}
export function fileUploadAPI(data) {
    return request({
      url: '/file/upload',
      method: 'post',
      data
    })
  }
export function getSeeFile(id) {
    return request({
      url: '/file/view/'+id,
      method: 'get',
    })
  }
// 附件下载
export function getFileDownload(id) {
  return request({
    url: '/file/download/'+id,
    method: 'get',
  })
}
// 表单保存
export function fileDataList(id) {
  return request({
    url: '/file/data/fileDataList/'+id,
    method: 'get',
  })
}