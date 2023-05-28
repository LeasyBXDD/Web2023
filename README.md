# restauranttwo

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

2022-2023-2学期

# 《Web程序设计》课程设计文档

**班级** **计算机216** **学号 2021212205048** **姓名** **郭馨蔓**

**班级** **计算机217** **学号 2021212205098** **姓名** **李奕哲**

**班级** **软工201** **学号 2020212205135** **姓名** **傅贤杨**

**班级** **软工201** **学号 2020212205171** **姓名** **韩佳梁**

**任课教师：张佳**

# 1. 选题及作品名称

点餐系统-点餐轻松GO

# 2. 要实现的需求

- 用户端功能

1. 用户登录、注册

2. 能浏览数据库读取的菜单信息，要求菜单中显示该菜品的营养素情况，能点餐并进行模拟结算

- 管理端功能：

1. 能查看用户的点餐订单，并且修改订单的状态，直至完成订单；

2. 能根据用户今日点餐数据，能根据《中国居民膳食指南（2022）》的准则和核心推荐，平衡膳食原则，把该用户今日的膳食情况转化为各类食物的数量和所占比例的图形化表示

- 将设计转化为系统，能运行起来，用于商铺完成线下点单。

# 3. 功能模块设计

## 3.1 流程设计

[需要实现的每个功能模块的操作流程设计，写操作步骤并配合画流程图，涉及多角色，需要说明每个角色曹走流程的异同点]

​                               

图3-1 点餐轻松GO（用户端）操作流程图

登录页面：用户可以选择登录或注册账户，注册账户->注册页面；登录账户，登录成功->点餐页面；用户忘记密码->修改密码界面

注册页面：用户在该页面进行信息注册，注册成功->登录页面

修改密码界面：用户可在该页面通过注册手机号获取验证码修改密码，修改成功->登录页面

点餐页面：用户选择餐桌号后，可在该页面查看菜品的营养素情况，挑选菜品并下单->结算页面

订单状态页面：用户可在该页面查询下单菜品制作情况

用户信息页面：用户可在该页面使用日期查询之前订单中菜品的膳食比例情况

 

 

图3-2 点餐轻松GO（管理端）操作流程图

登录页面：用户可以选择登录或注册账户，注册账户->注册页面；登录账户，登录成功->管理页面；用户忘记密码->修改密码界面

注册页面：用户在该页面进行信息注册，并且绑定餐厅，注册成功->登录页面

修改密码界面：用户可在该页面通过注册手机号获取验证码修改密码，修改成功->登录页面

接单页面：用户选择餐桌号后，可在该页面查看顾客下单菜品情况，进行接单

订单状态页面：用户可在该页面修改对应餐桌菜品制作情况

用户信息页面：用户可在该页面选择日期查看顾客当日就餐膳食情况

 

登录页面：用户可以选择登录或商户注册账户，选择注册则需要绑定餐厅，登录成功->订单页面

订单页面：用户可以选择相应餐桌菜单修改订单状态，如：1待付款，2已下单，3已接单，4制作中，5已完成，6已取消,直至所有菜品完成->订单完成页面，生成用户今日就餐的膳食情况

## 3.2 界面设计

[在设计阶段界面可以是低保真的线稿图，也可以是高保真的原型图或实现页面截图。

设计图需要明确每步操作的界面以及每张界面上的信息项。系统界面需保持每个端、每块功能的风格、配色统一]

 

## 3.3 功能设计

[根据前2步骤给出实现的每个模块的功能点，每个功能点涉及的信息项的输入/输出要求，并画出功能层次图，如果小组合作，实现的功能模块可以放在一张层次图里]

**用户端：**

l 用户注册：本功能主要实现顾客的注册操作。

顾客使用手机号进行注册，获取验证码，设置密码。包括用户手机号、验证码和用户密码3个信息项，其中用户手机号为11位整数，验证码为4为整数，用户密码不得少于6个字符，注册成功后用户信息保存进数据库，进入登录页面。

l 用户登录：本功能主要实现用户的登录操作。

包括用户手机号和用户密码2个信息项，用户手机号为11位整数，用户密码不得少于6个字符；用户手机号与用户密码必须与数据库中的数据相符合；输入正确后将进入点餐页面。

● 忘记密码：本功能主要实现修改密码操作。

用户使用注册手机号获取验证码，修改用户密码，包括用户手机号、验证码和用户密码3个信息项，用户手机号为11位整数，验证码为4为整数，用户密码不得少于6个字符，修改成功后用户信息保存进数据库，进入登录页面。

●  用户点单：本功能主要实现顾客点单功能。

用户选择餐桌号，即可查看店铺所有菜品以及菜品相关膳食信息，选择喜爱菜品下单，选择完毕可进入模拟结算页面。

●  用户订单状态：本功能主要为顾客提供菜品制作状态。

菜品下单后，用户可查看菜品制作状态，包括1待付款，2已下单，3已接单，4制作中，5已完成，6已取消。

●  用户信息：本功能主要实现顾客往日膳食情况查询。

用户可以通过选择日期查看当日就餐膳食情况，评估个人营养摄入情况。

**管理端：**

l 用户注册：本功能主要实现顾客的注册操作。

顾客使用手机号进行注册，获取验证码，设置密码。包括用户手机号、验证码和用户密码3个信息项，其中用户手机号为11位整数，验证码为4为整数，用户密码不得少于6个字符，注册成功后用户信息保存进数据库，进入登录页面。

l 用户登录：本功能主要实现用户的登录操作。

包括用户手机号和用户密码2个信息项，用户手机号为11位整数，用户密码不得少于6个字符；用户手机号与用户密码必须与数据库中的数据相符合；输入正确后将进入点餐页面。

● 忘记密码：本功能主要实现修改密码操作。

用户使用注册手机号获取验证码，修改用户密码，包括用户手机号、验证码和用户密码3个信息项，用户手机号为11位整数，验证码为4为整数，用户密码不得少于6个字符，修改成功后用户信息保存进数据库，进入登录页面。

●  用户订单：本功能主要实现商家接单功能。

用户选择餐桌号，即可查看下单情况，进行接单，开始制作菜品。

●  用户订单状态：本功能主要为商家修改菜品制作状态。

用户在菜品制作期间，按照菜品制作进度修改菜品制作状态，包括已下单、已接单、制作中、已完成四个状态。

●  用户信息：本功能主要实现商家对顾客膳食情况查询。

用户可以通过选择日期查看顾客当日就餐膳食情况，评估其营养摄入情况。

 

 

图3-3 功能层次图

 

## 3.3 数据库设计

［1、根据系统的功能设计，设计数据库表。

2、数据表较多时，前期设计需放上E-R图说明实体及其关系］

 

 

 

图3-3 E-R图

 

 

表3-1 user表

| 字段名称    | 数据类型 | 长度 | 字段含义   | 是否主键 |
| ----------- | -------- | ---- | ---------- | -------- |
| user_id     | bigint   | 20   | 用户编号   | 是       |
| user_name   | varchar  | 50   | 用户名称   | 否       |
| user_age    | int      | 11   | 用户年龄   | 否       |
| user_sex    | varchar  | 2    | 用户性别   | 否       |
| user_phone  | varchar  | 11   | 用户手机号 | 否       |
| user_pwd    | varchar  | 500  | 用户密码   | 否       |
| user_avatar | varchar  | 500  | 用户头像   | 否       |

表3-2 dish表

| 字段名称          | 数据类型 | 长度 | 字段含义 | 是否主键 |
| ----------------- | -------- | ---- | -------- | -------- |
| dish_id           | bigint   | 20   | 餐品编号 | 是       |
| dish_price        | decimal  | 10   | 餐品价格 | 否       |
| dish_name         | varchar  | 64   | 餐品名称 | 否       |
| dish_des          | varchar  | 400  | 餐品描述 | 否       |
| dish_img          | varchar  | 200  | 餐品图片 | 否       |
| dish_status       | int      | 11   | 餐品状态 | 否       |
| dish_weight       | int      | 11   | 餐品量   | 否       |
| dish_category_id  | bigint   | 20   | 分类编号 | 否       |
| dish_nutrition_id | bigint   | 20   | 营养编号 | 否       |

表3-3 category表

| 字段名称 | 数据类型 | 长度 | 字段含义 | 是否主键 |
| -------- | -------- | ---- | -------- | -------- |
| ctg_id   | bigint   | 20   | 类别编号 | 是       |
| ctg_name | varchar  | 64   | 类别名称 | 否       |

表3-4 nutrition表

| 字段名称 | 数据类型 | 长度 | 字段含义 | 是否主键 |
| -------- | -------- | ---- | -------- | -------- |
| ntt_id   | bigint   | 20   | 营养编号 | 是       |
| ntt_name | varchar  | 64   | 营养名称 | 否       |

表3-5 dish_flavor表

| 字段名称 | 数据类型 | 长度 | 字段含义 | 是否主键 |
| -------- | -------- | ---- | -------- | -------- |
| df_id    | bigint   | 20   | 风味编号 | 是       |
| dish_id  | bigint   | 20   | 餐品编号 | 否       |
| df_name  | varchar  | 64   | 风味名称 | 否       |
| df_val   | varchar  | 500  | 风味选项 | 否       |

表3-6 orders表

| 字段名称      | 数据类型 | 长度 | 字段含义 | 是否主键 |
| ------------- | -------- | ---- | -------- | -------- |
| order_id      | bigint   | 20   | 订单编号 | 是       |
| order_number  | varchar  | 50   | 流水号   | 否       |
| order_status  | int      | 11   | 订单状态 | 否       |
| user_id       | bigint   | 20   | 用户编号 | 否       |
| order_time    | datetime | 14   | 下单时间 | 否       |
| checkout_time | datetime | 14   | 结账时间 | 否       |
| amount        | decimal  | 10   | 支付金额 | 否       |
| remark        | varchar  | 100  | 备注     | 否       |
| number        | int      | 11   | 餐桌号   | 否       |

表3-7 admin表

| 字段名称  | 数据类型 | 长度 | 字段含义   | 是否主键 |
| --------- | -------- | ---- | ---------- | -------- |
| admin_id  | varchar  | 20   | 管理员编号 | 是       |
| admin_pwd | varchar  | 500  | 管理员密码 | 否       |

表3-8 order_detail表

| 字段名称    | 数据类型 | 长度 | 字段含义 | 是否主键 |
| ----------- | -------- | ---- | -------- | -------- |
| od_id       | bigint   | 20   | 详情编号 | 是       |
| order_id    | bigint   | 20   | 订单编号 | 否       |
| dish_id     | bigint   | 20   | 餐品编号 | 否       |
| dish_flavor | varchar  | 50   | 口味     | 否       |
| number      | int      | 11   | 数量     | 否       |
| amount      | decimal  | 10   | 金额     | 否       |

表3-9shopping_car表

| 字段名称    | 数据类型 | 长度 | 字段含义   | 是否主键 |
| ----------- | -------- | ---- | ---------- | -------- |
| id          | bigint   | 20   | 购物车编号 | 是       |
| name        | varchar  | 50   | 餐品名称   | 否       |
| dish_id     | bigint   | 20   | 餐品编号   | 否       |
| img         | varchar  | 100  | 图片       | 否       |
| user_id     | bigint   | 20   | 用户编号   | 否       |
| dish_flavor | varchar  | 50   | 口味       | 否       |
| number      | int      | 11   | 数量       | 否       |
| amount      | decimal  | 10   | 金额       | 否       |

 

 

## 3.4 接口设计

1. loginCheck接口

功能简介：登录

请求URL：src\php\loginCheck.php

请求方式：GET

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| phone    | varchar  | 用户名   | 必要     |
| pwd      | varchar  | 用户密码 | 必要     |

 

```
成功数据返回：[{"code":1,"data":[],"msg":"登录成功"}]
```

失败数据返回：[{"code":0,"data":[],"msg":"用户不存在"}]

[{"code":2,"data":[],"msg":"密码错误"}]

2. 管理员登录接口

功能简介：管理员登录

请求URL：src\php\adminLogin.php

请求方式：GET

参数设置：

| 参数名称   | 数据类型 | 含义       | 是否必需 |
| ---------- | -------- | ---------- | -------- |
| admin_name | varchar  | 管理员名   | 必要     |
| admin_pwd  | varchar  | 管理员密码 | 必要     |

 

成功数据返回：[{"code":1,"data":[],"msg":"登录成功"}]

失败数据返回：[{"code":0,"data":[],"msg":"管理员不存在"}]

[{"code":2,"data":[],"msg":"密码错误"}]

3.用户信息收集接口

功能简介：向数据库中修改用户信息。

请求方式：GET

请求URL:src/php/updateUserInfo.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | bigint   | 编号 | 必需     |
| sex      | varchar  | 性别 | 否       |
| age      | int      | 年龄 | 否       |
| name     | varchar  | 姓名 | 否       |
| avatar   | varchar  | 头像 | 否       |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"用户信息修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"用户信息修改失败"

​          }]

4. 获取餐品分类接口

功能简介：获取餐品分类

请求方式：GET

请求URL:src/php/getCategory.php

参数设置：无

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              id:编号,

​                              name:名称

}],

​          msg:"获取成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"获取失败"

​          }]

5. 获取餐品接口

功能简介：根据餐品分类获取餐品

请求方式：GET

请求URL:src/php/getDish.php

参数设置：

| 参数名称 | 数据类型 | 含义         | 是否必需 |
| -------- | -------- | ------------ | -------- |
| id       | bigint   | 餐品分类编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              dish_id:编号,

​                              dish_name:名称

​                              dish_price:价格

​                              dish_img:图片

​                              dish_des:描述

​                              dish_status: [0-停售,1-起售]

​                              nutrition:营养分类

​                              dish_weight:重量

}],

​          msg:"获取菜单成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"获取菜单失败"

​          }]

 

6. 增加餐品接口

功能简介：增加餐品

请求方式：GET

请求URL:src/php/addDish.php

参数设置：

| 参数名称     | 数据类型 | 含义     | 是否必需 |
| ------------ | -------- | -------- | -------- |
| name         | varchar  | 餐品名称 | 必需     |
| price        | decima   | 价格     | 必需     |
| img          | varchar  | 图片     | 否       |
| des          | varchar  | 描述     | 否       |
| status       | int      | 状态     | 必需     |
| weight       | int      | 重量     | 必需     |
| category_id  | bigint   | 餐品类别 | 必需     |
| nutrition_id | bigint   | 营养分类 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

​          }]

​                     

7. 修改餐品接口

功能简介：修改餐品

请求方式：GET

请求URL:src/php/updateDish.php

参数设置：

| 参数名称     | 数据类型 | 含义     | 是否必需 |
| ------------ | -------- | -------- | -------- |
| id           | bigint   | 编号     | 必需     |
| name         | varchar  | 餐品名称 | 必需     |
| price        | decima   | 价格     | 必需     |
| img          | varchar  | 图片     | 否       |
| des          | varchar  | 描述     | 否       |
| status       | int      | 状态     | 必需     |
| weight       | int      | 重量     | 必需     |
| category_id  | bigint   | 餐品类别 | 必需     |
| nutrition_id | bigint   | 营养分类 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

​                     

8. 删除餐品接口

功能简介：删除餐品

请求方式：GET

请求URL:src/php/deleteDish.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | bigint   | 编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"删除成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"删除失败"

​          }]

9. 用户修改密码接口

功能简介：用户修改密码

请求方式：GET

请求URL:src/php/updateUser.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | bigint   | 编号 | 必需     |
| pwd      | varchar  | 密码 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

10. 管理员修改密码接口

功能简介：管理员修改密码

请求方式：GET

请求URL:src/php/updateAdmin.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | varchar  | 名称 | 必需     |
| pwd      | varchar  | 密码 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

11. 添加餐品分类接口

功能简介：添加餐品分类

请求方式：GET

请求URL:src/php/addCategory.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| name     | varchar  | 名称 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

​          }]

12.修改餐品分类接口

功能简介：修改餐品分类

请求方式：GET

请求URL:src/php/updateCategory.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | int      | 编号 | 必需     |
| name     | varchar  | 名称 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

13. 删除餐品分类接口

功能简介：删除餐品分类

请求方式：GET

请求URL:src/php/deleteCategory.php

参数设置：

| 参数名称 | 数据类型 | 含义 | 是否必需 |
| -------- | -------- | ---- | -------- |
| id       | int      | 编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"删除成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"删除失败"

​          }]

14 添加餐品口味接口

功能简介：添加餐品口味

请求方式：GET

请求URL:src/php/addFlavor.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 餐品编号 | 必需     |
| name     | varchar  | 口味名称 | 必需     |
| val      | varchar  | 口味选项 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

​          }]

15 添加餐品口味接口

功能简介：添加餐品口味

请求方式：GET

请求URL:src/php/deleteFlavor.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 口味编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"删除成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"删除失败"

​          }]

16 修改餐品口味接口

功能简介：修改餐品口味

请求方式：GET

请求URL:src/php/deleteFlavor.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 口味编号 | 必需     |
| name     | varchar  | 口味名称 | 必需     |
| val      | varchar  | 口味选项 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

17 查找餐品口味接口

功能简介：按照餐品查找餐品口味

请求方式：GET

请求URL:src/php/getFlavor.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 餐品编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              name:口味名称

​                              val:口味选项

}],

​          msg:"查询成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"查询失败"

​          }]

18 新建订单接口

功能简介：新增订单

请求方式：GET

请求URL:src/php/addOrder.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 用户编号 | 必需     |
| amount   | decimal  | 总金额   | 必需     |
| remark   | varchar  | 备注     | 否       |
| number   | int      | 餐桌号   | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

​          }]

19 修改订单状态接口

功能简介：新增订单

请求方式：GET

请求URL:src/php/updateOrder.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 用户编号 | 必需     |
| status   | int      | 状态     | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

​          }]

20 查询历史订单接口

功能简介：查询历史订单

请求方式：GET

请求URL:src/php/getOrder.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 用户编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              order_number:订单流水号

​                              status:订单状态

​                              phone:手机号

​                              order_time:下单时间

​                              checkout_time:结账时间

​                              amount:实收金额

​                              remark:备注

​                              name:用户姓名

​                              number:餐桌号

}],

​          msg:"修改成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"修改失败"

 

 

21 添加订单详情接口

功能简介：添加订单详情

请求方式：GET

请求URL:src/php/addOrderDetail.php

参数设置：

| 参数名称    | 数据类型 | 含义     | 是否必需 |
| ----------- | -------- | -------- | -------- |
| id          | int      | 订单编号 | 必需     |
| dish_id     | varchar  | 餐品编号 | 必需     |
| number      | varchar  | 数量     | 必需     |
| amount      | int      | 总金额   | 必需     |
| dish_flavor | varchar  | 口味选择 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

22 查询餐品销售接口

功能简介：查询餐品销售

请求方式：GET

请求URL:src/php/getNumber.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 餐品编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                         number:数量

}],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

23 购物车新增接口

功能简介：如果购物车中没有该餐品，则新增

请求方式：GET

请求URL:src/php/addShopping.php

参数设置：

| 参数名称    | 数据类型 | 含义     | 是否必需 |
| ----------- | -------- | -------- | -------- |
| dish_id     | int      | 餐品编号 | 必需     |
| user_id     | int      | 用户编号 | 必需     |
| name        | varchar  | 餐品名称 | 必需     |
| img         | varchar  | 图片     | 必需     |
| dish_flavor | varchar  | 口味     | 必需     |
| amount      | int      | 金额     | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"添加成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"添加失败"

24 查询购物车中是否存在相同商品接口

功能简介：若餐品，用户以及口味一样则判断相同

请求方式：GET

请求URL:src/php/isExists.php

参数设置：

| 参数名称    | 数据类型 | 含义     | 是否必需 |
| ----------- | -------- | -------- | -------- |
| dish_id     | int      | 餐品编号 | 必需     |
| user_id     | int      | 用户编号 | 必需     |
| dish_flavor | varchar  | 口味     | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"存在"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"不存在"

25 修改购物车接口

功能简介：若购物车中已经存在，那么数量修改，金额修改

请求方式：GET

请求URL:src/php/updateShopping.php

参数设置：

| 参数名称    | 数据类型 | 含义       | 是否必需 |
| ----------- | -------- | ---------- | -------- |
| number      | int      | 变化的数量 | 必需     |
| dish_id     | int      | 餐品编号   | 必需     |
| user_id     | int      | 用户编号   | 必需     |
| dish_flavor | varchar  | 口味       | 必需     |
| amount      | int      | 金额       | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"存在"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"不存在"

26 查询购物车接口

功能简介：根据用户id查询购物车

请求方式：GET

请求URL:src/php/getShopping.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| user_id  | int      | 用户编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              name:餐品名称

​                              img:图片

​                              dish_flavor:口味

​                              number:数量

​                              amount:金额

}],

​          msg:"查询成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"查询失败"

27 清空购物车接口

功能简介：清空购物车

请求方式：GET

请求URL:src/php/clearShopping.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| user_id  | int      | 用户编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"清空成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"清空失败"

28 查询用户今天的营养接口

功能简介：获取各个营养的重量

请求方式：GET

请求URL:src/php/getNtt.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| user_id  | int      | 用户编号 | 必需     |
| year     | varchar  | 年       | 必需     |
| month    | varchar  | 月       | 必需     |
| day      | varchar  | 日       | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[{

​                              name:营养名称

​                              weight:重量

}],

​          msg:"查询成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"查询失败"

29 删除购物车接口

功能简介：如果购物车中的数量为1则删除

请求方式：GET

请求URL:src/php/deleteShopping.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 用户编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"删除成功"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"删除失败"

30 判断购物车中的数量是否为1接口

功能简介：判断购物车中的数量是否为1

请求方式：GET

请求URL:src/php/isOne.php

参数设置：

| 参数名称 | 数据类型 | 含义     | 是否必需 |
| -------- | -------- | -------- | -------- |
| id       | int      | 用户编号 | 必需     |

 

数据返回：

数据返回成功结果：[{

​          code:1,

​          data:[],

​          msg:"数量为1"

​          }]

​                         

 

数据返回失败结果：[{

​          code:0,

​          data:[],

​          msg:"数量不为1"

 

 

 

……

# 4. 软件说明

## 4.1 开发环境说明

IDE：VScode

## 4.2 运行环境说明

Wampserver

Google Chrome

# 5. 开发计划

## 5.1 时间安排

5.10～5.14： 小组讨论并完成计划书书写

5.15～5.24： 前后端分别开发

5.25～5.29： 前后端联调

5.30～6.2: 整理代码完善计划书，完成作业提交

## 5.2 项目分工

小组长：郭馨蔓，负责组织开会、设计书、设计、完成部分前端、服务端开发

前端：李奕哲、韩佳梁，负责前端开发，设计

后端：傅贤杨，负责服务端开发，设计

# 6. 非原创部分说明
