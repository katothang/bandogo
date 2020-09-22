-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 22, 2020 lúc 03:55 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `parent`) VALUES
(5, 'BÀN GHẾ GỖ', 'ban-ghe-go', 0),
(6, 'TỦ GỖ', 'tu-go', 0),
(7, 'BỘ BÀN ĂN', 'bo-ban-an', 0),
(8, 'GIƯỜNG GỖ', 'giuong-go', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_05_15_040854_create_category_table', 1),
(2, '2020_05_15_073332_create_product_table', 1),
(3, '2020_05_15_074028_create_users_table', 1),
(4, '2020_05_15_080439_create_order_table', 1),
(5, '2020_05_15_162628_create_order_detail_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `full` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(18,0) DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `full`, `address`, `email`, `phone`, `total`, `state`, `created_at`, `updated_at`) VALUES
(1, 'dsdsdsds', 'dsdsd', 'katothang@gmail.com', '0345648295', '482790', 0, '2020-09-17 03:00:57', '2020-09-17 03:00:57'),
(2, 'Bui Thi Hai Van', 'Ha noi viet nam', 'vanbui@gmail.com', '0345648295', '605000', 1, '2020-09-17 09:27:50', '2020-09-17 09:28:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,0) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `code`, `name`, `price`, `quantity`, `img`, `order_id`) VALUES
(1, 'NIKE01', 'Giày Thể Thao XSPORT Ni.ke Air Force 1 Full Trắng SF', '399000', 1, 'no-img.jpg', 1),
(2, '5260', 'Giày Thể Thao Nam MWC NATT - 5260', '500000', 1, 'giay-the-thao-nam-mwc-natt-5260.jpg', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,0) NOT NULL DEFAULT 0,
  `featured` tinyint(3) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `describe` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `code`, `name`, `slug`, `price`, `featured`, `state`, `info`, `describe`, `img`, `category_id`, `created_at`, `updated_at`) VALUES
(8, '0022', 'Bộ Bàn Ghế Hoàng Gia Gỗ Mun Đuôi Công 6 món', 'bo-ban-ghe-hoang-gia-go-mun-duoi-cong-6-mon', '36000000', 1, 1, 'Nhà sản xuất: Đồ gỗ mạnh mộc\r\n\r\nDòng sản phẩm: Bàn ghế phòng khách', 'Bộ Bàn Ghế Phòng Khách Hoàng Gia Gỗ Mun Đuôi Công 6 món : 38tr\r\n\r\nBộ Bàn Ghế Phòng Khách Hoàng Gia Gỗ Mun Đuôi Công 10 món: 58tr\r\n\r\nGiá Bán Đã Bao Gồm Sơn Pu Hoàn Thiện', 'bo-ban-ghe-hoang-gia-go-mun-duoi-cong-6-mon.jpg', 5, '2020-09-22 06:45:13', '2020-09-22 06:45:44'),
(9, 'GN502C-160MT', 'Giường Ngủ Thiết Kế Đuôi Cong Mềm Mại Gỗ Xoan Đào Màu Trắng', 'giuong-ngu-thiet-ke-duoi-cong-mem-mai-go-xoan-dao-mau-trang', '15500000', 1, 1, 'Chất liệu: Gỗ Xoan Đào - Vạt nan hoặc vạt phản.\r\nTình trạng: Hàng mới 100%\r\nTrạng thái: Còn hàng.', 'rên thị trường hiện nay có vô vàn các mẫu giường ngủ đẹp, đa dạng từ thiết kế, kiểu dáng, chất lượng, mẫu mã cho đến màu sắc. Nếu giường ngủ nhà bạn đã cũ thì hãy mạnh dạn thay một chiếc giường mới ngay và luôn đi nhé.\r\nBạn có thể tiết kiệm tiền mua quần áo, tiền mua son phấn nhưng tuyệt đối đừng tiết tiền khi mua giường ngủ. Vì sao ư? Giường ngủ có vai trò rất quan trọng, mang đến cho bạn những giấc ngủ sâu, thoải mái và êm dịu nhất. Chẳng phải mỗi lần mệt mỏi, kiệt sức vì công việc, chán nản,.. bạn điều tìm đến giường ngủ hay sao? Một giấc ngủ ngon sẽ nạp năng lượng cho bạn để tiếp tục “cuộc chiến” mỗi ngày. Vì vậy đừng bao giờ tiếc tiền khi mua giường ngủ.', 'giuong-ngu-thiet-ke-duoi-cong-mem-mai-go-xoan-dao-mau-trang.jpg', 8, '2020-09-22 06:52:03', '2020-09-22 06:52:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full`, `address`, `phone`, `level`, `remember_token`) VALUES
(1, 'katothang@gmail.com', '$2y$12$KlT2DY/yFOKSAhjd.mvg4eMB2z1MXrtLrKobc.Vs9ZX7lIQfGvGNG', '', '', '', 1, ''),
(2, 'admin@gmail.com', '$2y$12$yvIT8svsJ409YqOPvBALL.Qcw3bW6gqA1AsX/mob2kZB2.ubRaYT.', 'admin', 'hn', '0345648295', 1, NULL),
(3, 'haivan@gmail.com', '$2y$10$oJic/4ai7aXWa/K/hWrx6ellwBEr33OTUD00j7V5O7z5QLt8yTCl2', 'Bui Thi Hai Van', 'ha noi', '0364561995', 1, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code_unique` (`code`),
  ADD KEY `product_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
