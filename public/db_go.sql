CREATE database db_go;
USE db_go;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:8889
-- 生成日期： 2023-05-29 08:42:04
-- 服务器版本： 5.7.39
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `db_go`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `admin_pwd` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员信息';

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_pwd`) VALUES
('root', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `ctg_id` bigint(20) NOT NULL COMMENT '主键',
  `ctg_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '分类名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品分类';

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`ctg_id`, `ctg_name`) VALUES
(1, '主食'),
(3, '小吃'),
(2, '川菜'),
(4, '饮品');

-- --------------------------------------------------------

--
-- 表的结构 `dish`
--

CREATE TABLE `dish` (
  `dish_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `dish_category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `dish_price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `dish_image` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '图片',
  `dish_des` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `dish_status` int(11) NOT NULL DEFAULT '1' COMMENT '0 停售 1 起售',
  `dish_weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量',
  `dish_nutrition_id` bigint(20) NOT NULL COMMENT '营养分类id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品管理';

--
-- 转存表中的数据 `dish`
--

INSERT INTO `dish` (`dish_id`, `dish_name`, `dish_category_id`, `dish_price`, `dish_image`, `dish_des`, `dish_status`, `dish_weight`, `dish_nutrition_id`) VALUES
(1, '辣子鸡', 2, '80.00', 'https://static.xinshipu.com/20160303/original/1456997621331.jpg', '来自鲜嫩美味的小鸡，值得一尝', 1, 250, 2),
(2, '盐卤豆花水煮鱼', 2, '65.00', 'https://hellorfimg.zcool.cn/provider_image/large/hi2240046414.jpg', '川菜经典，豆花柔嫩，鱼片鲜嫩，爽口微辣，香气十足。', 1, 36, 2),
(3, '米饭', 1, '3.00', 'https://img2.baidu.com/it/u=108457981,2972760881&fm=253&fmt=auto&app=138&f=JPEG?w=610&h=406', '主食之王，软糯香甜。', 1, 52, 3),
(4, '板烧鸡腿堡', 3, '23.00', 'https://img2.baidu.com/it/u=2196094063,2946524437&fm=253&fmt=auto&app=120&f=PNG?w=667&h=500', '原块去骨鸡排嫩滑多汁，与翠绿新鲜的生菜加洋葱，口感丰富，让人食指大动。', 1, 16, 1),
(5, '加多宝', 4, '8.00', 'https://img1.baidu.com/it/u=3570795302,2814812705&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '天然草本，清热解渴好选择。', 1, 26, 3);

-- --------------------------------------------------------

--
-- 表的结构 `dish_flavor`
--

CREATE TABLE `dish_flavor` (
  `df_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `df_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `df_value` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '口味数据list'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品口味关系表';

--
-- 转存表中的数据 `dish_flavor`
--

INSERT INTO `dish_flavor` (`df_id`, `dish_id`, `df_name`, `df_value`) VALUES
(1, 1, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');

-- --------------------------------------------------------

--
-- 表的结构 `nutrition`
--

CREATE TABLE `nutrition` (
  `ntt_id` bigint(20) NOT NULL COMMENT '主键',
  `ntt_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '营养名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='营养分类';

--
-- 转存表中的数据 `nutrition`
--

INSERT INTO `nutrition` (`ntt_id`, `ntt_name`) VALUES
(3, '碳水化合物'),
(1, '脂肪'),
(4, '膳食纤维'),
(2, '蛋白质');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL COMMENT '订单编号',
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款，2已下单，3已接单，4制作中，5已完成，6已取消',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `number` int(11) NOT NULL COMMENT '餐桌号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`order_id`, `order_status`, `user_id`, `order_time`, `checkout_time`, `amount`, `remark`, `number`) VALUES
(1, 2, 1, '2023-05-29 08:32:08', NULL, '83.00', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` bigint(20) NOT NULL COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表';

--
-- 转存表中的数据 `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `order_id`, `dish_id`, `dish_flavor`, `number`, `amount`) VALUES
(1, 1, 1, NULL, 1, '80.00'),
(2, 1, 5, NULL, 1, '8.00');

-- --------------------------------------------------------

--
-- 表的结构 `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `user_sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `user_avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `user_pwd` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `user_age` int(11) DEFAULT '18' COMMENT '年龄'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_phone`, `user_sex`, `user_avatar`, `user_pwd`, `user_age`) VALUES
(1, '傅贤杨', '13958958107', '男', '', 'e10adc3949ba59abbe56e057f20f883e', 21);

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`) USING BTREE;

--
-- 表的索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ctg_id`) USING BTREE,
  ADD UNIQUE KEY `idx_category_name` (`ctg_name`);

--
-- 表的索引 `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dish_id`) USING BTREE,
  ADD UNIQUE KEY `idx_dish_name` (`dish_name`);

--
-- 表的索引 `dish_flavor`
--
ALTER TABLE `dish_flavor`
  ADD PRIMARY KEY (`df_id`) USING BTREE;

--
-- 表的索引 `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`ntt_id`) USING BTREE,
  ADD UNIQUE KEY `idx_category_name` (`ntt_name`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`) USING BTREE;

--
-- 表的索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_id`) USING BTREE;

--
-- 表的索引 `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `ctg_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `dish`
--
ALTER TABLE `dish`
  MODIFY `dish_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `dish_flavor`
--
ALTER TABLE `dish_flavor`
  MODIFY `df_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `ntt_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
