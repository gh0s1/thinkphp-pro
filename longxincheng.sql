-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-08-30 10:01:46
-- 服务器版本： 5.5.38-log
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `longxincheng`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE IF NOT EXISTS `tp_admin` (
  `id` int(10) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(33) DEFAULT NULL,
  `posttime` varchar(40) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `username`, `password`, `posttime`) VALUES
(1, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_config`
--

CREATE TABLE IF NOT EXISTS `tp_config` (
  `id` int(20) NOT NULL,
  `wxuser` varchar(40) NOT NULL,
  `appid` varchar(40) NOT NULL,
  `appsecret` varchar(50) NOT NULL,
  `posttime` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_config`
--

INSERT INTO `tp_config` (`id`, `wxuser`, `appid`, `appsecret`, `posttime`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_map_type`
--

CREATE TABLE IF NOT EXISTS `tp_map_type` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `imgUrl` text NOT NULL,
  `posttime` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_map_type`
--

INSERT INTO `tp_map_type` (`id`, `type`, `imgUrl`, `posttime`) VALUES
(1, '减排小组', 'upload/2016-06-28/5771e8ba48a95.png', '1468389895'),
(2, '停车场', 'upload/2016-06-28/5771e8c7bb2a6.png', '1467082951'),
(3, '社会充电', 'upload/2016-06-28/5771e8d4a085e.png', '1468221048'),
(4, '会员充电', 'upload/2016-07-01/577607c337d78.png', '1468049623'),
(5, '综合类型', 'upload/2016-07-13/578603460920f.png', '1468400454');

-- --------------------------------------------------------

--
-- 表的结构 `tp_pile`
--

CREATE TABLE IF NOT EXISTS `tp_pile` (
  `id` int(30) NOT NULL,
  `pilename` varchar(50) NOT NULL,
  `positions` text NOT NULL,
  `lng` varchar(30) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `type` int(10) NOT NULL,
  `mulType` varchar(40) NOT NULL DEFAULT '0',
  `error` int(20) NOT NULL DEFAULT '0',
  `likes` int(20) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `posttime` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_pile`
--

INSERT INTO `tp_pile` (`id`, `pilename`, `positions`, `lng`, `lat`, `type`, `mulType`, `error`, `likes`, `status`, `posttime`) VALUES
(9, '五年一千吨李震组', '市南区金湖路21号', '120.391605', '36.085406', 4, '4', 9, 12, 1, '1468852782'),
(43, '深圳路东充电桩(普)', '崂山区深圳路162号公交车停车场', '120.45824', '36.120918', 3, '3', 0, 0, 1, '1468852995'),
(41, '维客商务国际中心(特-快充)', '李沧区京口路84号', '120.424614', '36.167686', 3, '3', 0, 0, 1, '1468849208'),
(10, '五年一千吨桩子组', '市北区宁安路27号', '120.410169', '36.120667', 4, '4', 0, 0, 1, '1468852800'),
(11, '五年一千吨项目组', '市北区鞍山路3号十六中停车场', '120.375132', '36.101873', 4, '4', 0, 1, 1, '1468852859'),
(13, '青岛机动车交易市场(特-快充)', '市南区燕儿岛路3号', '120.405863', '36.066933', 3, '3', 0, 0, 1, '1468849249'),
(14, '海尔洲际酒店(特-慢充)', '市南区澳门路98号', '120.404718', '36.062482', 3, '3', 0, 0, 1, '1468849240'),
(15, '五年一千吨远古大气氧舱', '市南区闽江路183号', '120.40823', '36.075395', 4, '4', 0, 1, 1, '1468852773'),
(16, '油猴汽车快修充电站(特-快充)', '市北区银川西路136号', '120.424393', '36.099418', 3, '3', 0, 0, 1, '1468849257'),
(17, '华泰集团充电站(特-快充)', '市北区福州北路127号', '120.405441', '36.098316', 3, '3', 8, 8, 1, '1468849267'),
(18, '和达麦凯乐(特-慢充)', '市北区哈尔滨路88号', '120.398091', '36.115171', 3, '3', 1, 0, 1, '1468849228'),
(19, '农业银行崂山支行(特-慢充)', '崂山区香港东路242号', '120.469836', '36.098292', 3, '3', 0, 0, 1, '1468848939'),
(20, '青岛国际创新园(特-慢充)', '崂山区松岭路169号', '120.492025', '36.152671', 3, '3', 0, 0, 1, '1468848918'),
(21, '世园假日酒店(特-快充)', '崂山区天水路2号', '120.522213', '36.199377', 3, '3', 0, 3, 1, '1468849274'),
(22, '杰正财富中心充电站(特-慢充)', '崂山区海尔路182号-8号', '120.469026', '36.102981', 3, '3', 0, 0, 1, '1468848846'),
(23, '李沧绿城喜来登(特-慢充)', '李沧区金水路678号', '120.455491', '36.183148', 3, '3', 0, 0, 1, '1468848888'),
(42, '金狮广场充电桩(普)', '崂山区香港东路195号乙', '120.471215', '36.100942', 3, '3', 0, 0, 1, '1468853005'),
(40, '五年一千吨阜新路小组', '市北区鞍山二路97号东侧', '120.373796', '36.111788', 4, '4', 0, 0, 1, '1468849332'),
(44, '海尔美乐乐充电桩群(普)', '市北区黑龙江中路609号', '120.43744', '36.149606', 3, '3', 0, 0, 1, '1468852961'),
(45, '苏宁易购充电桩群(普)', '李沧区京口路22-42号苏宁生活广场', '120.43125', '36.164045', 3, '3', 0, 0, 1, '1468852988'),
(46, '李沧联通公司充电桩群(普)', '李沧区黑龙江中路769号', '120.439634', '36.176127', 3, '3', 0, 0, 1, '1468852881'),
(47, '印象山充电桩群(普)', '市北区劲松三路印象山小区东门', '120.42467', '36.102935', 3, '3', 0, 0, 1, '1468852955'),
(48, '万科城联通营业厅充电桩群(普)', '市北区合肥路与台柳路交汇处', '120.40096', '36.120159', 3, '3', 0, 0, 1, '1468852981'),
(49, '江淮4s店充电桩群(普)', '市北区重庆南路207号', '120.398099', '36.132368', 3, '3', 0, 0, 1, '1468852976'),
(50, '江淮圣豪长沙路店充电桩群(普)', '市北区长沙路76号', '120.386333', '36.121975', 3, '3', 0, 0, 1, '1468852969'),
(51, '南京路联通营业厅充电桩群(普)', '市北区南京路359号', '120.388382', '36.111028', 3, '3', 0, 0, 1, '1468852942'),
(52, '青岛广电充电桩群(普)', '市南区宁夏路200号', '120.405451', '36.086437', 3, '3', 0, 0, 1, '1468852949'),
(53, '隆德路公交停车场充电站(普)', '市南区隆德路3号', '120.416423', '36.084993', 3, '3', 0, 0, 1, '1468852891'),
(54, '市南图书馆充电桩群(普)', '市南区大尧三路19号', '120.408565', '36.080799', 3, '3', 0, 0, 1, '1468852934'),
(55, '银座中心充电桩群(普)', '市南区香港中路与南京路交汇', '120.397872', '36.072521', 3, '3', 0, 0, 1, '1468852926'),
(56, '延安三路邮政大厦充电桩群(普)', '市南区延安三路220号', '120.378929', '36.070112', 3, '3', 0, 0, 1, '1468852908'),
(57, '丽天大酒店充电站(普)', '市南区香港西路87号', '120.379914', '36.067495', 3, '3', 0, 0, 1, '1468852899'),
(58, '好啦汽车旅馆充电站(特-快充)', '市南区香港中路13号-3', '120.390913', '36.073278', 3, '3', 0, 0, 1, '1468849173'),
(59, '西湖花园酒店充电站(特-快充)', '市南区延安一路西湖花园酒店', '120.350301', '36.06987', 3, '3', 0, 0, 1, '1468849138'),
(60, '鑫金磊汽修充电站(特-快充)', '市北区福州北路118号', '120.404261', '36.097956', 3, '3', 0, 0, 1, '1468849056'),
(61, '金瑞汽修充电站(特-快充)', '市北区劲松三路126号', '120.423025', '36.105604', 3, '3', 0, 0, 1, '1468849044'),
(62, '智博新能源充电站(特-快充)', '崂山区科苑纬3路2-1号', '120.455743', '36.142441', 3, '3', 0, 0, 1, '1468849010'),
(63, '万里江茶博园充电站(特-快充)', '崂山区松岭路397号', '120.520995', '36.195721', 3, '3', 0, 0, 1, '1468849000'),
(64, '车管家九水路充电站(特-快充)', '李沧区九水路588号', '120.499197', '36.176984', 3, '3', 0, 0, 1, '1468848987'),
(65, '轿之林充电站(特-快充)', '李沧区九水东路369-1号', '120.483996', '36.177602', 3, '3', 0, 0, 1, '1468848977'),
(66, '图原汽车维修充电站(特-快充)', '李沧区308国道1138-13号', '120.438835', '36.173375', 3, '3', 0, 0, 1, '1468848954'),
(67, '崂山区环保汽修(特-慢充)', '崂山区苗岭路18号', '120.489248', '36.113949', 3, '3', 0, 0, 1, '1468848875'),
(68, '世贸中心车库充电站(特-慢充)', '市南区香港中路6号', '120.383462', '36.068426', 3, '3', 0, 0, 1, '1468848692');

-- --------------------------------------------------------

--
-- 表的结构 `tp_pile_sort`
--

CREATE TABLE IF NOT EXISTS `tp_pile_sort` (
  `id` int(30) NOT NULL,
  `pilename` varchar(50) NOT NULL,
  `positions` text NOT NULL,
  `lng` varchar(30) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `type` int(10) NOT NULL,
  `mulType` varchar(40) NOT NULL DEFAULT '0',
  `error` int(20) NOT NULL DEFAULT '0',
  `likes` int(20) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `posttime` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_pile_sort`
--

INSERT INTO `tp_pile_sort` (`id`, `pilename`, `positions`, `lng`, `lat`, `type`, `mulType`, `error`, `likes`, `status`, `posttime`) VALUES
(21, '青岛世园假日酒店', '青岛市崂山区天水路2号', '120.522213', '36.199377', 3, '3', 0, 3, 1, '1467285061'),
(20, '青岛国际创新园', '青岛市崂山区松岭路169号', '120.492025', '36.152671', 3, '3', 0, 0, 1, '1467285015'),
(23, '青岛李沧绿城喜来登', '青岛市李沧区金水路678号', '120.455491', '36.183148', 3, '3', 0, 0, 1, '1467285347'),
(46, '李沧联通公司充电桩群（普天）', '山东省青岛市李沧区黑龙江中路769号', '120.439634', '36.176127', 3, '3', 0, 0, 1, '1468471124'),
(41, '青岛维客商务国际中心充电站', '山东省青岛市李沧区京口路84号', '120.424614', '36.167686', 3, '3', 0, 0, 1, '1468470341'),
(42, '金狮广场充电桩（普天）', '山东省青岛市崂山区香港东路195号乙', '120.471215', '36.100942', 3, '3', 0, 0, 1, '1468470654'),
(45, '苏宁易购充电桩群（普天）', '青岛市李沧区京口路22-42号苏宁生活广场', '120.43125', '36.164045', 3, '3', 0, 0, 1, '1468471043'),
(19, '中国农业银行崂山支行', '青岛市崂山区香港东路242号', '120.469836', '36.098292', 3, '3', 0, 0, 1, '1467284935'),
(22, '青岛杰正财富中心', '青岛市崂山区海尔路182号-8号', '120.469026', '36.102981', 3, '3', 0, 0, 1, '1467285206'),
(44, '海尔美乐乐充电桩群（普天）', '山东省青岛市市北区黑龙江中路609号', '120.43744', '36.149606', 3, '3', 0, 0, 1, '1468470943'),
(14, '海尔洲际酒店', '青岛市市南区澳门路98号', '120.404718', '36.062482', 3, '3', 0, 0, 1, '1467284688'),
(43, '深圳路东充电桩（普天）', '青岛市崂山区深圳路162号公交车停车场', '120.45824', '36.120918', 3, '3', 0, 0, 1, '1468470781'),
(13, '青岛机动车交易市场', '青岛市市南区燕儿岛路3号', '120.405863', '36.066933', 3, '3', 0, 0, 1, '1467284271'),
(57, '丽天大酒店充电站（普天）', '青岛市市南区香港西路87号', '120.379914', '36.067495', 3, '3', 0, 0, 1, '1468472148'),
(15, '五年一千吨远古大气氧舱', '青岛市市南区闽江路183号', '120.40823', '36.075395', 4, '4', 0, 1, 1, '1468474811'),
(56, '延安三路邮政大厦充电桩群（普天）', '青岛市市南区延安三路220号', '120.378929', '36.070112', 3, '3', 0, 0, 1, '1468472081'),
(55, '银座中心充电桩群（普天）', '青岛市市南区香港中路与南京路交汇', '120.397872', '36.072521', 3, '3', 0, 0, 1, '1468472024'),
(53, '隆德路公交停车场充电站（普天）', '青岛市市南区隆德路3号公交车停车场', '120.416423', '36.084993', 3, '3', 0, 0, 1, '1468471867'),
(16, '油猴汽车快修（银川西路店）', '青岛市市北区银川西路136号', '120.424393', '36.099418', 3, '3', 0, 0, 1, '1467284751'),
(47, '印象山充电桩群（普天）', '山东省青岛市市北区劲松三路印象山小区东门', '120.42467', '36.102935', 3, '3', 0, 0, 1, '1468471235'),
(54, '市南图书馆充电桩群（普天）', '青岛市市南区大尧三路19号', '120.408565', '36.080799', 3, '3', 0, 0, 1, '1468471966'),
(49, '江淮4s店充电桩群（普天）', '青岛市市北区重庆南路207号', '120.398099', '36.132368', 3, '3', 0, 0, 1, '1468471545'),
(10, '五年一千吨宁安路桩子组', '青岛市市北区宁安路27号', '120.410169', '36.120667', 4, '4', 0, 0, 1, '1468474832'),
(52, '青岛广电充电桩群（普天）', '山东省青岛市市南区宁夏路200号', '120.405451', '36.086437', 3, '3', 0, 0, 1, '1468471743'),
(9, '五年一千吨李震组', '青岛市市南区金湖路21号', '120.391605', '36.085406', 4, '4', 9, 12, 1, '1468474825'),
(48, '万科城联通营业厅充电桩群（普天）', '青岛市市北区合肥路与台柳路交汇处', '120.40096', '36.120159', 3, '3', 0, 0, 1, '1468471397'),
(17, '青岛华泰集团', '青岛市市北区福州北路127号', '120.405441', '36.098316', 3, '3', 8, 8, 1, '1467284819'),
(50, '江淮圣豪长沙路店充电桩群（普天）', '青岛市市北区长沙路76号', '120.386333', '36.121975', 3, '3', 0, 0, 1, '1468471604'),
(51, '南京路联通营业厅充电桩群（普天）', '青岛市市北区南京路359号', '120.388382', '36.111028', 3, '3', 0, 0, 1, '1468471703'),
(11, '五年一千吨项目组', '青岛市市北区鞍山路3号十六中停车场', '120.375132', '36.101873', 4, '4', 0, 1, 1, '1468474847'),
(40, '五年一千吨阜新路小组', '鞍山二路97号东侧', '120.373796', '36.111788', 4, '4', 0, 0, 1, '1468474818'),
(18, '和达麦凯乐', '青岛市市北区哈尔滨路88号', '120.398091', '36.115171', 3, '3', 1, 0, 1, '1467284887');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tp_admin`
--
ALTER TABLE `tp_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_config`
--
ALTER TABLE `tp_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_map_type`
--
ALTER TABLE `tp_map_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `type_2` (`type`);

--
-- Indexes for table `tp_pile`
--
ALTER TABLE `tp_pile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilename` (`pilename`),
  ADD KEY `lng` (`lng`),
  ADD KEY `lng_2` (`lng`),
  ADD KEY `lat` (`lat`),
  ADD KEY `mulType` (`mulType`),
  ADD KEY `pilename_2` (`pilename`),
  ADD KEY `lng_3` (`lng`),
  ADD KEY `lat_2` (`lat`),
  ADD KEY `lat_3` (`lat`),
  ADD KEY `type` (`type`),
  ADD KEY `mulType_2` (`mulType`),
  ADD FULLTEXT KEY `mulType_3` (`mulType`);

--
-- Indexes for table `tp_pile_sort`
--
ALTER TABLE `tp_pile_sort`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilename` (`pilename`),
  ADD KEY `lng` (`lng`),
  ADD KEY `lng_2` (`lng`),
  ADD KEY `lat` (`lat`),
  ADD KEY `mulType` (`mulType`),
  ADD KEY `pilename_2` (`pilename`),
  ADD KEY `lng_3` (`lng`),
  ADD KEY `lat_2` (`lat`),
  ADD KEY `lat_3` (`lat`),
  ADD KEY `type` (`type`),
  ADD KEY `mulType_2` (`mulType`),
  ADD KEY `id` (`id`),
  ADD KEY `pilename_3` (`pilename`),
  ADD KEY `lng_4` (`lng`),
  ADD KEY `lat_4` (`lat`),
  ADD KEY `type_2` (`type`),
  ADD KEY `mulType_4` (`mulType`),
  ADD KEY `error` (`error`),
  ADD KEY `likes` (`likes`),
  ADD KEY `status` (`status`),
  ADD KEY `posttime` (`posttime`),
  ADD KEY `pilename_4` (`pilename`),
  ADD FULLTEXT KEY `mulType_3` (`mulType`);
ALTER TABLE `tp_pile_sort`
  ADD FULLTEXT KEY `mulType_5` (`mulType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tp_admin`
--
ALTER TABLE `tp_admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tp_config`
--
ALTER TABLE `tp_config`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tp_map_type`
--
ALTER TABLE `tp_map_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tp_pile`
--
ALTER TABLE `tp_pile`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
