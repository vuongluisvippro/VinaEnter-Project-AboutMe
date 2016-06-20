-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2016 at 05:04 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aboutme`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutme`
--

CREATE TABLE `aboutme` (
  `MaIntro` int(100) NOT NULL,
  `GioiThieu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ChiTiet` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aboutme`
--

INSERT INTO `aboutme` (`MaIntro`, `GioiThieu`, `ChiTiet`) VALUES
(1, 'Chào Mừng Bạn Đến Với Website Cá Nhân Trần Nguyễn Văn Vương', '<p>Nguyễn Văn Vương sinh ng&agrave;y 26/07/1994, được sinh ra trong một gia đ&igrave;nh gi&agrave;u truyền thống ng&agrave;nh CNTT. Cha t&ocirc;i l&agrave; một kỹ sư CNTT đầu ng&agrave;nh trong c&ocirc;ng ty, v&agrave; c&oacute; nhiều đ&oacute;ng g&oacute;p tạo n&ecirc;n thương hiệu c&ocirc;ng ty...</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `advs`
--

CREATE TABLE `advs` (
  `MaADV` int(100) NOT NULL,
  `TenQuangCao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HinhAnh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LienKet` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advs`
--

INSERT INTO `advs` (`MaADV`, `TenQuangCao`, `HinhAnh`, `LienKet`) VALUES
(1, 'Cơ hội vừa làm vừa học ĐH', 'Advertisement-1.jpg', 'http://uni.topica.edu.vn/'),
(2, 'Film + xem phim siêu nhanh ', 'Advertisement-2.jpg', 'https://movies.fimplus.vn/');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `MaDM` int(100) NOT NULL,
  `TenDanhMuc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `MaCT` int(100) NOT NULL,
  `HoTen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ThuDienTu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SoDienThoai` int(11) NOT NULL,
  `NoiDung` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `MaTT` int(100) NOT NULL,
  `TenTinTuc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MoTa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ChiTiet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MaDM` int(100) NOT NULL,
  `HinhAnh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LuocXem` int(100) NOT NULL,
  `KichHoat` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `MaP` int(100) NOT NULL,
  `TenDuAn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MoTa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HinhAnh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LienKet` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saying`
--

CREATE TABLE `saying` (
  `MaDN` int(100) NOT NULL,
  `NoiDung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TacGia` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saying`
--

INSERT INTO `saying` (`MaDN`, `NoiDung`, `TacGia`) VALUES
(1, 'Tôi tin rằng 50% quyết định một doanh nhân thành công hay thất bại chỉ đơn thuần là ở tính kiên trì', '- Steve Jobs'),
(2, 'Bạn sẽ không thể kiếm được 40.000 USD/năm ngay sau khi tốt nghiệp trung học. Bạn cũng không là một ông sếp lớn có điện thoại gắn trên ô tô cho đến khi bạn kiếm được hai thứ đó', '- Bill Gates'),
(3, 'Cuộc sống vốn không công bằng, hãy tập quen dần với điều đó', '- Bill Gates'),
(4, 'Nếu bạn không chịu bắt tay vào làm thì chẳng có điều gì là khả thi cả', '- Jack Ma'),
(5, 'Bạn không thể để thất bại tạo nên chính mình. Bạn phải để thất bại tặng mình những bài học', '- Barack Obama');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `MaND` int(100) NOT NULL,
  `UserName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PassWord` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutme`
--
ALTER TABLE `aboutme`
  ADD PRIMARY KEY (`MaIntro`);

--
-- Indexes for table `advs`
--
ALTER TABLE `advs`
  ADD PRIMARY KEY (`MaADV`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`MaDM`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`MaCT`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`MaTT`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`MaP`);

--
-- Indexes for table `saying`
--
ALTER TABLE `saying`
  ADD PRIMARY KEY (`MaDN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`MaND`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advs`
--
ALTER TABLE `advs`
  MODIFY `MaADV` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `MaDM` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `MaCT` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `MaP` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `saying`
--
ALTER TABLE `saying`
  MODIFY `MaDN` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `MaND` int(100) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
