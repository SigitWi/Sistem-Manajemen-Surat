-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2021 at 03:22 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_letter`
--

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE `disposisi` (
  `id_disposisi` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `id_pegawai_pengirim` int(11) NOT NULL,
  `id_pegawai_penerima` int(11) NOT NULL,
  `tgl_disposisi` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `level`) VALUES
(1, 'Lurah', 1),
(2, 'Sekretaris', 2),
(3, 'Kasie A', 3),
(4, 'Kasie B', 4),
(5, 'Kasie C', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nik` bigint(50) NOT NULL,
  `nama_pegawai` varchar(200) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nik`, `nama_pegawai`, `id_jabatan`, `password`) VALUES
(1, 999, 'Christian Doxa Hamasiah', 1, '$2y$10$hWHq6k/Y31G8gA/ql2LvVem4rGSykg7taIzC8ER9QfslvFrHSi0fG'),
(20, 2147483647, 'Sigit', 2, '$2y$10$7whyO5JSowO56exMDeY/JOAHM/dMPkyBD.F1fncJWrmgZ7UI7UUCi'),
(21, 1811016310020, 'Habib', 4, '$2y$10$VgEXa0zfn7cJ0hb8QO1NdO/e.lTlw96indFeFgNmhQxJ6mQPYsXXK'),
(22, 12345, 'Sigit', 1, '$2y$10$z9kPYadO5OyRWKktx4GYMeqr30VX/aeoRi.dPhmGYo3PQkG5ICrd.'),
(23, 123456, 'Sigit', 2, '$2y$10$azrKY88OwbtBvZWISLveVu.1L5uSZPt4i9woNHQIdTaNNVNfwYPw2');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(200) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `tujuan` varchar(200) NOT NULL,
  `perihal` varchar(200) NOT NULL,
  `file_surat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_keluar`
--

INSERT INTO `surat_keluar` (`id_surat`, `nomor_surat`, `tgl_kirim`, `tujuan`, `perihal`, `file_surat`) VALUES
(4, 'INM/129/KPW', '2018-02-01', 'SMK DB Jombang', 'Undangan Pernikahannn', 'Nilai_Siswa_9990244809.pdf'),
(5, 'KOB/1212/FFF', '2018-01-31', 'SMPN 2 Jombang', 'Undangan HUT Telkom', 'RULEBOOK-ISHOT-COMPETITION-IDEACTION-20173.pdf'),
(6, '99000', '2021-10-21', 'DLH', 'bb', 'UAS_MetPen.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(200) NOT NULL,
  `tgl_kirim` date NOT NULL,
  `tgl_terima` date NOT NULL,
  `pengirim` varchar(200) NOT NULL,
  `penerima` varchar(200) NOT NULL,
  `perihal` varchar(200) NOT NULL,
  `file_surat` text NOT NULL,
  `status` enum('proses','selesai') NOT NULL DEFAULT 'proses'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_surat`, `nomor_surat`, `tgl_kirim`, `tgl_terima`, `pengirim`, `penerima`, `perihal`, `file_surat`, `status`) VALUES
(4, 'INV/777/IND', '2018-01-12', '2018-01-13', 'SMPN 5 JOMBANG', 'Sekretaris', 'Undangan Workshop', 'RULEBOOK-ISHOT-COMPETITION-IDEACTION-20171.pdf', 'selesai'),
(5, 'KKN/993/JJH', '2018-01-03', '2018-01-06', 'SMPN 2 MALANG', 'Sekretaris', 'Undangan Workshop', 'August_Assignment.pdf', 'proses'),
(6, '081545989254', '2021-10-25', '2021-10-25', 'Sigit', 'sekretaris', 'Undangan Maulid nabi', 'Ilkom_Sigit_Wibowo.pdf', 'selesai'),
(7, '99000', '2021-10-30', '2021-10-30', 'Sigit', 'sekretaris', 'Nikahan', 'SURAT_PERNYATAAN_PKKMB.pdf', 'proses');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`id_disposisi`),
  ADD KEY `id_surat` (`id_surat`),
  ADD KEY `id_pegawai_penerima` (`id_pegawai_penerima`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_surat`),
  ADD KEY `id_surat` (`id_surat`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_surat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disposisi`
--
ALTER TABLE `disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD CONSTRAINT `disposisi_ibfk_1` FOREIGN KEY (`id_surat`) REFERENCES `surat_masuk` (`id_surat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disposisi_pegawai_id_pegawai_fk` FOREIGN KEY (`id_pegawai_penerima`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_jabatan_id_jabatan_fk` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
