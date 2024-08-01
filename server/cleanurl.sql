-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2024 at 05:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleanurl`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_31_113659_create_short_urls_table', 2),
(6, '2024_07_31_152744_add_user_email_to_short_urls_table', 3),
(7, '2024_07_31_164555_add_clicks_to_short_urls_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', 'bf765f4be887e76c1e6ddddea9eec9436380c4026f6827a83884df9f39d6350e', '[\"*\"]', NULL, NULL, '2024-07-30 09:19:25', '2024-07-30 09:19:25'),
(2, 'App\\Models\\User', 4, 'auth_token', '9271a4d29ab826dbb1ab3680827c892ef7c7ba653e8c43a9f1e9c8888963715a', '[\"*\"]', NULL, NULL, '2024-07-30 09:20:01', '2024-07-30 09:20:01'),
(3, 'App\\Models\\User', 5, 'auth_token', '16e6dde51ef5aca0074b844d2cbbc7d2bd18a795e469bf6fb75ed0a29767789a', '[\"*\"]', NULL, NULL, '2024-07-30 09:21:36', '2024-07-30 09:21:36'),
(4, 'App\\Models\\User', 6, 'auth_token', 'b5d311fb850fa72ab2b27da871b856425b0706ef1b0c7b5ea482a03dc6ecceb6', '[\"*\"]', NULL, NULL, '2024-07-30 09:21:57', '2024-07-30 09:21:57'),
(6, 'App\\Models\\User', 2, 'auth_token', '3542b8bb52993f4b13febd0cf3b2d45ce0cb419cf7975700c3f6c3a6e969dd6b', '[\"*\"]', '2024-07-30 09:46:19', NULL, '2024-07-30 09:46:06', '2024-07-30 09:46:19'),
(8, 'App\\Models\\User', 2, 'auth_token', '9f319565de81a6681830e7abe3f7321335d868af737e7677ed99186fe7a6f304', '[\"*\"]', NULL, NULL, '2024-07-30 09:46:32', '2024-07-30 09:46:32'),
(10, 'App\\Models\\User', 2, 'auth_token', '82f2b98d3f9c74089b9c96dba6f5c756a747c693f8d08d4fca816b015fc4cf0c', '[\"*\"]', '2024-07-30 12:16:03', NULL, '2024-07-30 12:15:56', '2024-07-30 12:16:03'),
(11, 'App\\Models\\User', 2, 'auth_token', '4e1e57a7d136a88ce36d8eb4d45e99ca1124fc52ebe41c9d3109247e5637f982', '[\"*\"]', '2024-07-30 12:16:12', NULL, '2024-07-30 12:16:03', '2024-07-30 12:16:12'),
(12, 'App\\Models\\User', 2, 'auth_token', 'b1572b5ae491a6c14376160cbdd08c2eb4f800f5f326d8501e2c9d176b5efb0b', '[\"*\"]', '2024-07-30 12:16:15', NULL, '2024-07-30 12:16:12', '2024-07-30 12:16:15'),
(13, 'App\\Models\\User', 2, 'auth_token', 'ab7de6021d4be96cbd7a0b5d9af051806ed99f0a8f20492c9ef4f89ec91447bb', '[\"*\"]', '2024-07-30 12:16:32', NULL, '2024-07-30 12:16:15', '2024-07-30 12:16:32'),
(14, 'App\\Models\\User', 2, 'auth_token', '31b4f786f92f893617bfe9ead51d20d9dd0233c104923e549660a8e8f80b67e8', '[\"*\"]', '2024-07-30 12:16:45', NULL, '2024-07-30 12:16:32', '2024-07-30 12:16:45'),
(15, 'App\\Models\\User', 2, 'auth_token', '1369cfeb8aea9baf1d40cc258d22cc67af5f0f477ebfb00865e8a9044dc62224', '[\"*\"]', NULL, NULL, '2024-07-30 12:16:44', '2024-07-30 12:16:44'),
(16, 'App\\Models\\User', 2, 'auth_token', 'b8c915b355f65761de70971ec52836a2a455ac888b5836ca4e8b15505378c4f5', '[\"*\"]', '2024-07-30 12:17:39', NULL, '2024-07-30 12:16:45', '2024-07-30 12:17:39'),
(17, 'App\\Models\\User', 2, 'auth_token', '14cb40d9952c65fd70f3f1ce1539850ec1e7287029e572a7f2c717f8fc146ffd', '[\"*\"]', '2024-07-30 12:18:33', NULL, '2024-07-30 12:17:39', '2024-07-30 12:18:33'),
(18, 'App\\Models\\User', 2, 'auth_token', 'c11d9098621931d5c5754e6ef0cece044f60931b736b40745b35e1403f4c4751', '[\"*\"]', '2024-07-30 12:18:40', NULL, '2024-07-30 12:18:33', '2024-07-30 12:18:40'),
(19, 'App\\Models\\User', 2, 'auth_token', '74f1b4742bccb1c58e14de88f3896934d91d7c825ee7eeb69d4f6a9319bd5142', '[\"*\"]', '2024-07-30 12:18:44', NULL, '2024-07-30 12:18:40', '2024-07-30 12:18:44'),
(20, 'App\\Models\\User', 2, 'auth_token', 'f19b2e397c9a21680f208a4c91a5eb513ce80e40363bb8b8b60fbd8fea8068d8', '[\"*\"]', '2024-07-30 12:18:49', NULL, '2024-07-30 12:18:44', '2024-07-30 12:18:49'),
(21, 'App\\Models\\User', 2, 'auth_token', '94f309787b893f6bf82caaf84529562dac0301675d13c88b948c6ff3abc14c17', '[\"*\"]', '2024-07-30 12:18:59', NULL, '2024-07-30 12:18:49', '2024-07-30 12:18:59'),
(22, 'App\\Models\\User', 2, 'auth_token', '5ba4c35bdb8f1d50ffb15c71e12ccb13c0c36731ac8c27a538abdc82cdd120c1', '[\"*\"]', '2024-07-30 12:19:03', NULL, '2024-07-30 12:18:59', '2024-07-30 12:19:03'),
(23, 'App\\Models\\User', 2, 'auth_token', 'c3747436fa13ed426bf71891ef81d94c3b8757f6976fefbe186d2f132652bc53', '[\"*\"]', '2024-07-30 12:19:14', NULL, '2024-07-30 12:19:03', '2024-07-30 12:19:14'),
(24, 'App\\Models\\User', 2, 'auth_token', '8c9f5f686c05added427afd18d80b42052f41478929205430f7a7e8f00fbcef1', '[\"*\"]', '2024-07-30 12:19:17', NULL, '2024-07-30 12:19:14', '2024-07-30 12:19:17'),
(25, 'App\\Models\\User', 2, 'auth_token', 'c6c59c9e9f282fe5f0f302da4011d6369febc2fbc6da12f417dd22f310dfc48b', '[\"*\"]', '2024-07-30 12:23:15', NULL, '2024-07-30 12:19:17', '2024-07-30 12:23:15'),
(26, 'App\\Models\\User', 2, 'auth_token', 'e4dae9e3fae9582eb74385d5b3558a6c5224a1d079d08ed3439d31da0969f2ab', '[\"*\"]', NULL, NULL, '2024-07-30 12:23:15', '2024-07-30 12:23:15'),
(27, 'App\\Models\\User', 2, 'auth_token', '6c89f6d34a8f3145ce561df5d1e47a49f5dbe30251e75befb74449dc811b880d', '[\"*\"]', NULL, NULL, '2024-07-30 12:51:27', '2024-07-30 12:51:27'),
(28, 'App\\Models\\User', 2, 'auth_token', '8fa38a930c1b063f09743632e86beb56a1e8e2f6fe4e27adc9951726a0622551', '[\"*\"]', NULL, NULL, '2024-07-30 12:53:35', '2024-07-30 12:53:35'),
(29, 'App\\Models\\User', 2, 'auth_token', '17f45d74d52374e69532740a359790032fe87053375eed7e58084814c40320ab', '[\"*\"]', NULL, NULL, '2024-07-30 12:54:43', '2024-07-30 12:54:43'),
(30, 'App\\Models\\User', 2, 'auth_token', '09a8983b36acf421fd77efdea6e1f8edb00b0830012bfe640e3e8c2579082257', '[\"*\"]', NULL, NULL, '2024-07-30 12:55:48', '2024-07-30 12:55:48'),
(31, 'App\\Models\\User', 2, 'auth_token', 'bb7d0724249d2e5bed21232a4224e9e109c0109434d970006ed8bf6305dc58b3', '[\"*\"]', NULL, NULL, '2024-07-30 12:56:07', '2024-07-30 12:56:07'),
(32, 'App\\Models\\User', 2, 'auth_token', '878864c3693da75484431e527e75f13b403a3b1833dd6227eb94cf1dcc001f15', '[\"*\"]', NULL, NULL, '2024-07-30 12:56:29', '2024-07-30 12:56:29'),
(33, 'App\\Models\\User', 2, 'auth_token', '6f5a4b014a96ff07dd90aaa20e89e996d86a4deabfc719ab1e0a16ae048146a0', '[\"*\"]', NULL, NULL, '2024-07-30 12:57:26', '2024-07-30 12:57:26'),
(50, 'App\\Models\\User', 9, 'auth_token', '41651601931b017385d6c4465ef5aaa4adb64d5a5a68840d28f29d39672ea0c3', '[\"*\"]', NULL, NULL, '2024-08-01 10:13:17', '2024-08-01 10:13:17'),
(51, 'App\\Models\\User', 9, 'auth_token', '59c305483cd3b3998889880b3d86c7380c8a9b1cd5a551a16215c76d82a035aa', '[\"*\"]', NULL, NULL, '2024-08-01 10:13:51', '2024-08-01 10:13:51'),
(56, 'App\\Models\\User', 2, 'auth_token', 'a4cc7d36ef0197ee21de582634378a7e017640ec2b2ed1cadf72b05afdcf1ee6', '[\"*\"]', '2024-08-01 13:15:51', NULL, '2024-08-01 12:47:11', '2024-08-01 13:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `original_url` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clicks` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `original_url`, `short_code`, `user_email`, `created_at`, `updated_at`, `clicks`) VALUES
(20, 'https://es.pinterest.com/pin/574420127493567566/', 'jtqRba', 'alvaro@gmail.com', '2024-07-31 13:43:38', '2024-07-31 14:47:19', 1),
(21, 'https://www.awwwards.com/', 'oDHynF', 'alvaro@gmail.com', '2024-07-31 14:05:32', '2024-07-31 14:05:32', 0),
(22, 'https://oh-vue-icons.js.org/', 'wtmwJY', 'alvaro@gmail.com', '2024-08-01 08:36:32', '2024-08-01 08:36:32', 0),
(23, 'https://box-shadow.dev/', 'YsTWiJ', 'alvaro@gmail.com', '2024-08-01 08:59:20', '2024-08-01 08:59:20', 0),
(24, 'https://search.brave.com/search?q=e-charts&source=desktop', 'rcFs7p', 'alvaro@gmail.com', '2024-08-01 09:10:45', '2024-08-01 09:10:45', 0),
(25, 'https://es.pinterest.com/pin/574420127493567566/', 'MrJ9lx', 'alvaro@gmail.com', '2024-08-01 09:29:53', '2024-08-01 11:06:18', 1),
(26, 'https://es.pinterest.com/pin/574420127493567566/', 'yDr3g2', 'alvaro@gmail.com', '2024-08-01 09:29:54', '2024-08-01 09:29:54', 0),
(27, 'https://www.awwwards.com/', '2FiEq4', 'alvaro@gmail.com', '2024-08-01 10:25:23', '2024-08-01 10:25:23', 0),
(28, 'https://chatgpt.com/', '1Z0WOL', 'alvaro@gmail.com', '2024-08-01 10:28:21', '2024-08-01 10:28:21', 0),
(29, 'http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=cleanurl&table=users', 'KX1DSh', 'alvaro@gmail.com', '2024-08-01 12:58:22', '2024-08-01 12:58:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'alvaro', 'alvaro@gmail.com', NULL, '$2y$10$ZL.Qi64I7teFw9bPagH0Ke/h8UsVdo8o6iQnFSRPVRdUXivY2xmay', NULL, '2024-07-30 09:16:11', '2024-07-30 09:16:11'),
(7, 'pepe', 'pepillo@gmail.com', NULL, '$2y$10$3k7tYsDOZXxyVjYTAHFBeOWicGoHVHJVJwXls/R9drXCh2jGC/2/a', NULL, '2024-07-30 09:27:21', '2024-07-30 09:27:21'),
(9, 'luis', 'luis@gmail.com', NULL, '$2y$10$12EFpL3t9TTqiSOUu4oBjO4IvCXBciEZo2sp2.FUpJdUX21r5NCQK', NULL, '2024-08-01 10:06:16', '2024-08-01 10:06:16');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_urls_short_code_unique` (`short_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
