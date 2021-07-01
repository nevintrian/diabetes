-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2021 at 05:33 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabetes`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add data', 7, 'add_data'),
(26, 'Can change data', 7, 'change_data'),
(27, 'Can delete data', 7, 'delete_data'),
(28, 'Can view data', 7, 'view_data'),
(29, 'Can add mata', 8, 'add_mata'),
(30, 'Can change mata', 8, 'change_mata'),
(31, 'Can delete mata', 8, 'delete_mata'),
(32, 'Can view mata', 8, 'view_mata');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$4Ib22zCpdaL4qDoZkN5ySA$D+gWfZ+XWyRzVz1So/pruuHz1SzR9rTNcHPY4wnuUc4=', '2021-06-30 05:49:09.714708', 1, 'nevin', 'nevin', 'trian', 'nevintrianade@gmail.com', 1, 1, '2021-06-21 22:47:19.242066'),
(2, 'pbkdf2_sha256$260000$dQUc19L0i6tUmryFvAZBvh$IxRFsLkmZKLX8FFFqpNgCHHVbl700Vb9/YTCWXumGcU=', '2021-06-23 01:03:18.237632', 0, 'agung', 'agung', 'gunawan', 'agung@gmail.com', 0, 1, '2021-06-21 22:49:33.729100'),
(3, 'pbkdf2_sha256$260000$AkEjsUugGGEcao1j93wA0W$tQ1XtWp5im3jHHx5iql4XLYWpYki8oXx9A3YfIVsqYc=', NULL, 0, 'ryan', 'ryan', 'madara', 'ahmadmadara@gmail.com', 0, 1, '2021-06-22 00:50:10.891316'),
(4, 'pbkdf2_sha256$260000$PnWagoCiYv4fb0Wa5oZtkK$3e4e6Qz8qFy5gQXu7vlf5girIUugxvpfG3V1URX5YD4=', '2021-06-22 01:05:52.314352', 0, 'aan', 'aan', 'nur', 'aan@gaming.com', 0, 1, '2021-06-22 01:05:38.402171');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-06-21 22:49:33.912823', '2', 'agung', 1, '[{\"added\": {}}]', 4, 1),
(2, '2021-06-21 23:06:00.799248', '1', 'Data object (1)', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-06-21 23:07:25.936240', '2', 'Data object (2)', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mata', 'data'),
(8, 'pengujian', 'mata'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-21 22:45:41.875550'),
(2, 'auth', '0001_initial', '2021-06-21 22:45:42.420318'),
(3, 'admin', '0001_initial', '2021-06-21 22:45:42.529700'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-06-21 22:45:42.529700'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-21 22:45:42.545324'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-06-21 22:45:42.592181'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-06-21 22:45:42.623448'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-06-21 22:45:42.656037'),
(9, 'auth', '0004_alter_user_username_opts', '2021-06-21 22:45:42.664922'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-06-21 22:45:42.696521'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-06-21 22:45:42.696521'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-06-21 22:45:42.696521'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-06-21 22:45:42.726581'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-06-21 22:45:42.743540'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-06-21 22:45:42.762311'),
(16, 'auth', '0011_update_proxy_permissions', '2021-06-21 22:45:42.765357'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-06-21 22:45:42.780984'),
(18, 'sessions', '0001_initial', '2021-06-21 22:45:42.812212'),
(19, 'mata', '0001_initial', '2021-06-21 23:02:53.097895'),
(20, 'mata', '0002_alter_data_gambar', '2021-06-22 22:58:58.425033'),
(21, 'mata', '0003_alter_data_gambar', '2021-06-25 02:25:04.521315'),
(22, 'pengujian', '0001_initial', '2021-06-25 02:25:04.562988');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('12jru4q0c7luixafvzck5vpgqz2zj7a4', '.eJxVjEEOwiAQRe_C2pAOFCgu3fcMZJihUjWQlHZlvLtt0oVu_3vvv0XAbc1ha2kJM4urAHH53SLSM5UD8APLvUqqZV3mKA9FnrTJsXJ63U737yBjy3ttkRBVijB0ng36CDh0CidkC6AdU1KKFEEkY51N2sV-B702k_MEmsXnC_4aOBM:1lyT5x:TlaQ9L2ypsdCJU2V63rUN1BEUPhzP9yv9xEaUukjLec', '2021-07-14 05:49:09.494040'),
('m9tcg5sa8zl2kdiatuml7g4tktg54ubj', '.eJxVjEEOwiAQRe_C2pAOFCgu3fcMZJihUjWQlHZlvLtt0oVu_3vvv0XAbc1ha2kJM4urAHH53SLSM5UD8APLvUqqZV3mKA9FnrTJsXJ63U737yBjy3ttkRBVijB0ng36CDh0CidkC6AdU1KKFEEkY51N2sV-B702k_MEmsXnC_4aOBM:1lyT5x:TlaQ9L2ypsdCJU2V63rUN1BEUPhzP9yv9xEaUukjLec', '2021-07-14 05:49:09.763132'),
('rm1r3oe7fq3o993i2g2l67xygvx1byj3', '.eJxVjEEOwiAQRe_C2pAOFCgu3fcMZJihUjWQlHZlvLtt0oVu_3vvv0XAbc1ha2kJM4urAHH53SLSM5UD8APLvUqqZV3mKA9FnrTJsXJ63U737yBjy3ttkRBVijB0ng36CDh0CidkC6AdU1KKFEEkY51N2sV-B702k_MEmsXnC_4aOBM:1lw08K:GMtMzv6aW78rWc2xLYvN4TIIFOmRyeQ6_3SQYmVOM-Y', '2021-07-07 10:29:24.805813');

-- --------------------------------------------------------

--
-- Table structure for table `mata_data`
--

CREATE TABLE `mata_data` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `entropi` double NOT NULL,
  `energi` double NOT NULL,
  `homogenitas` double NOT NULL,
  `kontras` double NOT NULL,
  `status` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_data`
--

INSERT INTO `mata_data` (`id`, `nama`, `entropi`, `energi`, `homogenitas`, `kontras`, `status`, `gambar`) VALUES
(10, 'i01', 4.079101562, 0.026643753, 0.457288906, 3.931406326, 1, 'i01.bmp'),
(11, 'i02', 3.52734375, 0.017541885, 0.451411256, 4.148589657, 1, 'i02.bmp'),
(12, 'i04', 2.100585938, 0.038431168, 0.580370382, 3.648267025, 1, 'i04.bmp'),
(13, 'i05', 1.825195312, 0.052453995, 0.597240438, 3.366214743, 1, 'i05.bmp'),
(14, 'i06', 1.458007812, 0.031999588, 0.577246094, 3.556406728, 1, 'i06.bmp'),
(15, 'i07', 3.233398438, 0.026319504, 0.496419409, 3.949933778, 1, 'i07.bmp'),
(16, 'i10', 1.13671875, 0.061214447, 0.645932904, 3.125608597, 1, 'i10.bmp'),
(17, 'j01', 1.380859375, 0.049943924, 0.605618107, 3.240789448, 1, 'j01.bmp'),
(18, 'j02', 2.798828125, 0.018989563, 0.465405706, 4.072524998, 1, 'j02.bmp'),
(19, 'j03', 1.41015625, 0.044971466, 0.620574095, 3.40961804, 1, 'j03.bmp'),
(20, 'j04', 1.484375, 0.047483444, 0.583570772, 3.282640541, 1, 'j04.bmp'),
(21, 'j05', 1.607421875, 0.033597946, 0.573917385, 3.530916112, 1, 'j05.bmp'),
(22, 'j06', 1.713867188, 0.020187378, 0.534725414, 3.956869556, 1, 'j06.bmp'),
(23, 'j07', 3.592773438, 0.01811409, 0.450691309, 4.094069188, 1, 'j07.bmp'),
(24, 'j08', 2.474609375, 0.023487091, 0.495268192, 3.802907188, 1, 'j08.bmp'),
(25, 'j09', 3.536132812, 0.037506104, 0.541474952, 3.718464092, 1, 'j09.bmp'),
(26, 'k01', 1.54296875, 0.056598663, 0.578877969, 3.043272876, 0, 'k01.bmp'),
(27, 'k02', 0.598632812, 0.12869072, 0.724511719, 2.283542344, 0, 'k02.bmp'),
(28, 'k03', 0.495117188, 0.108522415, 0.755175781, 2.418314378, 0, 'k03.bmp'),
(29, 'k04', 0.416992188, 0.17193222, 0.773144531, 2.037662928, 0, 'k04.bmp'),
(30, 'k05', 0.57421875, 0.173624039, 0.756502757, 2.085855714, 0, 'k05.bmp'),
(31, 'k06', 0.494140625, 0.114679337, 0.760351563, 2.561702513, 0, 'k06.bmp'),
(32, 'k07', 0.98046875, 0.077043533, 0.64375, 2.803519919, 0, 'k07.bmp'),
(33, 'k08', 0.432617188, 0.14487648, 0.771191406, 2.18623856, 0, 'k08.bmp'),
(34, 'k09', 1.5625, 0.049402237, 0.559329044, 3.134013098, 0, 'k09.bmp'),
(35, 'k11', 0.561523438, 0.172496796, 0.759472656, 2.244717, 0, 'k11.bmp'),
(36, 'k12', 1.266601562, 0.083992004, 0.618974035, 2.752702431, 0, 'k12.bmp');

-- --------------------------------------------------------

--
-- Table structure for table `pengujian_mata`
--

CREATE TABLE `pengujian_mata` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `entropi` double NOT NULL,
  `energi` double NOT NULL,
  `homogenitas` double NOT NULL,
  `kontras` double NOT NULL,
  `status` int(11) NOT NULL,
  `uji` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengujian_mata`
--

INSERT INTO `pengujian_mata` (`id`, `nama`, `entropi`, `energi`, `homogenitas`, `kontras`, `status`, `uji`, `gambar`) VALUES
(1, 'i01', 4.079101562, 0.026643753, 0.457288906, 3.931406326, 1, 1, 'i01_5E5FtUu.bmp'),
(2, 'i02', 3.52734375, 0.017541885, 0.451411256, 4.148589657, 1, 1, 'i02_4vR7woF.bmp'),
(3, 'i04', 2.100585938, 0.038431168, 0.580370382, 3.648267025, 1, 1, 'i04_vdXSAyW.bmp'),
(4, 'i05', 1.825195312, 0.052453995, 0.597240438, 3.366214743, 1, 1, 'i05_QQtptBz.bmp'),
(5, 'i06', 1.458007812, 0.031999588, 0.577246094, 3.556406728, 1, 1, 'i06_O0TRpWM.bmp'),
(6, 'i07', 3.233398438, 0.026319504, 0.496419409, 3.949933778, 1, 1, 'i07_DEoXgEl.bmp'),
(7, 'i10', 1.13671875, 0.061214447, 0.645932904, 3.125608597, 1, 0, 'i10_JwqX6x2.bmp'),
(8, 'j01', 1.380859375, 0.049943924, 0.605618107, 3.240789448, 1, 0, 'j01_vz42Trp.bmp'),
(9, 'j02', 2.798828125, 0.018989563, 0.465405706, 4.072524998, 1, 1, 'j02_waOwWZ8.bmp'),
(10, 'j03', 1.41015625, 0.044971466, 0.620574095, 3.40961804, 1, 0, 'j03_NLqjYbu.bmp'),
(11, 'j04', 1.484375, 0.047483444, 0.583570772, 3.282640541, 1, 0, 'j04_p3nnvId.bmp'),
(12, 'j05', 1.607421875, 0.033597946, 0.573917385, 3.530916112, 1, 1, 'j05_2Mj40yO.bmp'),
(13, 'j06', 1.713867188, 0.020187378, 0.534725414, 3.956869556, 1, 1, 'j06_GTsTs6F.bmp'),
(14, 'j07', 3.592773438, 0.01811409, 0.450691309, 4.094069188, 1, 1, 'j07_eNaCJjc.bmp'),
(15, 'j08', 2.474609375, 0.023487091, 0.495268192, 3.802907188, 1, 1, 'j08_9pZ8iSG.bmp'),
(16, 'j09', 3.536132812, 0.037506104, 0.541474952, 3.718464092, 1, 1, 'j09_qh8f8NB.bmp'),
(17, 'k01', 1.54296875, 0.056598663, 0.578877969, 3.043272876, 0, 0, 'k01_UH0Lccl.bmp'),
(18, 'k02', 0.598632812, 0.12869072, 0.724511719, 2.283542344, 0, 0, 'k02_KCk7GE1.bmp'),
(19, 'k03', 0.495117188, 0.108522415, 0.755175781, 2.418314378, 0, 0, 'k03_XWw1h06.bmp'),
(20, 'k04', 0.416992188, 0.17193222, 0.773144531, 2.037662928, 0, 0, 'k04_6bz3m0R.bmp'),
(21, 'k05', 0.57421875, 0.173624039, 0.756502757, 2.085855714, 0, 0, 'k05_c86YEUK.bmp'),
(22, 'k06', 0.494140625, 0.114679337, 0.760351563, 2.561702513, 0, 0, 'k06_O9j4tJd.bmp'),
(23, 'k07', 0.98046875, 0.077043533, 0.64375, 2.803519919, 0, 0, 'k07_A5AIVLl.bmp'),
(24, 'k08', 0.432617188, 0.14487648, 0.771191406, 2.18623856, 0, 0, 'k08_hmtmouL.bmp'),
(25, 'k09', 1.5625, 0.049402237, 0.559329044, 3.134013098, 0, 0, 'k09_WavYZm6.bmp'),
(26, 'k11', 0.561523438, 0.172496796, 0.759472656, 2.244717, 0, 0, 'k11_cdT7DMH.bmp'),
(28, 'k12', 1.266601562, 0.083992004, 0.618974035, 2.752702431, 0, 0, 'k12_GFhIF8k.bmp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mata_data`
--
ALTER TABLE `mata_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengujian_mata`
--
ALTER TABLE `pengujian_mata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mata_data`
--
ALTER TABLE `mata_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pengujian_mata`
--
ALTER TABLE `pengujian_mata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
