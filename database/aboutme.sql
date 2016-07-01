-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2016 at 06:43 PM
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
  `id_aboutme` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aboutme`
--

INSERT INTO `aboutme` (`id_aboutme`, `name`, `detail_text`) VALUES
(1, 'Chào mừng bạn đến với website cá nhân của Nguyễn Văn Vương', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ch&agrave;o tất cả c&aacute;c bạn, rất vui được l&agrave;m quen với tất cả mọi người. Trước ti&ecirc;n cho ph&eacute;p m&igrave;nh giới thiệu một ch&uacute;t về m&igrave;nh nh&eacute;.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M&igrave;nh t&ecirc;n đầy đủ l&agrave; Nguyễn Văn Vương, sinh v&agrave;o ng&agrave;y 26/07/1994. Sinh trưởng trong một gia đ&igrave;nh c&oacute; truyền thống nghề nh&agrave; gi&aacute;o. Cha t&ocirc;i l&agrave;m nghề nh&agrave; gi&aacute;o trong một ng&ocirc;i trường trung học cơ sở, &ocirc;ng ấy đ&atilde; gắn b&oacute; với hơn 30 năm trồng người v&agrave; c&oacute; biết bao nhi&ecirc;u thế hệ học tr&ograve; th&agrave;nh c&ocirc;ng. Mẹ t&ocirc;i l&agrave; người tuyệt vời, với t&ocirc;i gia đ&igrave;nh lu&ocirc;n l&agrave; chổ dựa vững chắc nhất v&agrave; lu&ocirc;n lu&ocirc;n tự h&agrave;o về gia đ&igrave;nh minh.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T&ocirc;i th&iacute;ch c&ocirc;ng nghệ th&ocirc;ng tin xuất ph&aacute;t việc t&ocirc;i học, ng&agrave;y trước t&ocirc;i vọc ph&aacute; c&aacute;c đồ điện tử v&agrave; đặc biệt sự hấp dẫn của chiếc m&aacute;y vi t&iacute;nh l&uacute;c đ&oacute; khiến t&ocirc;i v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;. T&ocirc;i m&agrave;y m&ograve; v&agrave; t&igrave;m hiểu học sử dụng m&aacute;y vi t&iacute;nh, từ đ&oacute; tạo t&ocirc;i đam m&ecirc;. T&ocirc;i kh&ocirc;ng ho&agrave;n to&agrave;n giỏi về lập tr&igrave;nh, tuy học tốt về tự nhi&ecirc;n nhưng thật sự với những d&ograve;ng code khiến tối rất kh&oacute; hiểu, n&oacute; rất logic để chạy được một b&agrave;i to&aacute;n. Nhưng n&oacute; th&uacute; vị với việc thực thi một c&aacute;ch tự động v&agrave; đưa ra lời giải. N&oacute; thật tuyệt vời.</p>\r\n\r\n<p>&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `advs`
--

CREATE TABLE `advs` (
  `id_advs` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advs`
--

INSERT INTO `advs` (`id_advs`, `name`, `banner`, `link`) VALUES
(1, 'Cơ hội vừa làm vừa học ĐH', 'Advertisement-1-336705248395150.jpg', 'http://uni.topica.edu.vn/'),
(2, 'Film + xem phim siêu nhanh ', 'Advertisement-2-336709843133124.jpg', 'https://movies.fimplus.vn/');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `name`) VALUES
(1, 'Cuộc thi lập trình UIT_ACM'),
(2, 'Cuộc thi lập trình Alice'),
(3, 'Cuộc thi lập trình Hackathon'),
(4, 'Cuộc thi lập trình Bluebird Award'),
(5, 'Cuộc thi lập trình SMART HACK ');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(100) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `fullname`, `email`, `address`, `phone`, `content`) VALUES
(1, 'Nguyễn Văn Vương', 'vuongluis@gmail.com', 'Bình Thanh Tây - Bình Sơn - Quảng Ngãi', 972248187, 'Trao đổi về lập trình'),
(2, 'Trần Anh Thượng Long', 'vuongluis@gmail.com', 'Bình Phú - Bình Sơn - Quãng Ngãi', 98767323, 'Giao Lưu Học Hỏi');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id_news` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `id_cat` int(100) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view` int(100) NOT NULL,
  `is_active` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id_news`, `name`, `preview_text`, `detail_text`, `id_cat`, `picture`, `view`, `is_active`) VALUES
(1, 'Cuộc thi lập trình UIT ACM', 'Xuất phát từ mục đích đẩy mạnh phong trào thi đua học tập, sáng tạo...', '<p>Xuất ph&aacute;t từ mục đ&iacute;ch đẩy mạnh phong tr&agrave;o thi đua học tập, s&aacute;ng tạo cũng như tạo cơ hội để những sinh vi&ecirc;n đam m&ecirc; lĩnh vực lập tr&igrave;nh ph&aacute;t huy được thế mạnh, Trường ĐH C&ocirc;ng nghệ Th&ocirc;ng tin &ndash; ĐHQG-HCM đ&atilde; tổ chức Cuộc thi Lập tr&igrave;nh UIT ACM dưới sự đăng cai của Li&ecirc;n chi Hội Khoa học m&aacute;y t&iacute;nh trực thuộc Hội sinh vi&ecirc;n Trường.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trải qua 2 lần tổ chức, cuộc thi đ&atilde; nhận được sự quan t&acirc;m đăng k&yacute; tham gia của hơn&nbsp;<strong>150&nbsp;</strong>đội với gần&nbsp;<strong>500</strong>&nbsp;sinh vi&ecirc;n, thu h&uacute;t hơn&nbsp;<strong>5000</strong>&nbsp;lượt xem v&agrave; b&igrave;nh luận tr&ecirc;n Forum trường, website v&agrave; fanpage của cuộc thi.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cuộc thi đ&atilde; tạo ra một s&acirc;n chơi mới trong lĩnh vực lập tr&igrave;nh. Đến với cuộc thi, c&aacute;c sinh vi&ecirc;n được tiếp x&uacute;c với m&ocirc;i trường lập tr&igrave;nh quốc tế, &nbsp;khơi dậy được niềm đam m&ecirc; v&agrave; khả năng ph&aacute;t triển tư duy, vận dụng kiến thức để giải quyết b&agrave;i to&aacute;n đ&uacute;ng v&agrave; tối ưu nhất. Cuộc thi c&ograve;n gi&uacute;p c&aacute;c bạn sinh vi&ecirc;n r&egrave;n luyện được khả năng l&agrave;m việc nh&oacute;m, sự b&igrave;nh tĩnh, tự tin để giải quyết một vấn đề trong một khoảng thời gian nhất định. C&aacute;c đội thi đ&atilde; cố gắng hết sức m&igrave;nh để ho&agrave;n th&agrave;nh thật tốt b&agrave;i thi. Ở&nbsp;<em>Cuộc thi Lập tr&igrave;nh UIT ACM lần 1</em>: đội&nbsp;<strong>HViet_MTrung</strong>&nbsp;gi&agrave;nh giải nhất, đội&nbsp;<strong>Code_Code</strong>gi&agrave;nh giải nh&igrave; v&agrave;&nbsp;<strong>Newcomers</strong>&nbsp;gi&agrave;nh giải ba. Ở&nbsp;<em>cuộc thi Lập tr&igrave;nh UIT ACM lần 2</em>: đội&nbsp;<strong>Zeus</strong>&nbsp;gi&agrave;nh giải nhất, đội&nbsp;<strong>Accepted</strong>&nbsp;gi&agrave;nh giải nh&igrave; v&agrave; đội<strong>1.26AM</strong>&nbsp;gi&agrave;nh giải ba.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Với sự th&agrave;nh c&ocirc;ng của c&aacute;c lần thi trước,&nbsp;<em>Cuộc thi Lập tr&igrave;nh UIT ACM lần 3</em>&nbsp;đ&atilde; trở lại. Đồng h&agrave;nh với cuộc thi Lập tr&igrave;nh UIT ACM 3 &ndash; nh&agrave; t&agrave;i trợ ELCA &ndash; C&ocirc;ng ty ph&aacute;t triển phần mềm độc lập h&agrave;ng đầu Thụy Sỹ.&nbsp;</p>\r\n\r\n<p>C&aacute;c bạn sinh vi&ecirc;n c&oacute; thể t&igrave;m hiểu th&ocirc;ng tin chi tiết về cuộc thi tại acm.uit.edu.vn</p>\r\n', 1, 'UIT_ACM-69933629749727.jpg', 2, 1),
(4, 'Giải thưởng cuộc thi lập trình Edtech Asia Hackathon 2016 lên tới 90.000 USD', 'Sự kiện Edtech Asia Hackathon 2016 diễn ra vào ngày...', '<p>Sự kiện Edtech Asia Hackathon 2016 diễn ra v&agrave;o ng&agrave;y 9 - 10/4/2016 tại H&agrave; Nội được tổ chức bởi Topica v&agrave; Edtech Asia, với sự t&agrave;i trợ của hai &quot;&ocirc;ng lớn&quot; c&ocirc;ng nghệ l&agrave; Facebook v&agrave; Google.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; cuộc thi lập tr&igrave;nh theo nh&oacute;m 2-4 người với thời gian quy định 48 tiếng nhằm đưa ra sản phẩm c&ocirc;ng nghệ s&aacute;ng tạo, độc đ&aacute;o v&agrave; mới lạ nhất trong lĩnh vực gi&aacute;o dục, lần đầu ti&ecirc;n được tổ chức tại Việt Nam.</p>\r\n\r\n<p>Hackathon l&agrave; một trong những b&iacute; quyết để c&aacute;c &ldquo;&ocirc;ng tr&ugrave;m&rdquo; c&ocirc;ng nghệ như Google v&agrave; Facebook li&ecirc;n tục ph&aacute;t triển v&agrave; duy tr&igrave; sự tăng trưởng mạnh mẽ. &Iacute;t ai biết rằng n&uacute;t Like v&agrave; chức năng Chat của Facebook (Facebook Message) đều l&agrave; sản phẩm của những cuộc thi Hackathon.</p>\r\n\r\n<p>Mark Zuckerberg , CEO Facebook nhận định: &ldquo;Hackathon l&agrave; một trong những c&aacute;ch để nảy ra &yacute; tưởng mới tại Facebook. T&ocirc;i thường th&iacute;ch nh&igrave;n c&aacute;c kỹ sư s&aacute;ng tạo v&agrave; rất mong đợi những &yacute; tưởng n&agrave;y được th&ecirc;m v&agrave;o dịch vụ của ch&uacute;ng t&ocirc;i&rdquo;. Facebook v&agrave; Google cho biết, họ rất quan t&acirc;m đến sự ph&aacute;t triển của giới c&ocirc;ng nghệ tại Việt Nam những năm gần đ&acirc;y v&agrave; đề cao c&aacute;c cuộc thi s&aacute;ng tạo được tổ chức thường xuy&ecirc;n như Hackathon.</p>\r\n', 3, 'thi-2-70626097955234.jpg', 27, 1),
(5, 'Giới thiệu về Lập trình Alice', 'Alice là một công cụ lập trình đồ họa 3D giúp học sinh 3D...', '<p><big>&nbsp;Alice l&agrave; một c&ocirc;ng cụ lập tr&igrave;nh đồ họa 3D gi&uacute;p học sinh dễ d&agrave;ng tạo ra một h&igrave;nh ảnh động để kể một c&acirc;u chuyện, một tr&ograve; chơi tương t&aacute;c hoặc một video clip để chia sẻ tr&ecirc;n web. &nbsp;Alice c&ograve;n l&agrave; một c&ocirc;ng cụ giảng dạy được thiết kế d&agrave;nh cho học sinh bước đầu tiếp x&uacute;c với lập tr&igrave;nh hướng đối tượng. N&oacute; cho ph&eacute;p học sinh t&igrave;m hiểu c&aacute;c kh&aacute;i niệm lập tr&igrave;nh cơ bản bằng việc tạo ra bộ phim hoạt h&igrave;nh v&agrave; tr&ograve; chơi video đơn giản. Trong Alice, c&aacute;c đối tượng 3D&nbsp; (v&iacute; dụ, người, động vật v&agrave; c&aacute;c loại xe,&hellip;) nằm trong một thế giới ảo v&agrave; học sinh tạo ra một chương tr&igrave;nh để tạo hiệu ứng cho c&aacute;c đối tượng trong thế giới ảo đ&oacute;.</big></p>\r\n\r\n<p><big>Trong giao diện tương t&aacute;c của Alice, học sinh chỉ cần k&eacute;o v&agrave; thả c&aacute;c biểu thị đồ họa để tạo ra một chương tr&igrave;nh, c&aacute;c biểu thị đồ họa n&agrave;y thay cho c&aacute;c cấu tr&uacute;c lệnh của c&aacute;c ng&ocirc;n ngữ lập tr&igrave;nh hướng đối tượng như &nbsp;Java, C + +, v&agrave; C #. &nbsp;Alice cho ph&eacute;p học sinh xem chương tr&igrave;nh của họ chạy như thế n&agrave;o th&ocirc;ng qua c&aacute;c h&igrave;nh ảnh động, họ dễ d&agrave;ng hiểu được mối quan hệ giữa c&aacute;c cấu tr&uacute;c/ c&acirc;u lệnh lập tr&igrave;nh v&agrave; h&agrave;nh vi của c&aacute;c đối tượng trong h&igrave;nh ảnh động của họ. Bằng c&aacute;ch n&agrave;y, học sinh sẽ hiểu r&otilde; v&agrave; r&uacute;t được nhiều kinh nghiệm với c&aacute;c c&acirc;u lệnh, cấu tr&uacute;c, chương tr&igrave;nh (li&ecirc;n quan đến lập tr&igrave;nh) m&agrave; họ được giảng dạy.</big></p>\r\n', 2, 'Alice-70194227645003.png', 9, 1),
(7, 'Cuộc Thi Alice 2015', 'Là một đơn vị hoạt động trong lĩnh vực giáo dục, Trường...', '<p><strong><em><big>L&agrave; một đơn vị hoạt động trong lĩnh vực gi&aacute;o dục, Trường Đại học FPT đặc biệt ch&uacute; trọng thực hiện tr&aacute;ch nhiệm x&atilde; hội trong việc hỗ trợ, bồi dưỡng v&agrave; tạo điều kiện ph&aacute;t triển cho thế hệ trẻ của đất nước. Đ&oacute; cũng l&agrave; l&yacute; do, h&agrave;ng năm Trường Đại học FPT tổ chức c&aacute;c cuộc thi tầm cỡ quốc gia d&agrave;nh cho học sinh c&aacute;c cấp.&nbsp; &nbsp;</big></em></strong></p>\r\n\r\n<p>Tiếp nối th&agrave;nh c&ocirc;ng của cuộc thi &ldquo;Alice 2014&rdquo;, Trường Đại học FPT tiếp tục tổ chức cuộc thi Lập tr&igrave;nh Alice năm 2015 d&agrave;nh cho tất cả c&aacute;c em học sinh tr&ecirc;n to&agrave;n quốc.</p>\r\n\r\n<p>Dự kiến khởi động v&agrave;o đầu th&aacute;ng 9/2015, năm nay cuộc thi mở rộng đối tượng tham gia dự thi hơn so với mọi năm đ&oacute; l&agrave; c&aacute;c em học sinh mọi lứa tuổi từ bậc Tiểu học đến THPT tr&ecirc;n cả nước.&nbsp;<big>Mục đ&iacute;ch của cuộc thi nhằm tạo ra s&acirc;n chơi mới lạ, hấp dẫn về lập tr&igrave;nh cho học sinh. B&ecirc;n cạnh đ&oacute;, cuộc thi c&ograve;n nhằm phổ biến ng&ocirc;n ngữ lập tr&igrave;nh Alice tới c&aacute;c trường THCS v&agrave; THPT, x&oacute;a bỏ những quan điểm cho rằng lập tr&igrave;nh rất kh&oacute; v&agrave; phổ biến tư duy &ldquo;Ai cũng lập tr&igrave;nh được&rdquo;.</big></p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i tin rằng đ&acirc;y l&agrave; một cuộc thi bổ &iacute;ch để c&aacute;c em học sinh THCS, THPT c&oacute; thể &ldquo;học m&agrave; chơi, chơi m&agrave; học&rdquo;, tiếp cận với c&ocirc;ng nghệ th&ocirc;ng tin hiện đại, g&oacute;p phần khơi gợi niềm đam m&ecirc; C&ocirc;ng nghệ th&ocirc;ng tin của học sinh, đồng thời t&igrave;m kiếm những t&agrave;i năng về lập tr&igrave;nh để tiếp tục bồi đắp v&agrave; nu&ocirc;i dưỡng cho nguồn nh&acirc;n lực C&ocirc;ng nghệ th&ocirc;ng tin Việt Nam. Đồng thời với quy m&ocirc; v&agrave; sự quan t&acirc;m của b&aacute;o giới đối với cuộc thi, c&aacute;c trường tham gia cuộc thi chắc chắn sẽ c&oacute; được hiệu ứng truyền th&ocirc;ng nhất định.</p>\r\n', 2, 'Alice-70332530599633.jpg', 0, 0),
(10, '30 đội tham dự thi lập trình Hackathon', 'Cuộc thi thu hút khoảng 30 đội tham dự, với mỗi đội thi từ ...', '<p>Cuộc thi thu h&uacute;t khoảng 30 đội tham dự, với mỗi đội thi từ 3-5 th&iacute; sinh. Th&iacute; sinh tham dự cuộc thi trải qua 24 giờ thao t&aacute;c tr&ecirc;n m&aacute;y vi t&iacute;nh viết c&aacute;c m&atilde; code dựa tr&ecirc;n điện to&aacute;n đ&aacute;m m&acirc;y để cho ra một phần mềm ứng dụng hữu &iacute;ch li&ecirc;n quan đến th&agrave;nh phố th&ocirc;ng minh. Cụ thể, x&acirc;y dựng một sản phẩm th&ocirc;ng minh giải quyết c&aacute;c vấn đề trong cuộc sống hằng ng&agrave;y như về giao th&ocirc;ng, gi&aacute;o dục, x&atilde; hội v&agrave; sức khoẻ, an to&agrave;n c&ocirc;ng cộng, m&ocirc;i trường, năng lượng v&agrave; t&agrave;i nguy&ecirc;n nước. Đội thắng cuộc sẽ nhận được phần thưởng hấp dẫn, giấy chứng nhận từ Becamex v&agrave; IBM Việt Nam, v&agrave; được th&ocirc;ng b&aacute;o tr&ecirc;n c&aacute;c phương tiện truyền th&ocirc;ng. Giải nhất cho đội xuất sắc nhất l&agrave; 50 triệu đồng; hai giải đặc biệt, một cho đội c&oacute; c&aacute;ch tiếp cận giải quyết vấn đề s&aacute;ng tạo nhất (Most innovative) v&agrave; một cho đội tốt nhất về mặt kỹ thuật (Best technical) với trị gi&aacute; giải thưởng l&agrave; 20 triệu đồng. Phần trao giải sẽ diễn ra v&agrave;o chiều ng&agrave;y 28/3.&nbsp;</p>\r\n\r\n<p>Đ&acirc;y l&agrave; cuộc thi d&agrave;nh cho những ai y&ecirc;u th&iacute;ch thử th&aacute;ch, những người sẵn s&agrave;ng tạo sự kh&aacute;c biệt với x&atilde; hội v&agrave; thay đổi cuộc sống hằng ng&agrave;y của mọi người kh&ocirc;ng chỉ ở B&igrave;nh Dương m&agrave; to&agrave;n thể đất nước Việt Nam.&nbsp;</p>\r\n', 3, 'Hackathon-70464864701090.jpg', 0, 0),
(11, 'Đã đến thời điểm để game Việt bùng nổ?', 'Kể từ lâu, game Việt hay game do chính người Việt sản...', '<p>T&iacute;nh đến thời điểm hiện tại, c&oacute; thể khẳng định game Việt đ&atilde; c&oacute; những bước tiến d&agrave;i, tuy nhi&ecirc;n điều đ&oacute; vẫn l&agrave; chưa đủ. Game Việt cần c&oacute; một định hướng xa hơn nữa cũng như đạt được sự ph&aacute;t triển đồng đều hơn nữa. Liệu rằng, thời điểm đ&oacute; đ&atilde; đến? Thời điểm để game Việt b&ugrave;ng nổ, vươn m&igrave;nh xa hơn đến khắp c&aacute;c quốc gia tr&ecirc;n to&agrave;n thế giới?</p>\r\n\r\n<p>Thời gian gần đ&acirc;y, cụm từ &ldquo;game Việt&rdquo; đang xuất hiện với mật độ ng&agrave;y một d&agrave;y đặc v&agrave; bạn c&oacute; thể dễ d&agrave;ng bắt gặp cụm từ n&agrave;y ở bất cứ một phương tiện truyền th&ocirc;ng n&agrave;o. Dường như, kh&aacute;i niệm game Việt đang ng&agrave;y một đi xa hơn nếu so với giai đoạn khoảng 1 năm trước.</p>\r\n\r\n<p>C&oacute; thể thấy, &ldquo;hiện tượng&nbsp;<a href="http://gamek.vn/flappy-bird.htm" target="_blank">Flappy Bird</a>&rdquo; như một ng&ograve;i nổ v&agrave; n&oacute; đ&atilde; ch&acirc;m ng&ograve;i cho sự bứt ph&aacute; của quả t&ecirc;n lửa mang t&ecirc;n &ldquo;game Việt&rdquo;. Giải thưởng Bluebird Award 2015 hay c&ograve;n gọi với c&aacute;i t&ecirc;n th&acirc;n thương Chim Xanh l&agrave; chương tr&igrave;nh l&agrave;m game Việt đầu ti&ecirc;n được ph&aacute;t s&oacute;ng tr&ecirc;n k&ecirc;nh của đ&agrave;i truyền h&igrave;nh Quốc gia Việt Nam. Sự kiện n&agrave;y chứng tỏ tầm ảnh hưởng kh&ocirc;ng nhỏ của game Việt đồng thời thể hiện sự quan t&acirc;m của kh&aacute;n giả đến những tựa game do ch&iacute;nh người Việt sản xuất.</p>\r\n', 4, 'da-den-thoi-diem-de-game-viet-bung-no-70832799622312.jpg', 0, 0),
(12, 'Khai mạc cuộc thi lập trình ứng dụng di động cho sinh viên toàn quốc', 'Smart Hack 2016, cuộc thi lập trình ứng dụng trên thiết bị...', '<p>Smart Hack 2016, cuộc thi lập tr&igrave;nh ứng dụng tr&ecirc;n thiết bị di động d&agrave;nh cho sinh vi&ecirc;n to&agrave;n quốc đ&atilde; ch&iacute;nh thức được khai mạc s&aacute;ng nay, 29/6 tại H&agrave; Nội.<br />\r\n<br />\r\nCuộc thi n&agrave;y do C&ocirc;ng ty&nbsp;<a href="http://www.vietnamplus.vn/dai-ten-mien-shop-chinh-thuc-duoc-phan-phoi-o-viet-nam-cuoi-nam-2016/385416.vnp">GMO-Z.com RUNSYSTEM</a>&nbsp;phối hợp với Trường Đại học C&ocirc;ng nghệ (Đại học Quốc gia H&agrave; Nội) tổ chức.<br />\r\n<br />\r\nĐ&acirc;y l&agrave; s&acirc;n chơi cho c&aacute;c sinh vi&ecirc;n y&ecirc;u th&iacute;ch lập tr&igrave;nh, c&oacute; &yacute; tưởng l&agrave;m ứng dụng di động mang t&iacute;nh thực tiễn cao, tr&ecirc;n nền tảng Android, iOS hoặc Windows Phone. Cuộc thi cũng l&agrave; nơi giới trẻ &ldquo;thử sức&rdquo; v&agrave; thể hiện mong muốn tham gia v&agrave;o thị trường ứng dụng di động được xem l&agrave; rất nhiều tiềm năng.&nbsp;<br />\r\n<br />\r\nTiến sỹ Dương L&ecirc; Minh, Ph&oacute; Chủ nhiệm Khoa C&ocirc;ng nghệ th&ocirc;ng tin (Đại học C&ocirc;ng nghệ), nhận định, đ&acirc;y l&agrave; cuộc thi rất thiết thực với sinh vi&ecirc;n c&ocirc;ng nghệ th&ocirc;ng tin, đặc biệt l&agrave; c&aacute;c bạn trẻ y&ecirc;u th&iacute;ch v&agrave; đam m&ecirc; lập tr&igrave;nh ứng dụng di động.&nbsp;</p>\r\n', 5, 'vnp_anh_ne-71013489907976.jpg', 0, 0),
(13, 'Lào Cai bội thu giải thưởng tại Chung kết Alice toàn quốc 2015', 'Với một giải Nhất, một giải Nhì và hai giải Khuyến khích...', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sự kiện diễn ra ng&agrave;y 10/1, tại campus H&ograve;a Lạc, Trường Đại học FPT, đồng thời với Chung kết to&agrave;n quốc Scratch 2015. Từ nhiều tỉnh th&agrave;nh tr&ecirc;n cả nước như B&igrave;nh Định, L&agrave;o Cai, TP. HCM, H&agrave; Nội, 9 học sinh xuất sắc nhất to&agrave;n quốc đ&atilde; c&oacute; mặt tại Trường Đại học FPT để tranh t&agrave;i tại v&ograve;ng thi cuối c&ugrave;ng cuộc thi Alice.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ph&aacute;t biểu tại sự kiện, TS. Nguyễn Việt Thắng &ndash; Ph&oacute; Hiệu trưởng Trường Đại học FPT, đại diện Ban Tổ chức cuộc thi khẳng định đ&acirc;y l&agrave; cuộc thi d&agrave;nh cho tất cả mọi người, đặc biệt nh&acirc;n rộng trong lứa tuổi mầm non. &ldquo;Ch&uacute;ng t&ocirc;i mong muốn, bắt nguồn từ những cuộc thi lập tr&igrave;nh như Alice v&agrave; Scratch niềm đam m&ecirc; v&agrave; hiểu biết về CNTT sẽ được khởi nguồn v&agrave; lan tỏa. Trường Đại học FPT kỳ vọng, trong tương lai kh&ocirc;ng xa, ch&uacute;ng ta sẽ c&oacute; những nh&agrave; l&atilde;nh đạo lớn về CNTT&rdquo;.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tại chương tr&igrave;nh, lần lượt 9 phim ngắn chủ đề &ldquo;Ng&agrave;y Tết của em&rdquo; đ&atilde; được c&aacute;c học sinh&nbsp;giới thiệu. Mỗi sản phẩm đều chứa đựng một c&acirc;u chuyện c&aacute; nh&acirc;n gửi gắm cảm x&uacute;c v&agrave; th&ocirc;ng điệp kh&aacute;c nhau. Trong đ&oacute;, nổi bật c&oacute; những phim ngắn khiến cả Ban gi&aacute;m khảo v&agrave; kh&aacute;ch mời c&oacute; mặt ở kh&aacute;n ph&ograve;ng kh&ocirc;ng khỏi x&uacute;c động như: &ldquo;C&acirc;u chuyện bố xa nh&agrave; ng&agrave;y Tết&rdquo; của th&iacute; sinh Trần Anh Vũ, &ldquo;Về thăm nh&agrave; ng&agrave;y Tết&rdquo; của th&iacute; sinh Nguyễn Việt Ho&agrave;ng&hellip; Một số phim ngắn lại thể hiện g&oacute;c nh&igrave;n độc đ&aacute;o v&agrave; s&aacute;ng tạo của c&aacute;c th&iacute; sinh với c&aacute;c kể chuyện d&iacute; dỏm v&agrave; &oacute;c tưởng tượng phong ph&uacute; như &ldquo;Đ&oacute;n Tết v&agrave;o năm 2036&rdquo; của th&iacute; sinh Nguyễn Đức Tiến.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, '7cb2e-b563e6c3395712782f1cfbd56430977d-181675555514502.jpeg', 0, 0),
(14, 'Kết quả Vòng thi Chung kết khu vực Cuộc thi Lập trình ALICE', 'BTC xin chúc mừng danh sách thí sinh xuất sắc...', '<p>BTC xin ch&uacute;c mừng danh s&aacute;ch th&iacute; sinh xuất sắc lọt v&agrave;o v&ograve;ng Chung kết to&agrave;n quốc cuộc thi &ldquo;LẬP TR&Igrave;NH ALICE 2015&rdquo; được tổ chức tại H&agrave; Nội từ ng&agrave;y 08/01/2016 đến 10/01/2016 tại Trường Đại học FPT &ndash; Khu c&ocirc;ng nghệ cao L&aacute;ng H&ograve;a Lạc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sau khi tổng hợp điểm từ BGK v&agrave; điểm b&igrave;nh chọn (loại c&aacute;c điểm b&igrave;nh chọn ảo từ c&ugrave;ng 1 địa chỉ IP), BTC xin c&ocirc;ng bố danh s&aacute;ch th&iacute; sinh xuất sắc lọt v&agrave;o v&ograve;ng Chung kết to&agrave;n quốc như dưới đ&acirc;y:</p>\r\n\r\n<p>Y&ecirc;u cầu để ho&agrave;n tất thủ tục tham gia v&ograve;ng chung kết như sau:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c th&iacute; sinh lọt v&agrave;o v&ograve;ng &ldquo;Chung kết to&agrave;n quốc&rdquo; cần gửi ngay mail cho BTC &nbsp;trước ng&agrave;y 22/12/2015 theo địa chỉ&nbsp;<a href="mailto:violympic@fpt.edu.vn">violympic@fpt.edu.vn</a>&nbsp;để x&aacute;c nhận th&ocirc;ng tin c&aacute; nh&acirc;n v&agrave; th&ocirc;ng tin li&ecirc;n lạc bao gồm:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp;&nbsp; Họ v&agrave; t&ecirc;n th&iacute; sinh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp;&nbsp; Bản scan CMND (nếu c&oacute;) hoặc giấy khai sinh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp;&nbsp; Họ t&ecirc;n phụ huynh hoặc người bảo hộ đi k&egrave;m.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp;&nbsp; Bản scan CMND của phụ huynh hoặc người bảo hộ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>o&nbsp;&nbsp; Số điện thoại &amp; email li&ecirc;n lạc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sau khi nhận được email x&aacute;c nhận th&ocirc;ng tin của th&iacute; sinh. BTC sẽ li&ecirc;n lạc v&agrave; th&ocirc;ng b&aacute;o đầy đủ quyền lợi cũng như thủ tục cần thiết để tham gia v&ograve;ng &ldquo;Chung kết to&agrave;n quốc&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, '5511c-0f728d7e7e21f15e401e563450d3378a-182628774723108.jpeg', 0, 0),
(15, 'Tin tức Olympic / ACM ICPC', 'Việt Nam tiếp tục có mặt trong Top 100 trường ...', '<p><strong>Việt Nam tiếp tục c&oacute; mặt trong Top 100 trường đại học tham gia thi đấu Chung kết lập tr&igrave;nh ACM/ICPC to&agrave;n cầu tại Phuket, Th&aacute;i Lan từ 15/5 đến 20/5/2016. Đội tuyển BYTE trường Đại học C&ocirc;ng nghệ ĐHQG H&agrave; Nội v&agrave; Đội tuyển HCMUS-Shine trường Đại học KHTN ĐHQG Tp HCM với kết quả xuất sắc tại c&aacute;c v&ograve;ng loại ch&acirc;u &Aacute; đ&atilde; ch&iacute;nh thức c&oacute; t&ecirc;n trong danh s&aacute;ch c&aacute;c đội tuyển lập tr&igrave;nh mạnh nhất thế giới.</strong></p>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p>Kỳ thi ACM/ICPC Ch&acirc;u &Aacute; năm 2015 kết th&uacute;c bằng v&ograve;ng loại Chennai (Ấn Độ). Từ 18 điểm thi v&ograve;ng loại Ch&acirc;u &Aacute; tại 4 v&ugrave;ng l&atilde;nh thổ gồm T&acirc;y &Aacute;, Trung quốc, Đ&ocirc;ng Bắc &Aacute; - Đ&ocirc;ng Nam &Aacute; đ&atilde; lựa chọn gần 40 đội tuyển đại diện Ch&acirc;u &Aacute; tham dự Chung kết ACM/ICPC to&agrave;n cầu tại Phuket Th&aacute;i Lan từ 15/5 đến 20/5/2016. Danh s&aacute;ch c&aacute;c đội v&agrave;o Chung kết ACM/ICPC to&agrave;n cầu c&ocirc;ng bố tr&ecirc;n trang to&agrave;n cầu ACM/ICPC tại địa chỉ:&nbsp;<a href="http://icpc.baylor.edu/">http://icpc.baylor.edu/</a>&nbsp;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Đội BYTE V&ocirc; định ACM/ICPC Asia Hanoi 2015, Rank 1 tại Asia Phuket&nbsp; 2015</em></p>\r\n\r\n<p><em>Đội tuyển BYTE gồm: Phạm Văn Hạnh HCV Olympic Tin học Quốc tế 2015, V&ocirc; địch Si&ecirc;u CUP OLP 2015, Nguyễn Tiến Trung Ki&ecirc;n HCB OLP Tin học Quốc tế 2015,&nbsp;&nbsp;HCV Olympic Tin học Ch&acirc;u &Aacute; 2015, CUP Bạc Si&ecirc;u CUP OLP 2015, Đỗ Ngọc Kh&aacute;nh HCB OLP Tin học Ch&acirc;u &Aacute; 2015, CUP Bạc Si&ecirc;u CUP OLP 2015, Huấn luyện vi&ecirc;n Thầy Hồ Đắc Phương</em></p>\r\n', 1, 'Trao CHAMPION  ACM Assia Hanoi 2015-183344294010470.JPG', 0, 0),
(16, 'Đội tuyển BYTE giành được thứ hạng cao tại Vòng chung kết toàn cầu ACM/ICPC 2016', 'Đội tuyển BYTE, Trường ĐH Công nghệ - ĐHQGHN,...', '<p>Đội tuyển&nbsp;BYTE, Trường ĐH C&ocirc;ng nghệ - ĐHQGHN,&nbsp;l&agrave; một trong hai trường&nbsp;đại diện của Việt Nam tham gia V&ograve;ng chung kết to&agrave;n cầu kỳ thi Lập tr&igrave;nh sinh vi&ecirc;n quốc tế to&agrave;n cầu ACM/ICPC 2016đ&atilde;&nbsp;giành vị trí thứ 29 (là thứ hạng cao nh&acirc;́t của các đ&ocirc;̣i tuy&ecirc;̉n Vi&ecirc;̣t Nam từ trước đ&ecirc;́n nay) và đưa Vi&ecirc;̣t Nam vào qu&ocirc;́c gia có vị trí thứ 14 tại cuộc thi ACM/ICPC 2016.</p>\r\n\r\n<p>Cu&ocirc;̣c thi ACM&nbsp;/ICPC năm 2016 thu hút 40.266 thí sinh từ 2.736 đại học, 102 qu&ocirc;́c gia và vùng lãnh th&ocirc;̉, tại 481 đi&ecirc;̉m thi c&acirc;́p qu&ocirc;́c gia và khu vực. Theo kết quả v&ograve;ng loại c&aacute;c&nbsp;ch&acirc;u lục, căn cứ số điểm v&ograve;ng loại v&agrave; số lượng đội tuyển tham dự&nbsp;đ&atilde; chọn ra&nbsp;128 đ&ocirc;̣i xu&acirc;́t sắc nh&acirc;́t lọt vào Vòng Chung K&ecirc;́t được t&ocirc;̉ chức từ ngày 15-20/05/2016 tại&nbsp;Phuket,&nbsp;Thái Lan. T&acirc;́t cả 128 đ&ocirc;̣i này đ&ecirc;̀u đ&ecirc;́n từ 128 đại học C&ocirc;ng nghệ th&ocirc;ng tin hàng đ&acirc;̀u tr&ecirc;n toàn th&ecirc;́ giới.</p>\r\n\r\n<p>Đ&aacute;ng ch&uacute; &yacute; c&aacute;c đội mạnh l&agrave; c&aacute;c đội tuyển đến từ c&aacute;c trường đại học nổi tiếng thế giới như MIT, Stanford, CMU (Mỹ), c&aacute;c trường ch&acirc;u &Acirc;u nổi tiếng như Tổng hợp Moscow, Tổng hợp St.Peterburg, Tổng hợp Warsaw, Tổng hợp Belarus. Ch&acirc;u &Aacute; với nhiều t&ecirc;n quen thuộc như Đại học Thanh Hoa, Đại học Pekin, Giao th&ocirc;ng Thượng Hải, Tổng hợp Seoul (H&agrave;n Quốc), Tổng hợp Tokyo (Japan), Tổng hợp Đ&agrave;i Loan (Taiwan).</p>\r\n\r\n<p>Tại Vòng Chung K&ecirc;́t, đ&ocirc;̣i tuy&ecirc;̉n BYTE xu&acirc;́t sắc giành vị trí thứ 29 (là thứ hạng cao nh&acirc;́t của các đ&ocirc;̣i tuy&ecirc;̉n Vi&ecirc;̣t Nam từ trước đ&ecirc;́n nay) và đưa Vi&ecirc;̣t Nam vào qu&ocirc;́c gia có vị trí thứ 14.</p>\r\n\r\n<p>Với kết quả V&ocirc; địch v&ograve;ng loại ch&acirc;u &Aacute; địa điểm H&agrave; Nội v&agrave; rank 2 tại BangKok, đội tuyển BYTE của Trường Đại học C&ocirc;ng nghệ đ&atilde; được chọn tham gia V&ograve;ng chung kết ACM/ICPC 2016.&nbsp;Đ&ocirc;̣i tuy&ecirc;̉n BYTE g&ocirc;̀m 3 thành vi&ecirc;n Phạm Văn Hạnh, Đ&ocirc;̃ Ngọc Khánh và Nguy&ecirc;̃n Ti&ecirc;́n Trung Ki&ecirc;n đ&ecirc;̀u là sinh vi&ecirc;n năm&nbsp;K60.</p>\r\n', 1, 'ACM-2016-183476807116110.jpg', 0, 0),
(17, 'Đội tuyển BYTE vô địch tại Vòng online quốc gia kỳ thi ACM/ICPC lần thứ 24', 'Tại vòng online quốc gia cuộc thi lập trình ACM/ICPC 2016,...', '<p>Tại v&ograve;ng online quốc gia cuộc thi lập tr&igrave;nh ACM/ICPC 2016, đội BYTE của Trường Đại học C&ocirc;ng nghệ, ĐHQGHN đ&atilde; gi&agrave;nh chức v&ocirc; địch khi giải được 9 c&acirc;u diễn ra v&agrave;o ng&agrave;y 31/10.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Năm nay, kỳ thi ACM/ICPC c&oacute; sự tham dự của 11 trường đại học gồm Trường ĐHCN (ĐHQGHN), Trường Đại học B&aacute;ch khoa H&agrave; Nội, Trường Đại học FPT, Trường Đại học Khoa học tự nhi&ecirc;n (ĐHQGTP. HCM), Trường Đại học Duy T&acirc;n... với tổng số 161 đội tuyển. Trong đ&oacute;, Trường ĐHCN c&oacute; 33 đội tuyển v&agrave; Trường Đại học Khoa học tự nhi&ecirc;n c&oacute; 32 đội tuyển.</p>\r\n\r\n<p>33 đội thi đến từ Trường ĐHCN đ&atilde; tham gia v&ograve;ng thi online quốc gia cuộc thi lập tr&igrave;nh quốc tế ACM/ICPC v&agrave; bước đầu đạt được kết quả rất đ&aacute;ng kh&iacute;ch lệ. Đặc biệt, đội BYTE với c&aacute;c th&agrave;nh vi&ecirc;n l&agrave; t&acirc;n sinh vi&ecirc;n K60 gồm Phạm Văn Hạnh, Nguyễn Tiến Trung Ki&ecirc;n v&agrave; Đỗ Ngọc Kh&aacute;nh cũng đ&atilde; thể hiện được khả năng của m&igrave;nh qua việc gi&agrave;nh chức v&ocirc; địch khi giải được 9 c&acirc;u, xếp thứ 3 l&agrave; đội MEGABYTE (sinh vi&ecirc;n K60 gồm&nbsp;Vũ Ph&uacute;c Ho&agrave;ng, Mai Huy Ho&agrave;ng, B&ugrave;i Đức Thiện) với 7 c&acirc;u.</p>\r\n', 1, 'Screenshot 2015-11-04 11_23_13-183546595945256.png', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id_project` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id_project`, `name`, `preview_text`, `picture`, `link`) VALUES
(1, 'Xây dựng Website trung tâm y tế dự phòng ', '- Để quản lý vấn đề tiêm chủng tại các địa phương, nơi có các trung tâm tiêm chủng. Nhằm giúp việc tiêm chủng và quản lý tiêm chủng một cách dễ dàng hơn. Dự án website trung tâm y tế dự phòng được thực hiện nhằm mục đích đó.\r\n- Website được xây dựng dựa trên quy trình làm phần mềm chặc chẽ của FSORT.', 'Project-1-225548669739162.png', 'http://yteduphong.jelastic.skali.net/KhachTiemDanhSachServlet'),
(2, 'Xây dựng website tin tức - dự án đầu tiên tại trung tâm VinaEnter', 'Đây là dự án cơ bản về website java được thực hiện tại trung tâm VinaEnter. Vận dụng kiến thức java xây dựng website bằng JSP - SERVLET. Đặc biệt qua việc làm website biết thêm nhiều kiến thức - nghiệp vụ làm website. ', 'Project-2-225557386861085.png', 'http://bnewsproject.jelastic.skali.net/'),
(3, 'Xây dựng website quản lý giáo trình sách', 'Đây là dự án làm website về quản lý giáo trình sách. Tận dụng kiến thức về PHP và sử dụng MS SQL. Với dự án nhằm tạo ra trang website giúp cho các trung tâm sách, thư viện sách hay các nhà sách có thể mua bán và giới thiệu sách, hay thực hiện các hoạt động cho mượn sách.', 'Project-3-225565010712680.png', 'http://quanligiaotrinh.96.lt/'),
(4, 'Xây dựng blog website cá nhân ', 'Do nhu cầu học hỏi và bản thân tự muốn tạo ra blog cá nhân với mong muốn chia sẻ các kiến thức học được và cũng làm nơi lưu trữ những kiến thức lập trình mà mình tích lũy được. Dựa trên Open Source, sử dụng wordpress để xây dựng blog cá nhân', 'Project-4-225572719830342.png', 'http://localhost:4433/templatewordpress'),
(5, 'Xây dựng app game về android', 'Lấy ý tưởng là những quả bóng, dựa vào nền tảng android. Tự nhóm em xây dựng app game lấy ý tưởng là những trái bóng. Tuy nhiên quá trình mới học android nên cũng gặp nhiều khó khăn về app. Vì thế sản phẩm đang tiếp tục hoàn thiện. Hiện tại dự án được public lên github.', 'Project-5-225579996904817.png', 'https://github.com/dieuhang/Android-Project-NoFinish-Game-Ball'),
(6, 'Xây dựng một app về mạng xã hội bóng đá trực tuyến. ', 'Mục tiêu của app hiểu về việc kết nối và dùng loại cơ sỡ dữ liệu trong android. Tận dụng webservie lấy dữ liệu từ trang bóng đá và cung cấp cho người dùng những thông tin về bóng đá. App đang giai đoạn hoàn thiện với hướng phát triển là xây dựng app cho người dùng nắm thông tin về Euro 2016.', 'Project-6-225586447560153.png', 'https://github.com/dieuhang/Android-Project-NoFinish-Social-NetworkFootball');

-- --------------------------------------------------------

--
-- Table structure for table `saying`
--

CREATE TABLE `saying` (
  `id_saying` int(100) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saying`
--

INSERT INTO `saying` (`id_saying`, `content`, `author`) VALUES
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
  `id_user` int(100) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `fullname`) VALUES
(1, 'admin', 'e99a18c428cb38d5f260853678922e03', 'Administrator'),
(2, 'vuongluis', 'e99a18c428cb38d5f260853678922e03', 'Nguyễn Văn Vương'),
(3, 'admin1', 'e99a18c428cb38d5f260853678922e03', 'Trần Anh Thượng Long'),
(4, 'admin2', 'd46d699b05862a3eed508ccbea37aac8', 'Trần Thanh Sang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutme`
--
ALTER TABLE `aboutme`
  ADD PRIMARY KEY (`id_aboutme`);

--
-- Indexes for table `advs`
--
ALTER TABLE `advs`
  ADD PRIMARY KEY (`id_advs`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`);

--
-- Indexes for table `saying`
--
ALTER TABLE `saying`
  ADD PRIMARY KEY (`id_saying`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutme`
--
ALTER TABLE `aboutme`
  MODIFY `id_aboutme` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `advs`
--
ALTER TABLE `advs`
  MODIFY `id_advs` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `saying`
--
ALTER TABLE `saying`
  MODIFY `id_saying` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
