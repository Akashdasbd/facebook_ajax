-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 11:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(8) NOT NULL,
  `post_id` int(8) DEFAULT NULL,
  `comm_user_name` varchar(255) NOT NULL,
  `comm_user_img` varchar(255) NOT NULL,
  `comment_photo` varchar(255) DEFAULT NULL,
  `comment_content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `comm_user_name`, `comm_user_img`, `comment_photo`, `comment_content`, `status`, `trash`, `createdAt`, `updatedAt`) VALUES
(2, 24, 'Akash das', '1735294575_43591_7120548369.jpg', '1735294575_52914_3928417560.jpg', 'hello wold', 1, 0, '2024-12-27 10:16:15', NULL),
(3, 19, 'Shawon das', '1735294668_29081_3459160287.jpg', NULL, 'hello', 1, 0, '2024-12-27 10:17:48', NULL),
(4, 17, 'Shawon das', '1735294751_44433_0365248197.jpg', NULL, '', 1, 0, '2024-12-27 10:19:11', NULL),
(5, 0, 'Shawon das', '1735324302_51437_8259016734.png', NULL, 'hello', 1, 0, '2024-12-27 18:31:42', NULL),
(6, 23, 'Akash das', '1735325740_60687_1956027834.jpg', NULL, 'hi', 1, 0, '2024-12-27 18:55:40', NULL),
(7, 20, 'Shawon das', '1735325916_79527_3961482507.png', NULL, 'lll', 1, 0, '2024-12-27 18:58:36', NULL),
(8, 17, 'kkk', '1735326071_54551_4016725938.jpg', NULL, 'pppp', 1, 0, '2024-12-27 19:01:11', NULL),
(9, 23, 'Shawon das', '1735416766_97168_2497816503.png', NULL, 'hello manna', 1, 0, '2024-12-28 20:12:46', NULL),
(10, 24, 'Oli vai', '1735453826_73712_6453708921.png', NULL, 'Hello I am olli', 1, 0, '2024-12-29 06:30:26', NULL),
(11, 26, 'Oli vai', '1735453892_99330_0548692731.jpg', NULL, 'nice', 1, 0, '2024-12-29 06:31:32', NULL),
(12, 26, 'Oli vai', '1735453892_93179_4356129780.jpg', NULL, 'nice', 1, 0, '2024-12-29 06:31:32', NULL),
(13, 19, 'Oli vai', '1735453994_71562_7516482903.jpg', NULL, 'hello', 1, 0, '2024-12-29 06:33:14', NULL),
(14, 27, 'Oli vai', '1735456852_79918_6430195728.png', NULL, 'kljlj', 1, 0, '2024-12-29 07:20:52', NULL),
(15, 27, 'Akash', '1735459664_7242_2054617398.jpg', NULL, 'ekks', 1, 0, '2024-12-29 08:07:44', NULL),
(16, 24, 'y6yyy', '1735459894_84550_4806129375.', NULL, 'y6tytyju', 1, 0, '2024-12-29 08:11:34', NULL),
(17, 24, 'y6yyy', '1735459894_68938_4539760182.', NULL, 'y6tytyju', 1, 0, '2024-12-29 08:11:34', NULL),
(18, 27, 'Monti pal', '1735465887_56569_6384012975.png', NULL, 'fg', 1, 0, '2024-12-29 09:51:27', NULL),
(19, 22, 'Monti pal', '1735467073_71477_8625794013.png', NULL, 'kkiiiii', 1, 0, '2024-12-29 10:11:13', NULL),
(20, 27, 'Monti pal', '1735467342_40282_2906178345.png', '1735467342_33087_3752018964.png', '', 1, 0, '2024-12-29 10:15:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(5) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_photo` varchar(200) NOT NULL,
  `post_content` text DEFAULT NULL,
  `post_photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`post_photo`)),
  `post_video` varchar(200) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `Share` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_name`, `user_photo`, `post_content`, `post_photo`, `post_video`, `comments`, `likes`, `Share`, `status`, `trash`, `createdAt`, `updatedAt`) VALUES
(13, 'Asif Mahmoud Gaffar ', '1735236074_58938_7196403825.png', 'Hello ajax', '[\"1735236074_80741_7238409561.jpg\",\"1735236074_82187_1398546207.jpg\"]', NULL, NULL, 3, 0, 1, 0, '2024-12-26 18:01:14', NULL),
(15, 'Akash', '1735236293_27536_3574628190.jpg', 'HEllo', '[]', '1735236293_50649_3215698470.mp4', NULL, 3, 0, 1, 0, '2024-12-26 18:04:53', NULL),
(16, 'Reduanul Haque Sujon', '1735243463_2071_3659074128.jpg', '', '[\"1735243463_7291_3914567820.jpg\",\"1735243463_46951_9386104725.jpg\",\"1735243463_36091_2310657498.jpg\"]', NULL, NULL, 7, 0, 1, 0, '2024-12-26 20:04:23', NULL),
(17, 'Tania Rahman', '1735244760_91215_1826349570.webm', '', '[]', '1735244760_24206_0139867245.mp4', NULL, 14, 0, 1, 0, '2024-12-26 20:26:00', NULL),
(18, 'Boidye Nath', '1735272144_13737_6748139250.webp', '', '[\"1735272144_98333_9654213087.jpg\",\"1735272144_37728_1376259084.jpg\",\"1735272144_65624_7250319486.jpg\",\"1735272144_4144_2534609187.jpg\"]', NULL, NULL, 32, 0, 1, 0, '2024-12-27 04:02:24', NULL),
(19, 'Reduanul Haque Sujon', '1735272297_57037_1578692340.jpg', '', '[]', '1735272297_86738_8736240159.webm', NULL, 8, 0, 1, 0, '2024-12-27 04:04:57', NULL),
(20, 'Tania Rahman', '1735272423_12905_2850367194.png', '', '[\"1735272423_64540_1064823957.jpg\"]', NULL, NULL, 5, 0, 1, 0, '2024-12-27 04:07:03', NULL),
(21, 'Asif Mahmoud Gaffar ', '1735272761_30275_8614397052.png', '', '[\"1735272761_88320_5764081329.png\"]', NULL, NULL, 10, 0, 1, 0, '2024-12-27 04:12:41', NULL),
(22, 'Akash', '1735272846_55810_3529018764.jpg', '', '[\"1735272846_13687_0867952143.jpg\"]', NULL, NULL, 6, 0, 1, 0, '2024-12-27 04:14:06', NULL),
(23, 'Akash das', '1735272880_84136_8370594126.jpg', '', '[\"1735272880_10745_1348027695.webp\"]', NULL, NULL, 29, 0, 1, 0, '2024-12-27 04:14:40', NULL),
(24, 'Tania Rahman', '1735278715_74219_0125984763.jpg', 'hello vai', '[\"1735278715_17479_4632598170.png\"]', NULL, NULL, 7, 0, 1, 0, '2024-12-27 05:51:55', NULL),
(25, 'Reduanul Haque Sujon', '1735293326_85774_6042931758.jpg', '', '[]', NULL, NULL, 4, 0, 1, 0, '2024-12-27 09:55:26', NULL),
(26, 'Reduanul Haque Sujon', '1735453857_76710_0582197346.jpg', '', '[\"1735453857_55321_5970632418.png\"]', NULL, NULL, 1, 0, 1, 0, '2024-12-29 06:30:57', NULL),
(27, 'Asif Mahmoud Gaffar ', '1735456827_27538_2518407693.jpg', '', '[\"1735456827_68241_3748592016.webp\"]', NULL, NULL, 17, 0, 1, 0, '2024-12-29 07:20:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
