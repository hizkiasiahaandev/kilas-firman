-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2025 at 10:20 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kilas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int NOT NULL,
  `roomCode` varchar(10) NOT NULL,
  `participantName` varchar(50) NOT NULL,
  `joinedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `roomCode`, `participantName`, `joinedAt`) VALUES
(50, '421400', 'oke', '2025-12-04 09:33:51'),
(51, '421400', 'say', '2025-12-04 09:33:57'),
(52, '421400', 'bodoh', '2025-12-04 09:34:05'),
(53, '277461', 'aa', '2025-12-04 09:35:43'),
(54, '277461', 'okee', '2025-12-04 09:35:50'),
(55, '277461', 'aaa', '2025-12-04 09:35:55'),
(56, '461467', 'marga', '2025-12-04 09:38:00'),
(57, '538387', 'OKE', '2025-12-04 09:39:03'),
(58, '187776', 'AA', '2025-12-04 09:41:53'),
(59, '898445', 'PEPEK', '2025-12-04 09:44:27'),
(60, '226070', 'aym', '2025-12-04 09:54:26'),
(61, '756932', 'Kontol', '2025-12-04 10:04:44'),
(62, '756932', 'Kontol', '2025-12-04 10:04:47'),
(63, '756932', 'Kontol', '2025-12-04 10:05:01'),
(64, '904214', 'oke', '2025-12-04 10:06:46'),
(65, '904214', 'oke', '2025-12-04 10:07:51'),
(66, '904214', '12333', '2025-12-04 10:07:56'),
(67, '904214', '123333', '2025-12-04 10:08:48'),
(68, '904214', '123333', '2025-12-04 10:08:49'),
(69, '904214', '123333', '2025-12-04 10:08:54'),
(70, '904214', '123333', '2025-12-04 10:10:06'),
(71, '283792', '11', '2025-12-04 10:10:34'),
(72, '283792', '11aaaaa', '2025-12-04 10:10:53'),
(73, '283792', '11aaaaaaaa', '2025-12-04 10:10:55'),
(74, '283792', '11aaaaaaaaa', '2025-12-04 10:10:56'),
(75, '283792', '11aaaaaaaaa', '2025-12-04 10:12:20'),
(76, '283792', '11aaaaaaaaa', '2025-12-04 10:13:46'),
(77, '283792', '11aaaaaaaaa', '2025-12-04 10:13:50'),
(78, '283792', '11aaaaaaaaa', '2025-12-04 10:14:12'),
(79, '283792', '11aaaaaaaaa', '2025-12-04 10:15:15'),
(80, '283792', 'aaaa', '2025-12-04 10:15:27'),
(81, '283792', 'aaaa', '2025-12-04 10:15:57'),
(82, '283792', 'aaaa', '2025-12-04 10:17:27'),
(83, '283792', '222', '2025-12-04 10:17:36'),
(84, '421400', 'aa', '2025-12-04 10:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `roomCode` varchar(10) NOT NULL,
  `qText` text NOT NULL,
  `qType` varchar(5) NOT NULL,
  `qScore` int NOT NULL,
  `options` json NOT NULL,
  `correct` json NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `roomCode`, `qText`, `qType`, `qScore`, `options`, `correct`, `createdAt`) VALUES
(1, '271854', 'Siapa Nama Presiden Terbaik Di Dunia?', 'cb', 1000, '[{\"id\": 1, \"text\": \"owi\"}, {\"id\": 2, \"text\": \"jokowi\"}, {\"id\": 3, \"text\": \"none\"}, {\"id\": 4, \"text\": \"prabowo\"}]', '[\"1\", \"2\"]', '2025-12-04 06:07:06'),
(2, '271854', 'Benarkan Joko Widido Adalah Raja Jawa?', 'tf', 2000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 06:07:59'),
(3, '500943', 'Apakah Johan Itu Nyata?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 06:14:11'),
(4, '500943', 'Apakah Ini benar?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 06:14:36'),
(8, '378317', 'okay', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 06:31:03'),
(9, '378317', 'siap?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 06:38:53'),
(10, '461775', 'a', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 06:52:05'),
(11, '259729', 'okay siapa dia?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:05:06'),
(12, '164530', 'muel', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:15:41'),
(13, '437108', 'okay', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:22:33'),
(14, '974458', 'okay', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:25:05'),
(15, '731507', 'siap', 'tf', 999, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:28:09'),
(16, '506648', 'siap', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:34:56'),
(17, '111499', 'okay', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:47:21'),
(18, '209152', 'aaa', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 07:54:18'),
(19, '928071', 'okay', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 07:59:59'),
(20, '159270', 'siap', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 08:07:21'),
(21, '621998', 'siap', 'tf', 1, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 08:12:47'),
(22, '985793', 'siapa', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"b\"}, {\"id\": \"C\", \"text\": \"c\"}, {\"id\": \"D\", \"text\": \"d\"}]', '[\"A\"]', '2025-12-04 08:14:40'),
(23, '233238', 'aa', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"b\"}, {\"id\": \"C\", \"text\": \"c\"}, {\"id\": \"D\", \"text\": \"d\"}]', '[\"A\"]', '2025-12-04 08:17:20'),
(24, '134591', 'okay', 'pg', 10, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"b\"}, {\"id\": \"C\", \"text\": \"c\"}, {\"id\": \"D\", \"text\": \"d\"}]', '[\"A\"]', '2025-12-04 08:23:47'),
(25, '134591', 'okay', 'pg', 10, '[{\"id\": \"A\", \"text\": \"c\"}, {\"id\": \"B\", \"text\": \"d\"}, {\"id\": \"C\", \"text\": \"d\"}, {\"id\": \"D\", \"text\": \"g\"}]', '[\"B\"]', '2025-12-04 08:24:02'),
(26, '763675', 'Apakah gonter seorang dewa?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 08:28:54'),
(27, '144111', 'oke siapa dia?', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 08:32:38'),
(28, '130566', 'okje', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 08:34:29'),
(29, '541256', 'aa', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 08:42:28'),
(30, '239286', 'a', 'tf', 100, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 08:43:39'),
(31, '916619', 'ooke', 'tf', 100, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 08:55:12'),
(32, '121897', 'a', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 09:02:49'),
(33, '374978', 'oke', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 09:09:36'),
(34, '323260', 'oke', 'cb', 1000, '[{\"id\": 1, \"text\": \"a\"}]', '[]', '2025-12-04 09:12:54'),
(35, '668077', 'siap', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 09:20:21'),
(36, '219456', 'muel', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 09:28:09'),
(37, '403635', 'oke', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 09:31:51'),
(38, '421400', 'oke', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"b\"}, {\"id\": \"C\", \"text\": \"c\"}, {\"id\": \"D\", \"text\": \"c\"}]', '[\"C\"]', '2025-12-04 09:34:26'),
(39, '277461', 'aa', 'pg', 10, '[{\"id\": \"A\", \"text\": \"421400\"}, {\"id\": \"B\", \"text\": \"421400\"}, {\"id\": \"C\", \"text\": \"421400\"}, {\"id\": \"D\", \"text\": \"421400\"}]', '[\"A\"]', '2025-12-04 09:35:10'),
(40, '461467', 'AAAA', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 09:38:10'),
(42, '538387', 'AAAAA', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 09:39:23'),
(43, '187776', 'OKE', 'tf', 100, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 09:41:19'),
(44, '187776', 'OKEKEE', 'cb', 1000, '[{\"id\": 1, \"text\": \"A\"}, {\"id\": 2, \"text\": \"A\"}, {\"id\": 3, \"text\": \"C\"}, {\"id\": 4, \"text\": \"A\"}]', '[\"1\", \"2\", \"3\"]', '2025-12-04 09:41:44'),
(45, '898445', 'AAA', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 09:44:01'),
(46, '898445', 'AAAA', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"A\"}, {\"id\": \"B\", \"text\": \"A\"}, {\"id\": \"C\", \"text\": \"A\"}, {\"id\": \"D\", \"text\": \"A\"}]', '[\"A\"]', '2025-12-04 09:44:17'),
(47, '226070', 'oke', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 09:54:02'),
(48, '226070', 'oke', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"a\"}, {\"id\": \"C\", \"text\": \"a\"}, {\"id\": \"D\", \"text\": \"a\"}]', '[\"A\"]', '2025-12-04 09:54:15'),
(49, '762612', 'okay', 'pg', 100, '[{\"id\": \"A\", \"text\": \"a\"}, {\"id\": \"B\", \"text\": \"d\"}, {\"id\": \"C\", \"text\": \"f\"}, {\"id\": \"D\", \"text\": \"g\"}]', '[\"A\"]', '2025-12-04 10:00:02'),
(50, '174731', '1000', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"true\"]', '2025-12-04 10:01:14'),
(51, '151459', 'aaa', 'tf', 10, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 10:02:18'),
(52, '756932', 'Siapa Dia?', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"Dewa\"}, {\"id\": \"B\", \"text\": \"Dewi\"}, {\"id\": \"C\", \"text\": \"Tuhan\"}, {\"id\": \"D\", \"text\": \"Iblis\"}]', '[\"A\"]', '2025-12-04 10:04:30'),
(53, '904214', 'siap', 'pg', 1000, '[{\"id\": \"A\", \"text\": \"Oke\"}, {\"id\": \"B\", \"text\": \"Sipa\"}, {\"id\": \"C\", \"text\": \"AA\"}, {\"id\": \"D\", \"text\": \"ss\"}]', '[\"A\"]', '2025-12-04 10:06:33'),
(54, '330640', 'aaa', 'tf', 1000, '[{\"id\": \"true\", \"text\": \"Benar\"}, {\"id\": \"false\", \"text\": \"Salah\"}]', '[\"false\"]', '2025-12-04 10:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `roomCode` varchar(10) NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `hostName` varchar(100) NOT NULL,
  `mode` enum('ordered','random') NOT NULL,
  `totalQuestions` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'waiting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `roomCode`, `roomName`, `hostName`, `mode`, `totalQuestions`, `createdAt`, `status`) VALUES
(12, '506648', 'kuis', 'johan', 'ordered', 1, '2025-12-04 07:34:46', 'waiting'),
(13, '111499', 'kilasj', 'johan', 'ordered', 1, '2025-12-04 07:46:27', 'waiting'),
(14, '862096', 'fdgg', 'johan', 'ordered', 1, '2025-12-04 07:53:09', 'waiting'),
(15, '209152', 'aaa', 'johan', 'ordered', 1, '2025-12-04 07:53:52', 'waiting'),
(16, '928071', 'oke', 'johan', 'ordered', 1, '2025-12-04 07:59:48', 'waiting'),
(17, '159270', '1222', 'johan', 'ordered', 1, '2025-12-04 08:07:06', 'waiting'),
(18, '621998', 'aaaa', 'johan', 'ordered', 1, '2025-12-04 08:12:19', 'started'),
(19, '985793', 'okay', 'johan', 'ordered', 1, '2025-12-04 08:14:20', 'started'),
(20, '233238', 'kia', 'johan', 'ordered', 1, '2025-12-04 08:16:50', 'started'),
(21, '134591', 'kiasss', 'johan', 'ordered', 2, '2025-12-04 08:23:22', 'started'),
(22, '763675', 'KILAS-01', 'johan', 'ordered', 1, '2025-12-04 08:28:15', 'started'),
(23, '144111', 'Dark', 'johan', 'ordered', 1, '2025-12-04 08:32:14', 'finished'),
(24, '130566', 'Llma', 'johan', 'ordered', 1, '2025-12-04 08:33:59', 'finished'),
(25, '541256', 'aa', 'johan', 'ordered', 12, '2025-12-04 08:42:19', 'finished'),
(26, '239286', 'kilas aaaa', 'johan', 'ordered', 1, '2025-12-04 08:43:21', 'finished'),
(27, '916619', 'ko', 'johan', 'ordered', 1, '2025-12-04 08:54:39', 'finished'),
(28, '121897', 'asss', 'johan', 'ordered', 1, '2025-12-04 09:02:02', 'finished'),
(29, '374978', 'aaaaaa', 'johan', 'ordered', 1, '2025-12-04 09:08:53', 'finished'),
(30, '323260', 'aaa', 'johan', 'ordered', 1, '2025-12-04 09:12:29', 'finished'),
(31, '668077', 'okay', 'johan', 'ordered', 1, '2025-12-04 09:20:09', 'finished'),
(32, '219456', 'aaa', 'johan', 'ordered', 1, '2025-12-04 09:27:59', 'finished'),
(33, '403635', 'aaaa', 'gonter', 'ordered', 1, '2025-12-04 09:31:33', 'finished'),
(34, '421400', 'aaa', 'gonter', 'ordered', 1, '2025-12-04 09:33:46', 'started'),
(35, '277461', 'aaa', 'gonter', 'ordered', 1, '2025-12-04 09:34:56', 'finished'),
(36, '461467', 'dfdf', 'gonter', 'ordered', 1, '2025-12-04 09:37:53', 'started'),
(37, '538387', 'AAAAAAAAA', 'gonter', 'ordered', 1, '2025-12-04 09:38:36', 'finished'),
(38, '187776', 'AAAA', 'gonter', 'ordered', 2, '2025-12-04 09:41:09', 'finished'),
(39, '898445', 'HDGDGDGD', 'gonter', 'ordered', 2, '2025-12-04 09:43:48', 'finished'),
(40, '226070', 'aaa', 'johan', 'ordered', 2, '2025-12-04 09:53:55', 'finished'),
(41, '762612', 'aaa', 'gonter', 'ordered', 2, '2025-12-04 09:59:50', 'finished'),
(42, '174731', 'aaa', 'gonter', 'ordered', 1, '2025-12-04 10:01:07', 'finished'),
(43, '151459', 'aaaa', 'gonter', 'ordered', 1, '2025-12-04 10:02:07', 'finished'),
(44, '756932', 'kilas-12', 'gonter', 'ordered', 1, '2025-12-04 10:04:04', 'started'),
(45, '904214', 'aaa', 'johan', 'ordered', 1, '2025-12-04 10:06:15', 'finished'),
(46, '283792', 'aaa', 'johan', 'ordered', 1, '2025-12-04 10:10:22', 'waiting'),
(47, '330640', 'aaa', 'aaa', 'ordered', 1, '2025-12-04 10:19:47', 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'hizkia34', 'hz@gmail.com', '1234', '2025-12-03 14:51:34'),
(2, 'firman', 'firman@gmail.com', '1234', '2025-12-03 14:59:35'),
(3, 'desber', 'd@gmail.com', '1234', '2025-12-03 16:00:33'),
(4, 'gonter', 'gon@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Ix2o4O3zbNzM8RT1zdopIQ$x0Ea/lzQ1jE9vRcyi+yedB9gHyZQVO3b/gyVrF2UQK4', '2025-12-04 05:07:50'),
(5, 'johan', 'jo@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$j5XQTBjCyTEGZqoxz7PHBA$jCwwhyWV5qjgCp4o32WSNlqJZJrN4zSTjAVx4FwU1po', '2025-12-04 05:23:16'),
(7, 'hizkia siahaan', 'hzkia@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$KZJkOfvOJsr1jCymS+2usQ$xMKn9xeEooXnvCyKuhX3KM8mFkn4lRXE+aaqxYuJFEo', '2025-12-04 05:24:49'),
(8, 'adi', 'adi@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ZDqnGct6K2wcl3G5t9O+0A$vdkXhegJ+iOO7k2ocRSDRbkU3/78IaG2bi1MwHhyilk', '2025-12-04 05:29:29'),
(9, 'aaa', 'a@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DBiBWOde/UETcMS7dpqh6w$TcXBDF187IPrhGvSwb3uFd/8j8LXqOvEExYuE9hgv1Y', '2025-12-04 10:19:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomCode` (`roomCode`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roomCode` (`roomCode`),
  ADD UNIQUE KEY `roomCode_2` (`roomCode`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`roomCode`) REFERENCES `rooms` (`roomCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
