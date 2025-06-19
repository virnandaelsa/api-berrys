-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for api/berrys
CREATE DATABASE IF NOT EXISTS `api/berrys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `api/berrys`;

-- Dumping structure for table api/berrys.absensi
CREATE TABLE IF NOT EXISTS `absensi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_karyawan` bigint unsigned NOT NULL,
  `id_jadwal` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absensi_id_karyawan_foreign` (`id_karyawan`),
  KEY `absensi_id_jadwal_foreign` (`id_jadwal`),
  CONSTRAINT `absensi_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE,
  CONSTRAINT `absensi_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.absensi: ~40 rows (approximately)
REPLACE INTO `absensi` (`id`, `photo`, `tanggal`, `jam`, `id_karyawan`, `id_jadwal`, `created_at`, `updated_at`) VALUES
	(1, 'uploads/PAgfT4Y4nQx6G1VYINvgXL34u5ufEni1DwnX4HB8.jpg', '2025-04-07', '23:39:17', 4, 2, '2025-04-07 09:39:29', '2025-04-07 09:39:29'),
	(2, 'uploads/u7234Nx7j0WzTTinAqbaVbGc4VEuBlUKtR7i5GNI.jpg', '2025-04-07', '23:39:30', 4, 2, '2025-04-07 09:39:38', '2025-04-07 09:39:38'),
	(3, 'uploads/ntB2WwNkPsH9kzNFUAHP5JLAmv09NZXBUwWH2PxG.jpg', '2025-04-07', '23:39:45', 4, 2, '2025-04-07 09:39:54', '2025-04-07 09:39:54'),
	(4, 'uploads/255AatCHRtlMs3VUcMy4CIfkJDmChSjYYN15LF28.jpg', '2025-04-07', '23:39:47', 4, 2, '2025-04-07 09:39:55', '2025-04-07 09:39:55'),
	(5, 'uploads/AmD9OcVGp3dJAnDTcsHDTx1uay0o2Wu0d07GReyt.jpg', '2025-04-15', '07:35:21', 4, 2, '2025-04-14 17:35:46', '2025-04-14 17:35:46'),
	(6, 'uploads/T7YLoBZzv3n1Dk8nGEBZ9Zv9TLySCi7vARGsHRJr.jpg', '2025-04-15', '07:35:27', 4, 2, '2025-04-14 17:35:48', '2025-04-14 17:35:48'),
	(7, 'uploads/nqeNF1GTyla5ZlGAoUBLZYKUamoU25z1ylw28IfB.jpg', '2025-04-16', '23:03:39', 4, 2, '2025-04-16 09:03:44', '2025-04-16 09:03:44'),
	(8, 'uploads/R3leI4nG4ktQ0ffeLPdyx7653pTtcCqWAACJvQXa.jpg', '2025-04-16', '23:18:01', 4, 2, '2025-04-16 09:18:03', '2025-04-16 09:18:03'),
	(9, 'uploads/nc4Xe5sQZO0r4GssryVHBS1YqPu56pmEbhtIgh3c.jpg', '2025-04-19', '21:10:12', 4, 2, '2025-04-19 07:10:24', '2025-04-19 07:10:24'),
	(10, 'uploads/g6gWWZhzFHrLWL9sD3OqceO5VrF2ggKSq6Yu4F1X.jpg', '2025-04-19', '21:48:39', 4, 2, '2025-04-19 07:48:49', '2025-04-19 07:48:49'),
	(11, 'uploads/YIIPymftSszvfwmeceuyTuk44RLxzkUHQ1XDK3f5.jpg', '2025-04-22', '21:54:11', 4, 2, '2025-04-22 07:54:17', '2025-04-22 07:54:17'),
	(12, 'uploads/f5c26RP1q9yKAPsRugReyUIK8djH0Fzw6KW4P1Rv.jpg', '2025-04-22', '22:05:43', 4, 2, '2025-04-22 08:05:47', '2025-04-22 08:05:47'),
	(13, 'uploads/PNhEhdbR5nVR3kNq4Rz0HYhsyPBrpSB9NQhBDkv6.jpg', '2025-04-23', '15:22:41', 4, 2, '2025-04-23 01:22:50', '2025-04-23 01:22:50'),
	(18, 'uploads/ACQiJH6M4XcBGStxVhdvPai87abfDoMwOzDt2JBY.jpg', '2025-04-26', '22:46:03', 4, 2, '2025-04-26 08:46:12', '2025-04-26 08:46:12'),
	(19, 'uploads/NwkSvpWUQQkqDRHjbntTG24jmJ83sqgLp68Mcwfm.jpg', '2025-04-26', '22:47:40', 4, 2, '2025-04-26 08:47:50', '2025-04-26 08:47:50'),
	(20, 'uploads/RZ5LYyrHFuUCxMo5xoZh0Tl0H0SMpCI7G2FG3uqk.jpg', '2025-04-27', '10:54:15', 4, 2, '2025-04-26 20:54:17', '2025-04-26 20:54:17'),
	(21, 'uploads/lx0rHmSmYQyh316xgoiNdxz9isGHXDPFrqhKxQOL.jpg', '2025-04-27', '11:14:55', 4, 2, '2025-04-26 21:15:00', '2025-04-26 21:15:00'),
	(22, 'uploads/tt1c4fYN0AY5YitY7SZMe8YdPRl8PVtwEMMoRBqT.jpg', '2025-04-27', '12:13:13', 4, 2, '2025-04-26 22:13:16', '2025-04-26 22:13:16'),
	(23, 'uploads/5Iyx9nmjLObSAroalJgHmUZiP0WOInOkd2ts9Tcu.jpg', '2025-05-08', '19:11:19', 5, 53, '2025-05-08 05:11:21', '2025-05-08 05:11:21'),
	(24, 'uploads/QjEegMhXOkA9FPOH2KBxhjzPOlkX4NAcWozK5OjY.jpg', '2025-05-12', '22:54:25', 6, 79, '2025-05-12 08:54:31', '2025-05-12 08:54:31'),
	(25, 'uploads/Nq6xCBJyueucmT6ZWQVfUJOV7AZgXM8MdZq0jDNT.jpg', '2025-05-12', '23:33:03', 6, 79, '2025-05-12 09:33:08', '2025-05-12 09:33:08'),
	(26, 'uploads/v4iwCbN3aT8frvyn7C0MVV5Vaa5cnl3hfnu6Yhot.jpg', '2025-06-08', '16:28:06', 6, 89, '2025-06-08 02:28:19', '2025-06-08 02:28:19'),
	(27, 'uploads/permata_masuk.jpg', '2025-06-10', '08:00:00', 5, 132, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(28, 'uploads/permata_pulang.jpg', '2025-06-10', '17:00:00', 5, 132, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(29, 'uploads/riana_masuk.jpg', '2025-06-10', '08:10:00', 6, 98, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(30, 'uploads/riana_pulang.jpg', '2025-06-10', '17:10:00', 6, 98, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(31, 'uploads/dian_masuk.jpg', '2025-06-10', '08:05:00', 7, 72, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(32, 'uploads/dian_pulang.jpg', '2025-06-10', '17:05:00', 7, 72, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(33, 'uploads/aldi_masuk.jpg', '2025-06-10', '08:20:00', 8, 74, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(34, 'uploads/aldi_pulang.jpg', '2025-06-10', '17:20:00', 8, 74, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(35, 'uploads/putri_masuk.jpg', '2025-06-10', '08:00:00', 9, 135, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(36, 'uploads/putri_pulang.jpg', '2025-06-10', '17:00:00', 9, 135, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(37, 'uploads/nabilla_masuk.jpg', '2025-06-10', '08:10:00', 10, 105, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(38, 'uploads/nabilla_pulang.jpg', '2025-06-10', '17:10:00', 10, 105, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(39, 'uploads/laila_masuk.jpg', '2025-06-10', '08:15:00', 11, 112, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(40, 'uploads/laila_pulang.jpg', '2025-06-10', '17:15:00', 11, 112, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(41, 'uploads/ratna_masuk.jpg', '2025-06-10', '08:05:00', 12, 119, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(42, 'uploads/ratna_pulang.jpg', '2025-06-10', '17:05:00', 12, 119, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(43, 'uploads/putriy_masuk.jpg', '2025-06-10', '08:25:00', 13, 123, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(44, 'uploads/putriy_pulang.jpg', '2025-06-10', '17:25:00', 13, 123, '2025-06-10 16:04:45', '2025-06-10 16:04:45'),
	(45, 'uploads/M1sblNUx5dUS9Q6NsFqkh5nOiXN0cgsCO8L21FaL.jpg', '2025-06-11', '00:41:11', 6, 99, '2025-06-10 17:41:15', '2025-06-10 17:41:15'),
	(46, 'uploads/2Q5X1yqmYrq7Y2MiJ5lmjp7pUWWzN5sK7NTv0xAL.jpg', '2025-06-11', '02:27:56', 6, 99, '2025-06-10 19:27:58', '2025-06-10 19:27:58'),
	(47, 'uploads/LyYBObPckZHF8iP3VJBZC8I3pRxRBN23oTxk7D4P.jpg', '2025-06-11', '16:50:30', 5, 136, '2025-06-11 09:50:35', '2025-06-11 09:50:35'),
	(48, 'uploads/zlwvQk9akPzxOjLtZu47WbNBp5x1qKJosYDbRnvW.jpg', '2025-06-11', '16:52:49', 10, 106, '2025-06-11 09:52:52', '2025-06-11 09:52:52'),
	(49, 'uploads/R9hk4LbXGcWjg3trzqTK82B28ncL8FHHvXxXXUby.jpg', '2025-06-11', '16:52:55', 10, 106, '2025-06-11 09:52:57', '2025-06-11 09:52:57'),
	(50, 'uploads/9B1zifJcphzLEMWwWVN9QeEBAHUXKgv1PdsLeSHa.jpg', '2025-06-11', '16:54:00', 5, 136, '2025-06-11 09:54:02', '2025-06-11 09:54:02'),
	(51, 'uploads/28abVV58CvQZSmwr3cPZH8AM3FeerBhdgNEjOIpq.jpg', '2025-06-12', '21:10:28', 6, 100, '2025-06-12 14:10:34', '2025-06-12 14:10:34'),
	(52, 'uploads/TVz4KP8QZvV2NojYX3w8p8MRQga6HctGl2IknKFU.jpg', '2025-06-12', '21:37:07', 6, 100, '2025-06-12 14:37:14', '2025-06-12 14:37:14');

-- Dumping structure for table api/berrys.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.cache: ~0 rows (approximately)

-- Dumping structure for table api/berrys.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.cache_locks: ~0 rows (approximately)

-- Dumping structure for table api/berrys.cuti
CREATE TABLE IF NOT EXISTS `cuti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alasan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Diterima','Ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `id_karyawan` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuti_id_karyawan_foreign` (`id_karyawan`),
  CONSTRAINT `cuti_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.cuti: ~15 rows (approximately)
REPLACE INTO `cuti` (`id`, `tanggal`, `hari`, `alasan`, `status`, `id_karyawan`, `created_at`, `updated_at`) VALUES
	(1, '2025-03-10', 'Senin', 'Pergi ke Surabaya', 'Diterima', 4, '2025-03-08 08:55:34', '2025-03-10 18:52:11'),
	(3, '2025-04-19', 'Sabtu', 'sakit', 'Pending', 4, '2025-04-19 07:50:17', '2025-04-19 07:50:17'),
	(4, '2025-04-19', 'Sabtu', 'sedang berlibur', 'Pending', 4, '2025-04-19 08:15:36', '2025-04-19 08:15:36'),
	(5, '2025-04-24', 'Kamis', 'pergi', 'Ditolak', 4, '2025-04-23 01:23:22', '2025-05-03 09:57:54'),
	(6, '2025-05-13', 'Selasa', 'liburan', 'Ditolak', 6, '2025-05-11 06:59:26', '2025-05-11 07:04:50'),
	(7, '2025-04-08', 'Selasa', 'tamasya', 'Pending', 6, '2025-05-12 06:51:33', '2025-05-12 06:51:33'),
	(8, '2025-06-02', 'Senin', 'sakit', 'Pending', 6, '2025-05-12 07:23:54', '2025-05-12 07:23:54'),
	(9, '2025-06-16', 'Senin', 'ke surabaya', 'Diterima', 9, '2025-06-08 23:09:43', '2025-06-12 14:52:18'),
	(10, '2025-06-15', 'Minggu', 'Pernikahan saudara', 'Pending', 9, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(11, '2025-06-16', 'Senin', 'Sakit', 'Pending', 15, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(12, '2025-06-17', 'Selasa', 'Urus dokumen', 'Diterima', 11, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(13, '2025-06-18', 'Rabu', 'Liburan', 'Ditolak', 12, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(14, '2025-06-19', 'Kamis', 'Acara keluarga', 'Pending', 13, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(15, '2025-06-21', 'Sabtu', 'Ke luar kota', 'Pending', 10, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(16, '2025-06-22', 'Minggu', 'Acara pernikahan', 'Pending', 9, '2025-06-10 15:55:56', '2025-06-10 15:55:56'),
	(17, '2025-06-16', 'Senin', 'Pergi kontrol ke rumah sakit', 'Diterima', 5, '2025-06-11 17:02:07', '2025-06-12 15:14:43'),
	(18, '2025-06-23', 'Senin', 'Acara pernikahan saudara', 'Pending', 5, '2025-06-12 14:28:44', '2025-06-12 14:28:44'),
	(19, '2025-06-25', 'Rabu', '-', 'Ditolak', 5, '2025-06-12 14:29:25', '2025-06-12 14:32:37');

-- Dumping structure for table api/berrys.edit_gaji
CREATE TABLE IF NOT EXISTS `edit_gaji` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint unsigned NOT NULL,
  `bulan` int NOT NULL,
  `tahun` int NOT NULL,
  `jumlah` int NOT NULL,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edit_gaji_id_karyawan_foreign` (`id_karyawan`),
  CONSTRAINT `edit_gaji_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.edit_gaji: ~0 rows (approximately)
REPLACE INTO `edit_gaji` (`id`, `id_karyawan`, `bulan`, `tahun`, `jumlah`, `jenis`, `keterangan`, `created_at`, `updated_at`) VALUES
	(1, 4, 4, 2025, 500, 'bonus', 'bonus uang makan', '2025-04-28 04:22:45', '2025-04-28 04:22:45'),
	(2, 4, 4, 2025, -500, 'potongan', 'kasbon', '2025-04-29 03:39:13', '2025-04-29 03:39:13'),
	(3, 5, 6, 2025, -7000, 'potongan', 'uang makan', '2025-06-10 16:32:39', '2025-06-10 16:32:39'),
	(4, 5, 6, 2025, -50000, 'potongan', 'hutang', '2025-06-11 16:46:24', '2025-06-11 16:46:24');

-- Dumping structure for table api/berrys.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table api/berrys.gaji
CREATE TABLE IF NOT EXISTS `gaji` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gaji` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.gaji: ~4 rows (approximately)
REPLACE INTO `gaji` (`id`, `bagian`, `gaji`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 4000, NULL, NULL),
	(2, 'Kurir', 5000, NULL, NULL),
	(3, 'Penjaga Stand', 4000, NULL, NULL),
	(4, 'Produksi', 5000, NULL, NULL),
	(5, 'Toko', 4000, NULL, NULL);

-- Dumping structure for table api/berrys.jadwal
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_karyawan` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jadwal_id_karyawan_foreign` (`id_karyawan`),
  CONSTRAINT `jadwal_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.jadwal: ~132 rows (approximately)
REPLACE INTO `jadwal` (`id`, `date`, `hari`, `shift`, `tempat`, `id_karyawan`, `created_at`, `updated_at`) VALUES
	(1, '2025-03-10', 'Senin', '1', 'Produksi', 4, '2025-03-03 03:28:41', '2025-03-03 03:28:41'),
	(2, '2025-03-04', 'Selasa', '1', 'Produksi', 4, '2025-03-03 03:28:41', '2025-03-03 03:28:41'),
	(3, '2025-03-03', 'Senin', '1', 'Produksi', 4, '2025-03-03 03:39:13', '2025-03-03 03:39:13'),
	(4, '2025-03-03', 'Senin', '2', 'Produksi', 4, '2025-03-03 03:39:13', '2025-03-03 03:39:13'),
	(5, '2025-03-03', 'Senin', '1', 'Toko', 4, '2025-03-03 03:39:13', '2025-03-03 03:39:13'),
	(6, '2025-03-03', 'Senin', '2', 'Toko', 4, '2025-03-03 03:39:13', '2025-03-03 03:39:13'),
	(7, '2025-03-03', 'Senin', '1', 'Logistik', 4, '2025-03-03 03:39:13', '2025-03-03 03:39:13'),
	(8, '2025-03-03', 'Senin', '1', 'Produksi', 4, '2025-03-03 03:39:44', '2025-03-03 03:39:44'),
	(9, '2025-03-03', 'Senin', '2', 'Produksi', 4, '2025-03-03 03:39:44', '2025-03-03 03:39:44'),
	(10, '2025-03-03', 'Senin', '1', 'Toko', 4, '2025-03-03 03:39:44', '2025-03-03 03:39:44'),
	(11, '2025-03-03', 'Senin', '2', 'Toko', 4, '2025-03-03 03:39:44', '2025-03-03 03:39:44'),
	(12, '2025-03-03', 'Senin', '1', 'Logistik', 4, '2025-03-03 03:39:44', '2025-03-03 03:39:44'),
	(13, '2025-03-10', 'Senin', '1', 'Produksi', 4, '2025-03-03 16:11:51', '2025-03-03 16:11:51'),
	(14, '2025-03-10', 'Senin', '1', 'Logistik', 4, '2025-03-03 16:11:51', '2025-03-03 16:11:51'),
	(15, '2025-03-17', 'Senin', '1', 'Produksi', 4, '2025-03-03 20:42:36', '2025-03-03 20:42:36'),
	(16, '2025-03-17', 'Senin', '2', 'Produksi', 4, '2025-03-03 20:42:36', '2025-03-03 20:42:36'),
	(17, '2025-03-17', 'Senin', '1', 'Toko', 4, '2025-03-03 20:42:36', '2025-03-03 20:42:36'),
	(18, '2025-03-12', 'Rabu', '1', 'Produksi', 4, '2025-03-04 08:41:46', '2025-03-04 08:41:46'),
	(19, '2025-03-12', 'Rabu', '2', 'Produksi', 4, '2025-03-07 00:43:58', '2025-03-07 00:43:58'),
	(20, '2025-04-27', 'Minggu', '2', 'Toko', 4, '2025-04-27 04:18:07', '2025-04-27 04:18:07'),
	(21, '2025-04-29', 'Selasa', '1', 'Produksi', 6, '2025-04-28 06:51:58', '2025-05-03 07:57:16'),
	(22, '2025-05-01', 'Kamis', '1', 'Produksi', 5, '2025-04-28 06:51:58', '2025-05-03 07:54:51'),
	(23, '2025-04-28', 'Senin', '2', 'Produksi', 5, '2025-04-28 06:51:58', '2025-05-03 07:53:44'),
	(24, '2025-04-30', 'Rabu', '2', 'Produksi', 5, '2025-04-28 06:51:58', '2025-05-03 07:55:07'),
	(25, '2025-05-02', 'Jumat', '2', 'Produksi', 5, '2025-04-28 06:51:58', '2025-05-03 07:55:38'),
	(26, '2025-05-02', 'Jumat', '1', 'Produksi', 5, '2025-05-01 21:50:55', '2025-05-01 21:50:55'),
	(27, '2025-04-28', 'Senin', '1', 'Produksi', 5, '2025-05-03 07:05:31', '2025-05-03 07:05:31'),
	(28, '2025-04-28', 'Senin', '1', 'Toko', 5, '2025-05-03 07:05:31', '2025-05-03 07:05:31'),
	(29, '2025-04-28', 'Senin', '1', 'Logistik', 5, '2025-05-03 07:05:31', '2025-05-03 07:05:31'),
	(41, '2025-04-30', 'Rabu', '1', 'Produksi', 5, '2025-05-03 07:54:51', '2025-05-03 07:54:51'),
	(42, '2025-04-29', 'Selasa', '2', 'Produksi', 5, '2025-05-03 07:54:51', '2025-05-03 07:54:51'),
	(43, '2025-05-01', 'Kamis', '2', 'Produksi', 5, '2025-05-03 07:54:51', '2025-05-03 07:54:51'),
	(44, '2025-04-30', 'Rabu', '1', 'Toko', 5, '2025-05-03 07:54:51', '2025-05-03 07:54:51'),
	(45, '2025-04-28', 'Senin', '2', 'Toko', 5, '2025-05-03 07:54:51', '2025-05-03 07:54:51'),
	(46, '2025-04-29', 'Selasa', '1', 'Toko', 6, '2025-05-03 07:57:16', '2025-05-03 07:57:16'),
	(47, '2025-05-01', 'Kamis', '1', 'Toko', 6, '2025-05-03 08:14:11', '2025-05-03 08:14:11'),
	(48, '2025-04-29', 'Selasa', '2', 'Toko', 6, '2025-05-03 08:14:11', '2025-05-03 08:14:11'),
	(49, '2025-05-01', 'Kamis', '2', 'Toko', 6, '2025-05-03 08:14:11', '2025-05-03 08:14:11'),
	(50, '2025-04-29', 'Selasa', '1', 'Logistik', 6, '2025-05-03 08:14:11', '2025-05-03 08:14:11'),
	(51, '2025-05-01', 'Kamis', '1', 'Logistik', 6, '2025-05-03 08:14:11', '2025-05-03 08:14:11'),
	(52, '2025-05-05', 'Senin', '1', 'Pahing', 6, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(53, '2025-05-08', 'Kamis', '1', 'Pahing', 5, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(54, '2025-05-06', 'Selasa', '2', 'Pahing', 5, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(55, '2025-05-07', 'Rabu', '2', 'Pahing', 6, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(56, '2025-05-08', 'Kamis', '2', 'Pahing', 7, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(57, '2025-05-09', 'Jumat', 'Fulltime', 'Dlopo', 6, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(58, '2025-05-09', 'Jumat', 'Fulltime', 'Mojoroto', 5, '2025-05-03 09:17:14', '2025-05-03 09:17:14'),
	(59, '2025-05-06', 'Selasa', '1', 'Pahing', 7, '2025-05-03 09:21:43', '2025-05-03 09:21:43'),
	(60, '2025-05-07', 'Rabu', '1', 'Pahing', 8, '2025-05-03 09:21:43', '2025-05-03 09:21:43'),
	(61, '2025-05-06', 'Selasa', 'Fulltime', 'Bandar', 6, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(62, '2025-05-07', 'Rabu', 'Fulltime', 'Bandar', 5, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(63, '2025-05-05', 'Senin', 'Fulltime', 'Balowerti', 6, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(64, '2025-05-07', 'Rabu', 'Fulltime', 'Balowerti', 7, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(65, '2025-05-06', 'Selasa', 'Fulltime', 'Kaliombo', 5, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(66, '2025-05-06', 'Selasa', 'Fulltime', 'Toko', 6, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(67, '2025-05-08', 'Kamis', 'Fulltime', 'Pesantren', 7, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(68, '2025-05-06', 'Selasa', 'Fulltime', 'Ngronggo', 6, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(69, '2025-05-08', 'Kamis', '1', 'Kurir', 6, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(70, '2025-05-07', 'Rabu', '2', 'Kurir', 7, '2025-05-03 09:23:11', '2025-05-03 09:23:11'),
	(71, '2025-05-05', 'Senin', 'Fulltime', 'Produksi', 5, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(72, '2025-05-05', 'Senin', 'Fulltime', 'Produksi', 7, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(73, '2025-05-06', 'Selasa', 'Fulltime', 'Produksi', 5, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(74, '2025-05-06', 'Selasa', 'Fulltime', 'Produksi', 8, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(75, '2025-05-07', 'Rabu', 'Fulltime', 'Produksi', 5, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(76, '2025-05-07', 'Rabu', 'Fulltime', 'Produksi', 7, '2025-05-03 09:30:55', '2025-05-03 09:30:55'),
	(79, '2025-05-12', 'Senin', '1', 'Pahing', 6, '2025-05-12 08:19:03', '2025-05-12 08:19:03'),
	(80, '2025-05-13', 'Selasa', '1', 'Pahing', 6, '2025-05-12 08:19:03', '2025-05-12 08:19:03'),
	(81, '2025-05-18', 'Minggu', '1', 'Pahing', 6, '2025-05-17 19:19:21', '2025-05-17 19:19:21'),
	(82, '2025-05-28', 'Rabu', '1', 'Pahing', 6, '2025-05-21 03:11:24', '2025-05-21 03:11:24'),
	(83, '2025-05-21', 'Rabu', '1', 'Pahing', 6, '2025-05-21 03:11:45', '2025-05-21 03:11:45'),
	(84, '2025-06-02', 'Senin', '1', 'Pahing', 6, '2025-06-02 03:35:46', '2025-06-02 03:35:46'),
	(85, '2025-06-04', 'Rabu', '1', 'Pahing', 6, '2025-06-02 03:35:46', '2025-06-02 03:35:46'),
	(86, '2025-06-03', 'Selasa', '2', 'Pahing', 6, '2025-06-02 03:35:46', '2025-06-02 03:35:46'),
	(87, '2025-06-05', 'Kamis', '1', 'Pahing', 6, '2025-06-02 05:14:53', '2025-06-02 05:14:53'),
	(88, '2025-06-07', 'Sabtu', '1', 'Pahing', 6, '2025-06-02 05:14:53', '2025-06-02 05:14:53'),
	(89, '2025-06-08', 'Minggu', '1', 'Pahing', 6, '2025-06-02 05:14:53', '2025-06-02 05:14:53'),
	(90, '2025-06-06', 'Jumat', '2', 'Pahing', 6, '2025-06-02 05:14:53', '2025-06-02 05:14:53'),
	(91, '2025-06-09', 'Senin', '1', 'Pahing', 6, '2025-06-07 06:10:03', '2025-06-07 06:10:03'),
	(92, '2025-06-10', 'Selasa', '1', 'Pahing', 9, '2025-06-07 06:10:03', '2025-06-07 06:10:03'),
	(93, '2025-06-11', 'Rabu', '1', 'Pahing', 9, '2025-06-07 06:10:03', '2025-06-07 06:10:03'),
	(94, '2025-06-09', 'Senin', '2', 'Pahing', 9, '2025-06-07 06:10:03', '2025-06-07 06:10:03'),
	(95, '2025-06-07', 'Sabtu', 'Fulltime', 'Bandar', 6, '2025-06-08 02:21:44', '2025-06-08 02:21:44'),
	(96, '2025-06-07', 'Sabtu', 'Fulltime', 'Produksi', 9, '2025-06-08 02:21:44', '2025-06-08 02:21:44'),
	(97, '2025-06-07', 'Sabtu', 'Fulltime', 'Produksi', 5, '2025-06-08 02:32:46', '2025-06-08 02:32:46'),
	(98, '2025-06-10', 'Selasa', '1', 'Pahing', 6, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(99, '2025-06-11', 'Rabu', '1', 'Pahing', 6, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(100, '2025-06-12', 'Kamis', '1', 'Pahing', 6, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(101, '2025-06-13', 'Jumat', '1', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(102, '2025-06-14', 'Sabtu', '1', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(103, '2025-06-15', 'Minggu', '1', 'Pahing', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(104, '2025-06-09', 'Senin', '2', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(105, '2025-06-10', 'Selasa', '2', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(106, '2025-06-11', 'Rabu', '2', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(107, '2025-06-12', 'Kamis', '2', 'Pahing', 10, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(108, '2025-06-13', 'Jumat', '2', 'Pahing', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(109, '2025-06-14', 'Sabtu', '2', 'Pahing', 6, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(110, '2025-06-15', 'Minggu', '2', 'Pahing', 6, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(111, '2025-06-09', 'Senin', 'Fulltime', 'Bandar', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(112, '2025-06-10', 'Selasa', 'Fulltime', 'Bandar', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(113, '2025-06-11', 'Rabu', 'Fulltime', 'Bandar', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(114, '2025-06-12', 'Kamis', 'Fulltime', 'Bandar', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(115, '2025-06-13', 'Jumat', 'Fulltime', 'Bandar', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(116, '2025-06-14', 'Sabtu', 'Fulltime', 'Bandar', 11, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(117, '2025-06-15', 'Minggu', 'Fulltime', 'Bandar', 13, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(118, '2025-06-09', 'Senin', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(119, '2025-06-10', 'Selasa', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(120, '2025-06-11', 'Rabu', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(121, '2025-06-12', 'Kamis', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(122, '2025-06-13', 'Jumat', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(123, '2025-06-14', 'Sabtu', 'Fulltime', 'Balowerti', 13, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(124, '2025-06-15', 'Minggu', 'Fulltime', 'Balowerti', 12, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(125, '2025-06-09', 'Senin', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(126, '2025-06-10', 'Selasa', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(127, '2025-06-11', 'Rabu', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(128, '2025-06-12', 'Kamis', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(129, '2025-06-13', 'Jumat', 'Fulltime', 'Dlopo', 14, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(130, '2025-06-14', 'Sabtu', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(131, '2025-06-15', 'Minggu', 'Fulltime', 'Dlopo', 15, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(132, '2025-06-09', 'Senin', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(133, '2025-06-09', 'Senin', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(134, '2025-06-10', 'Selasa', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(135, '2025-06-10', 'Selasa', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(136, '2025-06-11', 'Rabu', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(137, '2025-06-11', 'Rabu', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(138, '2025-06-12', 'Kamis', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(139, '2025-06-13', 'Jumat', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(140, '2025-06-14', 'Sabtu', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(141, '2025-06-14', 'Sabtu', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(142, '2025-06-15', 'Minggu', 'Fulltime', 'Produksi', 5, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(143, '2025-06-15', 'Minggu', 'Fulltime', 'Produksi', 9, '2025-06-10 08:24:25', '2025-06-10 08:24:25'),
	(144, '2025-06-09', 'Senin', '1', 'Kurir', 16, '2025-06-11 09:05:35', '2025-06-11 09:05:35'),
	(145, '2025-06-11', 'Rabu', '1', 'Kurir', 16, '2025-06-11 09:05:35', '2025-06-11 09:05:35'),
	(399, '2025-06-16', 'Senin', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(400, '2025-06-17', 'Selasa', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(401, '2025-06-18', 'Rabu', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(402, '2025-06-19', 'Kamis', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(403, '2025-06-20', 'Jumat', '1', 'Pahing', 11, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(404, '2025-06-21', 'Sabtu', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(405, '2025-06-22', 'Minggu', '1', 'Pahing', 13, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(406, '2025-06-16', 'Senin', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(407, '2025-06-17', 'Selasa', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(408, '2025-06-18', 'Rabu', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(409, '2025-06-19', 'Kamis', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(410, '2025-06-20', 'Jumat', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(411, '2025-06-21', 'Sabtu', '2', 'Pahing', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(412, '2025-06-22', 'Minggu', '2', 'Pahing', 15, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(413, '2025-06-16', 'Senin', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(414, '2025-06-17', 'Selasa', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(415, '2025-06-18', 'Rabu', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(416, '2025-06-19', 'Kamis', 'Fulltime', 'Bandar', 21, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(417, '2025-06-20', 'Jumat', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(418, '2025-06-21', 'Sabtu', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(419, '2025-06-22', 'Minggu', 'Fulltime', 'Bandar', 10, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(420, '2025-06-16', 'Senin', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(421, '2025-06-17', 'Selasa', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(422, '2025-06-18', 'Rabu', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(423, '2025-06-19', 'Kamis', 'Fulltime', 'Balowerti', 11, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(424, '2025-06-20', 'Jumat', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(425, '2025-06-21', 'Sabtu', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(426, '2025-06-22', 'Minggu', 'Fulltime', 'Balowerti', 20, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(427, '2025-06-16', 'Senin', 'Fulltime', 'Dlopo', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(428, '2025-06-17', 'Selasa', 'Fulltime', 'Dlopo', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(429, '2025-06-18', 'Rabu', 'Fulltime', 'Dlopo', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(430, '2025-06-19', 'Kamis', 'Fulltime', 'Dlopo', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(431, '2025-06-20', 'Jumat', 'Fulltime', 'Dlopo', 21, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(432, '2025-06-21', 'Sabtu', 'Fulltime', 'Dlopo', 21, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(433, '2025-06-22', 'Minggu', 'Fulltime', 'Dlopo', 14, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(434, '2025-06-16', 'Senin', 'Fulltime', 'Mojoroto', 11, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(435, '2025-06-17', 'Selasa', 'Fulltime', 'Mojoroto', 11, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(436, '2025-06-18', 'Rabu', 'Fulltime', 'Mojoroto', 18, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(437, '2025-06-19', 'Kamis', 'Fulltime', 'Mojoroto', 18, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(438, '2025-06-20', 'Jumat', 'Fulltime', 'Mojoroto', 18, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(439, '2025-06-21', 'Sabtu', 'Fulltime', 'Mojoroto', 18, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(440, '2025-06-22', 'Minggu', 'Fulltime', 'Mojoroto', 11, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(441, '2025-06-16', 'Senin', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(442, '2025-06-17', 'Selasa', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(443, '2025-06-18', 'Rabu', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(444, '2025-06-19', 'Kamis', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(445, '2025-06-20', 'Jumat', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(446, '2025-06-21', 'Sabtu', 'Fulltime', 'Toko', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(447, '2025-06-22', 'Minggu', 'Fulltime', 'Toko', 6, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(448, '2025-06-16', 'Senin', 'Fulltime', 'Pesantren', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(449, '2025-06-17', 'Selasa', 'Fulltime', 'Pesantren', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(450, '2025-06-18', 'Rabu', 'Fulltime', 'Pesantren', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(451, '2025-06-19', 'Kamis', 'Fulltime', 'Pesantren', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(452, '2025-06-20', 'Jumat', 'Fulltime', 'Pesantren', 12, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(453, '2025-06-21', 'Sabtu', 'Fulltime', 'Pesantren', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(454, '2025-06-22', 'Minggu', 'Fulltime', 'Pesantren', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(455, '2025-06-16', 'Senin', 'Fulltime', 'Ngronggo', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(456, '2025-06-17', 'Selasa', 'Fulltime', 'Ngronggo', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(457, '2025-06-18', 'Rabu', 'Fulltime', 'Ngronggo', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(458, '2025-06-19', 'Kamis', 'Fulltime', 'Ngronggo', 22, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(459, '2025-06-20', 'Jumat', 'Fulltime', 'Ngronggo', 23, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(460, '2025-06-21', 'Sabtu', 'Fulltime', 'Ngronggo', 23, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(461, '2025-06-22', 'Minggu', 'Fulltime', 'Ngronggo', 23, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(462, '2025-06-16', 'Senin', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(463, '2025-06-17', 'Selasa', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(464, '2025-06-19', 'Kamis', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(465, '2025-06-20', 'Jumat', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(466, '2025-06-21', 'Sabtu', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(467, '2025-06-22', 'Minggu', '1', 'Kurir', 17, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(468, '2025-06-16', 'Senin', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(469, '2025-06-18', 'Rabu', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(470, '2025-06-19', 'Kamis', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(471, '2025-06-20', 'Jumat', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(472, '2025-06-21', 'Sabtu', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(473, '2025-06-22', 'Minggu', '2', 'Kurir', 16, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(474, '2025-06-16', 'Senin', 'Fulltime', 'Produksi', 9, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(475, '2025-06-17', 'Selasa', 'Fulltime', 'Produksi', 9, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(476, '2025-06-18', 'Rabu', 'Fulltime', 'Produksi', 9, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(477, '2025-06-19', 'Kamis', 'Fulltime', 'Produksi', 19, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(478, '2025-06-20', 'Jumat', 'Fulltime', 'Produksi', 9, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(479, '2025-06-21', 'Sabtu', 'Fulltime', 'Produksi', 9, '2025-06-19 15:21:52', '2025-06-19 15:21:52'),
	(480, '2025-06-22', 'Minggu', 'Fulltime', 'Produksi', 5, '2025-06-19 15:21:52', '2025-06-19 15:21:52');

-- Dumping structure for table api/berrys.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.jobs: ~0 rows (approximately)

-- Dumping structure for table api/berrys.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.job_batches: ~0 rows (approximately)

-- Dumping structure for table api/berrys.karyawan
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jen_kel` enum('P','L') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `karyawan_nik_unique` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.karyawan: ~17 rows (approximately)
REPLACE INTO `karyawan` (`id`, `nik`, `nama`, `alamat`, `tanggal_lahir`, `jen_kel`, `no_tlp`, `role`, `tanggal_masuk`, `status`, `username`, `password`, `created_at`, `updated_at`) VALUES
	(4, '34126671890017', 'Virnanda Elsa', 'Banaran', '2001-03-15', 'P', NULL, 'Toko', '2025-03-01', 'Tidak Aktif', 'virnandaelsa', '$2y$12$8BJk5V0gQRS5wkc7Y.56j.PfkPfz6Z4Xiiw6Bwzr12khHZcz3C8Nm', '2025-02-28 20:44:18', '2025-06-19 14:22:14'),
	(5, '3571907826115278', 'Permata Sari', 'Kediri', '1995-04-29', 'P', '088116256542', 'Produksi', '2022-04-28', 'Aktif', 'permatasari', '$2y$12$yDfYD.Aw.9scssXGb3PSteytghLcjLP80QZsb.SZZcrFTRWgSx0JS', '2025-04-28 06:54:46', '2025-06-10 08:21:30'),
	(6, '337166281001', 'Riana', 'Banjaran', '2005-05-23', 'P', '088156352684', 'Toko', '2024-05-03', 'Aktif', 'riana', '$2y$12$VJthHoWRUcYBQu.jiKPMn.cseznUWYAMJ9u4KdibgfOwVZd2sdYMi', '2025-05-03 07:57:02', '2025-06-19 14:02:27'),
	(7, '667509987346', 'Dian Kusuma', 'Balowerti', '2025-05-10', 'L', NULL, 'Produksi', '2025-05-08', 'Tidak Aktif', 'diankusuma', '$2y$12$GcZQT.DE/kfUlkVsVKZVIuEbibsvwfcFWWskhCFPAURRoShF26.QO', '2025-05-03 08:39:33', '2025-05-31 02:57:58'),
	(8, '6155201982771', 'Aldi', 'pesantren', '2025-04-27', 'L', NULL, 'Produksi', '2025-05-03', 'Tidak Aktif', 'aldi', '$2y$12$mosbCBRUscQTpOCnDSwN2uNnb/r7b2vDaWnMpETyjrtuzzVeVhVNu', '2025-05-03 08:40:34', '2025-05-31 02:57:50'),
	(9, '13333333333333333', 'Putri Sevira', 'Pesantren', '2004-08-23', 'P', NULL, 'Produksi', '2023-08-07', 'Aktif', 'putrisevira', '$2y$12$wZvKtrfJu7ZKwAjujLOGbOlYPqK2X.1dXhYWIjsI/fqafRogiqFpC', '2025-06-07 06:05:17', '2025-06-07 07:40:52'),
	(10, '3571895665467943', 'Nabilla Syafira', 'Bangsal, Pesantren', '2003-04-01', 'P', '0885875432112', 'Penjaga Stand', '2023-06-04', 'Aktif', 'nabillasyafira', '$2y$12$jx7HHMwoxY/mKnXm76Ru/.jJlaB3BwOkbGuCAFdGocaF1WWAJ/tVu', '2025-06-10 08:00:03', '2025-06-10 08:00:03'),
	(11, '3571994322678905', 'Laila Amalia', 'Mojoroto Gang 5', '1995-01-28', 'P', '08134522345', 'Penjaga Stand', '2023-11-12', 'Aktif', 'lailaamalia', '$2y$12$GhaKfgyFmQ0YM5rPjwOuWuqrzuqPcmZbBFWbEchR9qLb5VUdbd7C6', '2025-06-10 08:04:43', '2025-06-10 08:04:43'),
	(12, '3571324508734211', 'Ratna Puspita', 'Tinalan Gang 1', '2002-07-21', 'P', '087764325466', 'Penjaga Stand', '2024-08-19', 'Aktif', 'ratnapuspita', '$2y$12$GEbmqaADLZMmKVE3kBsk9uJXIcqDgEwvqUq6Cy0wQeK1EtAkKEVXG', '2025-06-10 08:15:21', '2025-06-10 08:15:21'),
	(13, '3571099854376512', 'Putri Yunita Sari', 'Blabak', '1999-05-01', 'P', '088154325489', 'Penjaga Stand', '2024-12-03', 'Aktif', 'putriyunitasari', '$2y$12$hXO66h6Yk3hlSGSkki66qOGC7ORobryzESvt9JwvAfOi6o8oZw9M6', '2025-06-10 08:17:11', '2025-06-10 08:17:11'),
	(14, '3571099854376543', 'Tria Ajeng', 'Pakunden, Kota Kediri', '1998-12-20', 'P', '086432665789', 'Penjaga Stand', '2024-04-01', 'Aktif', 'triaajeng', '$2y$12$bgbs5uzUY/FFILfvjNbT7evkj7tIDtnPvyNvwZfXDb.u9yiUJzdzu', '2025-06-10 08:19:07', '2025-06-19 14:02:08'),
	(15, '3571099854376552', 'Dina Aprilia', 'Pocanan', '1997-07-01', 'P', '08532155469', 'Penjaga Stand', '2024-06-01', 'Aktif', 'dinaaprilia', '$2y$12$DONMiFxM0QWAkCIUXzzQHe1V0Pvch5HFe.2Ru6DqAKWFChTB/XxQm', '2025-06-10 08:20:46', '2025-06-19 14:01:50'),
	(16, '3571076554387620', 'Ferdinan Rizky', 'Banaran, Pesantren', '2000-04-01', 'L', '088290542714', 'Kurir', '2025-01-15', 'Aktif', 'ferdinanrizky', '$2y$12$8AJ0lIa7RvcE0y1baUtlluYiM4KRiOB6gbDyTBeRoaScEgtgn309S', '2025-06-10 18:36:38', '2025-06-19 14:10:22'),
	(17, '3571082567815625', 'Doni Irawan', 'Burengan, Pesantren', '1996-08-24', 'L', '081765998754', 'Kurir', '2024-02-15', 'Aktif', 'doniirawan', '$2y$12$OUlM/343HjTZF6cVYwfSqO11BlOFPFZt5Iyk4/fPsMngShux4ulMq', '2025-06-10 18:39:26', '2025-06-19 14:06:26'),
	(18, '2231436655468913', 'Adelia Kusuma', 'Banaran, Pesantren', '2005-10-01', 'P', '08611237542', 'Penjaga Stand', '2024-04-04', 'Aktif', 'adeliakusuma', '$2y$12$IX61YOswnvR1uGhf0YtPOu8OLOLiEpaMlNzraXjY5L8/Yckl7YcDC', '2025-06-19 14:00:57', '2025-06-19 14:00:57'),
	(19, '3571076554387432', 'Wahyu Irawan', 'Kresek, Wates', '1997-02-02', 'L', '081623886142', 'Produksi', '2022-05-07', 'Aktif', 'wahyuirawan', '$2y$12$D93SByzNCzASHVpTRLeFoOrtuGHIBCP0nDmdGaNLldk8112tSiwHm', '2025-06-19 14:32:32', '2025-06-19 14:32:32'),
	(20, '3571907826115254', 'Lameila Yulia', 'Blabak Kota, Kota Kediri', '2001-03-04', 'P', '085439971166', 'Penjaga Stand', '2023-06-04', 'Aktif', 'lameilayulia', '$2y$12$QWhF4xHNEwxjQr3rGgAgVe14Qgt.SqrGhCyslffswAdFfaqwrfoNq', '2025-06-19 14:35:00', '2025-06-19 14:35:00'),
	(21, '3571907826115200', 'Sabina Aulia', 'Bence RT 22 RW 7', '2003-11-24', 'P', '081623886141', 'Penjaga Stand', '2024-04-10', 'Aktif', 'sabinaaulia', '$2y$12$CYawGWKfCbcfBkwd5M.dY.voCG4O.2jqiWaNvhTgy4qh3MzfEZZfO', '2025-06-19 14:38:09', '2025-06-19 14:38:09'),
	(22, '3571907826115243', 'Risa Tia', 'Ngronggo RT 6 RW 12', '2000-06-30', 'P', '081626546141', 'Penjaga Stand', '2023-06-30', 'Aktif', 'risatia', '$2y$12$J6a2vkHTlGcrY2wj7KYthOp/Z5Ce2x.AdZ0y.GVEGbaomzia8wY5y', '2025-06-19 15:18:46', '2025-06-19 15:18:46'),
	(23, '3571907825609278', 'Fia Sari', 'Tinalan Gg 1, Kec. Kota', '2004-05-30', 'P', '085439975432', 'Penjaga Stand', '2024-08-26', 'Aktif', 'fiasari', '$2y$12$Wp28FVseUDg6oO9jSdmbmuV/XBkOCgll79ZGVKywBRSaYWSI5BNC2', '2025-06-19 15:21:30', '2025-06-19 15:21:30');

-- Dumping structure for table api/berrys.laporan
CREATE TABLE IF NOT EXISTS `laporan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `omset` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fisik` decimal(15,2) NOT NULL DEFAULT '0.00',
  `pengeluaran` decimal(15,2) NOT NULL DEFAULT '0.00',
  `stok_bomboloni` int NOT NULL DEFAULT '0',
  `stok_bolong` int NOT NULL DEFAULT '0',
  `stok_salju` int NOT NULL DEFAULT '0',
  `kelengkapan` text COLLATE utf8mb4_unicode_ci,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laporan_id_jadwal_foreign` (`id_jadwal`),
  CONSTRAINT `laporan_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.laporan: ~10 rows (approximately)
REPLACE INTO `laporan` (`id`, `id_jadwal`, `tanggal`, `omset`, `fisik`, `pengeluaran`, `stok_bomboloni`, `stok_bolong`, `stok_salju`, `kelengkapan`, `catatan`, `created_at`, `updated_at`) VALUES
	(3, 23, '2025-04-28', 100000.00, 200000.00, 3000.00, 15, 12, 0, 'Meses habis', NULL, '2025-04-28 07:04:47', '2025-04-28 07:04:47'),
	(4, 79, '2025-05-12', 0.00, 0.00, 0.00, 0, 0, 0, NULL, 'Bomboloni sold (tulis 0)\nBolong sold (tulis 0)\nSalju sold (tulis 0)', '2025-05-12 09:10:08', '2025-05-12 09:10:08'),
	(5, 80, '2025-05-13', 100000.00, 90000.00, 10000.00, 5, 2, 1, 'Filling coklat\nFilling durian\nMeses\nBox isi 6', 'Pengeluaran Kebersihan', '2025-05-13 02:26:47', '2025-05-13 02:26:47'),
	(6, 89, '2025-06-08', 200000.00, 220000.00, 20000.00, 0, 0, 0, NULL, NULL, '2025-06-08 02:41:58', '2025-06-08 02:41:58'),
	(8, 91, '2025-06-09', 200000.00, 200000.00, 0.00, 0, 0, 0, NULL, NULL, '2025-06-09 00:24:01', '2025-06-09 00:24:01'),
	(9, 99, '2025-06-11', 200000.00, 200000.00, 0.00, 0, 0, 0, 'Filling coklat habis', 'omset termasuk uang donat art', '2025-06-10 19:36:47', '2025-06-10 19:36:47'),
	(10, 106, '2025-06-11', 210000.00, 200000.00, 10000.00, 10, 5, 0, NULL, NULL, '2025-06-11 08:56:46', '2025-06-11 08:56:46'),
	(11, 121, '2025-06-12', 100000.00, 125000.00, 0.00, 20, 30, 0, 'Filling Tiramisu Habis\nFilling Blueberry Habis', 'Fisik termasuk uang donat Art kak Dita', '2025-06-11 17:23:07', '2025-06-11 17:23:07'),
	(12, 100, '2025-06-12', 150000.00, 150000.00, 0.00, 10, 25, 0, NULL, NULL, '2025-06-12 14:16:51', '2025-06-12 14:16:51'),
	(13, 107, '2025-06-12', 210000.00, 210000.00, 0.00, 15, 5, 0, NULL, NULL, '2025-06-12 14:21:12', '2025-06-12 14:21:12');

-- Dumping structure for table api/berrys.laporan_datang
CREATE TABLE IF NOT EXISTS `laporan_datang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `donat_bombo` int NOT NULL,
  `donat_bolong` int NOT NULL,
  `donat_salju` int NOT NULL,
  `kelengkapan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laporan_datang_id_jadwal_foreign` (`id_jadwal`),
  CONSTRAINT `laporan_datang_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.laporan_datang: ~8 rows (approximately)
REPLACE INTO `laporan_datang` (`id`, `id_jadwal`, `tanggal`, `donat_bombo`, `donat_bolong`, `donat_salju`, `kelengkapan`, `catatan`, `created_at`, `updated_at`) VALUES
	(1, 20, '2025-04-27', 12, 15, 20, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-04-27 08:18:26', '2025-04-27 08:18:26'),
	(2, 23, '2025-04-28', 15, 30, 25, 'Filling Coklat', 'Tidak ada catatan', '2025-04-28 07:01:15', '2025-04-28 07:01:15'),
	(3, 53, '2025-05-08', 2, 2, 2, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-05-08 04:20:46', '2025-05-08 04:20:46'),
	(4, 79, '2025-05-12', 26, 25, 30, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-05-12 08:55:24', '2025-05-12 08:55:24'),
	(5, 80, '2025-05-13', 28, 26, 30, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-05-13 02:25:17', '2025-05-13 02:25:17'),
	(6, 89, '2025-06-08', 50, 30, 25, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-06-08 02:34:07', '2025-06-08 02:34:07'),
	(7, 91, '2025-06-09', 20, 55, 25, 'Filling coklat', 'Tidak ada catatan', '2025-06-08 22:27:08', '2025-06-08 22:27:08'),
	(8, 99, '2025-06-11', 20, 20, 25, 'Filling Coklat', 'Dibawa kurir 30 pcs bomboloni', '2025-06-10 19:33:49', '2025-06-10 19:33:49'),
	(9, 106, '2025-06-11', 23, 20, 25, 'Filling coklat habis\nFilling keju habis', NULL, '2025-06-11 08:55:21', '2025-06-11 08:55:21'),
	(10, 121, '2025-06-12', 60, 60, 25, 'Filling Coklat Habis\nMeses Habis\nKeju Parut Habis', NULL, '2025-06-11 17:14:21', '2025-06-11 17:14:21'),
	(11, 100, '2025-06-12', 30, 30, 0, NULL, NULL, '2025-06-12 14:16:12', '2025-06-12 14:16:12'),
	(12, 107, '2025-06-12', 25, 25, 50, NULL, NULL, '2025-06-12 14:18:01', '2025-06-12 14:18:01');

-- Dumping structure for table api/berrys.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.migrations: ~11 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_02_26_153259_create_karyawans_table', 1),
	(5, '2025_02_26_153300_create_jadwals_table', 1),
	(6, '2025_02_26_153302_create_absensis_table', 1),
	(7, '2025_02_26_153303_create_cutis_table', 1),
	(8, '2025_02_26_153303_create_penggajians_table', 1),
	(9, '2025_02_26_153304_create_gajis_table', 1),
	(10, '2025_02_26_153429_create_personal_access_tokens_table', 1),
	(11, '2025_02_26_153636_create_karyawans_table', 2),
	(12, '2025_03_01_033135_add_tanggal_masuk_status_to_karyawan', 3),
	(13, '2025_03_02_083032_create_gajis_table', 4),
	(14, '2025_03_02_085448_create_jadwals_table', 5),
	(15, '2025_03_07_074710_create_cuti_tablen', 6),
	(16, '2025_03_07_080459_add_status_to_cuti', 7),
	(17, '2025_03_08_085252_update_status_enum_in_cuti_table', 8),
	(18, '2025_03_09_141621_create_table_penjualan', 9),
	(19, '2025_03_09_142213_create_table_stok', 10),
	(20, '2025_03_31_125803_add_photo_to_absensi_table', 11),
	(21, '2025_04_07_153614_add_fields_to_absensi_table', 12),
	(22, '2025_04_16_150856_create_table_penggajian', 13),
	(23, '2025_04_22_062906_create_pendapatan_stand_table', 14),
	(24, '2025_04_22_063113_create_penjualan_table', 14),
	(25, '2025_04_22_063141_create_stok_table', 14),
	(26, '2025_04_22_133231_create_laporan_datang_table', 15),
	(27, '2025_04_25_110928_create_edit_gaji_table', 16),
	(28, '2025_04_25_114751_add_jenis_to_edit_gaji_table', 17),
	(29, '2025_04_26_093906_create_rekap_gaji_bulanan_table', 18),
	(30, '2025_04_27_061114_create_laporan_pulang_table', 19),
	(31, '2025_04_27_062836_create_stok_datang_table', 20),
	(32, '2025_04_27_163231_add_omset_sistem_to_pendapatan_table', 21),
	(33, '2025_05_05_145145_create_owners_table', 22),
	(34, '2025_06_08_084701_add_no_tlp_to_karyawan_table', 23);

-- Dumping structure for table api/berrys.owner
CREATE TABLE IF NOT EXISTS `owner` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_username_unique` (`username`),
  UNIQUE KEY `owner_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.owner: ~0 rows (approximately)
REPLACE INTO `owner` (`id`, `nama`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'Berrys Bakery', 'berrysbakery', 'owner@berrysbakery.com', '$2y$12$1iIbwxSGWdqaKV5aTbsoouUckpWASwAMDQ20tZWREXBI0q9YHWhOS', '2025-05-06 06:59:33', '2025-05-06 06:59:33');

-- Dumping structure for table api/berrys.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table api/berrys.pendapatan
CREATE TABLE IF NOT EXISTS `pendapatan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `omset` decimal(15,2) NOT NULL,
  `omset_sistem` decimal(15,2) NOT NULL,
  `fisik` decimal(15,2) DEFAULT NULL,
  `pengeluaran` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pendapatan_id_jadwal_foreign` (`id_jadwal`),
  CONSTRAINT `pendapatan_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.pendapatan: ~10 rows (approximately)
REPLACE INTO `pendapatan` (`id`, `id_jadwal`, `tanggal`, `omset`, `omset_sistem`, `fisik`, `pengeluaran`, `created_at`, `updated_at`) VALUES
	(1, 23, '2025-04-28', 100000.00, 535300.00, 200000.00, 3000.00, '2025-04-28 07:04:47', '2025-04-28 07:04:47'),
	(2, 79, '2025-05-12', 0.00, 335400.00, 0.00, 0.00, '2025-05-12 09:10:08', '2025-05-12 09:10:08'),
	(3, 80, '2025-05-13', 100000.00, 112900.00, 90000.00, 10000.00, '2025-05-13 02:26:47', '2025-05-13 02:26:47'),
	(4, 89, '2025-06-08', 200000.00, 180000.00, 220000.00, 20000.00, '2025-06-08 02:41:58', '2025-06-08 02:41:58'),
	(6, 91, '2025-06-09', 200000.00, 175000.00, 200000.00, 0.00, '2025-06-09 00:24:01', '2025-06-09 00:24:01'),
	(7, 99, '2025-06-11', 200000.00, 525000.00, 200000.00, 0.00, '2025-06-10 19:36:47', '2025-06-10 19:36:47'),
	(8, 106, '2025-06-11', 210000.00, 307500.00, 200000.00, 10000.00, '2025-06-11 08:56:46', '2025-06-11 08:56:46'),
	(9, 121, '2025-06-12', 100000.00, 325000.00, 125000.00, 0.00, '2025-06-11 17:23:07', '2025-06-11 17:23:07'),
	(10, 100, '2025-06-12', 150000.00, 285000.00, 150000.00, 0.00, '2025-06-12 14:16:51', '2025-06-12 14:16:51'),
	(11, 107, '2025-06-12', 210000.00, 210000.00, 210000.00, 0.00, '2025-06-12 14:21:12', '2025-06-12 14:21:12');

-- Dumping structure for table api/berrys.penggajian
CREATE TABLE IF NOT EXISTS `penggajian` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint unsigned NOT NULL,
  `total_jam` int NOT NULL,
  `gaji_per_jam` int NOT NULL,
  `total_gaji` int NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penggajian_id_karyawan_foreign` (`id_karyawan`),
  CONSTRAINT `penggajian_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.penggajian: ~11 rows (approximately)
REPLACE INTO `penggajian` (`id`, `id_karyawan`, `total_jam`, `gaji_per_jam`, `total_gaji`, `tanggal`, `created_at`, `updated_at`) VALUES
	(2, 4, 0, 4000, 958, '2025-04-16', '2025-04-16 10:08:13', '2025-04-16 10:08:13'),
	(3, 4, 0, 4000, 108, '2025-04-26', '2025-04-26 08:47:50', '2025-04-26 08:47:50'),
	(4, 4, 0, 4000, 1378, '2025-04-27', '2025-04-26 21:15:01', '2025-04-26 21:15:01'),
	(5, 6, 1, 4000, 2576, '2025-05-12', '2025-05-12 09:33:09', '2025-05-12 09:33:09'),
	(6, 5, 9, 5000, 45000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(7, 6, 9, 4000, 36000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(8, 9, 9, 5000, 45000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(9, 10, 9, 4000, 36000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(10, 11, 9, 4000, 36000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(11, 12, 9, 4000, 36000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(12, 13, 9, 4000, 36000, '2025-06-10', '2025-06-10 16:15:54', '2025-06-10 16:15:54'),
	(13, 6, 2, 4000, 7117, '2025-06-11', '2025-06-10 19:27:58', '2025-06-10 19:27:58'),
	(14, 10, 0, 4000, 7, '2025-06-11', '2025-06-11 09:52:57', '2025-06-11 09:52:57'),
	(15, 5, 0, 5000, 292, '2025-06-11', '2025-06-11 09:54:02', '2025-06-11 09:54:02'),
	(16, 6, 0, 4000, 1777, '2025-06-12', '2025-06-12 14:37:14', '2025-06-12 14:37:14');

-- Dumping structure for table api/berrys.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.personal_access_tokens: ~183 rows (approximately)
REPLACE INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'BerrysBakery', '4be3d7c68aee8cdd9e4e9ba34fdb370f4e2c76c011b70f636fbad3e24b625c9c', '["*"]', NULL, NULL, '2025-02-26 09:48:54', '2025-02-26 09:48:54'),
	(2, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3564e6240d9c2a5c528b028debb0ac8e784b1ead4142f34860cd0a0583753662', '["*"]', NULL, NULL, '2025-05-05 08:23:22', '2025-05-05 08:23:22'),
	(3, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3e97f55843e5958873577d23be0427c0a1a61226df25a4c25d9a1fa22a4ca7b8', '["*"]', NULL, NULL, '2025-05-05 08:24:13', '2025-05-05 08:24:13'),
	(4, 'App\\Models\\Karyawan', 6, 'karyawan-token', '8f44e184741617bb33a3d9f79ed131217a0367a9231b536c1d3cde8555f357ea', '["*"]', NULL, NULL, '2025-05-05 08:31:22', '2025-05-05 08:31:22'),
	(5, 'App\\Models\\Owner', 1, 'owner-token', '073457e04ab6f8708d91ec425a2327d3d0535b0ca2eeb418fe701700acde56ae', '["*"]', NULL, NULL, '2025-05-06 07:07:41', '2025-05-06 07:07:41'),
	(6, 'App\\Models\\Owner', 1, 'owner-token', '10b708c48dbc2035c5e35b03d6a3796b780356864b1013bf3dce46dfb9e17073', '["*"]', NULL, NULL, '2025-05-06 07:08:57', '2025-05-06 07:08:57'),
	(7, 'App\\Models\\Owner', 1, 'owner-token', 'fa2c4489aff95da691dc77f7dd21c1d2a1fbb81ba20d230ebceaf0f00a61818a', '["*"]', NULL, NULL, '2025-05-07 02:32:20', '2025-05-07 02:32:20'),
	(8, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5305628b394555fb46731b19e92cdc55827dab383f02479baef2783528b06598', '["*"]', NULL, NULL, '2025-05-07 03:15:02', '2025-05-07 03:15:02'),
	(9, 'App\\Models\\Owner', 1, 'owner-token', 'a187d7c69c179d337936a623d4e44d7e7851d785e68b9d6176a772cecca2141b', '["*"]', NULL, NULL, '2025-05-07 03:17:20', '2025-05-07 03:17:20'),
	(10, 'App\\Models\\Owner', 1, 'owner-token', '03278dec06a48b544c3e63b0ef2af69fe2fbf895d451a26542d64c252f6aedea', '["*"]', NULL, NULL, '2025-05-07 03:18:25', '2025-05-07 03:18:25'),
	(11, 'App\\Models\\Owner', 1, 'owner-token', 'ff227f31c5a5a651c750320673cc3808491dc5f468042d0a6ac5f714b9a09fbc', '["*"]', NULL, NULL, '2025-05-07 03:53:30', '2025-05-07 03:53:30'),
	(12, 'App\\Models\\Owner', 1, 'owner-token', 'c636c6e8d0aba767d50057adafc6f816376d636f0cb8f4a66766f70435edcbce', '["*"]', NULL, NULL, '2025-05-07 03:54:51', '2025-05-07 03:54:51'),
	(13, 'App\\Models\\Owner', 1, 'owner-token', '04ebcc2e7fa711588bdb5b873213bfa3420516daf6d3b91ba53c5f9c2dfd2161', '["*"]', NULL, NULL, '2025-05-07 04:07:43', '2025-05-07 04:07:43'),
	(14, 'App\\Models\\Owner', 1, 'owner-token', 'dcfe6b84d57836bbd896e063592911cbe7960a1a59f53600b19ad36afab829f9', '["*"]', NULL, NULL, '2025-05-07 04:09:36', '2025-05-07 04:09:36'),
	(15, 'App\\Models\\Owner', 1, 'owner-token', 'cedd76ce09da556b2522fad9a60e63c3ca0fd3eb30da2a60b38dd2ae91e7e206', '["*"]', NULL, NULL, '2025-05-07 04:17:48', '2025-05-07 04:17:48'),
	(16, 'App\\Models\\Owner', 1, 'owner-token', '233684c10108dfe25ab51b7bf79917e7731345cbed02d17e77afe6b05fb87917', '["*"]', NULL, NULL, '2025-05-07 04:22:44', '2025-05-07 04:22:44'),
	(17, 'App\\Models\\Owner', 1, 'owner-token', 'd1510f5249034a13ca867cc231f9b504947cb62c75b8f80273c5a02faf2fbc1a', '["*"]', NULL, NULL, '2025-05-07 04:26:33', '2025-05-07 04:26:33'),
	(18, 'App\\Models\\Owner', 1, 'owner-token', '45a5e9d0b1a619770bd1003ce59ebe14555123ada5c01ccfe2d01ce3eb0c43fd', '["*"]', NULL, NULL, '2025-05-07 04:34:01', '2025-05-07 04:34:01'),
	(19, 'App\\Models\\Owner', 1, 'owner-token', '8528a590b144aec30dd6cb5edb5ed7357a3049dabe9920c9bdb47d82436aea69', '["*"]', NULL, NULL, '2025-05-07 06:40:12', '2025-05-07 06:40:12'),
	(20, 'App\\Models\\Owner', 1, 'owner-token', '94097546c23c49d164df4d2c758abc8d7d97976df2ee531b870e211b75bbdf1c', '["*"]', NULL, NULL, '2025-05-07 06:53:52', '2025-05-07 06:53:52'),
	(21, 'App\\Models\\Owner', 1, 'owner-token', '45396052221aabfde0ab44162b2f6aa6a2bd5193beacb92b0705cfbb01cfd9c2', '["*"]', NULL, NULL, '2025-05-07 06:57:47', '2025-05-07 06:57:47'),
	(22, 'App\\Models\\Owner', 1, 'owner-token', 'aa84a91c8c83fb3a22c44934b8e7949520663fde6c316ebec2c984d74dd14be2', '["*"]', NULL, NULL, '2025-05-07 07:30:13', '2025-05-07 07:30:13'),
	(23, 'App\\Models\\Owner', 1, 'owner-token', '85c2bc20527a002d99bfdc1d8376d008b9356606c495f6a889f85f8c711c4cdf', '["*"]', NULL, NULL, '2025-05-07 08:16:50', '2025-05-07 08:16:50'),
	(24, 'App\\Models\\Owner', 1, 'owner-token', '01c05673b578cb76aaef439efabe83628d20d22b300b5bb8634e89bafcb1d5e5', '["*"]', NULL, NULL, '2025-05-07 08:17:04', '2025-05-07 08:17:04'),
	(25, 'App\\Models\\Owner', 1, 'owner-token', 'd8cb40d8c868f9beadbe93294dbf5d0d33f729ee03a1e08df5cee4540f3ebb64', '["*"]', NULL, NULL, '2025-05-07 08:18:31', '2025-05-07 08:18:31'),
	(26, 'App\\Models\\Owner', 1, 'owner-token', 'aec567f769df558e299b4ea5699a7948ea83a3d149207ce649b01bb1ac5e4942', '["*"]', NULL, NULL, '2025-05-07 08:20:12', '2025-05-07 08:20:12'),
	(27, 'App\\Models\\Owner', 1, 'owner-token', '6afb4d18a796772d87066894eee7307a83b1e4e9e4134dc725f08a0d4622f539', '["*"]', NULL, NULL, '2025-05-07 08:23:41', '2025-05-07 08:23:41'),
	(28, 'App\\Models\\Owner', 1, 'owner-token', '2b3964707f0809e7b8ae7552346bffce3aa9a7c63d7221e711058c1614f7791f', '["*"]', NULL, NULL, '2025-05-07 08:27:08', '2025-05-07 08:27:08'),
	(29, 'App\\Models\\Owner', 1, 'owner-token', 'd5af51b911c79950c20558f769644081bee2b08da226109d3b7438bca9d00c35', '["*"]', NULL, NULL, '2025-05-07 08:31:07', '2025-05-07 08:31:07'),
	(30, 'App\\Models\\Owner', 1, 'owner-token', '7d751636283dae73187988d078d34888813a89d54a9ce3df85de037742f3a337', '["*"]', NULL, NULL, '2025-05-07 08:33:53', '2025-05-07 08:33:53'),
	(31, 'App\\Models\\Owner', 1, 'owner-token', 'dafb28470b2b962be8503f4dd22ef52b34dab7d829c1d67118724d136ebb0f49', '["*"]', NULL, NULL, '2025-05-07 08:34:44', '2025-05-07 08:34:44'),
	(32, 'App\\Models\\Owner', 1, 'owner-token', 'c1941b8f49aa4fa99b4820fe777cbc37c5b5ed2f5132ec9585145c08973550dc', '["*"]', NULL, NULL, '2025-05-07 08:35:41', '2025-05-07 08:35:41'),
	(33, 'App\\Models\\Owner', 1, 'owner-token', '1dead0463a8c0f157cd286f7b021f1f3014888da40beb75780f5c3ed45511011', '["*"]', NULL, NULL, '2025-05-07 08:40:27', '2025-05-07 08:40:27'),
	(34, 'App\\Models\\Owner', 1, 'owner-token', 'bbb785bc713df7b07d0cae524309d0d655b76f465e524224c4344819b476dd6b', '["*"]', NULL, NULL, '2025-05-07 08:44:03', '2025-05-07 08:44:03'),
	(35, 'App\\Models\\Owner', 1, 'owner-token', '85df2f2b880894e9c4b7c82c9f2e1638a5efe80a4cd8abdfe4049926fd88e648', '["*"]', NULL, NULL, '2025-05-07 08:45:57', '2025-05-07 08:45:57'),
	(36, 'App\\Models\\Owner', 1, 'owner-token', 'c31a7447a995aeaaa033e558c555ea1fa17cf1e8e05e5d0b8bc8cc231da04b3b', '["*"]', NULL, NULL, '2025-05-07 08:47:46', '2025-05-07 08:47:46'),
	(37, 'App\\Models\\Owner', 1, 'owner-token', '8aba55bdc4ab2f5578c8b7eedf4fd5f106988c55da9a2f7ea4a2a4308c34015f', '["*"]', NULL, NULL, '2025-05-07 08:47:59', '2025-05-07 08:47:59'),
	(38, 'App\\Models\\Owner', 1, 'owner-token', '039205acdb16c419eed2af384cda2bba32841b866d3281d93b2e9b0f285b6707', '["*"]', NULL, NULL, '2025-05-07 09:00:04', '2025-05-07 09:00:04'),
	(39, 'App\\Models\\Owner', 1, 'owner-token', '2b1c31622007a3df90a733dc1131902971a75b8916f9187a8a6d3b0a423b563c', '["*"]', NULL, NULL, '2025-05-07 09:04:08', '2025-05-07 09:04:08'),
	(40, 'App\\Models\\Karyawan', 6, 'karyawan-token', '54aff6bbdd956f1dfae6a6648103f77b038844f46b405f271b4d1f33aed5dc58', '["*"]', NULL, NULL, '2025-05-07 09:12:03', '2025-05-07 09:12:03'),
	(41, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'b79a43ce3af942d4dade5a09c1b53dcdfaa3c504fb4501125e1dac2787c04867', '["*"]', NULL, NULL, '2025-05-07 09:12:28', '2025-05-07 09:12:28'),
	(42, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'd8bfc72563fef611356b1cd9fb8dfd1964db7ec792ebbd0323ff38e48f8121eb', '["*"]', NULL, NULL, '2025-05-07 09:15:26', '2025-05-07 09:15:26'),
	(43, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5d07af59209b4c621e755e263ff31828aac98e16932eb8abdec34976cbd719d5', '["*"]', NULL, NULL, '2025-05-07 09:20:18', '2025-05-07 09:20:18'),
	(44, 'App\\Models\\Karyawan', 6, 'karyawan-token', '28bdf26784e03158c75bcce3fb4e016c24c3929369c9a4b07114f7925b9aed03', '["*"]', NULL, NULL, '2025-05-07 09:25:51', '2025-05-07 09:25:51'),
	(45, 'App\\Models\\Karyawan', 6, 'karyawan-token', '781c1366c0be9b6851016ee8e6dbe277cc97802db6f4e2d1d5249107af67c92a', '["*"]', NULL, NULL, '2025-05-07 09:29:23', '2025-05-07 09:29:23'),
	(46, 'App\\Models\\Karyawan', 6, 'karyawan-token', '993291f34f265058691e01240a0d53f23072ce770857f16e9a58f25dcd74c18f', '["*"]', NULL, NULL, '2025-05-07 09:32:02', '2025-05-07 09:32:02'),
	(47, 'App\\Models\\Karyawan', 6, 'karyawan-token', '70ae6a5f7639fc62cf13f5628384176131847d7697790b80221475d0320f99d8', '["*"]', NULL, NULL, '2025-05-07 09:34:47', '2025-05-07 09:34:47'),
	(48, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'd89fe612fd29701e4c1efbf4a073e2ff28d51993ac33f4a00b16bc31173c48d2', '["*"]', NULL, NULL, '2025-05-07 09:36:12', '2025-05-07 09:36:12'),
	(49, 'App\\Models\\Karyawan', 6, 'karyawan-token', '877e96b4a07bdff1184c8cbc26ee62eec5da334e47d79730e6ac1db4b29e326a', '["*"]', NULL, NULL, '2025-05-07 09:38:39', '2025-05-07 09:38:39'),
	(50, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'cb25986775a7086096ca0da930f40d1dc4eacc11f64fbaac1e0399f88c4a9f06', '["*"]', NULL, NULL, '2025-05-07 09:39:29', '2025-05-07 09:39:29'),
	(51, 'App\\Models\\Karyawan', 4, 'karyawan-token', 'b40a3f5dfa262d3f3ac01ac62d476701e9b193bd59545d39c2b51d922b016d2d', '["*"]', NULL, NULL, '2025-05-07 09:41:05', '2025-05-07 09:41:05'),
	(52, 'App\\Models\\Owner', 1, 'owner-token', '694622740adfc93c309fd21b50fa7dd957750c9809ebb0c0477fe4aa1f6c56bb', '["*"]', NULL, NULL, '2025-05-08 00:17:37', '2025-05-08 00:17:37'),
	(53, 'App\\Models\\Owner', 1, 'owner-token', '9881e21a6dbbc7c45506325f8cdcc21a90a9ca298e1dd719af95fccd4b5d4a4b', '["*"]', NULL, NULL, '2025-05-08 03:21:54', '2025-05-08 03:21:54'),
	(54, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'd1026d2eb26f70c051ea1d87256ee17aeeeaae8be869eff090090204386650ca', '["*"]', NULL, NULL, '2025-05-08 04:01:42', '2025-05-08 04:01:42'),
	(55, 'App\\Models\\Karyawan', 5, 'karyawan-token', '407b8e5948582d99f313977f62491613b05f6fe017da7ebc9dc3474cb056ed31', '["*"]', NULL, NULL, '2025-05-08 04:08:42', '2025-05-08 04:08:42'),
	(56, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'ffbf5a0a1303038351884adbe3b0330911511a9fae8e3c4d82e514375a98b292', '["*"]', NULL, NULL, '2025-05-08 04:08:44', '2025-05-08 04:08:44'),
	(57, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'f453599e36f17be23a9ea5d579c0bc1cafae44f2ae784ac0cc488e96a018a22c', '["*"]', NULL, NULL, '2025-05-08 04:08:46', '2025-05-08 04:08:46'),
	(58, 'App\\Models\\Karyawan', 5, 'karyawan-token', '4d8ac66554e0eff51c4d07e46d3fbde922b8f5be42d2e18ff0c505b6e788051f', '["*"]', NULL, NULL, '2025-05-08 04:13:01', '2025-05-08 04:13:01'),
	(59, 'App\\Models\\Karyawan', 4, 'karyawan-token', '7c723e2288a03ad2841e30c503c500cef0b2ffa6ab0223d430ee799e909fdab5', '["*"]', NULL, NULL, '2025-05-08 04:13:43', '2025-05-08 04:13:43'),
	(60, 'App\\Models\\Karyawan', 5, 'karyawan-token', '9d3b9629a6f37d0cd0fb1a37967aaf0a132ed4a789610b612410ea806e0b63da', '["*"]', NULL, NULL, '2025-05-08 04:20:30', '2025-05-08 04:20:30'),
	(61, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'fd7f5ab3974ffdbc9183ec7ff15e270eb409c588e0d0e724f1723afe928e4ffa', '["*"]', NULL, NULL, '2025-05-08 04:26:58', '2025-05-08 04:26:58'),
	(62, 'App\\Models\\Karyawan', 5, 'karyawan-token', '56c338c178c45bfaf91ff6af8121fca19594264748dfb31be1aaf45050f53ade', '["*"]', NULL, NULL, '2025-05-08 04:37:09', '2025-05-08 04:37:09'),
	(63, 'App\\Models\\Karyawan', 5, 'karyawan-token', '657d363ee50fe514561214852a1608c54de9d709129070c0d020c28127177093', '["*"]', NULL, NULL, '2025-05-08 04:51:15', '2025-05-08 04:51:15'),
	(64, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'cdab50da5b9338b83ad08785d7da6309cceeb45bdc392c4b35e72d6238c7c6a5', '["*"]', NULL, NULL, '2025-05-08 04:51:17', '2025-05-08 04:51:17'),
	(65, 'App\\Models\\Karyawan', 5, 'karyawan-token', '1228ae26230b1aaea15d9f1993aae53f2fa8f32bf369246846b7f433cf28905b', '["*"]', NULL, NULL, '2025-05-08 04:52:22', '2025-05-08 04:52:22'),
	(66, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'eca6d42cd63b0993ebe8b7840c2c45509aa7afff250911dcc963c6c38ecff0a7', '["*"]', NULL, NULL, '2025-05-08 05:10:59', '2025-05-08 05:10:59'),
	(67, 'App\\Models\\Owner', 1, 'owner-token', '1ef76369bbc72665af76b3e1ed530f145a2844912a13133e6e646319d028935f', '["*"]', NULL, NULL, '2025-05-09 02:53:44', '2025-05-09 02:53:44'),
	(73, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'dec66cb5bd110785e92952a09e6ef84f228e273cec7c493a3ebe5cd1d0e86f2a', '["*"]', '2025-05-11 04:48:55', NULL, '2025-05-11 04:46:56', '2025-05-11 04:48:55'),
	(74, 'App\\Models\\Karyawan', 6, 'karyawan-token', '9d224b6a71709f62189ac7fc4f98e55dc08d54d3609f932e3be7b19f86948113', '["*"]', NULL, NULL, '2025-05-11 06:10:24', '2025-05-11 06:10:24'),
	(75, 'App\\Models\\Karyawan', 6, 'karyawan-token', '2cb4716de093e529affdcee104cc1daafb2d76f06a9f3808f685c70c4769e33c', '["*"]', '2025-05-11 06:10:48', NULL, '2025-05-11 06:10:43', '2025-05-11 06:10:48'),
	(76, 'App\\Models\\Karyawan', 6, 'karyawan-token', '62bcc3bd8acb6f790fb2a370df80af8a61d1b735f8aa1166e5ef2d4ab27a0ef4', '["*"]', '2025-05-11 06:10:50', NULL, '2025-05-11 06:10:45', '2025-05-11 06:10:50'),
	(77, 'App\\Models\\Owner', 1, 'owner-token', 'b22faac050d17420882ef0e32cf0a5eb6fdade99d17e1a6a5f668f7312598271', '["*"]', '2025-05-11 08:12:40', NULL, '2025-05-11 06:17:47', '2025-05-11 08:12:40'),
	(78, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'ec85135b55b332102bde12ef57404379070914b3cd1016cb810bf6bea231d948', '["*"]', '2025-05-11 06:20:40', NULL, '2025-05-11 06:20:37', '2025-05-11 06:20:40'),
	(79, 'App\\Models\\Karyawan', 6, 'karyawan-token', '1329593685b1068a0ffd01f801a927221c432041d77da82b021c7b4506f6327d', '["*"]', '2025-05-11 06:37:00', NULL, '2025-05-11 06:36:24', '2025-05-11 06:37:00'),
	(80, 'App\\Models\\Karyawan', 6, 'karyawan-token', '738ab38f466a34ce7d2c3d96a312992d68c6c7c6203f10d584d9593be293ca80', '["*"]', '2025-05-11 06:53:49', NULL, '2025-05-11 06:53:44', '2025-05-11 06:53:49'),
	(82, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a68aab76840a2bbe42e7fc34c32e961339497b629f45851325078bb432d1532a', '["*"]', '2025-05-11 06:57:13', NULL, '2025-05-11 06:57:09', '2025-05-11 06:57:13'),
	(83, 'App\\Models\\Karyawan', 6, 'karyawan-token', '4e344d40df39dec0960253089b0d798d972f998dfb5960eb3b849a6f70930c7e', '["*"]', '2025-05-11 06:59:28', NULL, '2025-05-11 06:58:54', '2025-05-11 06:59:28'),
	(84, 'App\\Models\\Karyawan', 6, 'karyawan-token', '901afccd46d5f3a1aab366477f5b39ab84254012d47a950abfae4e321a145970', '["*"]', '2025-05-11 08:42:16', NULL, '2025-05-11 08:42:04', '2025-05-11 08:42:16'),
	(85, 'App\\Models\\Karyawan', 6, 'karyawan-token', '46630a8e3f64ac468241130c8577dff729f6739fcca65e13d719b6fb3dec7b8e', '["*"]', '2025-05-11 08:44:47', NULL, '2025-05-11 08:43:36', '2025-05-11 08:44:47'),
	(86, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f00923e95bb7649a41365e1ca910f434b571a1f47be126f4a5e978f2a27410d9', '["*"]', '2025-05-11 08:49:16', NULL, '2025-05-11 08:49:01', '2025-05-11 08:49:16'),
	(87, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3ba8c3802870ee071e6ef799cef7d13da4b93a818b37551ec7cdc4311617c66f', '["*"]', '2025-05-11 08:56:57', NULL, '2025-05-11 08:56:42', '2025-05-11 08:56:57'),
	(88, 'App\\Models\\Karyawan', 6, 'karyawan-token', '84f890755aae29580871c0bf995c20fdcbbd05b45d832e01239f57795895f37f', '["*"]', '2025-05-11 09:14:44', NULL, '2025-05-11 09:14:30', '2025-05-11 09:14:44'),
	(89, 'App\\Models\\Karyawan', 6, 'karyawan-token', '1e449432c68c5a6dba20994398a683372c3529c1ce1de317c1cdc403db3a0b98', '["*"]', '2025-05-11 09:18:19', NULL, '2025-05-11 09:18:00', '2025-05-11 09:18:19'),
	(90, 'App\\Models\\Karyawan', 6, 'karyawan-token', '61c6066e8dbf4e6969eb9791efd9baf36de591eac767a5337ee5ca9a411207d0', '["*"]', '2025-05-11 09:20:03', NULL, '2025-05-11 09:19:52', '2025-05-11 09:20:03'),
	(91, 'App\\Models\\Karyawan', 6, 'karyawan-token', '505d1fe6d68a6300701237f0e28b7bc9a4c33b9914bb8f77f701ac212be56efb', '["*"]', '2025-05-11 09:22:11', NULL, '2025-05-11 09:21:59', '2025-05-11 09:22:11'),
	(92, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f776248b3482af1076a81aafbc177ca258865e71da9c667bf942592502915a9c', '["*"]', '2025-05-12 05:59:07', NULL, '2025-05-12 05:58:49', '2025-05-12 05:59:07'),
	(93, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5d0c68aac0764cfd7d99e642cca79dff1af6a85880490109e518d405d03ee18a', '["*"]', NULL, NULL, '2025-05-12 06:09:07', '2025-05-12 06:09:07'),
	(94, 'App\\Models\\Karyawan', 6, 'karyawan-token', '2c8755ebf4264d78f14a91cf3bcbaa3dc207971277f656a27ef86d1531a21843', '["*"]', '2025-05-12 06:09:37', NULL, '2025-05-12 06:09:25', '2025-05-12 06:09:37'),
	(95, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'e0bd014ec9a4e088081c54e570aca6e096f81b205ef9205b4658a861796d87a0', '["*"]', '2025-05-12 06:10:08', NULL, '2025-05-12 06:09:59', '2025-05-12 06:10:08'),
	(96, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a0dec86c8bd2fbaaf2237f86d42583fbd1d7176589d63a178bdc58259417e297', '["*"]', '2025-05-13 03:18:20', NULL, '2025-05-12 06:17:59', '2025-05-13 03:18:20'),
	(97, 'App\\Models\\Karyawan', 6, 'karyawan-token', '4e33f2c2adaff6b02c21df3e1692c3935cb10a7edab838ba826d35fe9e2b0924', '["*"]', '2025-05-12 06:32:05', NULL, '2025-05-12 06:31:50', '2025-05-12 06:32:05'),
	(98, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'd4ca85f6b2d3b0c6930865cf194fe2e26c0e1c34b3428a766c2189959296bed6', '["*"]', '2025-05-12 06:36:17', NULL, '2025-05-12 06:36:00', '2025-05-12 06:36:17'),
	(99, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a9a9bf2dc6e048c0e94d12d7e9eab46602846d4da6c0790ecccd6638e376a9c2', '["*"]', '2025-05-12 06:51:34', NULL, '2025-05-12 06:48:46', '2025-05-12 06:51:34'),
	(100, 'App\\Models\\Karyawan', 6, 'karyawan-token', '17cad7c22c80ac9d9d4ce263e49f0dcde765b953f694b211aa5ff5eda1d8a4ee', '["*"]', '2025-05-12 06:56:23', NULL, '2025-05-12 06:52:19', '2025-05-12 06:56:23'),
	(101, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'c7b148b25d6f4e95cb46872bfa92f8646ff647c257945401e0b40d46015f4727', '["*"]', '2025-05-12 06:57:44', NULL, '2025-05-12 06:57:33', '2025-05-12 06:57:44'),
	(102, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a149bfd01d89e2d923c73651fd8bfe0b07877d9ac1775eaca63d825f4648772b', '["*"]', '2025-05-12 07:01:03', NULL, '2025-05-12 07:00:49', '2025-05-12 07:01:03'),
	(103, 'App\\Models\\Karyawan', 6, 'karyawan-token', '05bff4ed6a7b2db1afe83ddb45a11732be65003a51f87359d8b47aa351dba40e', '["*"]', '2025-05-12 07:07:24', NULL, '2025-05-12 07:07:10', '2025-05-12 07:07:24'),
	(104, 'App\\Models\\Owner', 1, 'owner-token', '5cb42b8e1585e3edac05e7acbf9a3c4eb9e809059e31c785d778448cba39e3de', '["*"]', '2025-05-12 08:32:11', NULL, '2025-05-12 07:13:49', '2025-05-12 08:32:11'),
	(105, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f2555768bb2345cae760db7aa75c9345be006f066a3ab41f8f63407eaba5c7a7', '["*"]', '2025-05-12 07:21:53', NULL, '2025-05-12 07:20:56', '2025-05-12 07:21:53'),
	(106, 'App\\Models\\Karyawan', 6, 'karyawan-token', '0ccc99e711747aa77c3b2c0bd471f7d7f85df465f57ae2864cb9d6d2e71561b9', '["*"]', '2025-05-12 07:24:00', NULL, '2025-05-12 07:23:24', '2025-05-12 07:24:00'),
	(107, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'e9ac9f4c1869f212002a51fc2babf2330bf17ba752a69b75f73929a67d83dbfe', '["*"]', '2025-05-12 08:34:41', NULL, '2025-05-12 08:32:27', '2025-05-12 08:34:41'),
	(108, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f2db7ccf240a227e69f3c8e316a16d6b77af23533c3767c9115de8c398ca5fa9', '["*"]', '2025-05-12 08:55:38', NULL, '2025-05-12 08:53:34', '2025-05-12 08:55:38'),
	(109, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'e70706ed963a44af53d9e007b71f82c59c51c6059921c856fdc06d8245c46932', '["*"]', '2025-05-12 08:59:31', NULL, '2025-05-12 08:59:24', '2025-05-12 08:59:31'),
	(110, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a5ca8ff4254546e201bb2abf7bfd3df9ef9ea7a8cb519fe32304361a5ea8d203', '["*"]', '2025-05-12 09:10:44', NULL, '2025-05-12 09:09:52', '2025-05-12 09:10:44'),
	(111, 'App\\Models\\Karyawan', 6, 'karyawan-token', '8cee2d5e47ba4835092dfb3d2b859f3f16b2d200252561d2aa7f21b0812bccd0', '["*"]', '2025-05-12 09:17:55', NULL, '2025-05-12 09:17:23', '2025-05-12 09:17:55'),
	(114, 'App\\Models\\Karyawan', 6, 'karyawan-token', '8a6b8d009018e3045ac55137f22af73251bcca0cd165695803485be8b0fa8b35', '["*"]', '2025-05-12 09:33:41', NULL, '2025-05-12 09:32:21', '2025-05-12 09:33:41'),
	(115, 'App\\Models\\Karyawan', 6, 'karyawan-token', '7fde698429b3cd408365d9b39b541e51dfd441b1467ad69c940311bda8c88aba', '["*"]', '2025-05-12 10:22:40', NULL, '2025-05-12 10:22:14', '2025-05-12 10:22:40'),
	(116, 'App\\Models\\Karyawan', 6, 'karyawan-token', '81b4f0721d9313cd25ed2bcfe95fb0a92506c775cfd0a508d92ad756232e5030', '["*"]', '2025-05-12 10:24:50', NULL, '2025-05-12 10:24:26', '2025-05-12 10:24:50'),
	(117, 'App\\Models\\Karyawan', 6, 'karyawan-token', '1d007aedaf5e5efc7cf22a7723cc838be2afc82eb7afdfacfc875cc8c086a087', '["*"]', '2025-05-12 10:27:01', NULL, '2025-05-12 10:26:48', '2025-05-12 10:27:01'),
	(118, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'e1dcc5dcd96080dcb5a42cfc9803f6e3b65f5a3be82f3a6af3c9aee86d39627e', '["*"]', '2025-05-12 10:32:29', NULL, '2025-05-12 10:32:21', '2025-05-12 10:32:29'),
	(119, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3c2d7a6ebe4ed119bba55200df5fe5f3e47382f10386967e54708778ea159c34', '["*"]', '2025-05-12 10:39:19', NULL, '2025-05-12 10:39:00', '2025-05-12 10:39:19'),
	(120, 'App\\Models\\Karyawan', 6, 'karyawan-token', '31e5bff66b290d8fd6e10064fdbd7e4ec8f0fc7a22d4771cd97602a363b16475', '["*"]', NULL, NULL, '2025-05-13 01:58:49', '2025-05-13 01:58:49'),
	(122, 'App\\Models\\Karyawan', 4, 'karyawan-token', 'a73e1a28b940faf36a59d6abd270c821c939b66aa68479659bf7d264ee6bf57e', '["*"]', '2025-05-13 02:06:54', NULL, '2025-05-13 02:06:46', '2025-05-13 02:06:54'),
	(123, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5a57458e7369ac58300b06af6539516d6025232866842211407edaa287304289', '["*"]', '2025-05-13 02:14:43', NULL, '2025-05-13 02:14:33', '2025-05-13 02:14:43'),
	(124, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'c413b9d5c3e86af4e4970ff82995f796b6bfca19356c420edd10a9f4f661c3c3', '["*"]', '2025-05-13 02:28:11', NULL, '2025-05-13 02:20:22', '2025-05-13 02:28:11'),
	(125, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5bfcfcef98621d273de94066b403fb5a2d354854feafd43b895bf0d8314c24d3', '["*"]', '2025-05-13 02:30:51', NULL, '2025-05-13 02:30:18', '2025-05-13 02:30:51'),
	(126, 'App\\Models\\Karyawan', 6, 'karyawan-token', '1629c0c21fed99ef08d9a33e52e6990ac376a699ad7b36169563e145b9027e65', '["*"]', '2025-05-13 02:33:39', NULL, '2025-05-13 02:33:12', '2025-05-13 02:33:39'),
	(127, 'App\\Models\\Karyawan', 6, 'karyawan-token', '146ef5fcc1ebe17d959c2410e6ae43c65936b834864b51352a552092351a1ead', '["*"]', '2025-05-13 02:44:09', NULL, '2025-05-13 02:43:04', '2025-05-13 02:44:09'),
	(128, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'b0d0310b03a061359e44c47431b83c0bc986546eda95616fff932b71d2cf2a89', '["*"]', '2025-05-13 02:47:35', NULL, '2025-05-13 02:47:21', '2025-05-13 02:47:35'),
	(129, 'App\\Models\\Karyawan', 6, 'karyawan-token', '39cc1df2ceda874c2592c8f1eeb7df5c00c1bc6f5b90939fa93877011d79bde3', '["*"]', '2025-05-13 03:09:27', NULL, '2025-05-13 03:09:22', '2025-05-13 03:09:27'),
	(130, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'ab9a2b329dd04920af75bc0df7e1cad153177772bedf6b1af5f8cfba71eda686', '["*"]', '2025-05-13 03:20:34', NULL, '2025-05-13 03:19:32', '2025-05-13 03:20:34'),
	(131, 'App\\Models\\Owner', 1, 'owner-token', '4d3fffa04af47a77f3524674ce4a0318987523585bbf1a62eb1a0085ec54d4fa', '["*"]', '2025-05-14 08:54:37', NULL, '2025-05-14 05:06:09', '2025-05-14 08:54:37'),
	(132, 'App\\Models\\Owner', 1, 'owner-token', 'f089fcdce786e80dcee3b8e3f619f810fd2fdca82157d4109ffa414b67a3fec5', '["*"]', '2025-05-14 12:28:27', NULL, '2025-05-14 11:26:56', '2025-05-14 12:28:27'),
	(133, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'ae77c0d851f0d80380de3e6582597b5cf448f98b309fa2960d96dba0003d8796', '["*"]', NULL, NULL, '2025-05-17 19:00:10', '2025-05-17 19:00:10'),
	(134, 'App\\Models\\Karyawan', 6, 'karyawan-token', '1919bad4fb910bec42d4a1ad45a90ffcea728f48c9cdd2761e8f893afd516f89', '["*"]', '2025-05-17 19:30:39', NULL, '2025-05-17 19:00:14', '2025-05-17 19:30:39'),
	(135, 'App\\Models\\Owner', 1, 'owner-token', 'fd4a754670a47134e2bc739080c9a653644d8bda9a0376fa42c375e1ce60b2ae', '["*"]', '2025-05-17 19:19:23', NULL, '2025-05-17 19:17:38', '2025-05-17 19:19:23'),
	(136, 'App\\Models\\Owner', 1, 'owner-token', '40848c51009396ce31bb01980647fc11061b0b43596fd4fea00595c9ee4278b2', '["*"]', '2025-05-17 19:18:48', NULL, '2025-05-17 19:18:24', '2025-05-17 19:18:48'),
	(137, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'dff9421bea431fb6620a9694fac80f0a5a1bfe57e9391219e227c7545d59fc3e', '["*"]', NULL, NULL, '2025-05-17 20:31:48', '2025-05-17 20:31:48'),
	(138, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'ed69b1cd98f0699a90b83d63b269057c0bfe7082bd2e226c1de22449686408e0', '["*"]', '2025-05-17 21:33:55', NULL, '2025-05-17 20:32:02', '2025-05-17 21:33:55'),
	(139, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'add1e510f9a0327d5cee3e28de2776b32b06615d18ae04ff9c0a98bf80be1f67', '["*"]', '2025-05-17 21:36:01', NULL, '2025-05-17 21:35:57', '2025-05-17 21:36:01'),
	(140, 'App\\Models\\Karyawan', 6, 'karyawan-token', '9baf53d800de715aca4f3fbab393194ef6d7b2a32a903ae287f5517f04b89506', '["*"]', '2025-05-17 21:36:20', NULL, '2025-05-17 21:36:17', '2025-05-17 21:36:20'),
	(142, 'App\\Models\\Karyawan', 4, 'karyawan-token', '22404978e9ece8fa8cc8da827af0e8e2671a9f0bdc44b76828da1080e41d38eb', '["*"]', '2025-05-17 21:57:19', NULL, '2025-05-17 21:57:13', '2025-05-17 21:57:19'),
	(143, 'App\\Models\\Owner', 1, 'owner-token', '119b94bea1f41c03fef5a303a087f7000d822ac7ab4fb6a75fc3ee9b7c652dd4', '["*"]', '2025-05-20 07:52:20', NULL, '2025-05-20 06:21:07', '2025-05-20 07:52:20'),
	(144, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'a4a455659b30daf32b7dd419cb3314cdc156e25121a3a3af3bfdf46cc22cb928', '["*"]', NULL, NULL, '2025-05-21 02:46:08', '2025-05-21 02:46:08'),
	(145, 'App\\Models\\Karyawan', 6, 'karyawan-token', '9697986466b2a42580de2f366ff9adeb84ad6b640a7d88c63a143fd0e9446bcc', '["*"]', '2025-05-21 02:47:57', NULL, '2025-05-21 02:46:28', '2025-05-21 02:47:57'),
	(146, 'App\\Models\\Karyawan', 6, 'karyawan-token', '937bb310e496c1fed8cd28b18562d62fb1c671d392af8bfccf6b347f92391f96', '["*"]', '2025-05-21 02:54:03', NULL, '2025-05-21 02:53:44', '2025-05-21 02:54:03'),
	(147, 'App\\Models\\Karyawan', 6, 'karyawan-token', '4f4f6ae442853b1297d4cc6796934d36782f4b6dea74f662248bbd2aabe84850', '["*"]', '2025-05-21 03:07:52', NULL, '2025-05-21 03:06:54', '2025-05-21 03:07:52'),
	(148, 'App\\Models\\Owner', 1, 'owner-token', 'e3341e3274895763c8aa66615510dae8122c5dd298fb52fd244134e848f9b653', '["*"]', '2025-05-21 03:11:47', NULL, '2025-05-21 03:10:37', '2025-05-21 03:11:47'),
	(149, 'App\\Models\\Karyawan', 6, 'karyawan-token', '59d86f2e731c48723c2165a125faedd546691ae4b203dfe09c05c0692cf6c4c1', '["*"]', '2025-05-21 03:12:31', NULL, '2025-05-21 03:12:24', '2025-05-21 03:12:31'),
	(150, 'App\\Models\\Karyawan', 6, 'karyawan-token', '16ae126b58aad9aa0b5fdbbb1c24a063b11a95d09c72626db7152136d1397746', '["*"]', '2025-05-21 03:27:41', NULL, '2025-05-21 03:22:56', '2025-05-21 03:27:41'),
	(151, 'App\\Models\\Owner', 1, 'owner-token', 'a3c622a8a92e4146743d8ae8abc3ee2409eccb0eef3f7930b925c4f4ebececee', '["*"]', '2025-05-21 03:25:08', NULL, '2025-05-21 03:24:43', '2025-05-21 03:25:08'),
	(152, 'App\\Models\\Owner', 1, 'owner-token', 'f6b5dd04eaf688e9e10afc3c30c73b506850503b23fbd594705aaea2ebc652de', '["*"]', '2025-05-29 09:55:25', NULL, '2025-05-29 09:11:43', '2025-05-29 09:55:25'),
	(153, 'App\\Models\\Owner', 1, 'owner-token', 'c1a8ab974fa288a1ca81bf7f3c108a460bc14d2bd47e57abb7be875f0c344dd1', '["*"]', '2025-05-30 08:30:16', NULL, '2025-05-30 08:17:16', '2025-05-30 08:30:16'),
	(154, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'fc9654e5314e3f90c10ccd193e09960f3e8b5c6f9d528a95bfebed482380a40a', '["*"]', '2025-05-30 08:22:29', NULL, '2025-05-30 08:18:15', '2025-05-30 08:22:29'),
	(155, 'App\\Models\\Owner', 1, 'owner-token', '634c871ab1e4fb4a9b8646839d44c303a5e52ac1ba4708cb01e6889bc4e993f4', '["*"]', '2025-05-31 05:21:30', NULL, '2025-05-31 02:57:24', '2025-05-31 05:21:30'),
	(156, 'App\\Models\\Karyawan', 6, 'karyawan-token', '307c035901f366552e62e8a4898d87a9d63e2d6ed3421e13738c76584374f819', '["*"]', '2025-05-31 07:42:53', NULL, '2025-05-31 07:42:49', '2025-05-31 07:42:53'),
	(157, 'App\\Models\\Owner', 1, 'owner-token', '416438652cba49c6a7d55fe396f7a721f7b98e300623bcfc50eafe231fa21d9e', '["*"]', '2025-06-02 05:45:01', NULL, '2025-06-02 03:35:03', '2025-06-02 05:45:01'),
	(158, 'App\\Models\\Karyawan', 6, 'karyawan-token', '76cbe7ce698d0cc728495fcdfd77e7041b1ca201c085ff1f211a805b21002cc9', '["*"]', '2025-06-02 03:36:07', NULL, '2025-06-02 03:36:04', '2025-06-02 03:36:07'),
	(160, 'App\\Models\\Karyawan', 6, 'karyawan-token', '103689a310c21c395c61b57cbde93b78a62323ca5192bf2c258c0466dcb82f1d', '["*"]', '2025-06-02 05:40:40', NULL, '2025-06-02 05:16:48', '2025-06-02 05:40:40'),
	(161, 'App\\Models\\Karyawan', 6, 'karyawan-token', '6ca683686c7b63d8998b4a87ec70bed94c322fdac715864e1e1e401fb6418493', '["*"]', '2025-06-02 05:43:31', NULL, '2025-06-02 05:40:51', '2025-06-02 05:43:31'),
	(162, 'App\\Models\\Owner', 1, 'owner-token', '98053957795879332927cb2db4fab24d49aa54e3ef92357b4caede1610df381e', '["*"]', '2025-06-03 00:14:09', NULL, '2025-06-03 00:05:07', '2025-06-03 00:14:09'),
	(163, 'App\\Models\\Owner', 1, 'owner-token', '02c479b8fecb205c19ba167c4906411db04c995995aef36c1356acc33bb9683d', '["*"]', '2025-06-07 07:44:58', NULL, '2025-06-07 05:41:24', '2025-06-07 07:44:58'),
	(164, 'App\\Models\\Owner', 1, 'owner-token', 'babbb31f38e3c43756fee2e49da7b5f1f3c36df085d5e3dec9e0584e1e9dc5e8', '["*"]', '2025-06-08 03:20:34', NULL, '2025-06-08 02:13:08', '2025-06-08 03:20:34'),
	(165, 'App\\Models\\Karyawan', 6, 'karyawan-token', '2e844f50ad27a1dc47d479a18987b5d8023ce4ce06e9bc20a94d0dda7f267d1f', '["*"]', '2025-06-08 02:33:08', NULL, '2025-06-08 02:26:41', '2025-06-08 02:33:08'),
	(166, 'App\\Models\\Karyawan', 6, 'karyawan-token', '0d0523de42ca71510e57243d3815f3b54690db700d7cdb93f85439a40e3c74e7', '["*"]', '2025-06-08 02:35:38', NULL, '2025-06-08 02:33:42', '2025-06-08 02:35:38'),
	(167, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'afe4cc0018bd6ab3766af77025e1fac80edc44c56a995a48b7c9d58265db3b61', '["*"]', '2025-06-08 02:42:30', NULL, '2025-06-08 02:40:45', '2025-06-08 02:42:30'),
	(168, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'bef8ea66b6b7c4dc8b25b10a60ed382782df50048be56dc09810bf8f70c36f4a', '["*"]', '2025-06-08 22:30:54', NULL, '2025-06-08 22:26:18', '2025-06-08 22:30:54'),
	(169, 'App\\Models\\Owner', 1, 'owner-token', '7810381080173d32486c981b0e428af39f26c290e24ce071dfb57fd9c9f8c60b', '["*"]', '2025-06-09 01:52:46', NULL, '2025-06-08 22:28:08', '2025-06-09 01:52:46'),
	(170, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'bbb102c0d07f80db44f136df31fe7f5dfff025e848c982678f183c38ee18479e', '["*"]', '2025-06-08 22:31:12', NULL, '2025-06-08 22:31:10', '2025-06-08 22:31:12'),
	(171, 'App\\Models\\Karyawan', 9, 'karyawan-token', 'bf9837f29db7416c88af367733efe549fef2bb5340742acd6a67b02a40e4ce4b', '["*"]', '2025-06-08 23:27:59', NULL, '2025-06-08 22:47:57', '2025-06-08 23:27:59'),
	(172, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3f9dd13c13a9c641cfce5d241425a8a0cc370aa95f0b92ce672ec4eaf14753f6', '["*"]', '2025-06-09 00:08:09', NULL, '2025-06-09 00:08:07', '2025-06-09 00:08:09'),
	(173, 'App\\Models\\Karyawan', 6, 'karyawan-token', '85cd0a01c52c5cac3345ce3aad87f25e4ed86c6dea1ffb92c0944984727c576e', '["*"]', '2025-06-09 00:18:44', NULL, '2025-06-09 00:18:41', '2025-06-09 00:18:44'),
	(174, 'App\\Models\\Karyawan', 6, 'karyawan-token', '99916ef6074114aebe5a7d48a8b6239730e4bc8e71277a67381cd0d8795dc70d', '["*"]', '2025-06-09 00:24:01', NULL, '2025-06-09 00:21:21', '2025-06-09 00:24:01'),
	(175, 'App\\Models\\Karyawan', 6, 'karyawan-token', '4d14cbb398bfadbc0506853e185638c520ddc7be8dc69522d841cd1a57cbfcf4', '["*"]', '2025-06-09 00:26:37', NULL, '2025-06-09 00:26:34', '2025-06-09 00:26:37'),
	(176, 'App\\Models\\Owner', 1, 'owner-token', 'b9ceccc422a6052c48b7c77d7586d27236c97f93e479353ae654af173f4a7249', '["*"]', '2025-06-09 02:31:42', NULL, '2025-06-09 01:53:47', '2025-06-09 02:31:42'),
	(177, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'd4aa6958d1b945684a0bf892aaa14da03e42f2e0862cd97df25bd1e0cf4464af', '["*"]', '2025-06-09 03:06:13', NULL, '2025-06-09 02:34:32', '2025-06-09 03:06:13'),
	(178, 'App\\Models\\Karyawan', 6, 'karyawan-token', '6e70a9ba5735ba6db3a4b731ed326afeeb436eabb378333a05263344afe83449', '["*"]', '2025-06-09 03:22:41', NULL, '2025-06-09 03:20:56', '2025-06-09 03:22:41'),
	(179, 'App\\Models\\Karyawan', 6, 'karyawan-token', '19622d77dd25631ae5bb3386c47590f3368f92c8369dfec4de0ca3648a607495', '["*"]', '2025-06-09 03:27:47', NULL, '2025-06-09 03:27:41', '2025-06-09 03:27:47'),
	(180, 'App\\Models\\Karyawan', 6, 'karyawan-token', '242b4586c71443d76377061412805b3053903dd3205b854542ebf990be2b49f0', '["*"]', '2025-06-09 03:32:48', NULL, '2025-06-09 03:32:42', '2025-06-09 03:32:48'),
	(181, 'App\\Models\\Karyawan', 6, 'karyawan-token', '13625338a82da74a717ee52f982c5efc519b6ab693607d43b3cb68b3167c1726', '["*"]', '2025-06-09 03:34:50', NULL, '2025-06-09 03:34:43', '2025-06-09 03:34:50'),
	(182, 'App\\Models\\Owner', 1, 'owner-token', 'd8b6be7476b212f8b850c68ea91428a4812ae03488bb7cb6aa13c67800e1e874', '["*"]', '2025-06-10 06:59:17', NULL, '2025-06-10 06:53:57', '2025-06-10 06:59:17'),
	(183, 'App\\Models\\Karyawan', 6, 'karyawan-token', '384ace8e6d852f3684f4af56e5cf46dd2fc289cc77d8cb283ac6417c209e9df5', '["*"]', NULL, NULL, '2025-06-10 07:42:10', '2025-06-10 07:42:10'),
	(184, 'App\\Models\\Karyawan', 6, 'karyawan-token', '6c230bc212600b4dd92fd9fd1935ac0a93d74a67d393f753c8f80211299127cc', '["*"]', '2025-06-10 08:12:36', NULL, '2025-06-10 07:43:10', '2025-06-10 08:12:36'),
	(186, 'App\\Models\\Karyawan', 6, 'karyawan-token', '3cede3b7e29f6027a839d956f2574aa0e29e9625077ef45cd404e34d75a38d06', '["*"]', '2025-06-10 08:59:53', NULL, '2025-06-10 08:59:48', '2025-06-10 08:59:53'),
	(190, 'App\\Models\\Owner', 1, 'owner-token', 'd5761ab9500d07537bad84f42a1c26ef864dfee10edcb08855e1c37e196ddd11', '["*"]', '2025-06-10 19:22:58', NULL, '2025-06-10 18:30:33', '2025-06-10 19:22:58'),
	(192, 'App\\Models\\Karyawan', 6, 'karyawan-token', '458e5265ad902c227397917993bdb983e75484acb8bf8ade1195eba271fe3edf', '["*"]', '2025-06-10 19:32:43', NULL, '2025-06-10 19:27:32', '2025-06-10 19:32:43'),
	(193, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'faaf671786d5e6636d3730f9d4ed824ff185c27bb503d9398644fff401e8ef01', '["*"]', '2025-06-10 19:36:51', NULL, '2025-06-10 19:33:02', '2025-06-10 19:36:51'),
	(194, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'c0aa41006897578ebb3bb1f2e7573c2c929096575d56cffc11ebfeebe6c9e126', '["*"]', '2025-06-11 02:36:12', NULL, '2025-06-11 02:36:11', '2025-06-11 02:36:12'),
	(195, 'App\\Models\\Owner', 1, 'owner-token', 'a9fdb4a2180a1799f8fe1440ee1ce4bb1e7adca791f170efff6c70c459c01d9b', '["*"]', '2025-06-11 09:54:08', NULL, '2025-06-11 08:34:37', '2025-06-11 09:54:08'),
	(196, 'App\\Models\\Karyawan', 10, 'karyawan-token', '2bdebe39f41401aecf00b9696cd0de3613077c2e1f61690bdef6391ade09c022', '["*"]', '2025-06-11 08:36:53', NULL, '2025-06-11 08:36:51', '2025-06-11 08:36:53'),
	(197, 'App\\Models\\Karyawan', 10, 'karyawan-token', '66a4e411fb8557f1f3a4590901d9584fef99fd09d9a88ee4abb36cad8f266809', '["*"]', '2025-06-11 08:37:35', NULL, '2025-06-11 08:37:07', '2025-06-11 08:37:35'),
	(206, 'App\\Models\\Karyawan', 5, 'karyawan-token', 'cbb9e3a6eea5af3ee5f9b75851ed15aa7f0981fcafb254c14168bea692dfe420', '["*"]', '2025-06-11 09:51:31', NULL, '2025-06-11 09:50:03', '2025-06-11 09:51:31'),
	(208, 'App\\Models\\Karyawan', 5, 'karyawan-token', '550adf44bf1fb61aaa59b45c77ed3339844efcada4591c15550a6922f1b60267', '["*"]', '2025-06-11 09:54:04', NULL, '2025-06-11 09:53:43', '2025-06-11 09:54:04'),
	(212, 'App\\Models\\Owner', 1, 'owner-token', '995639aad8414af9a694f1f4bb8ccb66a17e9b386c9c957b6021820dc9af449a', '["*"]', '2025-06-11 17:29:22', NULL, '2025-06-11 17:29:01', '2025-06-11 17:29:22'),
	(213, 'App\\Models\\Karyawan', 16, 'karyawan-token', '2f22acb8f29f5439a092c7c012b1f52d39be48cf00b32f68b45d74fa154ffaf8', '["*"]', '2025-06-11 17:41:18', NULL, '2025-06-11 17:38:33', '2025-06-11 17:41:18'),
	(214, 'App\\Models\\Owner', 1, 'owner-token', '0f6de1a8e2b82652951c4905f34acebac04edb59b0854fa3f65370a193050fd0', '["*"]', '2025-06-11 17:56:10', NULL, '2025-06-11 17:56:08', '2025-06-11 17:56:10'),
	(215, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f364ff7d52d12cf3fec3513a63ab8c502b0af22271269a1f50ff266d2b1d3dcc', '["*"]', '2025-06-11 17:59:24', NULL, '2025-06-11 17:59:22', '2025-06-11 17:59:24'),
	(216, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'cca4f370ec6760046f928ec4d70264de1a815b0607ae2146b3b92fa133abab01', '["*"]', NULL, NULL, '2025-06-12 01:09:30', '2025-06-12 01:09:30'),
	(217, 'App\\Models\\Karyawan', 6, 'karyawan-token', '9ad6b5b8a0e3cbae0ed07171c7fce8eb5dace4085e47ca77e77ed84c54e12f8c', '["*"]', '2025-06-12 01:10:04', NULL, '2025-06-12 01:09:47', '2025-06-12 01:10:04'),
	(218, 'App\\Models\\Owner', 1, 'owner-token', '98941c4f1bba96eccf57253c2dc1914f626a3a5f0676bda2591edc26f145f129', '["*"]', '2025-06-12 01:28:21', NULL, '2025-06-12 01:26:56', '2025-06-12 01:28:21'),
	(221, 'App\\Models\\Owner', 1, 'owner-token', '29ff9c681af34d780b1e2bee534349b61a625ecc39f6199ead133a17e099b480', '["*"]', '2025-06-12 15:24:57', NULL, '2025-06-12 14:18:31', '2025-06-12 15:24:57'),
	(225, 'App\\Models\\Karyawan', 6, 'karyawan-token', '9736ed77115f72e87be803fab9a406d845641d04826ef7f20e4ab500dd8e464f', '["*"]', '2025-06-12 15:10:47', NULL, '2025-06-12 14:36:49', '2025-06-12 15:10:47'),
	(226, 'App\\Models\\Owner', 1, 'owner-token', '1c09b6505847c623f752232d280c60c67f7dfe53ccbe59b37fd34ce03983ea6b', '["*"]', '2025-06-16 02:17:52', NULL, '2025-06-16 02:17:12', '2025-06-16 02:17:52'),
	(227, 'App\\Models\\Owner', 1, 'owner-token', 'dc3380ddf3fb98516a50ad61c2b4c1b2ddb87930f28a28f4a2e430e7ae8cea0c', '["*"]', '2025-06-16 10:26:09', NULL, '2025-06-16 09:20:48', '2025-06-16 10:26:09'),
	(228, 'App\\Models\\Karyawan', 6, 'karyawan-token', '65a1a60ff1b05ccd9abf316e204524813f9874d5a383bc8e5bf4950170e97d64', '["*"]', '2025-06-16 10:18:08', NULL, '2025-06-16 10:17:53', '2025-06-16 10:18:08'),
	(229, 'App\\Models\\Karyawan', 6, 'karyawan-token', '5d8b5f9b238da80376bca02750fb0e43f2f728a93b20580ebe0024456f1b196e', '["*"]', '2025-06-16 10:21:50', NULL, '2025-06-16 10:21:19', '2025-06-16 10:21:50'),
	(230, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'f466b3520242a0d6134f8cb3e4a1cddf7347606860a7da007a77ecc12683b754', '["*"]', '2025-06-16 10:24:26', NULL, '2025-06-16 10:23:34', '2025-06-16 10:24:26'),
	(231, 'App\\Models\\Karyawan', 6, 'karyawan-token', 'db34a7b844e6a04041c07d3e8a4198f264654dd96e227f5731518e68245904b6', '["*"]', '2025-06-16 10:25:18', NULL, '2025-06-16 10:24:58', '2025-06-16 10:25:18'),
	(232, 'App\\Models\\Owner', 1, 'owner-token', 'a56807eb0f3d49bdf6251fd209fa72f7ee2513acf578c963176346e7657382d0', '["*"]', '2025-06-19 15:23:00', NULL, '2025-06-19 13:47:26', '2025-06-19 15:23:00');

-- Dumping structure for table api/berrys.rekap_gaji_bulanan
CREATE TABLE IF NOT EXISTS `rekap_gaji_bulanan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint unsigned NOT NULL,
  `bulan` int NOT NULL,
  `tahun` int NOT NULL,
  `total_gaji` decimal(15,2) NOT NULL,
  `total_jam` decimal(10,2) NOT NULL,
  `jumlah_hari_kerja` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rekap_gaji_bulanan_id_karyawan_bulan_tahun_unique` (`id_karyawan`,`bulan`,`tahun`),
  CONSTRAINT `rekap_gaji_bulanan_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.rekap_gaji_bulanan: ~9 rows (approximately)
REPLACE INTO `rekap_gaji_bulanan` (`id`, `id_karyawan`, `bulan`, `tahun`, `total_gaji`, `total_jam`, `jumlah_hari_kerja`, `created_at`, `updated_at`) VALUES
	(1, 4, 4, 2025, 1485.56, 0.37, 2, '2025-04-26 08:47:50', '2025-04-29 03:39:13'),
	(2, 6, 5, 2025, 2575.56, 0.64, 1, '2025-05-12 09:33:09', '2025-05-12 09:33:09'),
	(3, 5, 6, 2025, 213291.67, 54.06, 6, '2025-06-10 16:22:03', '2025-06-11 16:46:24'),
	(4, 6, 6, 2025, 239126.68, 59.78, 9, '2025-06-10 16:22:03', '2025-06-12 14:37:14'),
	(5, 9, 6, 2025, 135000.00, 27.00, 5, '2025-06-10 16:22:03', '2025-06-10 16:22:03'),
	(6, 10, 6, 2025, 180013.34, 45.00, 7, '2025-06-10 16:22:03', '2025-06-11 09:54:02'),
	(7, 11, 6, 2025, 216000.00, 54.00, 5, '2025-06-10 16:22:03', '2025-06-10 16:22:03'),
	(8, 12, 6, 2025, 216000.00, 54.00, 5, '2025-06-10 16:22:03', '2025-06-10 16:22:03'),
	(9, 13, 6, 2025, 216000.00, 54.00, 5, '2025-06-10 16:22:03', '2025-06-10 16:22:03');

-- Dumping structure for table api/berrys.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.sessions: ~11 rows (approximately)
REPLACE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('3Iotcenb1qMH1iF3V6lW0On5yHJHrpIJidYaI1bR', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3VZSmlIczYwQ0xFZHZ1UHJYTmFEUEd6aHlJcHFSMmNwMWdncklVTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740586913),
	('bAc4LKjLdjNykcTHtQFVvc5AyU7peVPjfTCRiKYq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU1jYnpocFp0OVhjNHFuVjc2aDZFQlAybjRYWG53YWtkTGs0VUVaSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740587150),
	('E8QUSAn3q9qUV41awfjXd1rHirkS5XfwcoV4L4qp', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUkxYXlFNXgzV0o0QkZvQ0MxZUZ2ZFFDdTlqd3ljd0hMWW5BdUVITiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740586686),
	('FJ55cLyelvytJphB7g5itKcZNIBLnKtSSIUMEiA6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzVZaW5vc0FMSHVWSTZHRUlwVDVtRXJnMVQxQUxuaWxNM3pTSDRlRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740589557),
	('IATBR9ba3a0htTWgxkW35YmiHHaUakOceCBFvrHY', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWEZCZmtabWRKbzNRbGszQXd3YzVzRXZhTlZOaHU0T1ZSN3p6cnFtbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740586950),
	('iOldCKJn1ju6e0DS6znhyyfhzLRFrPfGZOfnv7Gk', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXJkNjdJTHFpWEU3MDVmODBCNWtFYkJ4M3hNTmxja2NXajdRS2FDbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740587178),
	('PrGcwWIYEDWtTZGFL8Zh8eBEw1ZuJXSskvJBTpET', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGtYZEZobzRGWmVtRFZTeEhJOWFOcEdMWGxjTWdnZkllVTNjdnZBTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740587130),
	('q6JhldVKngTzWig3FCSC6ni4vrH6yaXb6mxZhSwb', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnlVZ0pYM1BoSTNmSFQ0RjAxMWptSEkwMWJyaWpNdGxjcDNqeEZTYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2thcnlhd2FuP0F1dGhvcml6YXRpb249MSU3Q2xxbzFUWTJ3QjgzVmpPc0ROZ3BtUVZ2ZXd5SnduaEYweFpNUnJYVHFmOTk2ZjU2Ijt9fQ==', 1740589572),
	('TyxMJNjS6z5id6aqULkAIFwGdKaKNb0T6qOuqK4w', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicndLZ0NPN25DYTl6VnBCUlRnTWNwOWtwT2ExSWIwZzhtWG55QjFyeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740587218),
	('yxd7q4XzNHts0RQyjN37x4IiJxRuxus2R7r2G4B9', NULL, '127.0.0.1', 'GuzzleHttp/7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlNtVlFoVDN4RHFLMGdEVWk2WE00NnRFS1hMV1JCdklGamUyQ0x3ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740587132),
	('ZoG1EcZyNj67TgYNyDz3O4dxYrg8a60T2o6e6EAW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWp6UVhUbndYVVFFY25hWEZjRnRjUlh1OHNsUlhIQnk3NGtBVkJIdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkva2FyeWF3YW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740586909);

-- Dumping structure for table api/berrys.stok_datang
CREATE TABLE IF NOT EXISTS `stok_datang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` bigint unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `donat_bombo` int NOT NULL,
  `donat_bolong` int NOT NULL,
  `donat_salju` int NOT NULL,
  `kelengkapan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stok_datang_id_jadwal_foreign` (`id_jadwal`),
  CONSTRAINT `stok_datang_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.stok_datang: ~11 rows (approximately)
REPLACE INTO `stok_datang` (`id`, `id_jadwal`, `tanggal`, `donat_bombo`, `donat_bolong`, `donat_salju`, `kelengkapan`, `catatan`, `created_at`, `updated_at`) VALUES
	(1, 20, '2025-04-27', 25, 65, 25, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-04-27 09:00:08', '2025-04-27 09:00:08'),
	(2, 23, '2025-04-28', 25, 65, 30, 'Keju parut', 'Tidak ada catatan', '2025-04-28 07:01:30', '2025-04-28 07:01:30'),
	(3, 23, '2025-04-28', 30, 85, 48, 'Coklat', 'Tidak ada catatan', '2025-04-28 07:01:42', '2025-04-28 07:01:42'),
	(4, 79, '2025-05-12', 50, 30, 29, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-05-12 08:55:38', '2025-05-12 08:55:38'),
	(5, 80, '2025-05-13', 20, 50, 0, 'Tidak ada kelengkapan', 'Tidak ada catatan', '2025-05-13 02:27:40', '2025-05-13 02:27:40'),
	(6, 99, '2025-06-11', 60, 60, 0, 'Filling Coklat\nFilling Tiramisu', 'Donat Art', '2025-06-10 19:35:03', '2025-06-10 19:35:03'),
	(7, 99, '2025-06-11', 30, 30, 25, 'Filling taro \nFilling Keju\nMeses', '-', '2025-06-10 19:35:35', '2025-06-10 19:35:35'),
	(8, 106, '2025-06-11', 50, 50, 25, 'Keju parut\nMeses', NULL, '2025-06-11 08:55:46', '2025-06-11 08:55:46'),
	(9, 121, '2025-06-12', 30, 30, 25, 'Filling Coklat\nKeju Parut', 'Donat Art reservasi a.n. kak Dita', '2025-06-11 17:18:42', '2025-06-11 17:18:42'),
	(10, 100, '2025-06-12', 30, 60, 50, NULL, NULL, '2025-06-12 14:16:25', '2025-06-12 14:16:25'),
	(11, 107, '2025-06-12', 30, 20, 0, NULL, NULL, '2025-06-12 14:18:47', '2025-06-12 14:18:47');

-- Dumping structure for table api/berrys.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api/berrys.users: ~0 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$yeM4Yr2Iw1j5YewWm9h7FuQuTybiLO62FpYExIhhG6rC8sRimYJiu', NULL, '2025-02-26 09:46:26', '2025-02-26 09:46:26');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
