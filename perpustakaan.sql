-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2024 at 02:03 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint UNSIGNED NOT NULL,
  `book_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_code`, `title`, `cover`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'L1', 'Laravel For Newbie', 'Laravel For Newbie-1734775530.png', 'laravel-for-newbie', 'in stock', NULL, '2024-12-22 06:09:21', NULL),
(2, 'A001-02', 'PHP For Newbie', NULL, 'php-for-newbie', 'in stock', '2024-12-13 22:55:21', '2024-12-26 06:59:36', NULL),
(3, 'A001-03', 'Programmer Untuk Pemula', NULL, 'programmer-untuk-pemula', 'in stock', '2024-12-13 23:00:20', '2024-12-22 06:29:36', NULL),
(4, 'A001-04', 'HTML & CSS', NULL, 'html-css', 'in stock', '2024-12-14 07:48:32', '2024-12-22 06:29:42', NULL),
(5, 'A001-05', 'Cara Cepat Menjadi Kaya', 'Cara Cepat Menjadi Kaya-1734776409.png', 'cara-cepat-menjadi-kaya', 'in stock', '2024-12-14 08:19:24', '2024-12-22 06:38:33', NULL),
(6, 'A001-06', 'Atomic Habbits', 'Atomic Habbits-1734189942.png', 'atomic-habbits', 'in stock', '2024-12-14 08:25:42', '2024-12-25 09:18:01', NULL),
(7, 'A001-07', 'Tentangmu', NULL, 'tentangmu', 'in stock', '2024-12-14 09:09:06', '2024-12-15 09:05:21', '2024-12-15 09:05:21'),
(8, 'A001-08', 'Filosofi Teras', 'Filosofi Teras-1734199473.png', 'filosofi-teras', 'in stock', '2024-12-14 09:27:40', '2024-12-25 09:13:28', NULL),
(9, 'A001-09', 'Memeluk Boemi', '', 'memeluk-boemi', 'in stock', '2024-12-25 09:14:51', '2024-12-25 09:14:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 7, 4, NULL, NULL),
(3, 8, 5, NULL, NULL),
(4, 8, 9, NULL, NULL),
(5, 8, 12, NULL, NULL),
(6, 1, 9, NULL, NULL),
(7, 5, 3, NULL, NULL),
(8, 9, 3, NULL, NULL),
(9, 9, 4, NULL, NULL),
(10, 9, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'novel', 'novel', NULL, NULL, NULL),
(2, 'comic', 'comic', NULL, NULL, NULL),
(3, 'fantasy', 'fantasy', NULL, NULL, NULL),
(4, 'fiction', 'fiction', NULL, NULL, NULL),
(5, 'mystery', 'mystery', NULL, NULL, NULL),
(6, 'horror', 'horror', NULL, NULL, NULL),
(7, 'romance', 'romance', NULL, NULL, NULL),
(8, 'western', 'western', NULL, NULL, NULL),
(9, 'Science', 'Science', '2024-11-27 20:54:30', '2024-11-27 20:54:30', NULL),
(10, 'Sports', 'Sports', '2024-11-27 21:21:51', '2024-12-01 09:49:59', NULL),
(12, 'Seff Impovement', 'seff-impovement', '2024-11-28 05:45:24', '2024-12-01 08:32:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_14_080627_create_roles_table', 1),
(7, '2024_10_14_170115_add_role_id_colum_to_users_table', 2),
(8, '2024_10_14_173033_create_categories_table', 2),
(9, '2024_10_14_173244_create_book_table', 2),
(13, '2024_10_15_154327_create_categories_table', 3),
(14, '2024_10_15_154539_create_books_table', 3),
(15, '2024_10_15_155114_create_book_category_table', 3),
(16, '2024_10_15_160438_create_rent_logs_table', 4),
(18, '2024_11_28_043515_add_slug_column_to_categories_table', 5),
(19, '2024_11_28_054110_change_slug_column_into_nullable_in_categories_table', 6),
(20, '2024_12_01_153916_add_soft_delete_column_to_categories_table', 7),
(21, '2024_12_08_170803_add_slug_cover_column_to_books_table', 8),
(22, '2024_12_15_152813_add_soft_delete_to_books_table', 9),
(23, '2024_12_16_141311_add_slug_to_users_table', 10),
(24, '2024_12_16_152352_add_softdelete_to_users_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rent_logs`
--

CREATE TABLE `rent_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `rent_date` date NOT NULL,
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rent_logs`
--

INSERT INTO `rent_logs` (`id`, `user_id`, `book_id`, `rent_date`, `return_date`, `actual_return_date`, `created_at`, `updated_at`) VALUES
(6, 7, 2, '2024-12-22', '2024-12-29', '2024-12-22', '2024-12-22 06:10:09', '2024-12-22 10:44:20'),
(7, 7, 3, '2024-12-22', '2024-12-29', '2024-12-31', '2024-12-22 06:29:35', '2024-12-22 06:29:35'),
(8, 7, 4, '2024-12-22', '2024-12-29', '2024-12-29', '2024-12-22 06:29:41', '2024-12-22 06:29:41'),
(9, 7, 5, '2024-12-22', '2024-12-29', '2024-12-25', '2024-12-22 06:38:33', '2024-12-25 09:15:36'),
(10, 8, 8, '2024-12-25', '2025-01-01', '2024-12-25', '2024-12-25 09:13:28', '2024-12-25 09:16:03'),
(11, 8, 6, '2024-12-25', '2025-01-01', '2024-12-25', '2024-12-25 09:18:01', '2024-12-25 09:18:30'),
(12, 8, 2, '2024-12-26', '2025-01-02', '2024-12-26', '2024-12-26 06:59:36', '2024-12-26 07:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'client', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `slug`, `password`, `phone`, `address`, `status`, `created_at`, `updated_at`, `deleted_at`, `role_id`) VALUES
(1, 'admin', 'admin', '$2y$10$3HYRngijiz0/Zx2wTIL4ZelolBC6dk7yFxHT55zzxoqh8l9BzJRgy', NULL, 'perpustakaan', 'active', NULL, NULL, NULL, 1),
(2, 'tes1', 'tes1', '$2y$10$3HYRngijiz0/Zx2wTIL4ZelolBC6dk7yFxHT55zzxoqh8l9BzJRgy', NULL, 'akun test1', 'inactive', NULL, NULL, NULL, 2),
(3, 'test2', 'test2', '$2y$10$3HYRngijiz0/Zx2wTIL4ZelolBC6dk7yFxHT55zzxoqh8l9BzJRgy', NULL, 'akun test2', 'active', NULL, '2024-12-16 09:27:30', NULL, 2),
(6, 'Zulfan', 'zulfan', '$2y$10$Ecz9B5g0viCo/CnzO8LF9OwXDgrblY5Rssm7QCOHKtzxP1uEhMnje', '000000', 'Raga Tunjung', 'inactive', '2024-10-25 10:14:06', '2024-10-25 10:14:06', NULL, 2),
(7, 'dendikanpas', 'dendikanpas', '$2y$10$5ZlvuHERw7KjTKeWxFAl5e88ZAf7U8w1cxECBRacz8dgc.T6TcHVC', '988767675', 'kaligiri', 'active', '2024-12-16 07:32:42', '2024-12-16 09:27:33', NULL, 2),
(8, 'Daru', 'daru', '$2y$10$lf4WSRV6wwXrVBiQaurCbuW88fm8rrGDxgUY4h0EaHGnsG1dg.BF2', '11111111', 'Karang Sawah', 'active', '2024-12-25 09:02:01', '2024-12-25 09:05:06', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rent_logs_user_id_foreign` (`user_id`),
  ADD KEY `rent_logs_book_id_foreign` (`book_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent_logs`
--
ALTER TABLE `rent_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD CONSTRAINT `rent_logs_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `rent_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
