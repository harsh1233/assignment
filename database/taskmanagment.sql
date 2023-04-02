-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 02, 2023 at 07:36 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskmanagment`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `street3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `state_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `name`, `street1`, `street2`, `street3`, `city`, `postcode`, `state_id`) VALUES
(1, 'Tony', 'Floor 42, Room 7', 'Stark Industries', NULL, 'New York', '1234', 7),
(2, 'Thor', 'The Citadel', 'Middle of the city', NULL, 'Asgard', '5678', 2),
(3, 'Charles', 'Xavier\'s School for Gifted Youngsters', '1 One Way', NULL, 'Western Massachusetts', '9012', 4);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `person_id` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `active_from` datetime NOT NULL,
  `active_thru` datetime DEFAULT NULL,
  `is_primary` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`person_id`, `email`, `pass`, `active_from`, `active_thru`, `is_primary`) VALUES
(1, 'ddd@stark.com', '$2y$10$6s5RoWJNMsyE5v3bp.Vo6Obxih9/I2hk2Kgw2Dv4POJZ2pCyl80/a', '2023-04-02 08:50:00', '2024-04-02 08:50:00', 1),
(1, 'tony@stark.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2014-01-01 00:00:00', NULL, 1),
(2, 'e@stark.com', '$2y$10$VdXJowq1zikNMEApwUzdP.FbAUmETtemvAIPvnh34isLot0D2XgTK', '2023-04-02 08:46:23', '2024-04-02 08:46:23', 1),
(2, 'thecap@marvel.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2013-12-25 00:00:00', '2014-01-01 00:00:00', 1),
(3, 'ee@stark.com', '$2y$10$k3HmXcJtdWtIx6xA7nAJh.QTC64uf76261hkgl1aI1UjEVLrij.Yu', '2023-04-02 08:49:13', '2024-04-02 08:49:13', 1),
(4, 'eee@stark.com', '$2y$10$E2LMmjtRGZJ2BTexeRzwLe4tymUSLhVrMNbId7dbV.bbDDkk1Hfte', '2023-04-02 08:49:30', '2024-04-02 08:49:30', 1),
(5, 'tony12@stark.com', '$2y$10$PggCbhHM1y0wXnCwbJ0TPeQfVDSCUXAcntND/aJAWLOWx8EycEKYy', '2023-04-02 08:46:11', '2024-04-02 08:46:11', 1),
(6, 'tony1@stark.com', '$2y$10$e6m0jxZ9isFS9EhgfU2l7egolpuwGqFwikR9n.8UBRKLj/s5kur0W', '2023-04-02 08:44:46', '2024-04-02 08:44:46', 1),
(8, 'charles@xmen.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2014-02-01 00:00:00', NULL, NULL),
(10, 'dww@stark.com', '$2y$10$NDfEuxjbwZYGltu3HG.NYO3PLI/XLVmPU1i0I5llJzBQuFsED7SeK', '2023-04-02 08:52:15', '2024-04-02 08:52:15', 1),
(10, 'sdsds@stark.com', '$2y$10$Evm3yHcoD1FKHF11jnJRBO4GYzs7DZivybO8jbsenjiRmyaxwxEwa', '2023-04-02 09:08:06', '2024-04-02 09:08:06', 1),
(11, 'csdsdsd@stark.com', '$2y$10$J2dPHO8j8xCnJ.r.7wgneOTgPNrDp0Q4VrCp/onLL4vKanQIlIOW6', '2023-04-02 08:52:26', '2024-04-02 08:52:26', 1),
(11, 'ss@stark.com', '$2y$10$kgWVasXhUsroA/OVGbixuOqOva3pVKFyoOha1iz1030SiZlzv7xnK', '2023-04-02 09:19:09', NULL, 1),
(12, 'dss@stark.com', '$2y$10$F9AjdUY7vmxwGBYBczilt.3BSlyt0sPQmjEk7ucYN32PyOsEruPSy', '2023-04-02 08:53:49', '2024-04-02 08:53:49', 1),
(13, 'eeee@stark.com', '$2y$10$zorWLVkqpdWVHDj7rI0oTOYaiueGR/LdN3K3NasPHzbAsfTFmbZUC', '2023-04-02 08:56:37', '2024-04-02 08:56:37', 1),
(14, 'eedde@stark.com', '$2y$10$8/T16ENXkZsTrpZRM7pEpO4in2LDwO8gbiBLCHYoxiXZmzsMuwkby', '2023-04-02 08:57:18', '2024-04-02 08:57:18', 1),
(15, 'eedded@stark.com', '$2y$10$gGUOKkMhWsLo22ycVw9auelkr7.NReQuNMj.54zb7b7XXrEGlNXWy', '2023-04-02 08:57:30', '2024-04-02 08:57:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`) VALUES
(1, 'Iron Man'),
(2, 'Captain America'),
(3, 'Thor'),
(4, 'Black Widow'),
(5, 'Wolverine'),
(6, 'Storm'),
(7, 'Rogue'),
(8, 'Professor X'),
(9, 'ddw'),
(10, 'Demo'),
(11, 'demo');

-- --------------------------------------------------------

--
-- Table structure for table `person_address`
--

CREATE TABLE `person_address` (
  `person_id` int UNSIGNED NOT NULL,
  `address_id` int UNSIGNED NOT NULL,
  `active_from` datetime NOT NULL,
  `active_thru` datetime DEFAULT NULL,
  `is_primary` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person_address`
--

INSERT INTO `person_address` (`person_id`, `address_id`, `active_from`, `active_thru`, `is_primary`) VALUES
(1, 1, '2014-01-01 00:00:00', NULL, 1),
(3, 2, '2014-10-01 00:00:00', NULL, NULL),
(8, 3, '2013-07-20 11:59:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `country_id`, `name`) VALUES
(1, 1, 'ACT'),
(2, 1, 'NSW'),
(3, 1, 'NT'),
(4, 1, 'QLD'),
(5, 1, 'SA'),
(6, 1, 'TAS'),
(7, 1, 'VIC'),
(8, 1, 'WA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`person_id`,`email`) USING BTREE;

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_address`
--
ALTER TABLE `person_address`
  ADD PRIMARY KEY (`person_id`,`address_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `person_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
