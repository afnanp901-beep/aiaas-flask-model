-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 07, 2025 at 09:44 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aiaas_model`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_label`
--

CREATE TABLE `am_label` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `label_name` varchar(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `crime_type` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `crime_date` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `enc_st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_label`
--

INSERT INTO `am_label` (`id`, `mid`, `label_name`, `name`, `dob`, `gender`, `crime_type`, `details`, `crime_date`, `status`, `address`, `enc_st`) VALUES
(1, 1, 'Haland', 'qX32notg4atET/Y0IQqKXqNyooUpNBH3qXIAUfPDfhE=', 'ZAQUg/ADxP3J/6lwV+pa2LMdcDY1UoM8L81iVeGs6Ko=', 'hAHAgJ1HNpTAILX1752ZUhCbwjxGn0a8rSNoXUch/NE=', 'P4mS7gbxGuVP0DeTkgJp2igFo7SIdwGsFjrwAOtxHlU=', '1rT6ig/WEyECuGX2pD4kiKMStmNQ+C/QOl+dlx3a+F/yIxKgYlI6J2u0WoMYLkeA', 'XqMl6zk+dc9r5cUcdi6wTv2y2JMU+2RTqax1RIJ3tdU=', 'OZnQhRIfVxKKAZmCSLwtP8OXRT8/wHdoQC8QpnlD2Ag=', 'hwL7uqOiX+iNzWzfz0kinpNx7MLpKoxnbT98MFZyhznqnjAfeUep/P6Ez2y5KmWT', 0),
(2, 1, 'Mbape', 'Mbape', '1990-02-28', 'Male', 'fraud', 'Credit card fraud', '2025-02-14', 'under_investigation', '456 Oak Ave, Riverdale', 0),
(3, 1, 'Messi', 'Messi', '1978-12-31', 'Male', 'assault', 'Bar fight injury', '2024-10-22', 'convicted', '789 Pine Rd, Hilltown', 0),
(4, 1, 'Neymar', 'Neymar', '1992-12-17', 'Male', 'shoplifting', 'Stole electronics from store', '2025-03-03', 'released', '159 Spruce Dr, Greenville', 0),
(5, 1, 'Ronaldo', 'Ronaldo', '1985-04-05', 'Male', 'identity_theft', 'Stole SSN and opened accounts', '2025-01-20', 'under_investigation', '654 Cedar Blvd, Metro City', 0);
