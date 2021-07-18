-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2021 at 12:13 AM
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
-- Database: `diabetesapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `mata`
--

CREATE TABLE `mata` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kontras` double NOT NULL,
  `energi` double NOT NULL,
  `homogenitas` double NOT NULL,
  `korelasi` double NOT NULL,
  `status` int(1) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata`
--

INSERT INTO `mata` (`id`, `nama`, `kontras`, `energi`, `homogenitas`, `korelasi`, `status`, `gambar`) VALUES
(1, 'i01', 0.5625, 0.119926143, 0.777385753, 1.453702137, 1, 'mata_1626484788.png'),
(2, 'i02', 0.605846774, 0.078001532, 0.75890457, 2.095234888, 1, 'mata_1626484829.png'),
(3, 'i04', 0.487903226, 0.143407847, 0.795026882, 1.350856827, 1, 'mata_1626484836.png'),
(4, 'i05', 0.610887097, 0.187172277, 0.767977151, 0.644113607, 1, 'mata_1626484842.png'),
(5, 'i06', 0.428427419, 0.115914209, 0.814012097, 1.194267552, 1, 'mata_1626484849.png'),
(6, 'i07', 0.431451613, 0.119402803, 0.80577957, 1.813932412, 1, 'mata_1626484857.png'),
(7, 'i10', 0.340725806, 0.195558927, 0.839045699, 0.562719467, 1, 'mata_1626484863.png'),
(8, 'j01', 0.365927419, 0.209526515, 0.830477151, 0.500712277, 1, 'mata_1626484869.png'),
(9, 'j02', 0.440524194, 0.092321231, 0.794522849, 1.965280692, 1, 'mata_1626484874.png'),
(10, 'j03', 0.341733871, 0.157328182, 0.841229839, 0.823064896, 1, 'mata_1626484881.png'),
(11, 'j04', 0.300403226, 0.210842486, 0.853830645, 0.706620629, 1, 'mata_1626484890.png'),
(12, 'j05', 0.38608871, 0.151541465, 0.821488575, 0.757800408, 1, 'mata_1626484896.png'),
(13, 'j06', 0.385080645, 0.087072589, 0.818212366, 2.124308033, 1, 'mata_1626484902.png'),
(14, 'j07', 0.454637097, 0.115195252, 0.802251344, 1.0802286, 1, 'mata_1626484911.png'),
(15, 'j08', 0.557459677, 0.10894515, 0.760248656, 0.765082022, 1, 'mata_1626484917.png'),
(16, 'j09', 0.324596774, 0.153789286, 0.841733871, 2.064253133, 1, 'mata_1626484924.png'),
(17, 'k01', 0.317540323, 0.230683167, 0.842573925, 0.284106582, 0, 'mata_1626484931.png'),
(18, 'k02', 0.255040323, 0.344446093, 0.873823925, 0.132795128, 0, 'mata_1626484939.png'),
(19, 'k03', 0.234879032, 0.352797176, 0.88390457, 0.195684364, 0, 'mata_1626484956.png'),
(20, 'k04', 0.178427419, 0.517122362, 0.91078629, 0.093303999, 0, 'mata_1626484963.png'),
(21, 'k05', 0.135080645, 0.649493326, 0.932459677, 0.116767522, 0, 'mata_1626484970.png'),
(22, 'k06', 0.17641129, 0.340125744, 0.911794355, 0.443200555, 0, 'mata_1626484977.png'),
(23, 'k07', 0.262096774, 0.303063622, 0.871639785, 0.303141859, 0, 'mata_1626484984.png'),
(24, 'k08', 0.26108871, 0.312587901, 0.872143817, 0.131734319, 0, 'mata_1626484991.png'),
(25, 'k09', 0.387096774, 0.216711007, 0.818548387, 0.266538998, 0, 'mata_1626484997.png'),
(26, 'k11', 0.276209677, 0.292241155, 0.861895161, 0.310869734, 0, 'mata_1626485004.png'),
(27, 'k12', 0.299395161, 0.304925289, 0.851646505, 0.208379505, 0, 'mata_1626485011.png');

-- --------------------------------------------------------

--
-- Table structure for table `uji`
--

CREATE TABLE `uji` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kontras` double NOT NULL,
  `energi` double NOT NULL,
  `homogenitas` double NOT NULL,
  `korelasi` double NOT NULL,
  `status` int(1) NOT NULL,
  `uji` int(1) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uji`
--

INSERT INTO `uji` (`id`, `nama`, `kontras`, `energi`, `homogenitas`, `korelasi`, `status`, `uji`, `gambar`) VALUES
(1, 'i01', 0.5625, 0.119926143, 0.777385753, 1.453702137, 1, 1, 'uji_1626485023.png'),
(2, 'i02', 0.605846774, 0.078001532, 0.75890457, 2.095234888, 1, 1, 'uji_1626485030.png'),
(3, 'i04', 0.487903226, 0.143407847, 0.795026882, 1.350856827, 1, 1, 'uji_1626485038.png'),
(4, 'i05', 0.610887097, 0.187172277, 0.767977151, 0.644113607, 1, 0, 'uji_1626485044.png'),
(5, 'i06', 0.428427419, 0.115914209, 0.814012097, 1.194267552, 1, 1, 'uji_1626485050.png'),
(6, 'i07', 0.431451613, 0.119402803, 0.80577957, 1.813932412, 1, 1, 'uji_1626485057.png'),
(7, 'i10', 0.340725806, 0.195558927, 0.839045699, 0.562719467, 1, 0, 'uji_1626485064.png'),
(8, 'j01', 0.365927419, 0.209526515, 0.830477151, 0.500712277, 1, 0, 'uji_1626485069.png'),
(9, 'j02', 0.440524194, 0.092321231, 0.794522849, 1.965280692, 1, 1, 'uji_1626485076.png'),
(10, 'j03', 0.341733871, 0.157328182, 0.841229839, 0.823064896, 1, 1, 'uji_1626485082.png'),
(11, 'j04', 0.300403226, 0.210842486, 0.853830645, 0.706620629, 1, 0, 'uji_1626485089.png'),
(12, 'j05', 0.38608871, 0.151541465, 0.821488575, 0.757800408, 1, 1, 'uji_1626485095.png'),
(13, 'j06', 0.385080645, 0.087072589, 0.818212366, 2.124308033, 1, 1, 'uji_1626485103.png'),
(14, 'j07', 0.454637097, 0.115195252, 0.802251344, 1.0802286, 1, 1, 'uji_1626485113.png'),
(15, 'j08', 0.557459677, 0.10894515, 0.760248656, 0.765082022, 1, 1, 'uji_1626485120.png'),
(16, 'j09', 0.324596774, 0.153789286, 0.841733871, 2.064253133, 1, 1, 'uji_1626485128.png'),
(17, 'k01', 0.317540323, 0.230683167, 0.842573925, 0.284106582, 0, 0, 'uji_1626485137.png'),
(18, 'k02', 0.255040323, 0.344446093, 0.873823925, 0.132795128, 0, 0, 'uji_1626485144.png'),
(19, 'k03', 0.234879032, 0.352797176, 0.88390457, 0.195684364, 0, 0, 'uji_1626485150.png'),
(20, 'k04', 0.178427419, 0.517122362, 0.91078629, 0.093303999, 0, 0, 'uji_1626485159.png'),
(21, 'k05', 0.135080645, 0.649493326, 0.932459677, 0.116767522, 0, 0, 'uji_1626485165.png'),
(22, 'k06', 0.17641129, 0.340125744, 0.911794355, 0.443200555, 0, 0, 'uji_1626485173.png'),
(23, 'k07', 0.262096774, 0.303063622, 0.871639785, 0.303141859, 0, 0, 'uji_1626485180.png'),
(24, 'k08', 0.26108871, 0.312587901, 0.872143817, 0.131734319, 0, 0, 'uji_1626485187.png'),
(25, 'k09', 0.387096774, 0.216711007, 0.818548387, 0.266538998, 0, 0, 'uji_1626485194.png'),
(26, 'k11', 0.276209677, 0.292241155, 0.861895161, 0.310869734, 0, 0, 'uji_1626485202.png'),
(27, 'k12', 0.299395161, 0.304925289, 0.851646505, 0.208379505, 0, 0, 'uji_1626485207.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `nama`, `password`, `status`) VALUES
(1, 'nevin', 'nevintrianade@gmail.com', 'nevin trian', '57dd6150d6302a88892a0c5e09dfc7fc', 'superadmin'),
(4, 'nevintrian', 'ne.vind99@gmail.com', 'nevin trian', 'd86180304faff1bb9849a78146b8496c', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mata`
--
ALTER TABLE `mata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uji`
--
ALTER TABLE `uji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mata`
--
ALTER TABLE `mata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `uji`
--
ALTER TABLE `uji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
