-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2025 at 06:31 PM
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
-- Database: `akd`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2025-03-05 16:21:18', '2025-03-12 12:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(11, 'Travel Bags', 'Used when you are travelling across global.', '2025-03-21 06:16:08', '2025-03-21 06:16:08'),
(12, 'Backpack', 'Backpack is usually used by students or the traveler from one point to another.', '2025-03-21 06:19:00', '2025-03-21 06:19:00'),
(13, 'Hand bags', 'Used by womens', '2025-03-21 06:40:02', '2025-03-21 06:40:02'),
(14, 'KIDS BAGS', 'Bags for smaller kids ', '2025-03-21 07:31:54', '2025-03-21 07:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(30, 11, '54', 2, '2025-03-21 07:36:10', 'COD', 'Delivered'),
(31, 11, '53', 1, '2025-03-22 05:30:54', 'COD', 'Delivered'),
(32, 11, '54', 1, '2025-03-22 05:30:54', 'COD', 'Delivered'),
(33, 11, '54', 1, '2025-04-06 16:26:20', 'COD', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(22, 31, 'in Process', 'Order is in process', '2025-03-23 03:53:48'),
(23, 31, 'Delivered', 'Delivered', '2025-03-23 03:54:32'),
(24, 30, 'Delivered', 'Product has been delivered..', '2025-03-24 05:29:26'),
(25, 32, 'Delivered', 'Product has been delivered.', '2025-03-24 05:30:01'),
(26, 33, 'in Process', 'Order is in process', '2025-04-06 16:27:22'),
(27, 33, 'Delivered', 'Delivered', '2025-04-06 16:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(12, 57, 4, 4, 4, 'Abhishek', 'Worthy', 'Price worthy ', '2025-03-24 05:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(53, 11, 26, 'Safari travel bag', 'Safari', 1499, 1999, 'Used for travelling. Best in hardness', 'safari_bag.jpg', 'safari_bag.jpg', 'safari_bag.jpg', 40, 'In Stock', '2025-03-21 07:10:43', '2025-03-21 07:10:43'),
(54, 11, 26, 'American Tourister bag', 'American Tourister ', 1999, 2999, 'Best for long route travelling', 'American_Tourister.jpg', 'American_Tourister.jpg', 'American_Tourister.jpg', 40, 'In Stock', '2025-03-21 07:20:19', '2025-03-21 07:20:19'),
(55, 11, 26, 'Safari travel bag', 'Safari', 3999, 7999, 'Big size bag', 'safari1.jpg', 'safari1.jpg', 'safari1.jpg', 30, 'In Stock', '2025-03-21 07:25:05', '2025-03-21 07:25:05'),
(56, 12, 27, 'Shoulder bag', 'Leather bags', 599, 799, 'Suitable for student', 'Backpack.jpg', 'Backpack.jpg', 'Backpack.jpg', 0, 'In Stock', '2025-03-21 07:28:43', '2025-03-21 07:28:43'),
(57, 13, 30, 'Leather bag', 'Miyaco', 2499, 2999, 'COmfortable to carry', '1.jpg', '1.jpg', '1.jpg', 30, 'In Stock', '2025-03-21 14:12:07', '2025-03-21 14:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(26, 11, 'Wheel bags', '2025-03-21 07:09:09', '2025-03-21 07:09:09'),
(27, 12, 'Shoulder bag', '2025-03-21 07:27:33', '2025-03-21 07:27:33'),
(28, 14, 'School bags', '2025-03-21 07:32:08', '2025-03-21 07:32:08'),
(29, 13, 'Mens', '2025-03-21 07:32:39', '2025-03-21 07:32:39'),
(30, 13, 'Womens', '2025-03-21 07:32:47', '2025-03-21 07:32:47'),
(31, 11, 'wheelless', '2025-03-21 07:34:17', '2025-03-21 07:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(56, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-20 12:21:26', NULL, 1),
(57, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-20 12:26:56', '0000-00-00 00:00:00', 1),
(58, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-21 06:20:34', '2025-03-21 06:20:34', 1),
(59, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-21 14:51:18', '2025-03-21 02:52:16', 1),
(60, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-21 14:52:29', '2025-03-21 14:52:29', 1),
(61, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-22 05:30:13', '2025-03-22 05:30:13', 0),
(62, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-22 05:30:26', '2025-03-22 05:34:54', 1),
(63, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 03:57:26', '2025-03-23 03:58:59', 1),
(64, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 03:59:10', '2025-03-23 03:59:10', 0),
(65, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 03:59:18', '2025-03-23 04:05:49', 1),
(66, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 04:06:09', '2025-03-23 04:06:09', 0),
(67, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 04:06:17', '2025-03-23 04:07:27', 1),
(68, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 04:07:35', '2025-03-23 05:27:19', 1),
(69, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-23 05:36:34', '2025-03-23 05:42:59', 1),
(70, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-04-06 16:25:56', '2025-04-06 16:25:56', 0),
(71, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-04-06 16:26:05', '2025-04-06 16:26:05', 1),
(72, 'walikarabhishek85@gmail.com', 0x3a3a3100000000000000000000000000, '2025-04-06 16:29:44', '2025-04-06 04:29:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(11, 'Abhishek Walikar', 'walikarabhishek85@gmail.com', 7776049351, '827ccb0eea8a706c4c34a16891f84e7b', 'C-87, Indira Nagar', 'Maharashtra', 'Sangli', 416416, 'C-87, Indira Nagar', 'Maharashtra', 'Sangli', 416416, '2025-03-20 12:20:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
