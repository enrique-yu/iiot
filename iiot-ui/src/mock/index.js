import Mock from 'mockjs'

const device = require('./device')


const mocks = [
    ...device,
  ]
  
const mockArray = new Array();

for (const i of mocks) {
    mockArray.push(Mock.mock(new RegExp(i.url), i.type || 'get', i.data))
}

module.exports = mockArray

  
// 使用mockjs模拟数据
// Mock.mock(rurl?, rtype?, template|function(options))
// rurl: 表示需要拦截 URL
// rtype: 表示需要拦截的Ajax请求类型: GET， POST, DELETE 等
// template：表示数据模板
// function: 表示生成响应数据的函数
// 设置延时 400ms请求到数据
// Mock.setup({timeout: 400})
// 设置延时 200-600ms请求到数据
// Mock.setup({timeout: '200-600'})

// 生成规则：
// 数据模板中的每个属性由三部分构成：属性名 name, 生成规则 rule, 属性值 value: 'name|rule': value
// 属性名和生成规则之间用竖线 | 分隔，生成规则是可选的，有 7种格式：
// 'name|min-max': value
// 'name|count': value
// 'name|min-max.dmin-dmax': value
// 'name|min-max.dcount': value
// 'name|count.dmin-dmax': value
// 'name|count.dcount': value
// 'name|+step': value
// Mock.mock('/device/category/tree', {
//     'ret': 0,
//     'data': {
//         'mtime': '@datetime', // 随机生成日期时间
//         'score|1-800': 800, //随机生成1-800的数字
//         'rank|1-100': 100, // 随机生成1-100的数字
//         'stars|1-5': 5, 
//         'nickname': '@cname', //随机生成中文名字
//         'img': "@img('200*100', '#ffcc33', '#FFF', 'png', 'FaskMock')" //生成图片
//     }
// });
