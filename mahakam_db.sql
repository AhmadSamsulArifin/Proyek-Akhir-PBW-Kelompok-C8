-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2026 at 07:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahakam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `nama_lengkap`, `created_at`) VALUES
(1, 'admin', 'mahakamlampion2015', 'Administrator Mahakam', '2026-04-21 13:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int NOT NULL,
  `judul` varchar(150) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id`, `judul`, `kategori`, `foto`, `status`) VALUES
(1, 'Tepi Sungai Mahakam', 'Pemandangan', 'tepi_sungai.png', 'aktif'),
(2, 'Kopi dan Suasana Malam', 'Bersantai', 'nongkrong.png', 'aktif'),
(3, 'Lorong Cahaya', 'Wahana & Permainan', 'lorongcahaya.png', 'aktif'),
(4, 'Papan Harapan', 'Bersantai', 'harapan.png', 'aktif'),
(5, 'Feeding Ikan', 'Wahana & Permainan', 'feedingikan.png', 'aktif'),
(6, 'Feeding Kelinci', 'Wahana & Permainan', 'feedingkelinci.png', 'aktif'),
(7, 'Panggung Acara', 'Pertunjukan', 'panggung.png', 'aktif'),
(8, 'Permainan Anak', 'Wahana & Permainan', 'permainan.png', 'aktif'),
(9, 'Santai di Tepi Mahakam', 'Bersantai', 'santai.png', 'aktif'),
(10, 'Sewa Sepeda', 'Wahana & Permainan', 'sewasepeda.png', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int NOT NULL,
  `wisata_id` int NOT NULL,
  `nama_pengunjung` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `rating` tinyint NOT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `isi_ulasan` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` enum('menunggu','disetujui','ditolak') DEFAULT 'disetujui',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id`, `wisata_id`, `nama_pengunjung`, `email`, `rating`, `judul`, `isi_ulasan`, `foto`, `status`, `created_at`) VALUES
(1, 1, 'Arya Satria', 'arya@email.com', 5, 'Pengalaman yang Tak Terlupakan', 'Suasana malam di tepi Sungai Mahakam dengan cahaya lampion yang memukau benar-benar luar biasa. Cocok untuk keluarga maupun pasangan. Pasti akan datang lagi!', NULL, 'disetujui', '2026-04-21 13:27:14'),
(2, 1, 'Larasati Putri', 'larasati@email.com', 4, 'Wisata Malam Terbaik di Samarinda', 'Tempatnya bagus dan lampionnya banyak banget variasinya. Gerbangnya mirip Islamic Center, keren! Wahana juga lengkap, anak-anak senang sekali. Rekomendasikan untuk liburan keluarga.', NULL, 'disetujui', '2026-04-21 13:27:14'),
(3, 1, 'Dimas Kurnia', 'dimas@email.com', 5, 'Wajib Dikunjungi Saat ke Samarinda', 'Sudah beberapa kali ke sini dan tidak pernah bosan. Setiap kunjungan selalu ada yang baru. Harga tiket juga terjangkau banget untuk pengalaman wisata semalam penuh seperti ini.', NULL, 'disetujui', '2026-04-21 13:27:14'),
(5, 1, 'asdfghjkl', 'rasyadinanova@gmail.com', 5, 'asdfghjkl', 'buuuuuuuuuuuuuuuuuuuuuuuuuuyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', '', 'disetujui', '2026-04-28 16:16:48'),
(6, 1, 'Siapa Nyak', 'uchihasamsul@gmail.com', 5, 'duwdinednindi', 'sdfghjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjksfha unnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', '', 'disetujui', '2026-04-28 23:44:45'),
(7, 1, 'asdfghjkl;', 'asdfghjk@gmail.com', 5, 'rtyuioluyt55f678', 'vfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', '', 'disetujui', '2026-04-29 01:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` int NOT NULL,
  `nama` varchar(150) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `kategori` enum('alam','budaya','kuliner','wahana') NOT NULL DEFAULT 'alam',
  `deskripsi_singkat` text,
  `deskripsi_lengkap` text,
  `fasilitas` text COMMENT 'JSON array fasilitas',
  `harga_weekday` decimal(10,2) DEFAULT '0.00',
  `harga_weekend` decimal(10,2) DEFAULT '0.00',
  `jam_buka` varchar(50) DEFAULT '18:00',
  `jam_tutup` varchar(50) DEFAULT '22:00',
  `lokasi` varchar(255) DEFAULT NULL,
  `maps_embed` text,
  `foto_utama` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `nama`, `slug`, `kategori`, `deskripsi_singkat`, `deskripsi_lengkap`, `fasilitas`, `harga_weekday`, `harga_weekend`, `jam_buka`, `jam_tutup`, `lokasi`, `maps_embed`, `foto_utama`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Taman Lampion Mahakam', 'taman-lampion-mahakam', 'budaya', 'Destinasi cahaya terbesar di Kalimantan dengan ribuan lampion yang menerangi tepi Sungai Mahakam setiap malam.', 'Mahakam Lampion Garden adalah surga cahaya yang terletak di tepi Sungai Mahakam, Samarinda. Setiap malam, ribuan lampion warna-warni menyinari langit dan air sungai, menciptakan pemandangan yang memukau dan tak terlupakan\r\n\r\nInstalasi cahaya bertema mitologi lokal dan satwa endemik Kalimantan menjadi daya tarik utama. Dari replika Pesut Mahakam hingga motif ukiran Dayak yang bercahaya, setiap sudut dirancang untuk memukau indra Anda.\r\n\r\nTaman ini juga menampilkan pertunjukan budaya rutin, kuliner terapung, dan berbagai wahana interaktif yang cocok untuk seluruh keluarga.', '[\"WiFi Gratis\",\"Area Parkir Luas\",\"Musala\",\"Toilet Bersih\",\"Restoran Terapung\",\"Area Foto\",\"Panggung Budaya\",\"Wahana Anak\"]', '10000.00', '13000.00', '16:00', '23:00', 'Jl. Slamet Riyadi, Karang Asam Ilir, Samarinda Ulu, Kota Samarinda, Kalimantan Timur', NULL, 'wisata_1777438222_6359.jpeg', 1, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:28:43'),
(2, 'Lorong Cahaya', 'lorong-cahaya', 'wahana', 'Perjalanan melalui ribuan cahaya yang menggantung rendah, menciptakan ilusi ruang tanpa batas di sepanjang lorong.', 'Lorong Cahaya adalah instalasi seni cahaya yang memukau. Ribuan lampion kecil menggantung di atas lorong berkelok, menciptakan efek visual yang membuat pengunjung seolah berjalan di bintang-bintang.\r\n\r\nInstalasi ini berganti tema setiap bulan, mulai dari nuansa biru galaksi hingga keemasan panen raya. Spot foto terfavorit pengunjung dengan antrian terpanjang setiap malam.', '[\"Spot Foto Premium\",\"Pemandu Wisata\",\"Akses Ramah Difabel\",\"Souvenir Shop\"]', '0.00', '0.00', '16:00', '23:00', 'Area Dalam Mahakam Lampion Garden, Samarinda', NULL, 'wisata_1777438476_5693.jpeg', 1, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:28:25'),
(3, 'Sewa Kendaraan dan Kendaraan Mainan', 'sewa-kendaraan-dan-kendaraan-mainan', 'wahana', 'Nikmati keseruan berkeliling area Mahakam Lampion Garden dengan pilihan kendaraan sewa yang cocok untuk anak-anak dan keluarga.', 'Sewa Kendaraan di Mahakam Lampion Garden menghadirkan pengalaman bermain yang menyenangkan untuk pengunjung, terutama anak-anak dan keluarga.\r\n\r\nTersedia berbagai pilihan kendaraan seperti scooter, mobil-mobilan, sepeda biasa,  sepeda listrik, dan gocar. Pengunjung dapat menikmati suasana malam sambil berkeliling area wisata dengan aman dan menyenangkan.\r\n\r\nPembayaran dilakukan langsung di loket Candy Kidzland sebelum menggunakan kendaraan. Demi kenyamanan bersama, pengunjung diharapkan mengikuti arahan petugas dan menjaga waktu penggunaan sesuai ketentuan.', '[\"Scooter\",\"Mobil-mobilan\",\"Sepeda Biasa\",\"Sepeda Listrik\",\"Gocar\",\"Loket Pembayaran\",\"Area Bermain Anak\"]', '40000.00', '40000.00', '16:00', '23:00', 'Area Candy Kidzland, Mahakam Lampion Garden, Samarinda', NULL, 'wisata_1777440003_1612.jpeg', 0, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:27:55'),
(4, 'Kopi Lima', 'kopi-lima', 'kuliner', 'Tempat santai menikmati kopi dengan suasana malam yang nyaman di Mahakam Lampion Garden.', 'Kopi Lima adalah tempat kuliner yang menawarkan berbagai pilihan kopi dan minuman hangat di area Mahakam Lampion Garden. \r\nDengan suasana malam yang estetik dan lampion yang indah, pengunjung dapat bersantai bersama teman maupun keluarga sambil menikmati hidangan ringan dan minuman favorit.', '[\"Tempat Duduk Penonton\",\"Sistem Sound Profesional\",\"Tata Cahaya Panggung\"]', '25000.00', '23000.00', '12:00', '12:00', 'Zona Timur Mahakam Lampion Garden, Samarinda', NULL, 'wisata_1777438942_2712.jpeg', 1, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:28:15'),
(5, 'Feeding Ikan', 'feeding-ikan', 'wahana', 'Aktivitas seru memberi makan ikan di kolam dengan suasana lampion yang indah dan menenangkan.', 'Feeding Ikan adalah salah satu aktivitas menarik di Mahakam Lampion Garden yang cocok untuk semua usia, terutama anak-anak dan keluarga.\r\n\r\nPengunjung dapat membeli pakan ikan dengan harga terjangkau, kemudian memberi makan ikan langsung di kolam yang dihiasi lampion warna-warni. Suasana malam yang estetik membuat pengalaman ini semakin menyenangkan dan cocok untuk bersantai sambil menikmati keindahan taman.\r\n\r\nAktivitas ini juga menjadi pilihan edukatif bagi anak-anak untuk berinteraksi dengan alam secara langsung.', '[\"Pakan Ikan\",\"Area Duduk\",\"Pencahayaan Lampion\",\"Spot Foto\"]', '5000.00', '5000.00', '16:00', '23:00', 'Area Kolam Lampion, Mahakam Lampion Garden, Samarinda', NULL, 'wisata_1777440450_9234.jpeg', 0, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:27:30'),
(6, 'Feeding Kelinci', 'feeding-kelinci', 'wahana', 'Pengalaman seru memberi makan kelinci secara langsung di area yang aman dan ramah anak.', 'Feeding Kelinci adalah salah satu wahana interaktif di Mahakam Lampion Garden yang sangat cocok untuk anak-anak dan keluarga.\r\n\r\nPengunjung dapat berinteraksi langsung dengan kelinci lucu dengan memberi mereka makanan yang telah disediakan. Area ini dirancang aman dan nyaman, dengan kandang tertata rapi serta pencahayaan lampion yang membuat suasana semakin hangat dan menyenangkan di malam hari.\r\n\r\nSelain sebagai hiburan, aktivitas ini juga memberikan pengalaman edukatif bagi anak-anak untuk mengenal dan menyayangi hewan.', '[\"Pakan Kelinci\",\"Area Interaksi\",\"Pencahayaan Lampion\",\"Spot Edukasi Anak\"]', '5000.00', '5000.00', '16:00', '23:00', 'Area Mini Zoo, Mahakam Lampion Garden, Samarinda', NULL, 'wisata_1777440814_8224.jpeg', 0, 'aktif', '2026-04-21 13:27:14', '2026-04-29 05:33:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wisata_id` (`wisata_id`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`wisata_id`) REFERENCES `wisata` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
