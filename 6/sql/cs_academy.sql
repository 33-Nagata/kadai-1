-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- ホスト: 127.0.0.1
-- 生成日時: 2015 年 9 月 18 日 09:57
-- サーバのバージョン: 5.5.32-log
-- PHP のバージョン: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `cs_academy`
--
CREATE DATABASE IF NOT EXISTS `cs_academy` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cs_academy`;

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- テーブルのデータのダンプ `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `create_date`) VALUES
(1, '政治', '2015-09-18 09:42:13'),
(2, '経済', '2015-09-18 09:42:13'),
(3, 'スポーツ', '2015-09-18 09:42:49');

-- --------------------------------------------------------

--
-- テーブルの構造 `enq`
--

CREATE TABLE IF NOT EXISTS `enq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- テーブルのデータのダンプ `enq`
--

INSERT INTO `enq` (`id`, `name`, `email`, `age`, `create_date`, `update_date`) VALUES
(3, 'ttt', 'info@azmax.me', 20, '2015-09-12 08:41:46', '2015-09-13 15:13:25'),
(5, 'aaa', 'xxxx', 30, '2015-09-12 09:08:09', '2015-09-13 15:02:09'),
(6, 'uuu', 'info@azmax.me', 33, '2015-09-13 14:46:58', '2015-09-13 15:35:27'),
(7, 'azmax', 'info@azmax.me', 20, '2015-09-13 14:56:25', '2015-09-13 15:00:48'),
(8, 'azmax', 'azmax@azmax.me', 33, '2015-09-13 15:55:27', '2015-09-13 15:55:27');

-- --------------------------------------------------------

--
-- テーブルの構造 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `news_title` varchar(64) NOT NULL,
  `news_detail` varchar(1024) NOT NULL,
  `show_flg` int(11) NOT NULL,
  `author` varchar(12) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- テーブルのデータのダンプ `news`
--

INSERT INTO `news` (`news_id`, `category_id`, `news_title`, `news_detail`, `show_flg`, `author`, `create_date`, `update_date`) VALUES
(1, 1, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:58:24', '2015-09-16 19:58:24'),
(2, 2, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:58:42', '2015-09-16 19:58:42'),
(3, 1, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:58:52', '2015-09-16 19:58:52'),
(4, 2, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:58:58', '2015-09-16 19:58:58'),
(5, 1, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:59:04', '2015-09-16 19:59:04'),
(6, 2, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:59:08', '2015-09-16 19:59:08'),
(7, 3, '０１２３４５６７８９１０', 'テスト本文', 1, 'az', '2015-09-16 19:59:11', '2015-09-16 19:59:11');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
