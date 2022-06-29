SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cs332t13`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `ID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `textbook` text NOT NULL,
  `units` double NOT NULL,
  `PreReq` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `title`, `textbook`, `units`, `PreReq`) VALUES
(1, 'Databases', 'Databases 101', 3, NULL),
(2, 'Biology 1A', 'Biology The Core', 3, NULL),
(3, 'Biology 1B', 'Advanced Biology', 4, 'Biology 1A'),
(4, 'Art', 'The Flow of Art', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` int(10) NOT NULL,
  `location` text NOT NULL,
  `chairman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID`, `name`, `phone`, `location`, `chairman`) VALUES
(1, 'Computer Science', 1234567891, 'E 300', 1),
(2, 'Mathematics', 2147483647, 'H 200', 2);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `ID` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `grade` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`ID`, `student`, `course`, `section`, `grade`) VALUES
(1, 1, 1, 1, 'A+'),
(2, 1, 1, 2, 'B+'),
(3, 1, 2, 3, 'A'),
(4, 2, 1, 1, 'C'),
(5, 2, 1, 2, 'A+'),
(6, 2, 3, 5, 'A+'),
(7, 3, 1, 1, 'A+'),
(8, 3, 1, 2, 'A+'),
(9, 3, 3, 6, 'C-'),
(10, 4, 1, 1, 'F'),
(11, 4, 1, 2, 'A-'),
(12, 4, 2, 3, 'B-'),
(13, 5, 1, 1, 'C-'),
(14, 6, 1, 1, 'D+'),
(15, 7, 1, 1, 'A'),
(16, 7, 1, 2, 'A-'),
(17, 7, 3, 5, 'B'),
(18, 7, 2, 4, 'B-'),
(19, 8, 2, 4, 'B+'),
(20, 8, 3, 6, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `ID` int(11) NOT NULL,
  `ssn` int(9) NOT NULL,
  `name` varchar(25) NOT NULL,
  `addr` text NOT NULL,
  `phone` int(10) NOT NULL,
  `sex` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `salary` double NOT NULL,
  `degrees` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`ID`, `ssn`, `name`, `addr`, `phone`, `sex`, `title`, `salary`, `degrees`) VALUES
(1, 123456789, 'Joe Shmoe', '123 YellowBrick Rd, Fullerton, CA, 90621', 1234567891, 'Male', 'Computer Professor', 100000, 'Bachelors In Computer Science'),
(2, 973589121, 'Jonas Hill', '555 Rainbow Rd, Corona, CA, 92881', 1984728193, 'Male', 'Math Professor', 90000, 'Bachelors In Mathematics'),
(3, 222333567, 'Dat Gal', '437 Winco Dr, Norco, CA, 92661', 1958529205, 'Female', 'Art Professor', 85000, 'Bachelors In Arts');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `ID` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `classroom` varchar(25) NOT NULL,
  `seats` int(100) NOT NULL,
  `days` varchar(25) NOT NULL,
  `beggining` varchar(25) NOT NULL,
  `ending` varchar(25) NOT NULL,
  `professor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`ID`, `course`, `classroom`, `seats`, `days`, `beggining`, `ending`, `professor`) VALUES
(1, 1, 'E 301', 30, 'M W', '4:00 PM', '5:15 PM', 1),
(2, 1, 'E 301', 30, 'M W', '5:30 PM', '6:45 PM', 1),
(3, 2, 'H 200', 45, 'Tue Th', '8:00 AM', '9:15 AM', 2),
(4, 2, 'H 200', 45, 'M W', '8:00 AM', '9:15 AM', 2),
(5, 3, 'S 107', 30, 'Sat', '4:00 PM', '6:15 PM', 3),
(6, 3, 'S 107', 35, 'Tue TH', '5:30 PM', '6:45 PM', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `cwid` int(7) NOT NULL,
  `name` varchar(25) NOT NULL,
  `addr` text NOT NULL,
  `phone` int(10) NOT NULL,
  `major` varchar(25) NOT NULL,
  `minor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `cwid`, `name`, `addr`, `phone`, `major`, `minor`) VALUES
(1, 1234567, 'Brandon Gillett', '123 Fullerton Ln, Fullerton, CA, 90621', 1987654321, 'Computer Science', 'Math'),
(2, 2468123, 'John Doe', '123 Oak Rd, Fullerton, CA, 90621', 1112223333, 'Engineering', 'Art, Math'),
(3, 3455632, 'Finding Nemo', '42 Wallaby Way, Sydney, Australia, 2000', 1232229999, 'Engineering', 'Swimming'),
(4, 9876578, 'Kevin Durant', '123 Holly St, Orange, California, 92679', 1117623432, 'Computer Science', 'Physics'),
(5, 2347324, 'Russel Westbrook', '222 Westbrook Rd, Fullerton, California, 92679', 1113245534, 'Engineering', 'None'),
(6, 2568394, 'Mary Jane', '899 Nut Dr, Pasadena, CA, 90341', 2147483647, 'Art', 'Biology'),
(7, 1294366, 'Quincy Adams', '999 Crybaby Ave, Corona, CA, 92881', 2147483647, 'Sociology', ''),
(8, 2859293, 'Tyler Perk', '155 Avocado St, Orange, CA, 92679', 1489204255, 'Computer Science', 'Art');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chairman` (`chairman`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `student` (`student`),
  ADD KEY `course` (`course`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `professor` (`professor`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`chairman`) REFERENCES `professor` (`ID`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`ID`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course`) REFERENCES `course` (`ID`),
  ADD CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`section`) REFERENCES `section` (`ID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `professor` (`ID`);
COMMIT;
