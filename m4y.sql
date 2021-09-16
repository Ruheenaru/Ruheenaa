-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2019 at 02:02 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m4y`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_qty` ()  NO SQL
BEGIN
DECLARE p_id,total_rating int;
DECLARE DONE INT DEFAULT FALSE;
declare c cursor for 
  SELECT count(b.pid) total_rating, b.pid p_id FROM buy b group by b.pid;
  DECLARE CONTINUE HANDLER for NOT FOUND SET DONE=TRUE;
  open c;
  MYLOOP:
  LOOP
  fetch c into total_rating,p_id;
  IF DONE THEN
  LEAVE MYLOOP;
  END IF;
  update paiting p set p.sold=total_rating where p.pid=p_id;
END LOOP;
close c;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mail` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`name`, `phone`, `mail`) VALUES
('abcdefgh', '9844029620', 'd@gmail.com'),
('abcdefgh', '9844029620', 'd@gmail.com'),
('abcdefgh', '9844029620', 'd@gmail.com'),
('abcdefgh', '9844029620', 'd@gmail.com'),
('abcdefgh', '9844029620', 'd@gmail.com');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
