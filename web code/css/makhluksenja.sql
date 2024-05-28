-- Active: 1716870027124@@127.0.0.1@3306@makhluksenja
-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: april 8, 20 at 01:15 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET AUTOCOMMIT = 0;

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `equantom`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
    `id` int(11) NOT NULL,
    `name` varchar(255) NOT NULL,
    `rating` decimal(2, 1) NOT NULL,
    `price` decimal(6, 2) NOT NULL,
    `img_url` varchar(255) NOT NULL,
    `category` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--
-- Dumping data for table `products`
--

INSERT INTO
    `products` (
        `id`,
        `name`,
        `price`,
        `img_url`,
        `category`
    )
VALUES (
        1,
        'WHISKAS +2 Dry Food',
        '44000',
        'menu_adult_dry.png',
    ),
    (
        2,
        'WHISKAS Dry Food with Ocean Fish Flavor with milk',
        '30000',
        '2.png',
    ),
    (
        3,
        'WHISKAS Wet Food With Chicken Mince',
        '51500',
        '4.png',
    ),
    (
        4,
        'WHISKAS Wet Food With Beef Casserole',
        '53000',
        'samsung-galaxy-buds_1.jpg',
    ),
    -- --------------------------------------------------------
--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
    `idcategory` int(11) NOT NULL,
    `categoryname` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO
    `product_categories` (`idcategory`, `categoryname`)
VALUES (1, 'wet_food'),
    (2, 'dry_food'),
    (3, 'kitten'),
    (4, 'adult');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
    `id` int(11) NOT NULL,
    `username` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

--
-- Dumping data for table `users`
--

INSERT INTO
    `users` (
        `id`,
        `username`,
        `email`,
        `password`
    )
VALUES (
        3,
        'wefewhf',
        'wefeiuwf@gmail.com',
        '$2a$10$43F6yQOIbQ3/aER/XB2d4OP9qsV1K988Y4/OOE5OWVFDHk6pB7AY2'
    ),
    (
        4,
        'amin',
        'admin@admin.com',
        '$2a$10$HQYJU216Wu3RtKPdbR8aqu/04gNUdxn6EpcWc73vn5BiHoVCFCnES'
    ),
    (
        5,
        'rafael',
        'rafaelgoulartb@gmail.com',
        '$2a$10$nxrkZIRafbTsgtJTcFfgleVkuuH/MmzwGUvbIhH0VKb4AdUgDJawq'
    ),
    (
        6,
        'opresor',
        'opresor@protonmail.com',
        '$2a$10$RgS9EYuOxhwODKmTgBlK9OOUbDE8bmcRRf8Yi4kraLzfVpdkW5lT.'
    ),
    (
        7,
        'ewfwf',
        'wfewefw@ewfwfw.com',
        '$2a$10$OWbDkDphF.L11kIGiz1YzuXj7tYzs9b1hh/yHp9UkY2ciMlQ1CHqW'
    ),
    (
        8,
        'wfgewfgwegrhgol',
        'rafael@gmail.com',
        '$2a$10$alIXffXgTI7nWm.5Nlcnnuhq8EvZOxMGoR8IHK.48iPB/bEXvCae.'
    ),
    (
        9,
        'test',
        'test@test.com',
        '$2a$10$G6k09m2y3kLkaNRV4K0.POKsZYaYIaEb86VJWGBYtXZ2FOF6iptKW'
    ),
    (
        10,
        'rafaell',
        'rafael@gmail.comm',
        '$2a$10$ozcBdNwEdS6q2I1NqFdRdeFwPbDKQJHkOce3.f3G3rLjxU82I9nrS'
    ),
    (
        11,
        'rafaelll',
        'rafael@gmail.commmmm',
        '$2a$10$WtFCu09VzN6Y9B.lhiklCuNFGPiu5CFwXyUtPLWByGfNrsrziyEeK'
    ),
    (
        12,
        'rafael_f',
        'rafael_f@eu.com',
        '$2a$10$2tp5oXwOTTx9cYw27ztIF.bU/fNDixmLyVqB3Jrfd32AVrHuQgS4G'
    );

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
ADD PRIMARY KEY (`id`),
ADD KEY `category` (`category`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories` ADD PRIMARY KEY (`idcategory`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `username` (`username`),
ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 18;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `product_categories` (`idcategory`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;