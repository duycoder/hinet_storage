-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2017 at 09:56 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hinet_storage`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `ID` bigint(10) NOT NULL,
  `action_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `action_name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `function_id` int(10) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`ID`, `action_code`, `action_name`, `function_id`, `is_active`, `date_create`, `date_modify`, `user_create`, `user_modify`, `is_delete`) VALUES
(2, 'ADD_CUSTOMER', 'Thêm mới khách hàng', 2, b'0', '2017-12-10 13:44:39', '2017-12-10 13:44:39', 32, 2147483647, b'0'),
(3, 'ADD_STORAGE', 'Thêm mới kho hàng', 9, b'0', '2017-12-10 13:48:04', '2017-12-10 13:48:04', 32, 2147483647, b'0'),
(4, 'ADD_USER', 'Thêm mới người dùng', 10, b'0', '2017-12-10 13:49:01', '2017-12-10 13:49:02', 32, 2147483647, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` int(10) NOT NULL,
  `entity_type_id` int(10) DEFAULT NULL COMMENT 'Mã loại tệp đính kèm',
  `entity_type_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Tên loại tệp đính kèm',
  `entity_id` bigint(10) DEFAULT NULL COMMENT 'Định danh đối tượng',
  `entity_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Tên đối tượng',
  `mime_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Đường dẫn file',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'mã khách hàng',
  `customer_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'họ tên khách hàng',
  `customer_type_id` int(2) DEFAULT NULL COMMENT 'loại khách hàng',
  `customer_address` text COLLATE utf8_unicode_ci COMMENT 'địa chỉ khách hàng',
  `customer_mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'di động khách hàng',
  `is_delete` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(11) DEFAULT NULL,
  `user_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `export_bill`
--

CREATE TABLE `export_bill` (
  `id` bigint(10) NOT NULL,
  `exportbill_type_id` int(2) DEFAULT NULL COMMENT 'loại phiếu xuất',
  `paper_export_date` datetime DEFAULT NULL COMMENT 'ngày xuất trên giấy tờ',
  `real_export_date` datetime DEFAULT NULL COMMENT 'ngày nhập thực tế',
  `export_bill_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mã phiếu xuất',
  `receipt_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mã hóa đơn',
  `deliver` text COLLATE utf8_unicode_ci COMMENT 'người giao hàng',
  `delivery_department` text COLLATE utf8_unicode_ci COMMENT 'đơn vị giao hàng',
  `in_storage_id` int(10) DEFAULT NULL COMMENT 'mã kho nhập',
  `out_storage_id` int(10) DEFAULT NULL COMMENT 'mã kho xuất',
  `total_amount` decimal(10,0) DEFAULT NULL COMMENT 'Tổng tiền đơn hàng',
  `status` int(11) NOT NULL COMMENT 'Trạng thái xử lý hiện tại của phiếu nhập hàng ',
  `is_finish` bit(1) DEFAULT NULL COMMENT 'tình trạng đơn hàng này đã xong',
  `description` text COLLATE utf8_unicode_ci COMMENT 'ghi chú',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `export_bill_detail`
--

CREATE TABLE `export_bill_detail` (
  `id` int(10) NOT NULL,
  `product_id` bigint(10) DEFAULT NULL,
  `export_bill_id` bigint(10) DEFAULT NULL,
  `quantity` bigint(10) DEFAULT NULL COMMENT 'Số lượng từng sản phẩm',
  `price` decimal(18,0) DEFAULT NULL COMMENT 'Đơn giá tiền chi tiết đơn hàng',
  `is_delete` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

CREATE TABLE `function` (
  `ID` int(10) NOT NULL,
  `function_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `function_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `function`
--

INSERT INTO `function` (`ID`, `function_code`, `function_name`, `is_active`, `date_create`, `date_modify`, `user_create`, `user_modify`, `is_delete`) VALUES
(1, 'USER_MANAGER', 'Quản lý ngưởi dùng', b'1', '2017-12-10 09:09:12', '2017-12-10 10:00:39', -2147483648, -2147483648, b'1'),
(2, 'CUSTOMER_MANAGER', 'Quản lý khách hàng', b'1', '2017-12-10 09:12:04', '2017-12-10 09:12:04', -2147483648, -2147483648, b'0'),
(3, 'FUNCTION_MANAGER', 'Quản lý chức năng', b'1', '2017-12-10 09:12:27', '2017-12-10 09:12:27', -2147483648, -2147483648, b'0'),
(4, 'ACTION_MANAGER', 'Quản lý hành động thuộc chức năng', b'0', '2017-12-10 09:12:56', '2017-12-10 09:12:56', -2147483648, -2147483648, b'0'),
(5, 'MEASURE_UNIT_MANAGER', 'Quản lý đơn vị đo lường', b'0', '2017-12-10 09:13:57', '2017-12-10 09:13:57', -2147483648, -2147483648, b'0'),
(6, 'IMPORT_MANAGER', 'Quản lý nhập hàng', b'0', '2017-12-10 09:15:32', '2017-12-10 09:15:32', -2147483648, -2147483648, b'0'),
(7, 'EXPORT_MANAGER', 'Quản lý xuất hàng', b'0', '2017-12-10 09:15:45', '2017-12-10 09:15:45', -2147483648, -2147483648, b'0'),
(8, 'Quản lý kho', 'STORAGE_MANAGER', b'0', '2017-12-10 09:15:58', '2017-12-10 10:00:33', -2147483648, -2147483648, b'1'),
(9, 'STORAGE_MANAGER', 'Quản lý kho hàng', b'1', '2017-12-10 13:46:40', '2017-12-10 13:46:40', -2147483648, -2147483648, b'0'),
(10, 'USER_MANAGER', 'Quản lý người dùng', b'1', '2017-12-10 13:48:37', '2017-12-10 13:48:37', -2147483648, -2147483648, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `import_bill`
--

CREATE TABLE `import_bill` (
  `id` bigint(10) NOT NULL,
  `importbill_type_id` int(10) DEFAULT NULL COMMENT 'loại phiếu nhập',
  `paper_import_date` datetime DEFAULT NULL COMMENT 'ngày nhập trên giấy',
  `real_import_date` datetime DEFAULT NULL COMMENT 'ngày nhập thực tế',
  `import_bill_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mã phiếu nhập',
  `receipt_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mã hóa đơn',
  `deliver` text COLLATE utf8_unicode_ci COMMENT 'người giao hàng',
  `delivery_department` text COLLATE utf8_unicode_ci COMMENT 'đơn vị giao hàng',
  `in_storage_id` int(10) DEFAULT NULL COMMENT 'Mã kho nhập',
  `out_storage_id` int(10) DEFAULT NULL COMMENT 'Mã kho xuất',
  `total_amount` decimal(10,0) DEFAULT NULL COMMENT 'Tổng số tiền đơn hàng',
  `customer_id` int(10) DEFAULT NULL COMMENT 'Mã khách hàng, đơn vị, doanh nghiệp gửi hàng',
  `status` int(11) DEFAULT NULL COMMENT 'Trạng thái xử lý hiện tại của phiếu nhập hàng',
  `is_finish` bit(1) DEFAULT NULL COMMENT 'tình trạng đơn hàng này đã xong',
  `description` text COLLATE utf8_unicode_ci COMMENT 'ghi chú',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_bill_detail`
--

CREATE TABLE `import_bill_detail` (
  `id` int(10) NOT NULL,
  `product_id` bigint(10) DEFAULT NULL,
  `import_bill_id` bigint(10) DEFAULT NULL,
  `quantity` bigint(10) DEFAULT NULL COMMENT 'Số lượng từng sản phẩm',
  `price` decimal(18,0) NOT NULL COMMENT 'Đơn giá tiền chi tiết đơn hàng',
  `is_delete` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measure_unit`
--

CREATE TABLE `measure_unit` (
  `id` int(10) NOT NULL,
  `measure_unit_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eng_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vn_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_type_id` int(11) DEFAULT NULL COMMENT 'Loại đơn vị: khối lượng, độ dài,...',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_unit`
--

INSERT INTO `measure_unit` (`id`, `measure_unit_code`, `eng_name`, `vn_name`, `unit_type_id`, `date_create`, `date_modify`, `user_create`, `user_modify`, `is_delete`) VALUES
(1, 'm', 'meters', 'mét', 2, '2017-12-10 16:54:05', '2017-12-10 16:54:05', 2147483647, 2147483647, b'0'),
(2, 'km2', 'kilometers', 'kilômét', 2, '2017-12-10 16:55:05', '2017-12-10 16:55:05', 2147483647, 2147483647, b'0'),
(3, 'dm', 'decimeter', 'đềcimét', 2, '2017-12-10 17:38:26', '2017-12-10 17:38:26', 2147483647, 2147483647, b'0'),
(4, 'Lon', 'Lon', 'Lon', 5, '2017-12-11 11:57:51', '2017-12-11 11:57:51', 2147483647, 2147483647, b'0'),
(5, 'CHAI', 'bottle', 'Chai', 5, '2017-12-12 20:40:46', '2017-12-12 20:40:46', 2147483647, 2147483647, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(10) NOT NULL,
  `product_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mã hàng hóa',
  `official_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên chính thức',
  `other_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên khác',
  `calculate_method_id` int(2) DEFAULT NULL COMMENT 'phương pháp tính giá xuất kho',
  `measure_unit_id` int(10) DEFAULT NULL COMMENT 'đơn vị đo',
  `product_category_id` int(10) DEFAULT NULL,
  `vat_tax_id` int(2) DEFAULT NULL COMMENT 'thuế VAT',
  `tariff_tax_id` float DEFAULT NULL COMMENT 'thuế xuất/nhập khẩu',
  `origin` text COLLATE utf8_unicode_ci COMMENT 'Xuất xứ',
  `manufacturer` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nhà Sản Xuất',
  `price` decimal(18,0) DEFAULT NULL,
  `safe_inventory_quantity` bigint(10) DEFAULT NULL COMMENT 'Số lượng tồn kho an toàn',
  `status` int(10) DEFAULT NULL COMMENT 'Trạng thái',
  `is_delete` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_code`, `official_name`, `other_name`, `calculate_method_id`, `measure_unit_id`, `product_category_id`, `vat_tax_id`, `tariff_tax_id`, `origin`, `manufacturer`, `price`, `safe_inventory_quantity`, `status`, `is_delete`, `date_create`, `date_modify`, `user_create`, `user_modify`) VALUES
(6, 'HH-0000000006', 'Bia 333 loại 3330ml', 'Bia lon 333', 1, 4, 5, 1, 50, 'Thành Phố Hồ Chí Minh', 'Nhà Máy Bia Sài Gòn', '5000000', 50000, 0, b'0', NULL, '2017-12-13 00:30:39', NULL, NULL),
(8, 'HH-0000000009', 'Nước khoáng Lavie 1.5 lít', 'Lavie', 1, 5, 4, 1, 500, 'thị trấn Như Quỳnh, huyện Văn Lâm, tỉnh Hưng Yên', 'Nhà máy nước khoáng Lavie miền bắc', '8000', 5000000, 0, b'0', NULL, '2017-12-14 13:11:00', 0, NULL),
(10, 'HH-00000000010', 'Lon Coca-Cola 330ml', 'Coca-Cola', 1, 4, 5, 2, NULL, 'Thành Phố Hồ Chí Minh', 'Công ty Coca Cola Đông Dương', '80000', NULL, 0, b'0', '2017-12-12 21:56:43', '2017-12-12 21:56:43', NULL, NULL),
(11, 'HH-0000000011', 'Nước giải khát trà xanh hương lài Pokka chai 1.5L', 'Nước giải khát trà xanh hương lài Pokka', 1, 4, 5, 1, NULL, 'Đài Loan', 'Green Tea', '32000', NULL, 1, b'0', '2017-12-12 22:02:05', '2017-12-12 22:02:05', NULL, NULL),
(12, 'HH-0000000012', 'Nước giải khát có gas Club Soda Evervess Pepsico lon 330ml', 'Nước giải khát có gas Club Soda Evervess Pepsico', 1, 4, 5, 1, NULL, 'Thành phố Hồ Chí Minh', 'Nhà máy nước ngọt Pepsi-Cola', '53000', 5000000, 1, b'0', '2017-12-12 22:03:55', '2017-12-12 22:03:55', NULL, NULL),
(13, 'HH-0000000013', 'Bia chai HABEBO 330ml ', 'Bia chai HABEBO', 1, 5, 5, 3, 10, '183 Hoàng Hoa Thám, Ba Đình, Hà nội ', 'Tổng Công ty Cổ phần Bia – Rượu – Nước giải khát Hà Nội (HABECO)', '35000', 500000, 1, b'0', '2017-12-12 22:46:18', '2017-12-12 22:46:18', NULL, NULL),
(14, 'HH-0000000014', 'Lon Bia Sài Gòn Special 330ml ', 'Lon Bia Sài Gòn Special', 1, 4, 5, 1, NULL, 'Xuân Phương, Từ Liêm, Hanoi', 'Nhà máy bia Sài Gòn - Hà Nội  \r\n', '25000', 250000, 0, b'0', '2017-12-12 22:49:10', '2017-12-12 22:49:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) NOT NULL,
  `product_category_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `product_category_name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `measure_unit_id` int(10) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_category_code`, `product_category_name`, `is_active`, `is_delete`, `measure_unit_id`, `date_create`, `date_modify`, `user_create`, `user_modify`) VALUES
(4, 'PC-VLXD', 'Vật liệu xây dựng', b'1', b'0', 2, '2017-12-10 21:50:30', '2017-12-10 21:50:30', 2147483647, 2147483647),
(5, 'PC-HTD', 'Hàng tiêu dùng', b'1', b'0', 1, '2017-12-10 21:53:50', '2017-12-10 21:53:50', 2147483647, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `product_storage`
--

CREATE TABLE `product_storage` (
  `id` bigint(10) NOT NULL,
  `storage_id` int(10) DEFAULT NULL,
  `product_id` bigint(10) DEFAULT NULL,
  `quantity` bigint(10) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regency`
--

CREATE TABLE `regency` (
  `ID` int(10) NOT NULL,
  `regency_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Mã chức vụ',
  `regency_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Tên chức vụ',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(11) DEFAULT NULL,
  `user_modify` int(11) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `regency`
--

INSERT INTO `regency` (`ID`, `regency_code`, `regency_name`, `date_create`, `date_modify`, `user_create`, `user_modify`, `is_delete`) VALUES
(1, 'RC-TK', 'Thủ kho', '2017-12-08 00:00:00', '2017-12-09 17:39:49', 1, 2147483647, b'1'),
(2, 'RC-KTK', 'Kế toán kho', '2017-12-08 00:00:00', '2017-12-09 02:15:52', 1, 1, b'0'),
(3, 'RC-NVK', 'Nhân viên kho', '2017-12-08 00:00:00', '2017-12-09 02:15:59', 1, 1, b'0'),
(4, '123', '123', '2017-12-10 09:07:26', '2017-12-10 09:07:34', 1, 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `regency_action`
--

CREATE TABLE `regency_action` (
  `id` bigint(10) NOT NULL,
  `regency_id` int(10) DEFAULT NULL,
  `action_id` bigint(10) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regency_function`
--

CREATE TABLE `regency_function` (
  `id` bigint(10) NOT NULL,
  `regency_id` int(10) DEFAULT NULL,
  `function_id` int(10) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` int(11) DEFAULT NULL,
  `date_modify` int(11) DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `storage_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `storage_name` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `storage_address` text CHARACTER SET utf8,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`id`, `storage_code`, `storage_name`, `storage_address`, `is_active`, `date_create`, `date_modify`, `user_create`, `user_modify`, `is_delete`) VALUES
(1, 'KH-0001', 'Kho vật liệu xây dựng', 'Số nhà 23B, Ngõ 36, Tổ 19, Đường Nguyễn Đổng Chi, Nam Từ Liêm, Hà Nội', b'0', '2017-12-11 08:51:02', '2017-12-11 08:51:10', 2147483647, 2147483647, 0),
(2, 'KH-0002', 'Kho vật liệu tồn', 'Tòa nhà Keangnam Landmark, lô E6, KĐT mới Cầu Giấy, Mễ Trì, Nam Từ Liêm, Hà Nội', b'0', '2017-12-11 08:52:49', '2017-12-11 08:52:49', 2147483647, 2147483647, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(10) NOT NULL,
  `user_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `full_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci,
  `password_salt` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_regency`
--

CREATE TABLE `users_regency` (
  `id` bigint(10) NOT NULL,
  `users_id` int(10) DEFAULT NULL,
  `regency_id` int(10) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow`
--

CREATE TABLE `workflow` (
  `ID` int(10) NOT NULL,
  `workflow_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'tên quy trình xử lý',
  `workflow_description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'mô tả quy trình xử lý',
  `is_active` bigint(1) DEFAULT NULL COMMENT 'quy trình xử lý có hoạt động không?',
  `is_delete` bit(1) DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_history`
--

CREATE TABLE `workflow_history` (
  `ID` bigint(20) NOT NULL,
  `workflow_step_id` bigint(20) DEFAULT NULL COMMENT 'định danh bước chuyển trạng thái',
  `user_id` int(11) DEFAULT NULL COMMENT 'định danh người dùng',
  `regency_id` int(11) DEFAULT NULL COMMENT 'định danh chức vụ',
  `comment` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ghi chú',
  `is_viewer` int(11) DEFAULT NULL COMMENT 'kiểm tra tham gia xử lý',
  `is_processor` int(11) DEFAULT NULL COMMENT 'kiểm tra xử lý chính',
  `entity_id` bigint(20) DEFAULT NULL COMMENT 'định danh đối tượng',
  `entity_type_id` int(11) DEFAULT NULL COMMENT 'loại đối tượng',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(11) DEFAULT NULL,
  `user_modify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_status`
--

CREATE TABLE `workflow_status` (
  `ID` int(11) NOT NULL,
  `workflow_id` int(10) DEFAULT NULL COMMENT 'định danh luồng xử lý',
  `workflow_status_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên trạng thái',
  `workflow_status_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mô tả trạng thái',
  `is_allow_update` bit(1) DEFAULT NULL COMMENT 'cho phép được cập nhật kể cả khi đã vào luồng quy trình xử lý',
  `is_active` bit(1) DEFAULT NULL COMMENT 'trạng thái kích hoạt/vô hiêu hóa',
  `is_delete` bit(1) DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL,
  `date_create` int(10) DEFAULT NULL,
  `date_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_steps`
--

CREATE TABLE `workflow_steps` (
  `ID` bigint(20) NOT NULL,
  `workflow_id` int(10) DEFAULT NULL COMMENT 'định danh quy trình xử ly',
  `workflow_step_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên bước chuyển trạng thái',
  `workflow_step_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mô tả bước chuyển trạng thái',
  `is_finish` bit(1) DEFAULT NULL COMMENT 'xác định xem bước xử lý hiện tại là kết thúc',
  `input_status` int(10) DEFAULT NULL COMMENT 'Trạng thái đầu vào',
  `output_status` int(10) DEFAULT NULL COMMENT 'Trạng thái đầu ra',
  `is_active` bit(1) DEFAULT NULL COMMENT 'bước chuyển có đang được sử dụng hay không',
  `is_delete` bit(1) DEFAULT NULL,
  `date_create` int(10) DEFAULT NULL,
  `date_modify` int(10) DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_step_regency`
--

CREATE TABLE `workflow_step_regency` (
  `ID` bigint(20) NOT NULL,
  `workflow_step_id` bigint(20) DEFAULT NULL COMMENT 'định danh bước chuyển trạng thái',
  `regency_id` int(10) DEFAULT NULL COMMENT 'mã chức vụ',
  `is_processor` bit(1) DEFAULT NULL COMMENT 'kiểm tra là xử lý chính',
  `is_viewer` bit(1) DEFAULT NULL COMMENT 'kiểm tra tham gia xử lý',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_step_user`
--

CREATE TABLE `workflow_step_user` (
  `ID` bigint(20) NOT NULL,
  `workflow_step_id` bigint(20) DEFAULT NULL COMMENT 'định danh bước chuyển trạng thái',
  `user_id` int(10) DEFAULT NULL COMMENT 'định danh người xử lý',
  `is_processor` bit(1) DEFAULT NULL COMMENT 'kiểm tra là xử lý chính',
  `is_viewer` bit(1) DEFAULT NULL COMMENT 'kiểm tra tham gia xử lý',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `user_create` int(10) DEFAULT NULL,
  `user_modify` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `function_id` (`function_id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `export_bill`
--
ALTER TABLE `export_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `export_bill_constraint_1` (`customer_id`);

--
-- Indexes for table `export_bill_detail`
--
ALTER TABLE `export_bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `export_bill_detail_constraint_1` (`export_bill_id`),
  ADD KEY `export_bill_detail_constraint_2` (`product_id`);

--
-- Indexes for table `function`
--
ALTER TABLE `function`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `import_bill`
--
ALTER TABLE `import_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_bill_constraint_1` (`customer_id`);

--
-- Indexes for table `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`import_bill_id`),
  ADD KEY `import_bill_detail_constraint_1` (`import_bill_id`);

--
-- Indexes for table `measure_unit`
--
ALTER TABLE `measure_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measure_unit_id` (`measure_unit_id`,`product_category_id`),
  ADD KEY `product_constraint_1` (`product_category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_constraint_1` (`measure_unit_id`);

--
-- Indexes for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storage_id` (`storage_id`,`product_id`),
  ADD KEY `product_storage_constraint_1` (`product_id`);

--
-- Indexes for table `regency`
--
ALTER TABLE `regency`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `regency_action`
--
ALTER TABLE `regency_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regency_id` (`regency_id`,`action_id`),
  ADD KEY `regency_action_constraint_1` (`action_id`);

--
-- Indexes for table `regency_function`
--
ALTER TABLE `regency_function`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regency_id` (`regency_id`,`function_id`),
  ADD KEY `regency_function_constraint_1` (`function_id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users_regency`
--
ALTER TABLE `users_regency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `regency_id` (`regency_id`);

--
-- Indexes for table `workflow`
--
ALTER TABLE `workflow`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `workflow_history`
--
ALTER TABLE `workflow_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `workflow_history_constraint_1` (`workflow_step_id`),
  ADD KEY `workflow_history_constraint_2` (`user_id`),
  ADD KEY `workflow_history_constraint_3` (`regency_id`);

--
-- Indexes for table `workflow_status`
--
ALTER TABLE `workflow_status`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `workflow_statsus_constraint_1` (`workflow_id`);

--
-- Indexes for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `workflow_steps_constraint_1` (`workflow_id`);

--
-- Indexes for table `workflow_step_regency`
--
ALTER TABLE `workflow_step_regency`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `workflow_step_regency_constraint_1` (`regency_id`),
  ADD KEY `workflow_step_regecy_constraint_2` (`workflow_step_id`);

--
-- Indexes for table `workflow_step_user`
--
ALTER TABLE `workflow_step_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `workflow_step_user_constriant_1` (`user_id`),
  ADD KEY `workflow_step_user_constriant_2` (`workflow_step_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `export_bill`
--
ALTER TABLE `export_bill`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `export_bill_detail`
--
ALTER TABLE `export_bill_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `function`
--
ALTER TABLE `function`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `import_bill`
--
ALTER TABLE `import_bill`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measure_unit`
--
ALTER TABLE `measure_unit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_storage`
--
ALTER TABLE `product_storage`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regency`
--
ALTER TABLE `regency`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `regency_action`
--
ALTER TABLE `regency_action`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regency_function`
--
ALTER TABLE `regency_function`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_regency`
--
ALTER TABLE `users_regency`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow`
--
ALTER TABLE `workflow`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_history`
--
ALTER TABLE `workflow_history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_status`
--
ALTER TABLE `workflow_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_step_regency`
--
ALTER TABLE `workflow_step_regency`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflow_step_user`
--
ALTER TABLE `workflow_step_user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `action_ibfk_1` FOREIGN KEY (`function_id`) REFERENCES `function` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `export_bill`
--
ALTER TABLE `export_bill`
  ADD CONSTRAINT `export_bill_constraint_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `export_bill_detail`
--
ALTER TABLE `export_bill_detail`
  ADD CONSTRAINT `export_bill_detail_constraint_1` FOREIGN KEY (`export_bill_id`) REFERENCES `export_bill` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `export_bill_detail_constraint_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `import_bill`
--
ALTER TABLE `import_bill`
  ADD CONSTRAINT `import_bill_constraint_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD CONSTRAINT `import_bill_detail_constraint_1` FOREIGN KEY (`import_bill_id`) REFERENCES `import_bill` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `import_bill_detail_constraint_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_constraint_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_constraint_2` FOREIGN KEY (`measure_unit_id`) REFERENCES `measure_unit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_constraint_1` FOREIGN KEY (`measure_unit_id`) REFERENCES `measure_unit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD CONSTRAINT `product_storage_constraint_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_storage_constraint_2` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `regency_action`
--
ALTER TABLE `regency_action`
  ADD CONSTRAINT `regency_action_constraint_1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `regency_action_constraint_2` FOREIGN KEY (`regency_id`) REFERENCES `regency` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `regency_function`
--
ALTER TABLE `regency_function`
  ADD CONSTRAINT `regency_function_constraint_1` FOREIGN KEY (`function_id`) REFERENCES `function` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `regency_function_constraint_2` FOREIGN KEY (`regency_id`) REFERENCES `regency` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users_regency`
--
ALTER TABLE `users_regency`
  ADD CONSTRAINT `user_regency_constraint_1` FOREIGN KEY (`regency_id`) REFERENCES `regency` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_regency_constraint_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workflow_history`
--
ALTER TABLE `workflow_history`
  ADD CONSTRAINT `workflow_history_constraint_1` FOREIGN KEY (`workflow_step_id`) REFERENCES `workflow_steps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workflow_history_constraint_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workflow_history_constraint_3` FOREIGN KEY (`regency_id`) REFERENCES `regency` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workflow_status`
--
ALTER TABLE `workflow_status`
  ADD CONSTRAINT `workflow_statsus_constraint_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workflow_steps`
--
ALTER TABLE `workflow_steps`
  ADD CONSTRAINT `workflow_steps_constraint_1` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workflow_step_regency`
--
ALTER TABLE `workflow_step_regency`
  ADD CONSTRAINT `workflow_step_regecy_constraint_2` FOREIGN KEY (`workflow_step_id`) REFERENCES `workflow_steps` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workflow_step_regency_constraint_1` FOREIGN KEY (`regency_id`) REFERENCES `regency` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workflow_step_user`
--
ALTER TABLE `workflow_step_user`
  ADD CONSTRAINT `workflow_step_user_constriant_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `workflow_step_user_constriant_2` FOREIGN KEY (`workflow_step_id`) REFERENCES `workflow_steps` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
