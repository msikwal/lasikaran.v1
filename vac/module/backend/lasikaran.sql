-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2014 at 01:06 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lasikaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `child_details`
--

CREATE TABLE IF NOT EXISTS `child_details` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `child_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `parent_id` int(11) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  PRIMARY KEY (`child_id`),
  UNIQUE KEY `child_id` (`birth_date`,`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `child_details`
--

INSERT INTO `child_details` (`child_id`, `child_name`, `birth_date`, `parent_id`, `gender`) VALUES
(1, 'anu', '2014-03-11', 1, 'female'),
(2, 'avnvee', '2014-03-11', 2, 'female'),
(3, 'adad', '2014-03-04', 3, 'female'),
(4, 'adad', '2014-03-03', 3, 'female'),
(5, 'teretet', '2014-03-19', 4, 'female'),
(6, '11111', '2014-03-19', 1, 'female'),
(7, '1111', '2014-03-12', 3, 'female'),
(8, '', '0000-00-00', 1, ''),
(9, 'anvee', '2012-06-16', 1, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `doc_details`
--

CREATE TABLE IF NOT EXISTS `doc_details` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `text_msg` varchar(200) NOT NULL,
  `per_patient_amt` bigint(20) NOT NULL,
  `registration_date` datetime NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `doc_details`
--

INSERT INTO `doc_details` (`doc_id`, `first_name`, `last_name`, `mobile`, `email`, `address`, `pincode`, `location`, `phone`, `text_msg`, `per_patient_amt`, `registration_date`, `status`, `group_id`) VALUES
(1, 'mahesh ji ', 'sikwal', 1111111111, 'mahesh.sikwal@gmail.com', '', 0, '', 0, 'welcome this Dr.sikwal ', 50, '2014-03-14 10:13:22', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_details`
--

CREATE TABLE IF NOT EXISTS `group_details` (
  `group_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('active','deative','','') NOT NULL,
  `access_to_module` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_details`
--

INSERT INTO `group_details` (`group_id`, `code`, `name`, `status`, `access_to_module`) VALUES
(1, 'd_user', 'Doctor', 'active', ''),
(2, 'e_user', 'User ', 'active', '');

-- --------------------------------------------------------

--
-- Table structure for table `module_details`
--

CREATE TABLE IF NOT EXISTS `module_details` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `module_details`
--

INSERT INTO `module_details` (`module_id`, `module_name`, `status`) VALUES
(1, 'm_child', 'active'),
(2, 'm_preg', 'active'),
(3, 'm_appntment', 'active'),
(4, 'm_health', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `msg_schedule_master`
--

CREATE TABLE IF NOT EXISTS `msg_schedule_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vac_id` int(11) NOT NULL,
  `msg_type` enum('pregnancy','child','health','other') NOT NULL DEFAULT 'child',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `given_date` date NOT NULL,
  `msg_send_status` enum('pending','failed','other','send') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `msg_schedule_master`
--

INSERT INTO `msg_schedule_master` (`id`, `user_id`, `vac_id`, `msg_type`, `start_date`, `end_date`, `given_date`, `msg_send_status`) VALUES
(1, 1, 1, 'child', '2014-04-11', '2014-05-11', '0000-00-00', 'pending'),
(2, 1, 2, 'child', '2014-05-11', '2014-06-09', '0000-00-00', 'pending'),
(3, 1, 3, 'child', '2014-07-11', '2014-08-08', '0000-00-00', 'pending'),
(4, 1, 4, 'child', '2014-09-11', '2014-10-07', '0000-00-00', 'pending'),
(5, 1, 5, 'child', '2014-09-11', '2015-09-11', '0000-00-00', 'pending'),
(6, 1, 6, 'child', '2015-03-11', '2015-06-11', '0000-00-00', 'pending'),
(7, 1, 7, 'child', '2015-03-11', '2016-02-11', '0000-00-00', 'pending'),
(8, 1, 8, 'child', '2015-06-11', '2015-09-11', '0000-00-00', 'pending'),
(9, 1, 9, 'child', '2018-03-11', '2020-03-11', '0000-00-00', 'pending'),
(10, 2, 1, 'child', '2014-04-11', '2014-05-11', '0000-00-00', 'pending'),
(11, 2, 2, 'child', '2014-05-11', '2014-06-09', '0000-00-00', 'pending'),
(12, 2, 3, 'child', '2014-07-11', '2014-08-08', '0000-00-00', 'pending'),
(13, 2, 4, 'child', '2014-09-11', '2014-10-07', '0000-00-00', 'pending'),
(14, 2, 5, 'child', '2014-09-11', '2015-09-11', '0000-00-00', 'pending'),
(15, 2, 6, 'child', '2015-03-11', '2015-06-11', '0000-00-00', 'pending'),
(16, 2, 7, 'child', '2015-03-11', '2016-02-11', '0000-00-00', 'pending'),
(17, 2, 8, 'child', '2015-06-11', '2015-09-11', '0000-00-00', 'pending'),
(18, 2, 9, 'child', '2018-03-11', '2020-03-11', '0000-00-00', 'pending'),
(19, 3, 1, 'child', '2014-04-04', '2014-05-04', '0000-00-00', 'pending'),
(20, 3, 2, 'child', '2014-05-04', '2014-06-02', '0000-00-00', 'pending'),
(21, 3, 3, 'child', '2014-07-04', '2014-08-01', '0000-00-00', 'pending'),
(22, 3, 4, 'child', '2014-09-04', '2014-09-30', '0000-00-00', 'pending'),
(23, 3, 5, 'child', '2014-09-04', '2015-09-04', '0000-00-00', 'pending'),
(24, 3, 6, 'child', '2015-03-04', '2015-06-04', '0000-00-00', 'pending'),
(25, 3, 7, 'child', '2015-03-04', '2016-02-04', '0000-00-00', 'pending'),
(26, 3, 8, 'child', '2015-06-04', '2015-09-04', '0000-00-00', 'pending'),
(27, 3, 9, 'child', '2018-03-04', '2020-03-04', '0000-00-00', 'pending'),
(28, 3, 1, 'child', '2014-04-03', '2014-05-03', '0000-00-00', 'pending'),
(29, 3, 2, 'child', '2014-05-03', '2014-06-01', '0000-00-00', 'pending'),
(30, 3, 3, 'child', '2014-07-03', '2014-07-31', '0000-00-00', 'pending'),
(31, 3, 4, 'child', '2014-09-03', '2014-09-29', '0000-00-00', 'pending'),
(32, 3, 5, 'child', '2014-09-03', '2015-09-03', '0000-00-00', 'pending'),
(33, 3, 6, 'child', '2015-03-03', '2015-06-03', '0000-00-00', 'pending'),
(34, 3, 7, 'child', '2015-03-03', '2016-02-03', '0000-00-00', 'pending'),
(35, 3, 8, 'child', '2015-06-03', '2015-09-03', '0000-00-00', 'pending'),
(36, 3, 9, 'child', '2018-03-03', '2020-03-03', '0000-00-00', 'pending'),
(37, 4, 1, 'child', '2014-04-19', '2014-05-19', '0000-00-00', 'pending'),
(38, 4, 2, 'child', '2014-05-19', '2014-06-17', '0000-00-00', 'pending'),
(39, 4, 3, 'child', '2014-07-19', '2014-08-16', '0000-00-00', 'pending'),
(40, 4, 4, 'child', '2014-09-19', '2014-10-15', '0000-00-00', 'pending'),
(41, 4, 5, 'child', '2014-09-19', '2015-09-19', '0000-00-00', 'pending'),
(42, 4, 6, 'child', '2015-03-19', '2015-06-19', '0000-00-00', 'pending'),
(43, 4, 7, 'child', '2015-03-19', '2016-02-19', '0000-00-00', 'pending'),
(44, 4, 8, 'child', '2015-06-19', '2015-09-19', '0000-00-00', 'pending'),
(45, 4, 9, 'child', '2018-03-19', '2020-03-19', '0000-00-00', 'pending'),
(46, 1, 1, 'child', '2014-04-19', '2014-05-19', '0000-00-00', 'pending'),
(47, 1, 2, 'child', '2014-05-19', '2014-06-17', '0000-00-00', 'pending'),
(48, 1, 3, 'child', '2014-07-19', '2014-08-16', '0000-00-00', 'pending'),
(49, 1, 4, 'child', '2014-09-19', '2014-10-15', '0000-00-00', 'pending'),
(50, 1, 5, 'child', '2014-09-19', '2015-09-19', '0000-00-00', 'pending'),
(51, 1, 6, 'child', '2015-03-19', '2015-06-19', '0000-00-00', 'pending'),
(52, 1, 7, 'child', '2015-03-19', '2016-02-19', '0000-00-00', 'pending'),
(53, 1, 8, 'child', '2015-06-19', '2015-09-19', '0000-00-00', 'pending'),
(54, 1, 9, 'child', '2018-03-19', '2020-03-19', '0000-00-00', 'pending'),
(55, 3, 1, 'child', '2014-04-12', '2014-05-12', '0000-00-00', 'pending'),
(56, 3, 2, 'child', '2014-05-12', '2014-06-10', '0000-00-00', 'pending'),
(57, 3, 3, 'child', '2014-07-12', '2014-08-09', '0000-00-00', 'pending'),
(58, 3, 4, 'child', '2014-09-12', '2014-10-08', '0000-00-00', 'pending'),
(59, 3, 5, 'child', '2014-09-12', '2015-09-12', '0000-00-00', 'pending'),
(60, 3, 6, 'child', '2015-03-12', '2015-06-12', '0000-00-00', 'pending'),
(61, 3, 7, 'child', '2015-03-12', '2016-02-12', '0000-00-00', 'pending'),
(62, 3, 8, 'child', '2015-06-12', '2015-09-12', '0000-00-00', 'pending'),
(63, 3, 9, 'child', '2018-03-12', '2020-03-12', '0000-00-00', 'pending'),
(64, 1, 1, 'child', '1970-02-01', '1970-03-01', '0000-00-00', 'pending'),
(65, 1, 2, 'child', '1970-03-01', '1970-04-01', '0000-00-00', 'pending'),
(66, 1, 3, 'child', '1970-05-01', '1970-05-31', '0000-00-00', 'pending'),
(67, 1, 4, 'child', '1970-07-01', '1970-07-30', '0000-00-00', 'pending'),
(68, 1, 5, 'child', '1970-07-01', '1971-07-01', '0000-00-00', 'pending'),
(69, 1, 6, 'child', '1971-01-01', '1971-04-01', '0000-00-00', 'pending'),
(70, 1, 7, 'child', '1971-01-01', '1971-12-01', '0000-00-00', 'pending'),
(71, 1, 8, 'child', '1971-04-01', '1971-07-01', '0000-00-00', 'pending'),
(72, 1, 9, 'child', '1974-01-01', '1976-01-01', '0000-00-00', 'pending'),
(73, 1, 1, 'child', '2012-07-16', '2012-08-16', '0000-00-00', 'pending'),
(74, 1, 2, 'child', '2012-08-16', '2012-09-14', '0000-00-00', 'pending'),
(75, 1, 3, 'child', '2012-10-16', '2012-11-13', '0000-00-00', 'pending'),
(76, 1, 4, 'child', '2012-12-16', '2013-01-12', '0000-00-00', 'pending'),
(77, 1, 5, 'child', '2012-12-16', '2013-12-16', '0000-00-00', 'pending'),
(78, 1, 6, 'child', '2013-06-16', '2013-09-16', '0000-00-00', 'pending'),
(79, 1, 7, 'child', '2013-06-16', '2014-05-16', '0000-00-00', 'pending'),
(80, 1, 8, 'child', '2013-09-16', '2013-12-16', '0000-00-00', 'pending'),
(81, 1, 9, 'child', '2016-06-16', '2018-06-16', '0000-00-00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `refer_by_doc` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `salutation`, `first_name`, `last_name`, `mobile`, `refer_by_doc`, `email`, `address`, `pincode`, `location`, `phone`, `registration_date`, `group_id`, `status`) VALUES
(1, 'Mr.', '12113', '123123123', 2222222222, 1, 'test@test.com', '2222222222', 0, '', 0, '2014-03-18 07:23:10', 2, 'active'),
(2, 'Mr.', '', '', 3333333333, 1, 'test@test.com', '', 0, '', 0, '2014-03-18 07:23:51', 2, 'active'),
(3, 'Mr.', 'first name', 'last name', 4444444444, 1, 'test@test.com', 'ghatkopar west ', 0, '', 0, '2014-03-18 07:25:06', 2, 'active'),
(4, 'Mr.', '', '', 5555555555, 1, 'test@test.com', '', 0, '', 0, '2014-03-20 12:09:51', 2, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_details`
--

CREATE TABLE IF NOT EXISTS `user_login_details` (
  `user_mobile` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_details`
--

INSERT INTO `user_login_details` (`user_mobile`, `user_name`, `password`, `group_id`) VALUES
(1111111111, '', '123', 1),
(2222222222, '', '2222222222', 2),
(3333333333, '', '3333333333', 2),
(4444444444, '', '4444444444', 2),
(5555555555, '', '5555555555', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vac_details`
--

CREATE TABLE IF NOT EXISTS `vac_details` (
  `vac_id` int(11) NOT NULL AUTO_INCREMENT,
  `vac_name` varchar(100) NOT NULL,
  `effctive_for` varchar(100) NOT NULL,
  `start_month` varchar(50) NOT NULL,
  `end_month` varchar(50) NOT NULL,
  PRIMARY KEY (`vac_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vac_details`
--

INSERT INTO `vac_details` (`vac_id`, `vac_name`, `effctive_for`, `start_month`, `end_month`) VALUES
(1, 'Hepatitis B', 'Hepatitis B', '1 ', '2 '),
(2, 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', '2', '2'),
(3, 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', '4', '4'),
(4, 'DTaP Hib Pneumococcal (PCV) Rotavirus', 'DTaP Hib Pneumococcal (PCV) Rotavirus', '6', '6'),
(5, 'Hepatitis B Polio (IPV)', 'Hepatitis B Polio (IPV)', '6', '18'),
(6, 'Hib MMR Pneumococcal (PCV) Varicella', 'Hib MMR Pneumococcal (PCV) Varicella', '12', '15'),
(7, 'Hepatitis A', 'Hepatitis A', '12', '23'),
(8, 'DTaP', 'DTaP', '15', '18'),
(9, 'Varicella DTaP Polio (IPV) MMR', 'Varicella DTaP Polio (IPV) MMR', '48', '72');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
