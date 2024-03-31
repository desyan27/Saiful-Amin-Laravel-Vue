-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2024 at 03:41 PM
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
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_obat`
--

CREATE TABLE `detail_obat` (
  `id_details` int(11) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `komposisi` varchar(255) NOT NULL,
  `produsen` varchar(30) NOT NULL,
  `nomor_izin_bpom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_obat`
--

INSERT INTO `detail_obat` (`id_details`, `nama_obat`, `komposisi`, `produsen`, `nomor_izin_bpom`) VALUES
(1, 'Vaksin Sinovac', 'Larutan fosfat sebagai stabilizer, natrium chlorida (NaCl)', 'Biofarma', 23124535),
(2, 'Obat Cacing', 'Mengandung 250mg Pirantel Pamoat', 'Biokimia', 24435554),
(3, 'Obat Pusing', '500mg paracetamol', 'Biokimia', 34454532);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_merek` varchar(50) NOT NULL,
  `jenis_obat` varchar(15) NOT NULL,
  `khasiat` text DEFAULT NULL,
  `harga_obat` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `details` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_merek`, `jenis_obat`, `khasiat`, `harga_obat`, `id_perusahaan`, `details`) VALUES
(4, 'Obat Cacing', 'tablet', 'Mencegah penyakit cacingan', 75000, 2, 2),
(5, 'Obat Sakit Kepala', 'tablet', 'Meringankan gejala pusing', 30000, 2, 3),
(6, 'Vaksin Sinovac', 'cairan', 'Meningkatkan antibodi virus pada sistem kekebalan tubuh', 500000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `umur` int(2) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `umur`, `alamat`) VALUES
(1, 'Desyan', 25, 'Buah Batu, Bandung'),
(2, 'Syifa Fairuz', 24, 'Ciparay, Kabupaten Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_obat`
--

CREATE TABLE `perusahaan_obat` (
  `id` int(11) NOT NULL,
  `Nama_Perusahaan` varchar(50) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Izin_Operasional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perusahaan_obat`
--

INSERT INTO `perusahaan_obat` (`id`, `Nama_Perusahaan`, `Alamat`, `No_Izin_Operasional`) VALUES
(1, 'Biofarma', 'Bandung', 536346),
(2, 'Kimiafarma', 'Soreang', 1313243143);

-- --------------------------------------------------------

--
-- Table structure for table `table_harga`
--

CREATE TABLE `table_harga` (
  `id_harga` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_harga`
--

INSERT INTO `table_harga` (`id_harga`, `harga`, `id_obat`) VALUES
(1, 30000, 5),
(2, 75000, 4),
(3, 500000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pasien`, `id_obat`, `harga`) VALUES
(2, 1, 5, 1),
(3, 2, 5, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD PRIMARY KEY (`id_details`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_ibfk_1` (`id_perusahaan`),
  ADD KEY `details` (`details`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perusahaan_obat`
--
ALTER TABLE `perusahaan_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_harga`
--
ALTER TABLE `table_harga`
  ADD PRIMARY KEY (`id_harga`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `harga` (`harga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_obat`
--
ALTER TABLE `detail_obat`
  MODIFY `id_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perusahaan_obat`
--
ALTER TABLE `perusahaan_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_harga`
--
ALTER TABLE `table_harga`
  MODIFY `id_harga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan_obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `obat_ibfk_2` FOREIGN KEY (`details`) REFERENCES `detail_obat` (`id_details`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `table_harga`
--
ALTER TABLE `table_harga`
  ADD CONSTRAINT `table_harga_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`harga`) REFERENCES `table_harga` (`id_harga`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
