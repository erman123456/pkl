-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 23, 2020 at 09:47 AM
-- Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.3.24-3+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labura_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `nama_agama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nama_agama`) VALUES
(1, 'Budha'),
(2, 'Hindu'),
(3, 'Islam'),
(4, 'Katolik'),
(5, 'Protestan');

-- --------------------------------------------------------

--
-- Table structure for table `berkas_diri`
--

CREATE TABLE `berkas_diri` (
  `id_berkas_diri` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bulan`
--

CREATE TABLE `bulan` (
  `id_bulan` varchar(20) NOT NULL,
  `nama_bulan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulan`
--

INSERT INTO `bulan` (`id_bulan`, `nama_bulan`) VALUES
('01', 'Januari'),
('02', 'Februari'),
('03', 'Maret'),
('04', 'April'),
('05', 'Mei'),
('06', 'Juni'),
('07', 'Juli'),
('08', 'Agustus'),
('09', 'September'),
('10', 'Oktober'),
('11', 'November'),
('12', 'Desember');

-- --------------------------------------------------------

--
-- Table structure for table `casuti`
--

CREATE TABLE `casuti` (
  `id_casuti` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL,
  `id_cuti` int(11) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `tanggal_selesai` varchar(10) NOT NULL,
  `hari` int(10) NOT NULL,
  `n2` int(11) NOT NULL,
  `n1` int(11) NOT NULL,
  `n` int(11) NOT NULL,
  `alasan` varchar(100) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `baca` char(1) NOT NULL DEFAULT 'N',
  `tanggal_input` date NOT NULL,
  `alamat_cuti` varchar(255) NOT NULL,
  `upload` text NOT NULL,
  `konfirmasi` enum('','Y','T') NOT NULL DEFAULT '',
  `file` text NOT NULL,
  `ttd_atasan_langsung` text NOT NULL,
  `sk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `casuti`
--

INSERT INTO `casuti` (`id_casuti`, `id_pegawai`, `id_skpd`, `id_cuti`, `tanggal`, `tanggal_selesai`, `hari`, `n2`, `n1`, `n`, `alasan`, `status`, `baca`, `tanggal_input`, `alamat_cuti`, `upload`, `konfirmasi`, `file`, `ttd_atasan_langsung`, `sk`) VALUES
(1, 1, 1, 1, '2020-11-04', '2020-11-04', 1, 6, 6, 12, 'jln', 'N', 'N', '2020-11-04', '', '', '', '274197304101994022003', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `diklat`
--

CREATE TABLE `diklat` (
  `id_diklat` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `tahun` char(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jam` varchar(100) NOT NULL,
  `pelajaran` varchar(200) NOT NULL,
  `berkas` text NOT NULL,
  `keterangan` text NOT NULL,
  `id_jenis_diklat` int(11) NOT NULL,
  `id_kategori_diklat` int(11) NOT NULL,
  `skpd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diklat`
--

INSERT INTO `diklat` (`id_diklat`, `id_pegawai`, `nomor`, `tanggal`, `tahun`, `jumlah`, `jam`, `pelajaran`, `berkas`, `keterangan`, `id_jenis_diklat`, `id_kategori_diklat`, `skpd`) VALUES
(1, 1, 'sadf', '2020-10-15', '2020', 0, '11:30 AM', 'sadf', '131597686556.pdf', 'asdf', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `epensiun_sms`
--

CREATE TABLE `epensiun_sms` (
  `id_sms` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `waktu_input` varchar(10) NOT NULL,
  `isi_sms` tinytext NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `periode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `eselon`
--

CREATE TABLE `eselon` (
  `id_eselon` int(11) NOT NULL,
  `nama_eselon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eselon`
--

INSERT INTO `eselon` (`id_eselon`, `nama_eselon`) VALUES
(1, 'Ia'),
(2, 'Ib'),
(3, 'IIa'),
(4, 'IIb'),
(5, 'IIIa'),
(6, 'IIIb'),
(7, 'IVa'),
(8, 'IVb');

-- --------------------------------------------------------

--
-- Table structure for table `fungsi`
--

CREATE TABLE `fungsi` (
  `id_fungsi` varchar(11) NOT NULL,
  `nama_fungsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `id_golongan` int(11) NOT NULL,
  `nama_golongan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` varchar(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hari_libur`
--

CREATE TABLE `hari_libur` (
  `id_hari_libur` int(11) NOT NULL,
  `tanggal_libur` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hari_libur`
--

INSERT INTO `hari_libur` (`id_hari_libur`, `tanggal_libur`, `keterangan`) VALUES
(1, '2016-01-01', 'Tahun Baru Masehi'),
(2, '2016-02-08', 'Tahun Baru Imlek'),
(3, '2016-03-09', 'Hari Raya Nyepi'),
(4, '2016-03-25', 'Jumat Agung'),
(5, '2016-05-01', 'Hari Buruh'),
(6, '2016-05-05', 'Kenaikan Isa Almasih'),
(7, '2016-05-06', 'Isra Miraj'),
(8, '2016-05-22', 'Hari Raya Waisak'),
(9, '2016-07-04', 'Cuti Bersama'),
(10, '2016-07-05', 'Cuti Bersama'),
(11, '2016-07-06', 'Idul Fitri'),
(12, '2016-07-07', 'Idul Fitri'),
(13, '2016-07-08', 'Cuti Bersama'),
(14, '2016-08-17', 'Hari Kemerdekaan'),
(15, '2016-09-12', 'Idul Adha'),
(16, '2016-10-02', 'Tahun Baru Hijriah'),
(17, '2016-12-12', 'Maulid Nabi'),
(18, '2016-12-25', 'Hari Natal'),
(19, '2016-12-25', 'Cuti Bersama'),
(20, '2017-01-01', 'Tahun Baru'),
(21, '2017-01-28', 'Tahun Baru Imlek'),
(22, '2017-03-28', 'Hari Raya Nyepi'),
(23, '2017-04-14', 'Jumat Agung'),
(24, '2017-04-24', 'Isra Miraj'),
(25, '2017-05-01', 'Hari Buruh'),
(26, '2017-05-11', 'Hari Raya Waisak'),
(27, '2017-05-25', 'Kenaikan Isa Almasih'),
(28, '2016-06-01', 'Hari Lahir Pancasila'),
(29, '2017-06-23', 'Cuti Bersama'),
(30, '2017-06-25', 'Idul Fitri'),
(31, '2017-06-26', 'Idul Fitri'),
(32, '2016-06-27', 'Cuti Bersama'),
(33, '2016-06-28', 'Cuti Bersama'),
(34, '2017-06-27', 'Cuti Bersama'),
(35, '2017-06-28', 'Cuti Bersama'),
(36, '2017-08-17', 'Hari Kemerdekaan'),
(37, '2017-09-01', 'Idul Adha'),
(38, '2017-09-21', 'Tahun Baru Hijriah'),
(39, '2017-12-01', 'Maulid Nabi'),
(40, '2017-12-25', 'Hari Natal'),
(41, '2017-12-26', 'Cuti Bersama'),
(42, '2017-01-02', 'Cuti Bersama Tahun Baru'),
(43, '2017-02-15', 'HARI PILKADA'),
(45, '2017-03-11', 'coba'),
(46, '2017-06-01', 'HARI LAHIR PANCASILA'),
(47, '2017-06-29', 'Cuti Bersama Lebaran'),
(48, '2017-06-30', 'Cuti Bersama Lebaran');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(200) NOT NULL,
  `direktori` enum('N','Y') NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_atasan` int(11) NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `direktori`, `id_jenis`, `id_atasan`, `id_eselon`, `id_skpd`) VALUES
(1, 'Kepala Badan Kepegawaian Daerah', 'N', 1, 0, 4, 1),
(2, 'Sekretariat Badan Sekretariat', 'N', 1, 1, 5, 2),
(3, 'Kepala Sub Bagian Umum', 'N', 1, 2, 7, 3),
(4, 'Kepala Sub Bagian Program dan Keuangan', 'N', 1, 2, 7, 4),
(5, 'Kepala Bidang Mutasi, Pengadaan dan Pengembangan Karir', 'N', 1, 1, 6, 5),
(6, 'Sub Bidang Sub Bidang Mutasi', 'N', 1, 5, 7, 6),
(7, 'Sub Bagian Sub Bidang Pengadaan dan Pemberhentian', 'N', 1, 5, 7, 7),
(8, 'Kepala Bidang Pengembangan Sumber Daya Manusia dan Pensiun', 'N', 1, 1, 6, 8),
(9, 'Sub Bidang Sub Bidang Pengembangan Kariri dan Fasilitasi Profesi ASN', 'N', 1, 5, 7, 9),
(10, 'Kepala Sub Bidang Penilaian Kinerja Aparatur dan Informasi', 'N', 1, 8, 7, 10),
(11, 'Sub Bidang Sub Bidang Pengembangan Aparatur', 'N', 1, 8, 7, 11),
(12, 'Kepala Sub Bidang Pensiun dan Penghargaan', 'N', 1, 8, 7, 12),
(14, 'Kepala Dinas Komunikasi dan Informatika', 'N', 1, 0, 4, 14),
(15, 'Kepala Sekretariat', 'N', 1, 14, 5, 15),
(16, 'Bidang Bidang Komunikasi dan Informasi Publik', 'N', 1, 14, 6, 16),
(17, 'Bidang Bidang Teknologi Informasi', 'N', 1, 14, 6, 17),
(18, 'Bidang Bidang Statistika, Persandian dan Telematika', 'N', 1, 14, 6, 18),
(19, 'Kepala Seksi Pengembangan Perangkat Lunak dan Aplikasi Informatika', 'N', 1, 17, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
(1, 'Kepala'),
(2, 'Badan'),
(3, 'Dinas'),
(4, 'UPT'),
(5, 'SDN'),
(6, 'Bidang'),
(9, 'Sekretariat Badan'),
(11, 'Sub Bagian'),
(12, 'Sub Bidang'),
(13, 'Seksi');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuti`
--

CREATE TABLE `jenis_cuti` (
  `id_jenis_cuti` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_cuti`
--

INSERT INTO `jenis_cuti` (`id_jenis_cuti`, `nama`, `kode`) VALUES
(1, 'Cuti Tahunan', '851'),
(2, 'Cuti Besar', '852'),
(3, 'Cuti Sakit', '853'),
(4, 'Cuti Melahirkan', '854'),
(5, 'Cuti Karena Alasan Penting', '857'),
(7, 'Cuti Diluar Tanggungan Negara', '856');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_dokumen`
--

CREATE TABLE `jenis_dokumen` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_dokumen`
--

INSERT INTO `jenis_dokumen` (`id`, `nama`) VALUES
(1, 'erman');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_jabatan`
--

CREATE TABLE `jenis_jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_jabatan`
--

INSERT INTO `jenis_jabatan` (`id`, `nama_jabatan`) VALUES
(1, 'Sruktural'),
(2, 'Fungsional Tertentu'),
(3, 'Pelaksana');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id_kabupaten` int(11) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `tipe` varchar(30) NOT NULL,
  `kode_pos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id_kabupaten`, `id_provinsi`, `nama_kabupaten`, `tipe`, `kode_pos`) VALUES
(1, 21, 'Aceh Barat', 'Kabupaten', '23681'),
(2, 21, 'Aceh Barat Daya', 'Kabupaten', '23764'),
(3, 21, 'Aceh Besar', 'Kabupaten', '23951'),
(4, 21, 'Aceh Jaya', 'Kabupaten', '23654'),
(5, 21, 'Aceh Selatan', 'Kabupaten', '23719'),
(6, 21, 'Aceh Singkil', 'Kabupaten', '24785'),
(7, 21, 'Aceh Tamiang', 'Kabupaten', '24476'),
(8, 21, 'Aceh Tengah', 'Kabupaten', '24511'),
(9, 21, 'Aceh Tenggara', 'Kabupaten', '24611'),
(10, 21, 'Aceh Timur', 'Kabupaten', '24454'),
(11, 21, 'Aceh Utara', 'Kabupaten', '24382'),
(12, 32, 'Agam', 'Kabupaten', '26411'),
(13, 23, 'Alor', 'Kabupaten', '85811'),
(14, 19, 'Ambon', 'Kota', '97222'),
(15, 34, 'Asahan', 'Kabupaten', '21214'),
(16, 24, 'Asmat', 'Kabupaten', '99777'),
(17, 1, 'Badung', 'Kabupaten', '80351'),
(18, 13, 'Balangan', 'Kabupaten', '71611'),
(19, 15, 'Balikpapan', 'Kota', '76111'),
(20, 21, 'Banda Aceh', 'Kota', '23238'),
(21, 18, 'Bandar Lampung', 'Kota', '35139'),
(22, 9, 'Bandung', 'Kabupaten', '40311'),
(23, 9, 'Bandung', 'Kota', '40115'),
(24, 9, 'Bandung Barat', 'Kabupaten', '40721'),
(25, 29, 'Banggai', 'Kabupaten', '94711'),
(26, 29, 'Banggai Kepulauan', 'Kabupaten', '94881'),
(27, 2, 'Bangka', 'Kabupaten', '33212'),
(28, 2, 'Bangka Barat', 'Kabupaten', '33315'),
(29, 2, 'Bangka Selatan', 'Kabupaten', '33719'),
(30, 2, 'Bangka Tengah', 'Kabupaten', '33613'),
(31, 11, 'Bangkalan', 'Kabupaten', '69118'),
(32, 1, 'Bangli', 'Kabupaten', '80619'),
(33, 13, 'Banjar', 'Kabupaten', '70619'),
(34, 9, 'Banjar', 'Kota', '46311'),
(35, 13, 'Banjarbaru', 'Kota', '70712'),
(36, 13, 'Banjarmasin', 'Kota', '70117'),
(37, 10, 'Banjarnegara', 'Kabupaten', '53419'),
(38, 28, 'Bantaeng', 'Kabupaten', '92411'),
(39, 5, 'Bantul', 'Kabupaten', '55715'),
(40, 33, 'Banyuasin', 'Kabupaten', '30911'),
(41, 10, 'Banyumas', 'Kabupaten', '53114'),
(42, 11, 'Banyuwangi', 'Kabupaten', '68416'),
(43, 13, 'Barito Kuala', 'Kabupaten', '70511'),
(44, 14, 'Barito Selatan', 'Kabupaten', '73711'),
(45, 14, 'Barito Timur', 'Kabupaten', '73671'),
(46, 14, 'Barito Utara', 'Kabupaten', '73881'),
(47, 28, 'Barru', 'Kabupaten', '90719'),
(48, 17, 'Batam', 'Kota', '29413'),
(49, 10, 'Batang', 'Kabupaten', '51211'),
(50, 8, 'Batang Hari', 'Kabupaten', '36613'),
(51, 11, 'Batu', 'Kota', '65311'),
(52, 34, 'Batu Bara', 'Kabupaten', '21655'),
(53, 30, 'Bau-Bau', 'Kota', '93719'),
(54, 9, 'Bekasi', 'Kabupaten', '17837'),
(55, 9, 'Bekasi', 'Kota', '17121'),
(56, 2, 'Belitung', 'Kabupaten', '33419'),
(57, 2, 'Belitung Timur', 'Kabupaten', '33519'),
(58, 23, 'Belu', 'Kabupaten', '85711'),
(59, 21, 'Bener Meriah', 'Kabupaten', '24581'),
(60, 26, 'Bengkalis', 'Kabupaten', '28719'),
(61, 12, 'Bengkayang', 'Kabupaten', '79213'),
(62, 4, 'Bengkulu', 'Kota', '38229'),
(63, 4, 'Bengkulu Selatan', 'Kabupaten', '38519'),
(64, 4, 'Bengkulu Tengah', 'Kabupaten', '38319'),
(65, 4, 'Bengkulu Utara', 'Kabupaten', '38619'),
(66, 15, 'Berau', 'Kabupaten', '77311'),
(67, 24, 'Biak Numfor', 'Kabupaten', '98119'),
(68, 22, 'Bima', 'Kabupaten', '84171'),
(69, 22, 'Bima', 'Kota', '84139'),
(70, 34, 'Binjai', 'Kota', '20712'),
(71, 17, 'Bintan', 'Kabupaten', '29135'),
(72, 21, 'Bireuen', 'Kabupaten', '24219'),
(73, 31, 'Bitung', 'Kota', '95512'),
(74, 11, 'Blitar', 'Kabupaten', '66171'),
(75, 11, 'Blitar', 'Kota', '66124'),
(76, 10, 'Blora', 'Kabupaten', '58219'),
(77, 7, 'Boalemo', 'Kabupaten', '96319'),
(78, 9, 'Bogor', 'Kabupaten', '16911'),
(79, 9, 'Bogor', 'Kota', '16119'),
(80, 11, 'Bojonegoro', 'Kabupaten', '62119'),
(81, 31, 'Bolaang Mongondow (Bolmong)', 'Kabupaten', '95755'),
(82, 31, 'Bolaang Mongondow Selatan', 'Kabupaten', '95774'),
(83, 31, 'Bolaang Mongondow Timur', 'Kabupaten', '95783'),
(84, 31, 'Bolaang Mongondow Utara', 'Kabupaten', '95765'),
(85, 30, 'Bombana', 'Kabupaten', '93771'),
(86, 11, 'Bondowoso', 'Kabupaten', '68219'),
(87, 28, 'Bone', 'Kabupaten', '92713'),
(88, 7, 'Bone Bolango', 'Kabupaten', '96511'),
(89, 15, 'Bontang', 'Kota', '75313'),
(90, 24, 'Boven Digoel', 'Kabupaten', '99662'),
(91, 10, 'Boyolali', 'Kabupaten', '57312'),
(92, 10, 'Brebes', 'Kabupaten', '52212'),
(93, 32, 'Bukittinggi', 'Kota', '26115'),
(94, 1, 'Buleleng', 'Kabupaten', '81111'),
(95, 28, 'Bulukumba', 'Kabupaten', '92511'),
(96, 16, 'Bulungan (Bulongan)', 'Kabupaten', '77211'),
(97, 8, 'Bungo', 'Kabupaten', '37216'),
(98, 29, 'Buol', 'Kabupaten', '94564'),
(99, 19, 'Buru', 'Kabupaten', '97371'),
(100, 19, 'Buru Selatan', 'Kabupaten', '97351'),
(101, 30, 'Buton', 'Kabupaten', '93754'),
(102, 30, 'Buton Utara', 'Kabupaten', '93745'),
(103, 9, 'Ciamis', 'Kabupaten', '46211'),
(104, 9, 'Cianjur', 'Kabupaten', '43217'),
(105, 10, 'Cilacap', 'Kabupaten', '53211'),
(106, 3, 'Cilegon', 'Kota', '42417'),
(107, 9, 'Cimahi', 'Kota', '40512'),
(108, 9, 'Cirebon', 'Kabupaten', '45611'),
(109, 9, 'Cirebon', 'Kota', '45116'),
(110, 34, 'Dairi', 'Kabupaten', '22211'),
(111, 24, 'Deiyai (Deliyai)', 'Kabupaten', '98784'),
(112, 34, 'Deli Serdang', 'Kabupaten', '20511'),
(113, 10, 'Demak', 'Kabupaten', '59519'),
(114, 1, 'Denpasar', 'Kota', '80227'),
(115, 9, 'Depok', 'Kota', '16416'),
(116, 32, 'Dharmasraya', 'Kabupaten', '27612'),
(117, 24, 'Dogiyai', 'Kabupaten', '98866'),
(118, 22, 'Dompu', 'Kabupaten', '84217'),
(119, 29, 'Donggala', 'Kabupaten', '94341'),
(120, 26, 'Dumai', 'Kota', '28811'),
(121, 33, 'Empat Lawang', 'Kabupaten', '31811'),
(122, 23, 'Ende', 'Kabupaten', '86351'),
(123, 28, 'Enrekang', 'Kabupaten', '91719'),
(124, 25, 'Fakfak', 'Kabupaten', '98651'),
(125, 23, 'Flores Timur', 'Kabupaten', '86213'),
(126, 9, 'Garut', 'Kabupaten', '44126'),
(127, 21, 'Gayo Lues', 'Kabupaten', '24653'),
(128, 1, 'Gianyar', 'Kabupaten', '80519'),
(129, 7, 'Gorontalo', 'Kabupaten', '96218'),
(130, 7, 'Gorontalo', 'Kota', '96115'),
(131, 7, 'Gorontalo Utara', 'Kabupaten', '96611'),
(132, 28, 'Gowa', 'Kabupaten', '92111'),
(133, 11, 'Gresik', 'Kabupaten', '61115'),
(134, 10, 'Grobogan', 'Kabupaten', '58111'),
(135, 5, 'Gunung Kidul', 'Kabupaten', '55812'),
(136, 14, 'Gunung Mas', 'Kabupaten', '74511'),
(137, 34, 'Gunungsitoli', 'Kota', '22813'),
(138, 20, 'Halmahera Barat', 'Kabupaten', '97757'),
(139, 20, 'Halmahera Selatan', 'Kabupaten', '97911'),
(140, 20, 'Halmahera Tengah', 'Kabupaten', '97853'),
(141, 20, 'Halmahera Timur', 'Kabupaten', '97862'),
(142, 20, 'Halmahera Utara', 'Kabupaten', '97762'),
(143, 13, 'Hulu Sungai Selatan', 'Kabupaten', '71212'),
(144, 13, 'Hulu Sungai Tengah', 'Kabupaten', '71313'),
(145, 13, 'Hulu Sungai Utara', 'Kabupaten', '71419'),
(146, 34, 'Humbang Hasundutan', 'Kabupaten', '22457'),
(147, 26, 'Indragiri Hilir', 'Kabupaten', '29212'),
(148, 26, 'Indragiri Hulu', 'Kabupaten', '29319'),
(149, 9, 'Indramayu', 'Kabupaten', '45214'),
(150, 24, 'Intan Jaya', 'Kabupaten', '98771'),
(151, 6, 'Jakarta Barat', 'Kota', '11220'),
(152, 6, 'Jakarta Pusat', 'Kota', '10540'),
(153, 6, 'Jakarta Selatan', 'Kota', '12230'),
(154, 6, 'Jakarta Timur', 'Kota', '13330'),
(155, 6, 'Jakarta Utara', 'Kota', '14140'),
(156, 8, 'Jambi', 'Kota', '36111'),
(157, 24, 'Jayapura', 'Kabupaten', '99352'),
(158, 24, 'Jayapura', 'Kota', '99114'),
(159, 24, 'Jayawijaya', 'Kabupaten', '99511'),
(160, 11, 'Jember', 'Kabupaten', '68113'),
(161, 1, 'Jembrana', 'Kabupaten', '82251'),
(162, 28, 'Jeneponto', 'Kabupaten', '92319'),
(163, 10, 'Jepara', 'Kabupaten', '59419'),
(164, 11, 'Jombang', 'Kabupaten', '61415'),
(165, 25, 'Kaimana', 'Kabupaten', '98671'),
(166, 26, 'Kampar', 'Kabupaten', '28411'),
(167, 14, 'Kapuas', 'Kabupaten', '73583'),
(168, 12, 'Kapuas Hulu', 'Kabupaten', '78719'),
(169, 10, 'Karanganyar', 'Kabupaten', '57718'),
(170, 1, 'Karangasem', 'Kabupaten', '80819'),
(171, 9, 'Karawang', 'Kabupaten', '41311'),
(172, 17, 'Karimun', 'Kabupaten', '29611'),
(173, 34, 'Karo', 'Kabupaten', '22119'),
(174, 14, 'Katingan', 'Kabupaten', '74411'),
(175, 4, 'Kaur', 'Kabupaten', '38911'),
(176, 12, 'Kayong Utara', 'Kabupaten', '78852'),
(177, 10, 'Kebumen', 'Kabupaten', '54319'),
(178, 11, 'Kediri', 'Kabupaten', '64184'),
(179, 11, 'Kediri', 'Kota', '64125'),
(180, 24, 'Keerom', 'Kabupaten', '99461'),
(181, 10, 'Kendal', 'Kabupaten', '51314'),
(182, 30, 'Kendari', 'Kota', '93126'),
(183, 4, 'Kepahiang', 'Kabupaten', '39319'),
(184, 17, 'Kepulauan Anambas', 'Kabupaten', '29991'),
(185, 19, 'Kepulauan Aru', 'Kabupaten', '97681'),
(186, 32, 'Kepulauan Mentawai', 'Kabupaten', '25771'),
(187, 26, 'Kepulauan Meranti', 'Kabupaten', '28791'),
(188, 31, 'Kepulauan Sangihe', 'Kabupaten', '95819'),
(189, 6, 'Kepulauan Seribu', 'Kabupaten', '14550'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)', 'Kabupaten', '95862'),
(191, 20, 'Kepulauan Sula', 'Kabupaten', '97995'),
(192, 31, 'Kepulauan Talaud', 'Kabupaten', '95885'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)', 'Kabupaten', '98211'),
(194, 8, 'Kerinci', 'Kabupaten', '37167'),
(195, 12, 'Ketapang', 'Kabupaten', '78874'),
(196, 10, 'Klaten', 'Kabupaten', '57411'),
(197, 1, 'Klungkung', 'Kabupaten', '80719'),
(198, 30, 'Kolaka', 'Kabupaten', '93511'),
(199, 30, 'Kolaka Utara', 'Kabupaten', '93911'),
(200, 30, 'Konawe', 'Kabupaten', '93411'),
(201, 30, 'Konawe Selatan', 'Kabupaten', '93811'),
(202, 30, 'Konawe Utara', 'Kabupaten', '93311'),
(203, 13, 'Kotabaru', 'Kabupaten', '72119'),
(204, 31, 'Kotamobagu', 'Kota', '95711'),
(205, 14, 'Kotawaringin Barat', 'Kabupaten', '74119'),
(206, 14, 'Kotawaringin Timur', 'Kabupaten', '74364'),
(207, 26, 'Kuantan Singingi', 'Kabupaten', '29519'),
(208, 12, 'Kubu Raya', 'Kabupaten', '78311'),
(209, 10, 'Kudus', 'Kabupaten', '59311'),
(210, 5, 'Kulon Progo', 'Kabupaten', '55611'),
(211, 9, 'Kuningan', 'Kabupaten', '45511'),
(212, 23, 'Kupang', 'Kabupaten', '85362'),
(213, 23, 'Kupang', 'Kota', '85119'),
(214, 15, 'Kutai Barat', 'Kabupaten', '75711'),
(215, 15, 'Kutai Kartanegara', 'Kabupaten', '75511'),
(216, 15, 'Kutai Timur', 'Kabupaten', '75611'),
(217, 34, 'Labuhan Batu', 'Kabupaten', '21412'),
(218, 34, 'Labuhan Batu Selatan', 'Kabupaten', '21511'),
(219, 34, 'Labuhan Batu Utara', 'Kabupaten', '21711'),
(220, 33, 'Lahat', 'Kabupaten', '31419'),
(221, 14, 'Lamandau', 'Kabupaten', '74611'),
(222, 11, 'Lamongan', 'Kabupaten', '64125'),
(223, 18, 'Lampung Barat', 'Kabupaten', '34814'),
(224, 18, 'Lampung Selatan', 'Kabupaten', '35511'),
(225, 18, 'Lampung Tengah', 'Kabupaten', '34212'),
(226, 18, 'Lampung Timur', 'Kabupaten', '34319'),
(227, 18, 'Lampung Utara', 'Kabupaten', '34516'),
(228, 12, 'Landak', 'Kabupaten', '78319'),
(229, 34, 'Langkat', 'Kabupaten', '20811'),
(230, 21, 'Langsa', 'Kota', '24412'),
(231, 24, 'Lanny Jaya', 'Kabupaten', '99531'),
(232, 3, 'Lebak', 'Kabupaten', '42319'),
(233, 4, 'Lebong', 'Kabupaten', '39264'),
(234, 23, 'Lembata', 'Kabupaten', '86611'),
(235, 21, 'Lhokseumawe', 'Kota', '24352'),
(236, 32, 'Lima Puluh Koto/Kota', 'Kabupaten', '26671'),
(237, 17, 'Lingga', 'Kabupaten', '29811'),
(238, 22, 'Lombok Barat', 'Kabupaten', '83311'),
(239, 22, 'Lombok Tengah', 'Kabupaten', '83511'),
(240, 22, 'Lombok Timur', 'Kabupaten', '83612'),
(241, 22, 'Lombok Utara', 'Kabupaten', '83711'),
(242, 33, 'Lubuk Linggau', 'Kota', '31614'),
(243, 11, 'Lumajang', 'Kabupaten', '67319'),
(244, 28, 'Luwu', 'Kabupaten', '91994'),
(245, 28, 'Luwu Timur', 'Kabupaten', '92981'),
(246, 28, 'Luwu Utara', 'Kabupaten', '92911'),
(247, 11, 'Madiun', 'Kabupaten', '63153'),
(248, 11, 'Madiun', 'Kota', '63122'),
(249, 10, 'Magelang', 'Kabupaten', '56519'),
(250, 10, 'Magelang', 'Kota', '56133'),
(251, 11, 'Magetan', 'Kabupaten', '63314'),
(252, 9, 'Majalengka', 'Kabupaten', '45412'),
(253, 27, 'Majene', 'Kabupaten', '91411'),
(254, 28, 'Makassar', 'Kota', '90111'),
(255, 11, 'Malang', 'Kabupaten', '65163'),
(256, 11, 'Malang', 'Kota', '65112'),
(257, 16, 'Malinau', 'Kabupaten', '77511'),
(258, 19, 'Maluku Barat Daya', 'Kabupaten', '97451'),
(259, 19, 'Maluku Tengah', 'Kabupaten', '97513'),
(260, 19, 'Maluku Tenggara', 'Kabupaten', '97651'),
(261, 19, 'Maluku Tenggara Barat', 'Kabupaten', '97465'),
(262, 27, 'Mamasa', 'Kabupaten', '91362'),
(263, 24, 'Mamberamo Raya', 'Kabupaten', '99381'),
(264, 24, 'Mamberamo Tengah', 'Kabupaten', '99553'),
(265, 27, 'Mamuju', 'Kabupaten', '91519'),
(266, 27, 'Mamuju Utara', 'Kabupaten', '91571'),
(267, 31, 'Manado', 'Kota', '95247'),
(268, 34, 'Mandailing Natal', 'Kabupaten', '22916'),
(269, 23, 'Manggarai', 'Kabupaten', '86551'),
(270, 23, 'Manggarai Barat', 'Kabupaten', '86711'),
(271, 23, 'Manggarai Timur', 'Kabupaten', '86811'),
(272, 25, 'Manokwari', 'Kabupaten', '98311'),
(273, 25, 'Manokwari Selatan', 'Kabupaten', '98355'),
(274, 24, 'Mappi', 'Kabupaten', '99853'),
(275, 28, 'Maros', 'Kabupaten', '90511'),
(276, 22, 'Mataram', 'Kota', '83131'),
(277, 25, 'Maybrat', 'Kabupaten', '98051'),
(278, 34, 'Medan', 'Kota', '20228'),
(279, 12, 'Melawi', 'Kabupaten', '78619'),
(280, 8, 'Merangin', 'Kabupaten', '37319'),
(281, 24, 'Merauke', 'Kabupaten', '99613'),
(282, 18, 'Mesuji', 'Kabupaten', '34911'),
(283, 18, 'Metro', 'Kota', '34111'),
(284, 24, 'Mimika', 'Kabupaten', '99962'),
(285, 31, 'Minahasa', 'Kabupaten', '95614'),
(286, 31, 'Minahasa Selatan', 'Kabupaten', '95914'),
(287, 31, 'Minahasa Tenggara', 'Kabupaten', '95995'),
(288, 31, 'Minahasa Utara', 'Kabupaten', '95316'),
(289, 11, 'Mojokerto', 'Kabupaten', '61382'),
(290, 11, 'Mojokerto', 'Kota', '61316'),
(291, 29, 'Morowali', 'Kabupaten', '94911'),
(292, 33, 'Muara Enim', 'Kabupaten', '31315'),
(293, 8, 'Muaro Jambi', 'Kabupaten', '36311'),
(294, 4, 'Muko Muko', 'Kabupaten', '38715'),
(295, 30, 'Muna', 'Kabupaten', '93611'),
(296, 14, 'Murung Raya', 'Kabupaten', '73911'),
(297, 33, 'Musi Banyuasin', 'Kabupaten', '30719'),
(298, 33, 'Musi Rawas', 'Kabupaten', '31661'),
(299, 24, 'Nabire', 'Kabupaten', '98816'),
(300, 21, 'Nagan Raya', 'Kabupaten', '23674'),
(301, 23, 'Nagekeo', 'Kabupaten', '86911'),
(302, 17, 'Natuna', 'Kabupaten', '29711'),
(303, 24, 'Nduga', 'Kabupaten', '99541'),
(304, 23, 'Ngada', 'Kabupaten', '86413'),
(305, 11, 'Nganjuk', 'Kabupaten', '64414'),
(306, 11, 'Ngawi', 'Kabupaten', '63219'),
(307, 34, 'Nias', 'Kabupaten', '22876'),
(308, 34, 'Nias Barat', 'Kabupaten', '22895'),
(309, 34, 'Nias Selatan', 'Kabupaten', '22865'),
(310, 34, 'Nias Utara', 'Kabupaten', '22856'),
(311, 16, 'Nunukan', 'Kabupaten', '77421'),
(312, 33, 'Ogan Ilir', 'Kabupaten', '30811'),
(313, 33, 'Ogan Komering Ilir', 'Kabupaten', '30618'),
(314, 33, 'Ogan Komering Ulu', 'Kabupaten', '32112'),
(315, 33, 'Ogan Komering Ulu Selatan', 'Kabupaten', '32211'),
(316, 33, 'Ogan Komering Ulu Timur', 'Kabupaten', '32312'),
(317, 11, 'Pacitan', 'Kabupaten', '63512'),
(318, 32, 'Padang', 'Kota', '25112'),
(319, 34, 'Padang Lawas', 'Kabupaten', '22763'),
(320, 34, 'Padang Lawas Utara', 'Kabupaten', '22753'),
(321, 32, 'Padang Panjang', 'Kota', '27122'),
(322, 32, 'Padang Pariaman', 'Kabupaten', '25583'),
(323, 34, 'Padang Sidempuan', 'Kota', '22727'),
(324, 33, 'Pagar Alam', 'Kota', '31512'),
(325, 34, 'Pakpak Bharat', 'Kabupaten', '22272'),
(326, 14, 'Palangka Raya', 'Kota', '73112'),
(327, 33, 'Palembang', 'Kota', '31512'),
(328, 28, 'Palopo', 'Kota', '91911'),
(329, 29, 'Palu', 'Kota', '94111'),
(330, 11, 'Pamekasan', 'Kabupaten', '69319'),
(331, 3, 'Pandeglang', 'Kabupaten', '42212'),
(332, 9, 'Pangandaran', 'Kabupaten', '46511'),
(333, 28, 'Pangkajene Kepulauan', 'Kabupaten', '90611'),
(334, 2, 'Pangkal Pinang', 'Kota', '33115'),
(335, 24, 'Paniai', 'Kabupaten', '98765'),
(336, 28, 'Parepare', 'Kota', '91123'),
(337, 32, 'Pariaman', 'Kota', '25511'),
(338, 29, 'Parigi Moutong', 'Kabupaten', '94411'),
(339, 32, 'Pasaman', 'Kabupaten', '26318'),
(340, 32, 'Pasaman Barat', 'Kabupaten', '26511'),
(341, 15, 'Paser', 'Kabupaten', '76211'),
(342, 11, 'Pasuruan', 'Kabupaten', '67153'),
(343, 11, 'Pasuruan', 'Kota', '67118'),
(344, 10, 'Pati', 'Kabupaten', '59114'),
(345, 32, 'Payakumbuh', 'Kota', '26213'),
(346, 25, 'Pegunungan Arfak', 'Kabupaten', '98354'),
(347, 24, 'Pegunungan Bintang', 'Kabupaten', '99573'),
(348, 10, 'Pekalongan', 'Kabupaten', '51161'),
(349, 10, 'Pekalongan', 'Kota', '51122'),
(350, 26, 'Pekanbaru', 'Kota', '28112'),
(351, 26, 'Pelalawan', 'Kabupaten', '28311'),
(352, 10, 'Pemalang', 'Kabupaten', '52319'),
(353, 34, 'Pematang Siantar', 'Kota', '21126'),
(354, 15, 'Penajam Paser Utara', 'Kabupaten', '76311'),
(355, 18, 'Pesawaran', 'Kabupaten', '35312'),
(356, 18, 'Pesisir Barat', 'Kabupaten', '35974'),
(357, 32, 'Pesisir Selatan', 'Kabupaten', '25611'),
(358, 21, 'Pidie', 'Kabupaten', '24116'),
(359, 21, 'Pidie Jaya', 'Kabupaten', '24186'),
(360, 28, 'Pinrang', 'Kabupaten', '91251'),
(361, 7, 'Pohuwato', 'Kabupaten', '96419'),
(362, 27, 'Polewali Mandar', 'Kabupaten', '91311'),
(363, 11, 'Ponorogo', 'Kabupaten', '63411'),
(364, 12, 'Pontianak', 'Kabupaten', '78971'),
(365, 12, 'Pontianak', 'Kota', '78112'),
(366, 29, 'Poso', 'Kabupaten', '94615'),
(367, 33, 'Prabumulih', 'Kota', '31121'),
(368, 18, 'Pringsewu', 'Kabupaten', '35719'),
(369, 11, 'Probolinggo', 'Kabupaten', '67282'),
(370, 11, 'Probolinggo', 'Kota', '67215'),
(371, 14, 'Pulang Pisau', 'Kabupaten', '74811'),
(372, 20, 'Pulau Morotai', 'Kabupaten', '97771'),
(373, 24, 'Puncak', 'Kabupaten', '98981'),
(374, 24, 'Puncak Jaya', 'Kabupaten', '98979'),
(375, 10, 'Purbalingga', 'Kabupaten', '53312'),
(376, 9, 'Purwakarta', 'Kabupaten', '41119'),
(377, 10, 'Purworejo', 'Kabupaten', '54111'),
(378, 25, 'Raja Ampat', 'Kabupaten', '98489'),
(379, 4, 'Rejang Lebong', 'Kabupaten', '39112'),
(380, 10, 'Rembang', 'Kabupaten', '59219'),
(381, 26, 'Rokan Hilir', 'Kabupaten', '28992'),
(382, 26, 'Rokan Hulu', 'Kabupaten', '28511'),
(383, 23, 'Rote Ndao', 'Kabupaten', '85982'),
(384, 21, 'Sabang', 'Kota', '23512'),
(385, 23, 'Sabu Raijua', 'Kabupaten', '85391'),
(386, 10, 'Salatiga', 'Kota', '50711'),
(387, 15, 'Samarinda', 'Kota', '75133'),
(388, 12, 'Sambas', 'Kabupaten', '79453'),
(389, 34, 'Samosir', 'Kabupaten', '22392'),
(390, 11, 'Sampang', 'Kabupaten', '69219'),
(391, 12, 'Sanggau', 'Kabupaten', '78557'),
(392, 24, 'Sarmi', 'Kabupaten', '99373'),
(393, 8, 'Sarolangun', 'Kabupaten', '37419'),
(394, 32, 'Sawah Lunto', 'Kota', '27416'),
(395, 12, 'Sekadau', 'Kabupaten', '79583'),
(396, 28, 'Selayar (Kepulauan Selayar)', 'Kabupaten', '92812'),
(397, 4, 'Seluma', 'Kabupaten', '38811'),
(398, 10, 'Semarang', 'Kabupaten', '50511'),
(399, 10, 'Semarang', 'Kota', '50135'),
(400, 19, 'Seram Bagian Barat', 'Kabupaten', '97561'),
(401, 19, 'Seram Bagian Timur', 'Kabupaten', '97581'),
(402, 3, 'Serang', 'Kabupaten', '42182'),
(403, 3, 'Serang', 'Kota', '42111'),
(404, 34, 'Serdang Bedagai', 'Kabupaten', '20915'),
(405, 14, 'Seruyan', 'Kabupaten', '74211'),
(406, 26, 'Siak', 'Kabupaten', '28623'),
(407, 34, 'Sibolga', 'Kota', '22522'),
(408, 28, 'Sidenreng Rappang/Rapang', 'Kabupaten', '91613'),
(409, 11, 'Sidoarjo', 'Kabupaten', '61219'),
(410, 29, 'Sigi', 'Kabupaten', '94364'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)', 'Kabupaten', '27511'),
(412, 23, 'Sikka', 'Kabupaten', '86121'),
(413, 34, 'Simalungun', 'Kabupaten', '21162'),
(414, 21, 'Simeulue', 'Kabupaten', '23891'),
(415, 12, 'Singkawang', 'Kota', '79117'),
(416, 28, 'Sinjai', 'Kabupaten', '92615'),
(417, 12, 'Sintang', 'Kabupaten', '78619'),
(418, 11, 'Situbondo', 'Kabupaten', '68316'),
(419, 5, 'Sleman', 'Kabupaten', '55513'),
(420, 32, 'Solok', 'Kabupaten', '27365'),
(421, 32, 'Solok', 'Kota', '27315'),
(422, 32, 'Solok Selatan', 'Kabupaten', '27779'),
(423, 28, 'Soppeng', 'Kabupaten', '90812'),
(424, 25, 'Sorong', 'Kabupaten', '98431'),
(425, 25, 'Sorong', 'Kota', '98411'),
(426, 25, 'Sorong Selatan', 'Kabupaten', '98454'),
(427, 10, 'Sragen', 'Kabupaten', '57211'),
(428, 9, 'Subang', 'Kabupaten', '41215'),
(429, 21, 'Subulussalam', 'Kota', '24882'),
(430, 9, 'Sukabumi', 'Kabupaten', '43311'),
(431, 9, 'Sukabumi', 'Kota', '43114'),
(432, 14, 'Sukamara', 'Kabupaten', '74712'),
(433, 10, 'Sukoharjo', 'Kabupaten', '57514'),
(434, 23, 'Sumba Barat', 'Kabupaten', '87219'),
(435, 23, 'Sumba Barat Daya', 'Kabupaten', '87453'),
(436, 23, 'Sumba Tengah', 'Kabupaten', '87358'),
(437, 23, 'Sumba Timur', 'Kabupaten', '87112'),
(438, 22, 'Sumbawa', 'Kabupaten', '84315'),
(439, 22, 'Sumbawa Barat', 'Kabupaten', '84419'),
(440, 9, 'Sumedang', 'Kabupaten', '45326'),
(441, 11, 'Sumenep', 'Kabupaten', '69413'),
(442, 8, 'Sungaipenuh', 'Kota', '37113'),
(443, 24, 'Supiori', 'Kabupaten', '98164'),
(444, 11, 'Surabaya', 'Kota', '60119'),
(445, 10, 'Surakarta (Solo)', 'Kota', '57113'),
(446, 13, 'Tabalong', 'Kabupaten', '71513'),
(447, 1, 'Tabanan', 'Kabupaten', '82119'),
(448, 28, 'Takalar', 'Kabupaten', '92212'),
(449, 25, 'Tambrauw', 'Kabupaten', '98475'),
(450, 16, 'Tana Tidung', 'Kabupaten', '77611'),
(451, 28, 'Tana Toraja', 'Kabupaten', '91819'),
(452, 13, 'Tanah Bumbu', 'Kabupaten', '72211'),
(453, 32, 'Tanah Datar', 'Kabupaten', '27211'),
(454, 13, 'Tanah Laut', 'Kabupaten', '70811'),
(455, 3, 'Tangerang', 'Kabupaten', '15914'),
(456, 3, 'Tangerang', 'Kota', '15111'),
(457, 3, 'Tangerang Selatan', 'Kota', '15332'),
(458, 18, 'Tanggamus', 'Kabupaten', '35619'),
(459, 34, 'Tanjung Balai', 'Kota', '21321'),
(460, 8, 'Tanjung Jabung Barat', 'Kabupaten', '36513'),
(461, 8, 'Tanjung Jabung Timur', 'Kabupaten', '36719'),
(462, 17, 'Tanjung Pinang', 'Kota', '29111'),
(463, 34, 'Tapanuli Selatan', 'Kabupaten', '22742'),
(464, 34, 'Tapanuli Tengah', 'Kabupaten', '22611'),
(465, 34, 'Tapanuli Utara', 'Kabupaten', '22414'),
(466, 13, 'Tapin', 'Kabupaten', '71119'),
(467, 16, 'Tarakan', 'Kota', '77114'),
(468, 9, 'Tasikmalaya', 'Kabupaten', '46411'),
(469, 9, 'Tasikmalaya', 'Kota', '46116'),
(470, 34, 'Tebing Tinggi', 'Kota', '20632'),
(471, 8, 'Tebo', 'Kabupaten', '37519'),
(472, 10, 'Tegal', 'Kabupaten', '52419'),
(473, 10, 'Tegal', 'Kota', '52114'),
(474, 25, 'Teluk Bintuni', 'Kabupaten', '98551'),
(475, 25, 'Teluk Wondama', 'Kabupaten', '98591'),
(476, 10, 'Temanggung', 'Kabupaten', '56212'),
(477, 20, 'Ternate', 'Kota', '97714'),
(478, 20, 'Tidore Kepulauan', 'Kota', '97815'),
(479, 23, 'Timor Tengah Selatan', 'Kabupaten', '85562'),
(480, 23, 'Timor Tengah Utara', 'Kabupaten', '85612'),
(481, 34, 'Toba Samosir', 'Kabupaten', '22316'),
(482, 29, 'Tojo Una-Una', 'Kabupaten', '94683'),
(483, 29, 'Toli-Toli', 'Kabupaten', '94542'),
(484, 24, 'Tolikara', 'Kabupaten', '99411'),
(485, 31, 'Tomohon', 'Kota', '95416'),
(486, 28, 'Toraja Utara', 'Kabupaten', '91831'),
(487, 11, 'Trenggalek', 'Kabupaten', '66312'),
(488, 19, 'Tual', 'Kota', '97612'),
(489, 11, 'Tuban', 'Kabupaten', '62319'),
(490, 18, 'Tulang Bawang', 'Kabupaten', '34613'),
(491, 18, 'Tulang Bawang Barat', 'Kabupaten', '34419'),
(492, 11, 'Tulungagung', 'Kabupaten', '66212'),
(493, 28, 'Wajo', 'Kabupaten', '90911'),
(494, 30, 'Wakatobi', 'Kabupaten', '93791'),
(495, 24, 'Waropen', 'Kabupaten', '98269'),
(496, 18, 'Way Kanan', 'Kabupaten', '34711'),
(497, 10, 'Wonogiri', 'Kabupaten', '57619'),
(498, 10, 'Wonosobo', 'Kabupaten', '56311'),
(499, 24, 'Yahukimo', 'Kabupaten', '99041'),
(500, 24, 'Yalimo', 'Kabupaten', '99481'),
(501, 5, 'Yogyakarta', 'Kota', '55222');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_diklat`
--

CREATE TABLE `kategori_diklat` (
  `id_kategori_diklat` int(11) NOT NULL,
  `nama_diklat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pegawai_pangkat`
--

CREATE TABLE `kepo_pegawai_pangkat` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pengajuan`
--

CREATE TABLE `kepo_pengajuan` (
  `id` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `no_usul` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL,
  `tanggal_tmt` varchar(20) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_kenaikan` int(11) NOT NULL,
  `status_hapus` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pengajuan_detail`
--

CREATE TABLE `kepo_pengajuan_detail` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL,
  `id_pengajuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pengajuan_detail_log`
--

CREATE TABLE `kepo_pengajuan_detail_log` (
  `id` int(11) NOT NULL,
  `id_pengajuan_detail` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `catatan` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pengajuan_log`
--

CREATE TABLE `kepo_pengajuan_log` (
  `id_pengajuan` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `catatan` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_pengajuan_status`
--

CREATE TABLE `kepo_pengajuan_status` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `warna` varchar(200) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_sms`
--

CREATE TABLE `kepo_sms` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `isi_sms` text NOT NULL,
  `periode` varchar(20) NOT NULL,
  `no_hp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepo_users_log`
--

CREATE TABLE `kepo_users_log` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `waktu_input` varchar(20) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `aksi` varchar(50) NOT NULL,
  `id_data` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `launching`
--

CREATE TABLE `launching` (
  `id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `launching`
--

INSERT INTO `launching` (`id`, `status`) VALUES
(1, 'R');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity_simpeg`
--

CREATE TABLE `log_activity_simpeg` (
  `id_log` int(11) NOT NULL,
  `nama_tabel` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `query` text NOT NULL,
  `waktu` datetime NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_users`
--

CREATE TABLE `log_users` (
  `id_log_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `jam` varchar(10) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pangkat`
--

CREATE TABLE `pangkat` (
  `id_pangkat` int(11) NOT NULL,
  `kode_pangkat` varchar(10) NOT NULL,
  `nama_pangkat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pangkat`
--

INSERT INTO `pangkat` (`id_pangkat`, `kode_pangkat`, `nama_pangkat`) VALUES
(0, 'CPNS', 'Calon Pegawai Negeri Sipil'),
(1, ' I/a', 'Juru Muda '),
(2, 'I/b', 'Juru Muda Tingkat I'),
(3, 'I/c', 'Juru'),
(4, 'I/d', 'Juru Tingkat I'),
(5, 'II/a', 'Pengatur Muda'),
(6, 'II/b', 'Pengatur Muda Tingkat I'),
(7, 'II/c', 'Pengatur'),
(8, 'II/d', 'Pengatur Tingkat I'),
(9, 'III/a', 'Penata Muda'),
(10, 'III/b', 'Penata Muda Tingkat I'),
(11, 'III/c', 'Penata'),
(12, 'III/d ', 'Penata Tingkat I'),
(13, 'IV/a', 'Pembina'),
(14, 'IV/b', 'Pembina Tingkat I'),
(15, 'IV/c', 'Pembina Utama Muda'),
(16, 'IV/d', 'Pembina Utama Madya'),
(17, 'IV/e', 'Pembina Utama');

-- --------------------------------------------------------

--
-- Table structure for table `pangkat_gaji`
--

CREATE TABLE `pangkat_gaji` (
  `id_pangkat_gaji` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `masa_kerja` int(11) NOT NULL,
  `upah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pangkat_gaji`
--

INSERT INTO `pangkat_gaji` (`id_pangkat_gaji`, `id_pangkat`, `masa_kerja`, `upah`) VALUES
(1, 1, 0, '1560800'),
(2, 1, 24, '1610000'),
(3, 1, 48, '1660700'),
(4, 1, 72, '1713000'),
(5, 1, 96, '1766900'),
(6, 1, 120, '1822600'),
(7, 1, 144, '1880000'),
(8, 1, 168, '1939200'),
(9, 1, 192, '2000300'),
(10, 1, 216, '2063300'),
(11, 1, 240, '2128300'),
(12, 1, 264, '2195300'),
(13, 1, 288, '264400'),
(14, 1, 312, '2335800'),
(15, 2, 36, '1704500'),
(16, 2, 60, '1758200'),
(17, 2, 84, '1813600'),
(18, 2, 108, '1870700'),
(19, 2, 132, '1929600'),
(20, 2, 156, '1990400'),
(21, 2, 180, '2053100'),
(22, 2, 204, '2117700'),
(23, 2, 228, '2184400'),
(24, 2, 252, '2253200'),
(25, 2, 276, '2324200'),
(26, 2, 300, '2397400'),
(27, 2, 324, '2472900'),
(28, 3, 36, '1776600'),
(29, 3, 60, '1832600'),
(30, 3, 84, '1890300'),
(31, 3, 108, '1949800'),
(32, 3, 132, '2011200'),
(33, 3, 156, '2074600'),
(34, 3, 180, '2139900'),
(35, 3, 204, '2207300'),
(36, 3, 228, '2276800'),
(37, 3, 252, '2348500'),
(38, 3, 276, '2422500'),
(39, 3, 300, '2498800'),
(40, 3, 324, '2577500'),
(41, 4, 36, '1851800'),
(42, 4, 60, '1910100'),
(43, 4, 84, '1970200'),
(44, 4, 108, '2032300'),
(45, 4, 132, '2096300'),
(46, 4, 156, '2162300'),
(47, 4, 180, '2230400'),
(48, 4, 204, '2300700'),
(49, 4, 228, '2373100'),
(50, 4, 252, '2447900'),
(51, 4, 276, '2525000'),
(52, 4, 300, '2604500'),
(53, 4, 324, '2686500'),
(54, 5, 0, '2022200'),
(55, 5, 12, '2054100'),
(56, 5, 36, '2118800'),
(57, 5, 60, '2185500'),
(58, 5, 84, '2254300'),
(59, 5, 108, '2325300'),
(60, 5, 132, '2398600'),
(61, 5, 156, '2474100'),
(62, 5, 180, '2552000'),
(63, 5, 204, '2632400'),
(64, 5, 228, '2715300'),
(65, 5, 252, '2800800'),
(66, 5, 276, '2889100'),
(67, 5, 300, '2980000'),
(68, 5, 324, '3073900'),
(69, 5, 348, '3170700'),
(70, 5, 372, '3270600'),
(71, 5, 396, '3373600'),
(72, 6, 36, '2208400'),
(73, 6, 60, '2277900'),
(74, 6, 84, '2349700'),
(75, 6, 108, '2423700'),
(76, 6, 132, '2500000'),
(77, 6, 156, '2578800'),
(78, 6, 180, '2660000'),
(79, 6, 204, '2743800'),
(80, 6, 228, '2830200'),
(81, 6, 252, '2919300'),
(82, 6, 276, '2867900'),
(83, 6, 300, '2985300'),
(84, 6, 324, '3011300'),
(85, 6, 348, '3304800'),
(86, 6, 372, '3408900'),
(87, 6, 396, '3516300'),
(88, 7, 36, '2301800'),
(89, 7, 60, '2374300'),
(90, 7, 84, '2449100'),
(91, 7, 108, '2526200'),
(92, 7, 132, '2605800'),
(93, 7, 180, '2772500'),
(94, 7, 204, '2859800'),
(95, 7, 228, '2949900'),
(96, 7, 252, '3042800'),
(97, 7, 276, '3138600'),
(98, 7, 300, '3237500'),
(99, 7, 324, '2339400'),
(100, 7, 348, '3444600'),
(101, 7, 372, '3553100'),
(102, 7, 396, '3665000'),
(103, 7, 156, '2687800'),
(104, 8, 36, '2399200'),
(105, 8, 60, '2474700'),
(106, 8, 84, '2552700'),
(107, 8, 108, '2663100'),
(108, 8, 132, '2716000'),
(110, 8, 156, '2801500'),
(111, 8, 180, '2889800'),
(112, 8, 204, '2980800'),
(113, 8, 228, '3074700'),
(114, 8, 252, '3171500'),
(115, 8, 276, '3271400'),
(116, 8, 300, '3374400'),
(117, 8, 324, '3480700'),
(118, 8, 348, '3590300'),
(119, 8, 372, '3703400'),
(120, 8, 396, '3820000'),
(121, 9, 0, '2579400'),
(122, 9, 24, '2660700'),
(123, 9, 48, '2744500'),
(125, 9, 72, '2830900'),
(126, 9, 96, '2920100'),
(127, 9, 120, '3012000'),
(128, 9, 144, '3106900'),
(129, 9, 168, '3204700'),
(130, 9, 192, '3305700'),
(131, 9, 216, '3409800'),
(132, 9, 240, '3517200'),
(133, 9, 264, '3627900'),
(134, 9, 288, '3742200'),
(135, 9, 312, '3860100'),
(136, 9, 336, '3981600'),
(138, 9, 384, '4236400'),
(139, 9, 360, '4107000'),
(140, 10, 0, '2688500'),
(141, 10, 24, '2773200'),
(142, 10, 48, '2860500'),
(143, 10, 72, '2950600'),
(144, 10, 96, '3043600'),
(145, 10, 120, '3139400'),
(146, 10, 144, '3238300'),
(147, 10, 168, '3340300'),
(148, 10, 192, '3445500'),
(149, 10, 216, '3554000'),
(150, 10, 240, '3665900'),
(151, 10, 264, '3781400'),
(152, 10, 288, '3900500'),
(153, 10, 312, '4023300'),
(154, 10, 336, '4150100'),
(155, 10, 360, '4280800'),
(156, 10, 384, '4415600'),
(157, 11, 0, '2802300'),
(158, 11, 24, '2890500'),
(159, 11, 48, '2981500'),
(160, 11, 72, '3075500'),
(161, 11, 96, '3172300'),
(162, 11, 120, '3272200'),
(163, 11, 144, '3375300'),
(164, 11, 168, '3481600'),
(165, 11, 192, '3591200'),
(166, 11, 216, '3704300'),
(167, 11, 240, '3821000'),
(168, 11, 264, '3941400'),
(169, 11, 288, '4065500'),
(170, 11, 312, '4193500'),
(171, 11, 336, '4325600'),
(172, 11, 360, '4461800'),
(173, 11, 384, '4602400'),
(174, 12, 24, '3012800'),
(175, 12, 48, '3107700'),
(176, 12, 72, '3205500'),
(177, 12, 96, '3306500'),
(178, 12, 120, '3410600'),
(179, 12, 144, '3518100'),
(180, 12, 168, '3628900'),
(181, 12, 192, '3743100'),
(182, 12, 216, '3861000'),
(183, 12, 240, '3982600'),
(184, 12, 264, '4108100'),
(185, 12, 288, '4237500'),
(186, 12, 312, '4370900'),
(187, 12, 336, '4508600'),
(188, 12, 360, '4605600'),
(189, 12, 384, '4797000'),
(190, 12, 0, '2781800'),
(191, 13, 0, '3044300'),
(192, 13, 24, '3140200'),
(193, 13, 48, '3239100'),
(194, 13, 72, '3341100'),
(195, 13, 96, '3446400'),
(196, 13, 120, '3554900'),
(197, 13, 144, '3666900'),
(198, 13, 168, '3782400'),
(199, 13, 192, '3901500'),
(200, 13, 216, '4024400'),
(201, 13, 240, '4151100'),
(202, 13, 264, '4281800'),
(203, 13, 288, '4416700'),
(204, 13, 312, '4555800'),
(205, 13, 336, '4699300'),
(206, 13, 360, '4847300'),
(207, 13, 384, '5000000'),
(208, 14, 0, '3173100'),
(209, 14, 24, '3273100'),
(210, 14, 48, '3376100'),
(211, 14, 72, '3482500'),
(212, 14, 96, '3592100'),
(213, 14, 120, '3705300'),
(214, 14, 144, '3822000'),
(215, 14, 168, '3942400'),
(216, 14, 192, '4066500'),
(217, 14, 216, '4194600'),
(218, 14, 240, '4326700'),
(219, 14, 264, '4463000'),
(220, 14, 288, '4603500'),
(221, 14, 312, '4748500'),
(222, 14, 336, '4898100'),
(223, 14, 360, '5052300'),
(224, 14, 384, '5211500'),
(225, 15, 0, '3307300'),
(226, 15, 24, '3411500'),
(227, 15, 48, '3518900'),
(228, 15, 72, '3629800'),
(229, 15, 96, '3744100'),
(230, 15, 120, '3862000'),
(231, 15, 144, '3983600'),
(232, 15, 168, '4109100'),
(233, 15, 192, '4238500'),
(234, 15, 216, '4372000'),
(235, 15, 240, '4509700'),
(236, 15, 264, '4651800'),
(237, 15, 288, '4798300'),
(238, 15, 312, '4949400'),
(239, 15, 336, '5105300'),
(240, 15, 360, '5266100'),
(241, 15, 384, '5431900'),
(242, 16, 0, '3447200'),
(243, 16, 24, '3555800'),
(244, 16, 48, '3667800'),
(245, 16, 72, '3783300'),
(246, 16, 96, '3902500'),
(247, 16, 120, '4025400'),
(248, 16, 144, '4152200'),
(249, 16, 168, '4282900'),
(250, 16, 192, '4417800'),
(251, 16, 216, '4557000'),
(252, 17, 0, '3593100'),
(253, 17, 24, '3706200'),
(254, 16, 240, '4700500'),
(255, 16, 264, '4848500'),
(256, 17, 48, '3822900'),
(257, 16, 288, '5001200'),
(258, 16, 312, '5158700'),
(259, 16, 336, '5321200'),
(260, 16, 360, '5488800'),
(261, 16, 384, '5661700'),
(262, 17, 72, '3943300'),
(263, 17, 96, '4067500'),
(264, 17, 120, '4195700'),
(265, 17, 144, '4327800'),
(266, 17, 168, '4464100'),
(267, 17, 192, '4604700'),
(268, 17, 216, '4749700'),
(269, 17, 240, '4899300'),
(270, 17, 264, '5053600'),
(271, 17, 288, '5212800'),
(272, 17, 312, '5377000'),
(273, 17, 336, '5546300'),
(274, 17, 360, '5721000'),
(275, 17, 384, '5901200');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `gelar_depan` varchar(20) NOT NULL,
  `gelar_belakang` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nip_lama` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `id_kabupaten_lahir` int(11) NOT NULL,
  `tanggal_lahir` varchar(10) NOT NULL,
  `jenkel` varchar(2) NOT NULL,
  `usia` varchar(5) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `id_agama` varchar(4) NOT NULL,
  `status_kawin` enum('Belum Kawin','Kawin','Janda','Duda') NOT NULL,
  `alamat_jalan` text NOT NULL,
  `alamat_kelurahan` varchar(100) NOT NULL,
  `alamat_kecamatan` varchar(100) NOT NULL,
  `alamat_id_kabupaten` varchar(10) NOT NULL,
  `alamat_id_propinsi` varchar(3) NOT NULL,
  `tinggi_badan` varchar(5) NOT NULL,
  `berat_badan` varchar(5) NOT NULL,
  `rambut` tinytext NOT NULL,
  `bentuk_muka` tinytext NOT NULL,
  `warna_kulit` tinytext NOT NULL,
  `ciri_khas` text NOT NULL,
  `cacat_tubuh` text NOT NULL,
  `kegemaran` text NOT NULL,
  `tmtkgb` date NOT NULL,
  `tmtkgbyad` varchar(100) NOT NULL,
  `mkgolt` varchar(11) NOT NULL,
  `gaji_pokok` varchar(30) NOT NULL,
  `tmtberlaku` date NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `id_golongan_ruang` varchar(4) NOT NULL,
  `tmtcapeg` date NOT NULL,
  `tmtpns` date NOT NULL,
  `cabtaspen` varchar(100) NOT NULL,
  `id_satker` int(11) NOT NULL,
  `id_skpd` int(11) NOT NULL,
  `id_stapeg` varchar(11) NOT NULL,
  `tmtstop` varchar(100) NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `plt` enum('N','Y') NOT NULL,
  `id_fungsi` varchar(20) NOT NULL,
  `id_guru` varchar(20) NOT NULL,
  `foto` text NOT NULL,
  `pin` varchar(10) NOT NULL,
  `status_pegawai` enum('pegawai','pindah','pensiun','meninggal','berhenti') NOT NULL,
  `status_pegawai_kerja` enum('pns','cpns','honor') NOT NULL,
  `jabatan_honor` varchar(200) NOT NULL,
  `jabatan_cpns` varchar(200) NOT NULL,
  `status_aktif` enum('aktif','cuti') NOT NULL,
  `status_verifikasi` enum('verified','unverified') NOT NULL,
  `status_hk` enum('Y','N') NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `ttd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nik`, `nama_pegawai`, `gelar_depan`, `gelar_belakang`, `nip`, `nip_lama`, `tempat_lahir`, `id_kabupaten_lahir`, `tanggal_lahir`, `jenkel`, `usia`, `npwp`, `id_agama`, `status_kawin`, `alamat_jalan`, `alamat_kelurahan`, `alamat_kecamatan`, `alamat_id_kabupaten`, `alamat_id_propinsi`, `tinggi_badan`, `berat_badan`, `rambut`, `bentuk_muka`, `warna_kulit`, `ciri_khas`, `cacat_tubuh`, `kegemaran`, `tmtkgb`, `tmtkgbyad`, `mkgolt`, `gaji_pokok`, `tmtberlaku`, `id_pangkat`, `id_golongan_ruang`, `tmtcapeg`, `tmtpns`, `cabtaspen`, `id_satker`, `id_skpd`, `id_stapeg`, `tmtstop`, `id_eselon`, `id_jabatan`, `plt`, `id_fungsi`, `id_guru`, `foto`, `pin`, `status_pegawai`, `status_pegawai_kerja`, `jabatan_honor`, `jabatan_cpns`, `status_aktif`, `status_verifikasi`, `status_hk`, `no_hp`, `ttd`) VALUES
(1, '1223015004730002', 'SUSI ASMARANI', 'Dra', 'M.Si', '197304101994022003', '010250712', 'Citaman jernih', 404, '1974-10-01', 'W', '', '26.620.302.5-116.000', '1', 'Kawin', 'Lintas sumatera', 'Desa Damuli pekan', 'Kualuh selatan', '404', '34', '160', '32', '', '70', '', '', '', 'Menyanyi', '2019-10-01', '2021-10-01', '252', '', '0000-00-00', 15, '', '1994-02-01', '1995-09-01', '', 0, 1, '', '', 0, 1, 'N', '', '', '7493susi0002.jpg', '32', 'pegawai', 'pns', '', '', 'aktif', 'verified', '', '082166419456', ''),
(2, '1223016810800006', 'DEWI EVAWANI', '', 'SP', '198010282010012022', '', 'SUGARANG BAYU', 413, '2020-10-08', 'W', '', '', '1', 'Kawin', 'PURI SYAFIRA DAMULI BLOK D NO.3', 'DAMULI PEKAN', 'Kualuh selatan', '413', '34', '160', '60', '', 'Oval', '', '', '', 'Musik', '2020-01-01', '2022-01-01', '117', '', '0000-00-00', 12, '', '2010-01-01', '2011-05-01', '', 0, 12, '', '', 0, 12, 'N', '', '', '3293susi0002.jpg', '', 'pegawai', 'pns', '', '', 'aktif', 'verified', '', '081361769374', ''),
(3, '666', 'nkmsdklfnmlk', 'kkasdf', 'klnklnlk', '86789', '89', 'Kota Medan', 3, '2020-10-01', 'P', '', '32', '1', 'Belum Kawin', 'sdfgdfsg', 'gsdfgsdf', 'medan deli', '43', '34', '160', 'Oval', '', 'bulat kepetakan', '', '', '', 'sdfgds', '2020-10-20', '2020-10-28', '134', '', '0000-00-00', 3, '', '2020-10-15', '2020-10-07', '', 0, 12, '', '', 0, 12, 'N', '', '', '83bu susi.jpg', '', 'pegawai', 'pns', '', '', 'aktif', 'verified', 'Y', '435', ''),
(4, '7', 'bj', 'jhhk', 'b', '7', '7', 'asdf', 1, '2020-10-14', 'P', '', '', '2', 'Belum Kawin', 'sadf', 'asdfsd', 'sda', '1', '2', '2', 'Oval', '', 'bulat kepetakan', '', '', '', 'sd', '2020-10-28', '2020-10-21', '3223', '', '0000-00-00', 4, '', '2020-10-13', '2020-10-21', '', 0, 8, '', '', 0, 8, 'N', '', '', '59about.jpg', '', 'pegawai', 'pns', '', '', 'aktif', 'verified', 'Y', '23', ''),
(6, '1223080201670001', 'KHAIRUL SALEH', 'H', 'MM', '196701021988111001', '', '', 0, '', 'P', '', '', '', 'Kawin', 'Karang Sari', '', 'Kualuh Selatan', '219', '', '163', '68', 'Lurus', 'Bulat', '', '', '', 'Menulis', '2019-11-01', '2021-11-01', '', '', '0000-00-00', 15, '', '0000-00-00', '0000-00-00', '', 0, 4, '', '', 0, 4, 'N', '', '', '6720190510_181721.jpg', '', 'pegawai', 'pns', '', 'verified', 'aktif', '', 'Y', '085359184233', '');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_anak`
--

CREATE TABLE `pegawai_anak` (
  `id_pegawai_anak` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenkel` enum('P','W') NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pekerjaan` tinytext NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_berhenti`
--

CREATE TABLE `pegawai_berhenti` (
  `id_pegawai_berhenti` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `keterangan_berhenti` text NOT NULL,
  `berkas` text NOT NULL,
  `tanggal_berhenti` varchar(10) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL,
  `nik` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_berkas`
--

CREATE TABLE `pegawai_berkas` (
  `id_pegawai_berkas` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `file` text NOT NULL,
  `nik` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai_berkas`
--

INSERT INTO `pegawai_berkas` (`id_pegawai_berkas`, `id_pegawai`, `nama`, `file`, `nik`) VALUES
(37, 6, 'AKTA ANAK', '23akta anak.pdf', '1223080201670001'),
(38, 6, 'KARPEG', '48KARPEG.jpg', '1223080201670001'),
(39, 6, 'KENAIKAN GAJI BERKALA', '51KENAIKAN GAJI BERKALA.jpg', '1223080201670001'),
(40, 6, 'KARTU KELUARGA', '4KK.jpg', '1223080201670001'),
(41, 6, 'KONVERSI NIP', '94KONVERSI NIP.jpg', '1223080201670001'),
(42, 6, 'KTP', '63KTP.jpg', '1223080201670001'),
(43, 6, 'SK PELANTIKAN KADIS', '54SK PELANTIKAN KADIS.pdf', '1223080201670001'),
(44, 6, 'SKP TH 2017', '48SKP TH 2017.pdf', '1223080201670001'),
(45, 6, 'Surat Izin Cuti', '66KHAIRUL SALEH.pdf', '1223080201670001');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_golongan`
--

CREATE TABLE `pegawai_golongan` (
  `id_pegawai_golongan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `pangkat` varchar(100) NOT NULL,
  `golongan` varchar(100) NOT NULL,
  `berlaku_tmt` date NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `pejabat_keputusan` varchar(100) NOT NULL,
  `nomor_keputusan` varchar(50) NOT NULL,
  `tanggal_keputusan` date NOT NULL,
  `keterangan` text NOT NULL,
  `file` text NOT NULL,
  `masa` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL COMMENT 'PNS, CPNS',
  `nik` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_keterangan`
--

CREATE TABLE `pegawai_keterangan` (
  `id_pegawai_keterangan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `pejabat_keterangan` varchar(100) NOT NULL,
  `nomor_keterangan` varchar(100) NOT NULL,
  `tanggal_keterangan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai_keterangan`
--

INSERT INTO `pegawai_keterangan` (`id_pegawai_keterangan`, `id_pegawai`, `nik`, `nama`, `pejabat_keterangan`, `nomor_keterangan`, `tanggal_keterangan`) VALUES
(2, 1, '', 'sdfdfg', 'sdafdfgsdfg', 'sdfdfg', '2020-06-06'),
(4, 717, '', 'Erman Sibarani', 'sdaf', 'sdfsd', '2020-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_kgb`
--

CREATE TABLE `pegawai_kgb` (
  `id_pegawai_kgb` int(11) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nomor_sk` varchar(50) NOT NULL,
  `sifat` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `alasan` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `file` text NOT NULL,
  `gaji_lama` varchar(20) NOT NULL,
  `gaji_baru` varchar(20) NOT NULL,
  `kantor_tempat_kerja` text NOT NULL,
  `masa_kerja` varchar(2) NOT NULL,
  `masa_kerja_teks` varchar(100) NOT NULL,
  `tanggal_berlaku` varchar(10) NOT NULL,
  `tanggal_berlaku_berikutnya` varchar(10) NOT NULL,
  `tanggal_terbit_surat` varchar(10) NOT NULL,
  `nama_penanda_tangan` varchar(100) NOT NULL,
  `pangkat_penanda_tangan` varchar(100) NOT NULL,
  `nip_penanda_tangan` varchar(50) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL,
  `tanggal_sebelum` varchar(10) NOT NULL,
  `tanggal_berlaku_sebelum` varchar(10) NOT NULL,
  `nomor_sebelum` varchar(100) NOT NULL,
  `masa_kerja_sebelum` varchar(100) NOT NULL,
  `masa_kerja_sekarang` varchar(100) NOT NULL,
  `baca` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_kpb`
--

CREATE TABLE `pegawai_kpb` (
  `id_pegawai_kpb` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_pangkat_lama` varchar(3) NOT NULL,
  `tmt_lama` varchar(10) NOT NULL,
  `id_pangkat_baru` varchar(3) NOT NULL,
  `tmt_baru` varchar(10) NOT NULL,
  `nomor_keputusan` varchar(500) NOT NULL,
  `tanggal_keputusan` varchar(10) NOT NULL,
  `pejabat_keputusan` varchar(100) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_kursus`
--

CREATE TABLE `pegawai_kursus` (
  `id_pegawai_kursus` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_kursus` varchar(200) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `ijazah` varchar(500) NOT NULL,
  `file_ijazah` tinytext NOT NULL,
  `tempat` varchar(500) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_meninggal`
--

CREATE TABLE `pegawai_meninggal` (
  `id_pegawai_meninggal` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `keterangan_meninggal` text NOT NULL,
  `tanggal_meninggal` varchar(10) NOT NULL,
  `berkas` text NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL,
  `id_skpd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_mertua`
--

CREATE TABLE `pegawai_mertua` (
  `id_pegawai_mertua` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nik_mertua` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` enum('Ibu','Ayah') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tempat_lahir` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_orangtua`
--

CREATE TABLE `pegawai_orangtua` (
  `id_pegawai_orangtua` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nik_orangtua` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status` enum('Ibu','Ayah') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tempat_lahir` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_organisasi`
--

CREATE TABLE `pegawai_organisasi` (
  `id_pegawai_organisasi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kedudukan` varchar(100) NOT NULL,
  `tahun_awal` varchar(10) NOT NULL,
  `tahun_akhir` varchar(10) NOT NULL,
  `waktu` enum('SLTA','Perguruan','Pegawai') NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `pemimpin` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pangkat`
--

CREATE TABLE `pegawai_pangkat` (
  `id_pegawai_pangkat` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `sekarang` enum('N','Y') NOT NULL,
  `golongan` varchar(50) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `pejabat_keputusan` varchar(100) NOT NULL,
  `tanggal_keputusan` date NOT NULL,
  `file_sttb` text NOT NULL,
  `no_keputusan` varchar(60) NOT NULL,
  `nama_jabatan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai_pangkat`
--

INSERT INTO `pegawai_pangkat` (`id_pegawai_pangkat`, `id_pegawai`, `nik`, `id_pangkat`, `tanggal_mulai`, `tanggal_akhir`, `sekarang`, `golongan`, `gaji_pokok`, `pejabat_keputusan`, `tanggal_keputusan`, `file_sttb`, `no_keputusan`, `nama_jabatan`) VALUES
(1, 0, '', 15, '1995-09-01', '0000-00-00', 'Y', '252', 4651800, '', '0000-00-00', '', '', ''),
(2, 0, '', 12, '2011-05-01', '0000-00-00', 'Y', '117', 3410600, '', '0000-00-00', '', '', ''),
(3, 3, '', 3, '2020-10-07', '0000-00-00', 'Y', '134', 2074600, '', '0000-00-00', '', '', ''),
(4, 4, '', 4, '2020-10-21', '0000-00-00', 'Y', '3223', 0, '', '0000-00-00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pendidikan`
--

CREATE TABLE `pegawai_pendidikan` (
  `id_pegawai_pendidikan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_tingkat_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `sttb` varchar(200) NOT NULL,
  `file_sttb` tinytext NOT NULL,
  `tempat` varchar(300) NOT NULL,
  `nama_kepala` varchar(100) NOT NULL,
  `tahun` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai_pendidikan`
--

INSERT INTO `pegawai_pendidikan` (`id_pegawai_pendidikan`, `id_pegawai`, `nik`, `id_tingkat_pendidikan`, `nama_pendidikan`, `jurusan`, `sttb`, `file_sttb`, `tempat`, `nama_kepala`, `tahun`) VALUES
(1, 0, '', 2, 'sdaf', 'POLITIK PEMERINTAHAN', 'sdaf', 'MQ==93PERBAIKAN FKG USU.pdf', 'dfwsafd', 'asdf', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pengalaman`
--

CREATE TABLE `pegawai_pengalaman` (
  `id_pegawai_pengalaman` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_negara` varchar(100) NOT NULL,
  `tujuan_kunjungan` text NOT NULL,
  `lamanya` varchar(10) NOT NULL,
  `sponsor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_penghargaan`
--

CREATE TABLE `pegawai_penghargaan` (
  `id_pegawai_penghargaan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_penghargaan` varchar(500) NOT NULL,
  `tahun_perolehan` varchar(10) NOT NULL,
  `nama_negara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pensiun`
--

CREATE TABLE `pegawai_pensiun` (
  `id_pegawai_pensiun` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `keterangan_pensiun` text NOT NULL,
  `berkas` text NOT NULL,
  `tanggal_pensiun` varchar(10) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL,
  `id_usulan` varchar(11) NOT NULL,
  `konfirmasi` enum('Y','T','N','V','S','TU') NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pindah_instansi`
--

CREATE TABLE `pegawai_pindah_instansi` (
  `id_pegawai_pindah_instansi` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `instansi_baru` varchar(200) NOT NULL,
  `alasan_pindah` text NOT NULL,
  `tanggal_pindah` varchar(10) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL,
  `berkas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_pindah_skpd`
--

CREATE TABLE `pegawai_pindah_skpd` (
  `id_pegawai_pindah_skpd` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `id_skpd_lama` varchar(5) NOT NULL,
  `id_skpd_baru` varchar(5) NOT NULL,
  `id_jabatan_lama` varchar(5) NOT NULL,
  `plt_lama` enum('N','Y') NOT NULL,
  `id_jabatan_baru` varchar(5) NOT NULL,
  `plt_baru` enum('N','Y') NOT NULL,
  `alasan_pindah` text NOT NULL,
  `berkas` text NOT NULL,
  `tanggal_pindah` varchar(10) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_saudara`
--

CREATE TABLE `pegawai_saudara` (
  `id_pegawai_saudara` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenkel` enum('P','W') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tempat_lahir` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_suami`
--

CREATE TABLE `pegawai_suami` (
  `id_pegawai_suami` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` enum('suami','istri') NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tanggal_menikah` date NOT NULL,
  `pekerjaan` varchar(200) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `satker`
--

CREATE TABLE `satker` (
  `id_satker` varchar(20) NOT NULL,
  `nama_satker` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `judul_website` tinytext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `nama_penanda_tangan` text NOT NULL,
  `pangkat_penanda_tangan` text NOT NULL,
  `nip_penanda_tangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `judul_website`, `icon`, `nama_penanda_tangan`, `pangkat_penanda_tangan`, `nip_penanda_tangan`) VALUES
(1, 'Sistem Informasi Kepegawaian Online (SIGAOL)', 'icon.png', 'Imam', 'Jendral', '1234567890'),
(2, 'E-Performance System', 'icon.png', '', '', ''),
(3, 'Sistem Informasi Kehadiran', 'icon.png', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `setting_eperformance`
--

CREATE TABLE `setting_eperformance` (
  `id_setting` int(11) NOT NULL,
  `nilai_tetap` double NOT NULL,
  `persen_prestasi_kerja` double NOT NULL,
  `persen_penilaian_kinerja` double NOT NULL,
  `persen_capaian_skp` double NOT NULL,
  `persen_perilaku_kerja` double NOT NULL,
  `persen_tugas_tambahan` int(11) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `persen_plt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_eperformance`
--

INSERT INTO `setting_eperformance` (`id_setting`, `nilai_tetap`, `persen_prestasi_kerja`, `persen_penilaian_kinerja`, `persen_capaian_skp`, `persen_perilaku_kerja`, `persen_tugas_tambahan`, `jam_masuk`, `jam_keluar`, `persen_plt`) VALUES
(1, 500000, 30, 70, 60, 30, 10, '07:30:00', '00:00:00', 80);

-- --------------------------------------------------------

--
-- Table structure for table `simpeople`
--

CREATE TABLE `simpeople` (
  `people_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `status_id` varchar(100) NOT NULL,
  `join_date` date NOT NULL,
  `active_status` varchar(5) DEFAULT NULL,
  `end_date` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `komitment` float DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `cabang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `simpeople`
--

INSERT INTO `simpeople` (`people_id`, `name`, `telepon`, `address`, `status_id`, `join_date`, `active_status`, `end_date`, `email`, `komitment`, `username`, `password`, `cabang`) VALUES
(1, 'Asep Komarudin', '082121232730', 'Jl. Flamboyan No. 44 Srengseng Kembangan Jakarta Barat', 'Karyawan', '2017-04-04', 'on', NULL, 'aasseepp@gmail.com', 50000, 'asep', '*A4B6157319038724E3560894F7F932C8886EBFCF', 2),
(2, 'Arga', '1234', 'binus', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(3, 'Muhammad Ikhsan', '1234', 'DM', 'Pelajar', '2014-04-01', 'on', NULL, 'dumy@test.com', 100000, NULL, NULL, NULL),
(4, 'Dedy Suginato', '1234', 'DM', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(5, 'Asep Rusmana', '1234', 'jakarta', 'Pelajar', '2017-04-02', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(6, 'Nanang', '123', 'nihil', 'Pelajar', '2017-04-02', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(7, 'Muhammad Karno Utomo', '123', 'Srengseng', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(8, 'Yustian', '123', 'Jl. Flamboyan No. 59 Srengseng Kembangan Jakarta Barat', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 100000, NULL, NULL, NULL),
(9, 'Hersa', '123', 'DM', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(10, 'Dedy Sudrajat', '123', 'Al-ansor', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(11, 'Muhammad Farid', '13213', 'Dm', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(12, 'Santoso', '1234', 'Kontrakan Pak Roto', 'Pelajar', '2014-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(13, 'Faisal', '1234', 'DM', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(14, 'Edy Mohtar', '1234', 'DEkat Musola Ataawun', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 15000, NULL, NULL, NULL),
(15, 'Tarno', '1234', 'Kontrakan Pak RT', 'Pelajar', '2014-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(16, 'Sudarmono', '1234', 'Kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(17, 'Hamdani', '1234', 'Kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(18, 'Syarif', '1234', 'Kosong', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(19, 'Hudan', '1234', 'Kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 30000, NULL, NULL, NULL),
(20, 'Ayubi', '1234', 'Kembangan', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(21, 'Alvin STY', '1234', 'Dekat mesjid Al-Huda', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 50000, 'alvin', '*FBFD34E4561C6E9863547D3521D7A090554E00E6', NULL),
(22, 'Rizki', '1234', 'Nissan', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(23, 'Huda', '1234', 'Kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(24, 'Wahyu UBL', '1234', 'Kosong (UBL)', 'HU', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(25, 'Adiat', '1234', 'Kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(26, 'Kurdiono', '1234', 'Kontrakan Bu Roto', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(27, 'Ade', '1234', 'Masih Koasong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 50000, 'ase', '*246788DFD1F79D9635A58F8121B32F00A8A0D065', 2),
(28, 'Alfin Bin Nur', '1234', 'DM', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(29, 'Umar DM', '1234', 'DM', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(30, 'Slamet Tri Waluyo', '1234', 'Belakang Ust. Sofar', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(31, 'Wahyu Andri Irawan', '1234', 'Belakang UST. Sofar', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(32, 'Maman', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(33, 'Agung Sunaryadi', '1234', 'Belakang DM', 'Pelajar', '2015-04-01', 'off', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(34, 'Hafidz', '1234', 'Dekat Mesjid ', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(35, 'Nino', '1234', 'Dekat Mesjid Almutaakhirin', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(36, 'Adi Santoso', '1234', 'Dekat Mesjid At-taawun', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 100000, NULL, NULL, NULL),
(37, 'Rully Van Hod Nababn', '1234', 'DM', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(38, 'Hery Siswanto', '1234', 'DM', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 40000, NULL, NULL, NULL),
(39, 'Arif Nissan', '1234', 'Ciledug', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(40, 'Sadam Mubarok', '1234', 'Palmerah', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(41, 'Husen', '123', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 40000, NULL, NULL, NULL),
(42, 'Ajang Setiawan', '1234', 'Jalan Tolo', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 50000, 'ajang', '*A4B6157319038724E3560894F7F932C8886EBFCF', 2),
(43, 'mas Ahmad', '1234', 'kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(44, 'Mas Tarjo', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(45, 'pak Ade Rohana', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(46, 'H. Iskandar', '1234', 'jl. Srengseng', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(47, 'H. Muhyidin', '1234', 'Tanggerang', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(48, 'Muhaimin', '1234', 'kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(49, 'Surya', '1234', 'kosong', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(50, 'Pak Asep', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(52, 'Pak Pri', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(53, 'Deni', '1234', 'Kontrakan Pak RT', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(54, 'Hendra DM', '1234', 'DM', 'Pelajar', '2016-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(55, 'Awaludin', '1234', 'DM', 'Pelajar', '2015-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(56, 'Ahmad', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(57, 'Ardianto', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(58, 'Ahmad Yani', '1234', 'kosong', 'Pelajar', '2017-04-07', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(59, 'Muslim', '1234', 'kosong', 'Karyawan', '2011-04-01', 'on', NULL, 'dumy@test.com', 100000, 'muslim', '*A4B6157319038724E3560894F7F932C8886EBFCF', NULL),
(60, 'Harits', '1234', 'kosong', 'Karyawan', '2010-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(61, 'Sulaiman', '1234', 'kembangan', 'Karyawan', '2010-04-01', 'on', NULL, 'dumy@test.com', 75000, 'sulaiman', '*2FADBE3B28E3DF0BE9AAC4D06472A4F12C6BC342', NULL),
(62, 'Rahmadi', '1234', 'jakarta Timur', 'Karyawan', '2012-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(63, 'Suryadi', '1234', 'palmerah', 'Karyawan', '2011-04-01', 'on', NULL, 'dumy@test.com', 200000, NULL, NULL, NULL),
(64, 'Rustandi', '1234', 'kosong', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(65, 'Sumarna', '1234', 'kosong', 'Karyawan', '2012-04-02', 'on', NULL, 'dumy@test.com', 30000, NULL, NULL, NULL),
(66, 'Gunawan', '1234', 'kosong', 'Karyawan', '2010-04-01', 'on', NULL, 'dumy@test.com', 125000, 'gunawan', '*A4B6157319038724E3560894F7F932C8886EBFCF', 2),
(67, 'Nurjaman', '1234', 'kosong', 'Karyawan', '2012-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(68, 'Parno', '123', 'kosong', 'Karyawan', '2014-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(69, 'Supriono', '1234', 'kosong', 'Karyawan', '2011-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(70, 'Imam', '1234', 'kosong', 'Karyawan', '2010-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(71, 'Firman', '1234', 'seskoal', 'Karyawan', '2009-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(72, 'Fatur Rohman', '1234', 'kosong', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 90000, NULL, NULL, NULL),
(73, 'KH. Sofar Mawardi', '1234', 'Srengseng Kembangan', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 100000, NULL, NULL, NULL),
(74, 'Musoffa', '1234', 'Kontakan Ibu ZRoto', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 40000, NULL, NULL, NULL),
(75, 'Muhammad Nazib', '1234', 'DM', 'Karyawan', '2014-04-01', 'on', NULL, 'dumy@test.com', 40000, NULL, NULL, NULL),
(76, 'Partono', '1234', 'Belakang DM', 'Karyawan', '2017-04-07', 'on', NULL, 'dumy@test.com', 40000, NULL, NULL, NULL),
(77, 'Rohmat', '1234', 'srengseng kembangan', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 50000, NULL, NULL, NULL),
(78, 'Untung', '1234', 'Dekang rumah Ustad Soffar', 'Karyawan', '2013-04-01', 'on', NULL, 'dumy@test.com', 30000, NULL, NULL, NULL),
(79, 'Mahmudin', '1234', 'Kembangan', 'Karyawan', '2010-04-01', 'on', NULL, 'dumy@test.com', 0, NULL, NULL, NULL),
(80, 'Didik Dm', '1234', 'DM', 'HU', '2016-04-01', 'on', NULL, 'test@gmail.com', 0, NULL, NULL, NULL),
(81, 'Tolhah Ubayidilah', '1234', 'DM', 'HU', '2016-04-01', 'on', NULL, 'test@gmail.com', 0, NULL, NULL, NULL),
(82, 'Alif DM', '1234', 'dekat mesjid aluswah', 'HU', '2016-04-01', 'off', NULL, 'test@gmail.com', 0, 'alif', '*A4B6157319038724E3560894F7F932C8886EBFCF', 2),
(83, 'Unu', '1234', 'bogor', 'Pelajar', '2016-01-01', '1', NULL, 'test@gmail.com', 50000, NULL, NULL, NULL),
(84, 'Firman Nissan', '1234', 'nissan daanmogot', 'Kontakan', '1900-01-01', 'off', NULL, 'test@gmail.com', 0, NULL, NULL, NULL),
(85, 'Rudi Hidayat', '085697513898', 'cengkareng', 'Pelajar', '2016-01-05', '1', NULL, 'test@gmail.com', 100000, NULL, NULL, NULL),
(87, 'Dede Iskandar', '121313', 'DM', 'Pelajar', '2016-05-03', 'off', NULL, 'qweqe', 0, NULL, NULL, NULL),
(88, 'Eko DM', '1234', 'DM', 'HU', '2016-06-01', 'off', NULL, 'test@gmail.com', 0, 'eko', '*A4B6157319038724E3560894F7F932C8886EBFCF', NULL),
(89, 'Zaki', '1234', 'Samping Attaawun', 'HU', '2016-06-01', 'off', NULL, 'test@gmail.com', 0, 'zaki', '*A4B6157319038724E3560894F7F932C8886EBFCF', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `simposisi`
--

CREATE TABLE `simposisi` (
  `posisi_id` int(11) NOT NULL,
  `kode_posisi` varchar(50) NOT NULL,
  `nama_posisi` varchar(200) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `parent_path` varchar(200) DEFAULT NULL,
  `cabang_id` int(11) NOT NULL,
  `active_status` int(11) DEFAULT '1',
  `people_id` int(11) DEFAULT '0',
  `pembinaan` int(11) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `jam` varchar(10) DEFAULT NULL,
  `kitab` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simposisi`
--

INSERT INTO `simposisi` (`posisi_id`, `kode_posisi`, `nama_posisi`, `parent`, `parent_path`, `cabang_id`, `active_status`, `people_id`, `pembinaan`, `hari`, `jam`, `kitab`) VALUES
(1, 'KBJ-MGR', 'Manager', 0, '', 2, 1, 61, 0, '', '', ''),
(3, 'KBJ-AMN-1', 'Asmen', 1, '1', 2, 1, 59, 0, '', '', ''),
(5, 'KBJ-AMN-2', 'Asmen', 1, '1', 2, 1, 66, 0, '', '', ''),
(6, 'KBJ-MSF-1', 'Pengajar', 3, '1,3', 2, 1, 66, 1, 'Ahad', '07:00', 'Mafahim'),
(7, 'KBJ-MSF-2', 'Pengajar', 3, '1,3', 2, 1, 1, 1, 'Ahad', '05:00', 'Materi Dasar Islam'),
(8, 'KBJ-MSF-3', 'Pengajar', 5, '1,5', 2, 1, 73, 1, 'Selasa', '18:00', 'Mapahim'),
(9, 'KBJ-MSF-4', 'Pengajar', 5, '1,5', 2, 1, NULL, NULL, NULL, NULL, NULL),
(10, 'KBJ-PLJ-1', 'Pelajar', 6, '1,3,6', 2, 1, 33, 0, '', '', ''),
(11, 'KBJ-MAL', 'Maliah', 1, '1', 2, 1, 1, 0, '', '', ''),
(13, 'PE-01', 'Pelajar', 6, '1,3,6', 2, 1, 36, 0, '', '', ''),
(14, 'PE-02', 'Pelajar', 7, '1,3,7', 2, 1, 82, 0, '', '', ''),
(15, 'KBJ-PE-003', 'Pengajar', 3, '1,3', 2, 1, 21, 1, 'Sabtu', '16:00', 'Nizomul Islam'),
(16, 'KBJ-PEL-004', 'Pelajar', 15, '1,3,15', 2, 1, 39, 0, '', '', ''),
(17, 'KBJ-PEN-0003', 'Pengajar', 3, '1,3', 2, 1, 1, 1, 'Ahad', '07:00', 'Materi Dasar Islam'),
(18, 'KBJ-PEL-0004', 'Pelajar', 7, '1,3,7', 2, 1, 80, 0, '', '', ''),
(19, 'KBJ-PLJ-0012', 'Pelajar', 7, '1,3,7', 2, 1, 87, 0, '', '', ''),
(20, 'KBJ-PLJ-0005', 'Pelajar', 7, '1,3,7', 2, 1, 81, 0, '', '', ''),
(21, 'KBJ-DRS-0001', 'Pelajar', 8, '1,5,8', 2, 1, 47, 0, '', '', ''),
(22, 'KBJ-DRS-0002', 'Pelajar', 8, '1,5,8', 2, 1, 46, 0, '', '', ''),
(23, 'PE_KBJ_001', 'pelajar', 17, '1,3,17', 2, 1, 33, 0, '', '', ''),
(24, 'KBJ_PEL', 'Pelajar', 7, '1,3,7', 2, 1, 89, 0, '', '', ''),
(25, 'KBJ_PEL_01', 'Pelajar', 7, '1,3,7', 2, 1, 88, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `skp`
--

CREATE TABLE `skp` (
  `id_skp` int(11) NOT NULL,
  `id_pejabat_atasan_penilaian` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal` text NOT NULL,
  `nilai_skp` double NOT NULL,
  `orientasi_pelayanan` double NOT NULL,
  `integritas` double NOT NULL,
  `komitmen` double NOT NULL,
  `disiplin` double NOT NULL,
  `kerjasama` double NOT NULL,
  `kepemimpinan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skp`
--

INSERT INTO `skp` (`id_skp`, `id_pejabat_atasan_penilaian`, `id_pegawai`, `tanggal`, `nilai_skp`, `orientasi_pelayanan`, `integritas`, `komitmen`, `disiplin`, `kerjasama`, `kepemimpinan`) VALUES
(1, 7680, 1, '2020-05-18', 33, 333, 33, 333, 33, 33, 33),
(2, 2, 716, '2020-07-11', 125565, 66666666, 0, 0, 1, 1, 0),
(3, 2, 2, '2020-07-15', 22, 2222, 22, 2, 2, 2, 2),
(4, 2, 2, '2020-07-15', 78, 878, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `skpd`
--

CREATE TABLE `skpd` (
  `id_skpd` int(11) NOT NULL,
  `nama_skpd` varchar(200) NOT NULL,
  `id_atasan` int(11) NOT NULL,
  `id_eselon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skpd`
--

INSERT INTO `skpd` (`id_skpd`, `nama_skpd`, `id_atasan`, `id_eselon`) VALUES
(1, 'Badan Kepegawaian Daerah', 0, 4),
(2, 'Sekretariat', 1, 5),
(3, 'Sub Bagian Umum', 2, 7),
(4, 'Sub Bagian Program dan Keuangan', 2, 7),
(5, 'Bidang Mutasi, Pengadaan dan Pengembangan Karir', 1, 6),
(6, 'Sub Bidang Mutasi', 5, 7),
(7, 'Sub Bidang Pengadaan dan Pemberhentian', 5, 7),
(8, 'Bidang Pengembangan Sumber Daya Manusia dan Pensiun', 1, 6),
(9, 'Sub Bidang Pengembangan Kariri dan Fasilitasi Profesi ASN', 5, 7),
(10, 'Sub Bidang Penilaian Kinerja Aparatur dan Informasi', 8, 7),
(11, 'Sub Bidang Pengembangan Aparatur', 8, 7),
(12, 'Sub Bidang Pensiun dan Penghargaan', 8, 7),
(14, 'Dinas Komunikasi dan Informatika', 0, 4),
(15, 'Sekretariat', 14, 5),
(16, 'Bidang Komunikasi dan Informasi Publik', 14, 6),
(17, 'Bidang Teknologi Informasi', 14, 6),
(18, 'Bidang Statistika, Persandian dan Telematika', 14, 6),
(19, 'Seksi Pengembangan Perangkat Lunak dan Aplikasi Informatika', 17, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pensiun`
--

CREATE TABLE `tbl_pensiun` (
  `id_pensiun` int(11) NOT NULL,
  `no_sk` varchar(200) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `nama_atasan` varchar(200) NOT NULL,
  `berkas` text NOT NULL,
  `id_usulan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pensiun`
--

INSERT INTO `tbl_pensiun` (`id_pensiun`, `no_sk`, `tanggal`, `nama_atasan`, `berkas`, `id_usulan`) VALUES
(1, '123', '03/09/2020', 'asdfs', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tingkat_pendidikan`
--

CREATE TABLE `tingkat_pendidikan` (
  `id_tingkat_pendidikan` int(11) NOT NULL,
  `nama_tingkat_pendidikan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tingkat_pendidikan`
--

INSERT INTO `tingkat_pendidikan` (`id_tingkat_pendidikan`, `nama_tingkat_pendidikan`) VALUES
(1, 'SD'),
(2, 'SMP'),
(3, 'S.L.T.A'),
(4, 'D-I'),
(5, 'D-II'),
(6, 'D-III / AKADEMI'),
(7, 'D-IV'),
(8, 'S.1'),
(9, 'S.2'),
(10, 'S.3'),
(11, 'Spesialis I'),
(12, 'Spesialis II'),
(13, 'Profesi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level_1` varchar(50) NOT NULL,
  `level_2` varchar(50) NOT NULL,
  `level_3` varchar(50) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `waktu_login` datetime DEFAULT NULL,
  `login_android` enum('N','Y') NOT NULL,
  `ttd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `level_1`, `level_2`, `level_3`, `status`, `id_pegawai`, `waktu_login`, `login_android`, `ttd`) VALUES
('', '25f9e794323b453885f5181f1b624d0b', '', 'pegawai', 'pegawai', 'Y', 0, '2020-03-31 12:32:07', 'Y', 'TTD.png'),
('111', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 6, NULL, 'N', 'TTD.png'),
('111111', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 10, NULL, 'N', 'TTD.png'),
('11112222', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 720, NULL, 'N', 'TTD.png'),
('12', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 1, NULL, 'N', 'TTD.png'),
('1234', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 724, '2020-07-15 10:50:50', 'N', 'TTD.png'),
('12345457', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 726, NULL, 'N', 'TTD.png'),
('13556', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 7, NULL, 'N', 'TTD.png'),
('1411', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 1, NULL, 'N', 'TTD.png'),
('196701011993031012', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 0, '2020-07-11 14:04:25', 'N', 'TTD.png'),
('196701021988111001', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 0, NULL, 'N', 'TTD.png'),
('196812271996031001', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 717, '2020-09-02 23:00:10', 'N', 'TTD.png'),
('197109222014081001', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 0, NULL, 'N', 'TTD.png'),
('197302121993021001', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 0, NULL, 'N', 'TTD.png'),
('197304101994022003', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 1, '2020-11-04 10:34:00', 'N', ''),
('198010282010012022', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 2, '2020-11-02 18:43:23', 'N', ''),
('198501152011011012', '84d9cfc2f395ce883a41d7ffc1bbcf4e', 'pegawai', 'pegawai', 'pegawai', 'Y', 691, NULL, 'N', 'TTD.png'),
('198508112010012025', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 2, '2020-09-02 23:00:30', 'N', 'TTD.png'),
('54', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 7827, NULL, 'N', 'TTD.png'),
('558758', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 8, NULL, 'N', 'TTD.png'),
('655', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 725, NULL, 'N', 'TTD.png'),
('7', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 4, '2020-11-02 18:39:14', 'N', ''),
('78768', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 18, NULL, 'N', 'TTD.png'),
('86789', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 3, NULL, 'N', ''),
('87t78', '827ccb0eea8a706c4c34a16891f84e7b', 'pegawai', 'pegawai', 'pegawai', 'Y', 9, NULL, 'Y', 'TTD.png'),
('90', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 14, NULL, 'N', 'TTD.png'),
('905345', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 15, NULL, 'N', 'TTD.png'),
('9237403002730', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 718, NULL, 'N', 'TTD.png'),
('bkdadmin', '21232f297a57a5a743894a0e4a801fc3', 'master', '1', '', 'Y', 716, '2020-11-19 16:21:44', 'Y', 'TTD.png'),
('fds', '25d55ad283aa400af464c76d713c07ad', 'pegawai', 'pegawai', 'pegawai', 'Y', 719, NULL, 'N', 'TTD.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_skpd`
--

CREATE TABLE `users_skpd` (
  `id_users_skpd` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level_1` varchar(10) NOT NULL,
  `level_2` varchar(10) NOT NULL,
  `level_3` varchar(10) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `background_1` text NOT NULL,
  `background_2` text NOT NULL,
  `background_3` text NOT NULL,
  `id_jabatan_kepala` int(11) NOT NULL,
  `ttd` varchar(255) NOT NULL,
  `id_pegawai_atasan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_skpd`
--

INSERT INTO `users_skpd` (`id_users_skpd`, `username`, `password`, `level_1`, `level_2`, `level_3`, `status`, `id_pegawai`, `background_1`, `background_2`, `background_3`, `id_jabatan_kepala`, `ttd`, `id_pegawai_atasan`) VALUES
(1, 'adminbkd', '21232f297a57a5a743894a0e4a801fc3', '1', '', '', 'Y', 1, '', '', '', 0, '', 717);

-- --------------------------------------------------------

--
-- Table structure for table `usulan_pensiun`
--

CREATE TABLE `usulan_pensiun` (
  `id_usulan` int(11) NOT NULL,
  `no_usulan` varchar(150) NOT NULL,
  `tanggal_input` date NOT NULL,
  `periode` date NOT NULL,
  `konfirmasi` enum('Y','N','V','T') NOT NULL,
  `id_skpd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_skpd`
--

CREATE TABLE `_skpd` (
  `id__skpd` int(11) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `keterangan_pensiun` text NOT NULL,
  `berkas` text NOT NULL,
  `tanggal_pensiun` varchar(10) NOT NULL,
  `tanggal_input` varchar(10) NOT NULL,
  `jam_input` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_skpd`
--

INSERT INTO `_skpd` (`id__skpd`, `id_pegawai`, `keterangan_pensiun`, `berkas`, `tanggal_pensiun`, `tanggal_input`, `jam_input`) VALUES
(1, '', 'nnijsijqjsiq', '', '2018-11-15', '2018-10-25', '15:52:40'),
(7, '', 'oke oke oke oke oke oke oke oke oke oke oke oke oke oke oke', '', '2018-10-24', '2018-10-26', '10:52:41'),
(9, '', 'okw oke oke oek', '', '2018-11-19', '2018-10-26', '11:10:26'),
(10, '', 'oke', '', '2018-11-04', '2018-10-31', '16:39:34'),
(11, '', 'oke ajadeh', '', '2018-10-01', '2018-10-31', '16:40:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `casuti`
--
ALTER TABLE `casuti`
  ADD PRIMARY KEY (`id_casuti`);

--
-- Indexes for table `diklat`
--
ALTER TABLE `diklat`
  ADD PRIMARY KEY (`id_diklat`);

--
-- Indexes for table `epensiun_sms`
--
ALTER TABLE `epensiun_sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Indexes for table `eselon`
--
ALTER TABLE `eselon`
  ADD PRIMARY KEY (`id_eselon`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id_kabupaten`);

--
-- Indexes for table `kategori_diklat`
--
ALTER TABLE `kategori_diklat`
  ADD PRIMARY KEY (`id_kategori_diklat`);

--
-- Indexes for table `launching`
--
ALTER TABLE `launching`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pangkat`
--
ALTER TABLE `pangkat`
  ADD PRIMARY KEY (`id_pangkat`);

--
-- Indexes for table `pangkat_gaji`
--
ALTER TABLE `pangkat_gaji`
  ADD PRIMARY KEY (`id_pangkat_gaji`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pegawai_anak`
--
ALTER TABLE `pegawai_anak`
  ADD PRIMARY KEY (`id_pegawai_anak`);

--
-- Indexes for table `pegawai_berhenti`
--
ALTER TABLE `pegawai_berhenti`
  ADD PRIMARY KEY (`id_pegawai_berhenti`);

--
-- Indexes for table `pegawai_berkas`
--
ALTER TABLE `pegawai_berkas`
  ADD PRIMARY KEY (`id_pegawai_berkas`);

--
-- Indexes for table `pegawai_golongan`
--
ALTER TABLE `pegawai_golongan`
  ADD PRIMARY KEY (`id_pegawai_golongan`);

--
-- Indexes for table `pegawai_keterangan`
--
ALTER TABLE `pegawai_keterangan`
  ADD PRIMARY KEY (`id_pegawai_keterangan`);

--
-- Indexes for table `pegawai_kgb`
--
ALTER TABLE `pegawai_kgb`
  ADD PRIMARY KEY (`id_pegawai_kgb`);

--
-- Indexes for table `pegawai_kpb`
--
ALTER TABLE `pegawai_kpb`
  ADD PRIMARY KEY (`id_pegawai_kpb`);

--
-- Indexes for table `pegawai_kursus`
--
ALTER TABLE `pegawai_kursus`
  ADD PRIMARY KEY (`id_pegawai_kursus`);

--
-- Indexes for table `pegawai_meninggal`
--
ALTER TABLE `pegawai_meninggal`
  ADD PRIMARY KEY (`id_pegawai_meninggal`);

--
-- Indexes for table `pegawai_mertua`
--
ALTER TABLE `pegawai_mertua`
  ADD PRIMARY KEY (`id_pegawai_mertua`);

--
-- Indexes for table `pegawai_orangtua`
--
ALTER TABLE `pegawai_orangtua`
  ADD PRIMARY KEY (`id_pegawai_orangtua`);

--
-- Indexes for table `pegawai_organisasi`
--
ALTER TABLE `pegawai_organisasi`
  ADD PRIMARY KEY (`id_pegawai_organisasi`);

--
-- Indexes for table `pegawai_pangkat`
--
ALTER TABLE `pegawai_pangkat`
  ADD PRIMARY KEY (`id_pegawai_pangkat`);

--
-- Indexes for table `pegawai_pendidikan`
--
ALTER TABLE `pegawai_pendidikan`
  ADD PRIMARY KEY (`id_pegawai_pendidikan`);

--
-- Indexes for table `pegawai_pengalaman`
--
ALTER TABLE `pegawai_pengalaman`
  ADD PRIMARY KEY (`id_pegawai_pengalaman`);

--
-- Indexes for table `pegawai_penghargaan`
--
ALTER TABLE `pegawai_penghargaan`
  ADD PRIMARY KEY (`id_pegawai_penghargaan`);

--
-- Indexes for table `pegawai_pensiun`
--
ALTER TABLE `pegawai_pensiun`
  ADD PRIMARY KEY (`id_pegawai_pensiun`);

--
-- Indexes for table `pegawai_pindah_instansi`
--
ALTER TABLE `pegawai_pindah_instansi`
  ADD PRIMARY KEY (`id_pegawai_pindah_instansi`);

--
-- Indexes for table `pegawai_pindah_skpd`
--
ALTER TABLE `pegawai_pindah_skpd`
  ADD PRIMARY KEY (`id_pegawai_pindah_skpd`);

--
-- Indexes for table `pegawai_saudara`
--
ALTER TABLE `pegawai_saudara`
  ADD PRIMARY KEY (`id_pegawai_saudara`);

--
-- Indexes for table `pegawai_suami`
--
ALTER TABLE `pegawai_suami`
  ADD PRIMARY KEY (`id_pegawai_suami`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `simpeople`
--
ALTER TABLE `simpeople`
  ADD PRIMARY KEY (`people_id`);

--
-- Indexes for table `simposisi`
--
ALTER TABLE `simposisi`
  ADD PRIMARY KEY (`posisi_id`),
  ADD KEY `FK__simcabang` (`cabang_id`);

--
-- Indexes for table `skp`
--
ALTER TABLE `skp`
  ADD PRIMARY KEY (`id_skp`);

--
-- Indexes for table `skpd`
--
ALTER TABLE `skpd`
  ADD PRIMARY KEY (`id_skpd`);

--
-- Indexes for table `tbl_pensiun`
--
ALTER TABLE `tbl_pensiun`
  ADD PRIMARY KEY (`id_pensiun`);

--
-- Indexes for table `tingkat_pendidikan`
--
ALTER TABLE `tingkat_pendidikan`
  ADD PRIMARY KEY (`id_tingkat_pendidikan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `users_skpd`
--
ALTER TABLE `users_skpd`
  ADD PRIMARY KEY (`id_users_skpd`);

--
-- Indexes for table `usulan_pensiun`
--
ALTER TABLE `usulan_pensiun`
  ADD PRIMARY KEY (`id_usulan`);

--
-- Indexes for table `_skpd`
--
ALTER TABLE `_skpd`
  ADD PRIMARY KEY (`id__skpd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `casuti`
--
ALTER TABLE `casuti`
  MODIFY `id_casuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `diklat`
--
ALTER TABLE `diklat`
  MODIFY `id_diklat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `epensiun_sms`
--
ALTER TABLE `epensiun_sms`
  MODIFY `id_sms` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `eselon`
--
ALTER TABLE `eselon`
  MODIFY `id_eselon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_diklat`
--
ALTER TABLE `kategori_diklat`
  MODIFY `id_kategori_diklat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `launching`
--
ALTER TABLE `launching`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pangkat`
--
ALTER TABLE `pangkat`
  MODIFY `id_pangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pangkat_gaji`
--
ALTER TABLE `pangkat_gaji`
  MODIFY `id_pangkat_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;
--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pegawai_anak`
--
ALTER TABLE `pegawai_anak`
  MODIFY `id_pegawai_anak` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_berhenti`
--
ALTER TABLE `pegawai_berhenti`
  MODIFY `id_pegawai_berhenti` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_berkas`
--
ALTER TABLE `pegawai_berkas`
  MODIFY `id_pegawai_berkas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `pegawai_golongan`
--
ALTER TABLE `pegawai_golongan`
  MODIFY `id_pegawai_golongan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_keterangan`
--
ALTER TABLE `pegawai_keterangan`
  MODIFY `id_pegawai_keterangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pegawai_kgb`
--
ALTER TABLE `pegawai_kgb`
  MODIFY `id_pegawai_kgb` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_kpb`
--
ALTER TABLE `pegawai_kpb`
  MODIFY `id_pegawai_kpb` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_kursus`
--
ALTER TABLE `pegawai_kursus`
  MODIFY `id_pegawai_kursus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_meninggal`
--
ALTER TABLE `pegawai_meninggal`
  MODIFY `id_pegawai_meninggal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_mertua`
--
ALTER TABLE `pegawai_mertua`
  MODIFY `id_pegawai_mertua` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_orangtua`
--
ALTER TABLE `pegawai_orangtua`
  MODIFY `id_pegawai_orangtua` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_organisasi`
--
ALTER TABLE `pegawai_organisasi`
  MODIFY `id_pegawai_organisasi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_pangkat`
--
ALTER TABLE `pegawai_pangkat`
  MODIFY `id_pegawai_pangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pegawai_pendidikan`
--
ALTER TABLE `pegawai_pendidikan`
  MODIFY `id_pegawai_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pegawai_pengalaman`
--
ALTER TABLE `pegawai_pengalaman`
  MODIFY `id_pegawai_pengalaman` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_penghargaan`
--
ALTER TABLE `pegawai_penghargaan`
  MODIFY `id_pegawai_penghargaan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_pensiun`
--
ALTER TABLE `pegawai_pensiun`
  MODIFY `id_pegawai_pensiun` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_pindah_instansi`
--
ALTER TABLE `pegawai_pindah_instansi`
  MODIFY `id_pegawai_pindah_instansi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_pindah_skpd`
--
ALTER TABLE `pegawai_pindah_skpd`
  MODIFY `id_pegawai_pindah_skpd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_saudara`
--
ALTER TABLE `pegawai_saudara`
  MODIFY `id_pegawai_saudara` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pegawai_suami`
--
ALTER TABLE `pegawai_suami`
  MODIFY `id_pegawai_suami` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simpeople`
--
ALTER TABLE `simpeople`
  MODIFY `people_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `simposisi`
--
ALTER TABLE `simposisi`
  MODIFY `posisi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `skp`
--
ALTER TABLE `skp`
  MODIFY `id_skp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `skpd`
--
ALTER TABLE `skpd`
  MODIFY `id_skpd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_pensiun`
--
ALTER TABLE `tbl_pensiun`
  MODIFY `id_pensiun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tingkat_pendidikan`
--
ALTER TABLE `tingkat_pendidikan`
  MODIFY `id_tingkat_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users_skpd`
--
ALTER TABLE `users_skpd`
  MODIFY `id_users_skpd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usulan_pensiun`
--
ALTER TABLE `usulan_pensiun`
  MODIFY `id_usulan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_skpd`
--
ALTER TABLE `_skpd`
  MODIFY `id__skpd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
