-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2021 at 02:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pre_build_pc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_db`
--

CREATE TABLE `cart_db` (
  `cart_id` int(11) NOT NULL,
  `device` varchar(20) NOT NULL,
  `company` varchar(50) NOT NULL,
  `Ram` varchar(50) NOT NULL,
  `memory` varchar(50) NOT NULL,
  `processor` varchar(50) NOT NULL,
  `cd_writer` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_db`
--

INSERT INTO `cart_db` (`cart_id`, `device`, `company`, `Ram`, `memory`, `processor`, `cd_writer`, `price`, `user_id`, `status`) VALUES
(1, '', '', '', '', '', '', 0, 1, 1),
(2, 'computer', '', '', '', '', '', 0, 2, 1),
(3, '', '', '', '', '', '', 0, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_db`
--

CREATE TABLE `complaint_db` (
  `complaint_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint_db`
--

INSERT INTO `complaint_db` (`complaint_id`, `name`, `subject`, `complaint`, `user_id`) VALUES
(1, 'Arjun', 'can\'t use', 'There is some bug', 1),
(2, 'Joice John', 'not working', 'This is out of service', 2),
(3, 'Anonymous', 'Trial', 'This is trial complaint', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notification_db`
--

CREATE TABLE `notification_db` (
  `notification_id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_db`
--

INSERT INTO `notification_db` (`notification_id`, `content`, `time`) VALUES
(1, 'Here goes the best price for SSD Drives... Order NOW to get that', '20-02-2021'),
(2, '5% flat discount on DDR4 RAM', '01-01-2021'),
(4, 'There is 5% discount on HP laptops.. click here to get that', '17-02-2021 07:24am');

-- --------------------------------------------------------

--
-- Table structure for table `order_db`
--

CREATE TABLE `order_db` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device` varchar(30) NOT NULL,
  `company` varchar(30) NOT NULL,
  `ram` varchar(30) NOT NULL,
  `memory` varchar(30) NOT NULL,
  `processor` varchar(30) NOT NULL,
  `cd_drive` varchar(30) NOT NULL,
  `custom` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_db`
--

INSERT INTO `order_db` (`order_id`, `user_id`, `device`, `company`, `ram`, `memory`, `processor`, `cd_drive`, `custom`, `price`, `status`) VALUES
(1, 1, 'Laptop', 'DELL Inspiron 15', 'Kingston (Hyper X)', 'Samsung Quad', '', '', 'Ufdfiuffuufuffifi', 201, 'placed'),
(2, 59, '', '', '', '', '', '', '', 300, '$lu_id'),
(3, 1, 'Desktop', 'DELL Inspiron 15', 'Kingston (Hyper X)', 'Dell lapMem', 'Intel Core i5', '', 'Thank you', 110597, 'completed'),
(4, 1, 'Desktop', 'DELL Inspiron 15', 'G-Skill ', '', '', '', 'Bla', 76900, 'placed'),
(5, 1, 'Desktop', 'DELL Inspiron 15', 'G-Skill ', '', '', '', '', 76900, 'placed'),
(6, 1, 'Desktop', 'DELL Inspiron 15', 'G-Skill ', '', '', '', '', 76900, 'placed'),
(7, 4, 'Desktop', 'DELL Inspiron 15', 'Kingston (Hyper X)', 'Dell lapMemory', 'Intel Core i5', '', 'Please add web cam too', 108225, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(110) NOT NULL,
  `product_model` varchar(110) NOT NULL,
  `product_type` int(11) NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`product_id`, `product_name`, `product_model`, `product_type`, `product_price`) VALUES
(1, 'DELL Inspiron 15', '15-5000', 1, 70000),
(2, 'Corsair Air', 'DDR3 4GB Ram', 2, 2070),
(3, 'Kingston (Hyper X)', 'DDR4 16GB', 2, 8700),
(4, 'G-Skill ', 'DDR3 16GB', 2, 6900),
(5, 'Samsung Quad', 'HDD 2TB', 3, 4000),
(6, 'Dell lapMemory', 'SSD 512GB', 3, 8525),
(7, 'Intel Core i5', '11th Generation', 4, 21000),
(8, 'Hp Pavilion Laptop', '14-3220', 1, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `registration_db`
--

CREATE TABLE `registration_db` (
  `customer_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `mobile` int(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration_db`
--

INSERT INTO `registration_db` (`customer_id`, `user_name`, `mobile`, `address`, `role_id`) VALUES
(1, 'Arjun', 1020, 'Mananthavady', 1),
(2, 'Joice', 9644582, 'Kartikulam', 2),
(3, 'Anonymous', 2147483647, 'Asdfghjkll', 4);

-- --------------------------------------------------------

--
-- Table structure for table `role_db`
--

CREATE TABLE `role_db` (
  `role_id` int(11) NOT NULL,
  `mail` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_db`
--

INSERT INTO `role_db` (`role_id`, `mail`, `password`, `role`) VALUES
(1, 'ani', 'ani', 'customer'),
(2, 'joice@', 'ani', 'customer'),
(3, 'admin', 'ani', 'admin'),
(4, 'asd@', 'asdasd', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `specs_category`
--

CREATE TABLE `specs_category` (
  `category_id` int(11) NOT NULL,
  `category_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specs_category`
--

INSERT INTO `specs_category` (`category_id`, `category_type`) VALUES
(1, 'Company'),
(2, 'RAM'),
(3, 'HDD/SSD'),
(4, 'Processor'),
(5, 'CD Reader');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_db`
--
ALTER TABLE `cart_db`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `complaint_db`
--
ALTER TABLE `complaint_db`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `notification_db`
--
ALTER TABLE `notification_db`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `order_db`
--
ALTER TABLE `order_db`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `registration_db`
--
ALTER TABLE `registration_db`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `role_db`
--
ALTER TABLE `role_db`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `specs_category`
--
ALTER TABLE `specs_category`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_db`
--
ALTER TABLE `cart_db`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaint_db`
--
ALTER TABLE `complaint_db`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification_db`
--
ALTER TABLE `notification_db`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_db`
--
ALTER TABLE `order_db`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration_db`
--
ALTER TABLE `registration_db`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_db`
--
ALTER TABLE `role_db`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specs_category`
--
ALTER TABLE `specs_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
