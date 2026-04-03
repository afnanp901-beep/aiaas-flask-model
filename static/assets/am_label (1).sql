-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 12:47 AM
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
(1, 1, 'Haland', '0zDhOP3GUQ/wSVIfvYbQifmKl71BL+mxFHf+j07cipw=', 'oSiD6ydaqIhpY7lONB0UmmnZx690L3+Z32L3BJD0ZjU=', 'Uc+cZG4qwS2ZgemQrkwxtysU9b8Pdjz1iruW7k/xuiw=', '6IfT7bY1kycnS19Dl4iKI+8e+GTbb4g3AoxgSHyNWIo=', 'NDfTCvhFitpGICkBZVeRSHk1G6+xyfygRWAmwwvfUhwLlLi6ypvJ/Z0rgpTXJAA3', 't4YkqJcQtwXrmFoN7w8ViUJuJu/h7ZXrtW5MQYaYxdY=', 'w4wJL/gOcnA94Ja1kpLAd59wwleL4bQ69Pv/5O7P0fA=', 'B+j08JFG9GpFpHvzdo6G6LlM5mmQm7Aq5MSOl9+ECoMh5Hi56rnaSQLWgBJMMwiv', 0),
(2, 1, 'Mbape', 'XlGHKr1TAdWahBgcyOoJsj8gfC+AtrXxQB1IPciUjs4=', '9txWStFYwxbgyN37dgM+HCacTSNgZ/eYZOsKIqbocbA=', 'kH705JdpRhh34PMqBZksfVF+xW5MVRI2ajWExqM3RL4=', 'P8T8ArqYBR+e86HijeLtIdKBrsGb4QBPv9m71Pjhlb0=', 'pb864nkL6bk0kMU+lowpFBRtNruHoyxjdk1/H9wt6o3Zp2Obngw286B05lbGBDST', 'JPMA2R5YRMSy4Icd0kkDjgRmUW4OX1Ie+EhKNXn4ySs=', 'QK/BLd+dCMb/JT0rk0PYJBKi7AGGSE41Cm9yLj30WTL3w8ApwzWBkNicWmUvBM0M', 'W9Ugn4znnSNhUEBBgKeZe2ivFbkC5yI53LZ8cXFgG0sGErl9iirDTBjN15bL3EMS', 0),
(3, 1, 'Messi', '8AaKzeh2UxkLho7c4RaVUNODGoOW27AZMr/DDskDtvk=', 'MQdO2au4aWDeMWhK2om/bI5Ck8/G3pRRmsA2pJ886NU=', 'LSOQ/HTc+bT6jcjUzQxAW8SAcZ8T8Aa4VCEDs+ZY7Ng=', 'PDmwYqOgct7Iy5rUOL2spYEe3eE79kxT+6/uiXweSvk=', 'B8Lo7eH8D5GhkYyqTAQV2wyb+3imuI1AyUFM7VEB/+TPV9E5srnSvrv0i2nzwBTY', 'HhM6m50CJugnWLKJ9CoOAof0Sl+JLDMoTYuHuZH23MU=', 'oBi5qeKlcMGYHVhN9qURS8jrblNTuc646tgNrnhBBFM=', '7GrPhp1mlbKj3U8ldkKkgtBJiEFAxh8bXYLTfc2tV7iF6CZ8gEDPvz7D8vCZbQ9I', 0),
(4, 1, 'Neymar', 'J1C7F9woxNYvR3J1dwQqbt4fnlhswXklYgOxIaD5zvk=', 'pJQfkz6TnqyTcfix/UWoUsTjzV2mdGwacceQEzZNNWA=', 'LKghx8hs6xjeUjStuRQI72Ik9Wi20jta8A8uZC2SyiY=', '7ZhVKvlz5YrEur4Qjure5AZMQF9h3znueHHRaM2APQo5kC5OU5NwImVg3Zf1s4NN', 'K4tN4GlXBZjsJXRx1CR7MVvdIs0pm1WveaWJLJ0jw/RMdms57Ce/clUgCuwpmtdo', 'xsa5jNAfSIED2ZPtQLnlHLxUiR0/ThQVqrqu2Epcwxw=', 'T58FtlvIu3jwGpcXnF4g6u/cpmM/SZzLV0FGg8Hc4sA=', '+gqbItVVdWdnfm3OHjXFk/CDhEDwuzSVI5hHrVs88W4gEbhhR2ENqDjPGNZBz0U2', 0),
(5, 1, 'Ronaldo', '0IeTjEkk/Y5TB1V3lecFT1EKLu8NzBz7nGEbwmbXs1k=', '5NMC+L5x+4+nWyg/BPV9CXGCX/IvOMMBrmEPDM4T8Co=', 'bZpC71XLBQAPLf4F5fsajWMXjd9S2CpbPCkd4rNdLDc=', 'iYrO09gJKHOPfwPGL/H6HUQN3SPJIzlU8c+E53Qh89E=', '0ixuwWzitYhzoCmkOzJV1htzEooWVSrOE6r0AqE+GpAH6PmW15kSO3JfaDFD09Wd', 'Q8zpyzre2ovkYxMpqupndbpmdpV8NWG7P1O4zDrvWPY=', 'Mn3wDifPr2bGoEztZNAoAw/tgkQ9Vg9Bj5aYMKG9nesWffyUPnwTMd1B4czW1eWF', '8lzCSvmgI6hFW3zcrUjIW0uaHKboh0UNcFx18TtXjeMycZyrzLQE7WWoEROurMEe', 0),
(6, 2, 'Aaron_Paul', 'Aaron Paul', '1987-05-14', 'Male', 'phishing', 'Sent phishing emails', '2025-02-27', 'arrested', '357 Chestnut Rd, Riverview', 0),
(7, 2, 'Billy_Bob_Thornton', 'Billy Bob Thornton', '1979-10-08', 'Male', 'kidnapping', 'Abducted victim for ransom', '2024-07-07', 'convicted', '258 Aspen Pl, Brookfield', 0),
(8, 2, 'Clive_Owen', 'Clive Owen', '1984-06-30', 'Male', 'vandalism', 'Sprayed graffiti on public property', '2025-03-20', 'under_investigation', '147 Magnolia Ln, Union City', 0),
(9, 2, 'Edward_Norton', 'Edward Norton', '1971-09-10', 'Male', 'hit_and_run', 'Left scene after collision', '2025-01-05', 'arrested', '369 Dogwood Dr, Pinecrest', 0),
(10, 2, 'Freddie_Highmore', 'Freddie Highmore', '1996-11-22', 'Male', 'reckless_driving', 'High-speed chase', '2024-10-12', 'convicted', '481 Sycamore Ave, Meadowbrook', 0);
