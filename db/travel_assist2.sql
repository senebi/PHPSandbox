-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 14. 23:46
-- Kiszolgáló verziója: 10.4.25-MariaDB
-- PHP verzió: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `travel_assist`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alert`
--

CREATE TABLE `alert` (
  `alert_id` int(11) NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  `alert_active` tinyint(1) DEFAULT NULL,
  `alert_travel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `alert`
--

INSERT INTO `alert` (`alert_id`, `alert_date`, `alert_active`, `alert_travel_id`) VALUES
(1, '2022-11-11 10:00:00', 1, 1),
(2, '2022-11-10 18:05:56', 1, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cost`
--

CREATE TABLE `cost` (
  `cost_id` int(11) NOT NULL,
  `cost_name` varchar(50) DEFAULT NULL,
  `cost_cost` double(7,2) DEFAULT NULL,
  `cost_deviza` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `cost`
--

INSERT INTO `cost` (`cost_id`, `cost_name`, `cost_cost`, `cost_deviza`) VALUES
(1, 'Teszt Cost', 333.55, 'HUF');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `diary`
--

CREATE TABLE `diary` (
  `diary_id` int(11) NOT NULL,
  `diary_date` date DEFAULT NULL,
  `diary_duration` int(11) DEFAULT NULL,
  `diary_activity` varchar(50) DEFAULT NULL,
  `diary_desc` varchar(500) DEFAULT NULL,
  `diary_travel_id` int(11) DEFAULT NULL,
  `diary_cost_id` int(11) DEFAULT NULL,
  `diary_poi_id` int(11) DEFAULT NULL,
  `diary_photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `diary`
--

INSERT INTO `diary` (`diary_id`, `diary_date`, `diary_duration`, `diary_activity`, `diary_desc`, `diary_travel_id`, `diary_cost_id`, `diary_poi_id`, `diary_photo`) VALUES
(1, '0000-00-00', 5, 'Activity', 'diary desc', 1, 1, 1, 'teszt fotó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Pan Africa Market', '1521 1st Ave, Seattle, WA', 47.608940, -122.340141, 'restaurant'),
(2, 'Buddha Thai & Bar', '2222 2nd Ave, Seattle, WA', 47.613590, -122.344391, 'bar'),
(3, 'The Melting Pot', '14 Mercer St, Seattle, WA', 47.624561, -122.356445, 'restaurant'),
(4, 'Ipanema Grill', '1225 1st Ave, Seattle, WA', 47.606365, -122.337654, 'restaurant'),
(5, 'Pan Africa Market', '1521 1st Ave, Seattle, WA', 47.608940, -122.340141, 'restaurant'),
(6, 'Buddha Thai & Bar', '2222 2nd Ave, Seattle, WA', 47.613590, -122.344391, 'bar'),
(7, 'The Melting Pot', '14 Mercer St, Seattle, WA', 47.624561, -122.356445, 'restaurant'),
(8, 'Ipanema Grill', '1225 1st Ave, Seattle, WA', 47.606365, -122.337654, 'restaurant'),
(9, 'Sake House', '2230 1st Ave, Seattle, WA', 47.612823, -122.345673, 'bar'),
(10, 'Crab Pot', '1301 Alaskan Way, Seattle, WA', 47.605961, -122.340363, 'restaurant'),
(11, 'Mama\'s Mexican Kitchen', '2234 2nd Ave, Seattle, WA', 47.613976, -122.345467, 'bar'),
(12, 'Wingdome', '1416 E Olive Way, Seattle, WA', 47.617214, -122.326584, 'bar'),
(13, 'Piroshky Piroshky', '1908 Pike pl, Seattle, WA', 47.610126, -122.342834, 'restaurant');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_parc_name` varchar(50) DEFAULT NULL,
  `package_weight` double(3,2) DEFAULT NULL,
  `package_travel_id` int(11) DEFAULT NULL,
  `package_parc_quantity` int(11) DEFAULT NULL,
  `package_parc_ok` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `package`
--

INSERT INTO `package` (`package_id`, `package_parc_name`, `package_weight`, `package_travel_id`, `package_parc_quantity`, `package_parc_ok`) VALUES
(1, 'Teszt csomag', 0.70, 1, 3, '1'),
(2, 'Laptop', 1.80, 1, 1, '0'),
(3, 'Borotva', 0.30, 8, 3, 'on'),
(4, 'Borotva', 0.20, 7, 3, 'on'),
(5, 'Könyv', 0.40, 7, 2, ''),
(6, 'Tusfürdő', 0.20, 7, 1, 'on'),
(7, 'Gördeszka', 0.00, 8, 1, ''),
(8, 'Kenyér', 0.00, 8, 1, 'on'),
(9, 'Kenyér', 0.00, 5, 2, 'on'),
(11, 'Könyv', 0.60, 6, 2, 'on'),
(12, 'Szappan', 0.40, 10, 4, 'on');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `package_parc_ref`
--

CREATE TABLE `package_parc_ref` (
  `package_parc` varchar(50) NOT NULL,
  `package_parc_weight` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `package_parc_ref`
--

INSERT INTO `package_parc_ref` (`package_parc`, `package_parc_weight`) VALUES
('Borotva', 0.10),
('Gördeszka', 2.00),
('Kenyér', 1.00),
('Könyv', 0.30),
('Laptop', 1.30),
('Szappan', 0.10),
('Tusfürdő', 0.10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `poi`
--

CREATE TABLE `poi` (
  `poi_id` int(11) NOT NULL,
  `poi_name` varchar(50) DEFAULT NULL,
  `poi_desc` varchar(500) DEFAULT NULL,
  `poi_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `poi`
--

INSERT INTO `poi` (`poi_id`, `poi_name`, `poi_desc`, `poi_location`) VALUES
(1, 'Teszt POI', 'Teszt poi desc', 'teszt poi location');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `travel`
--

CREATE TABLE `travel` (
  `travel_id` int(11) NOT NULL,
  `travel_name` varchar(50) DEFAULT NULL,
  `travel_start` date DEFAULT NULL,
  `travel_end` date DEFAULT NULL,
  `travel_type` varchar(50) DEFAULT NULL,
  `travel_data_1` varchar(200) DEFAULT NULL,
  `travel_data_2` varchar(200) DEFAULT NULL,
  `travel_data_3` varchar(200) DEFAULT NULL,
  `travel_desc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `travel`
--

INSERT INTO `travel` (`travel_id`, `travel_name`, `travel_start`, `travel_end`, `travel_type`, `travel_data_1`, `travel_data_2`, `travel_data_3`, `travel_desc`) VALUES
(1, 'Teszt túra', '2022-11-09', '2022-11-10', '0', 'dsa', 'fds', 'yas', 'asd'),
(2, 'Mátrai túra', '2022-10-31', '2022-11-01', '2', 'dsa', '', 'dsad', 'asdkjsdfjsdfjdsfsdnsdnsdcs asadas '),
(3, 'sdfaDD', '2022-11-14', '2022-11-24', '0', '', '', '', 'ASD'),
(4, 'Első igazi teszt utazás', '2022-11-12', '2022-11-13', '3', 'teszt adat 1', 'teszt adat 2', 'teszt adat 3', 'Teszt'),
(5, 'jtrasafe', '2022-11-07', '2022-11-11', '1', 'asdasd', 'asdasd', 'dsadsa', 'asdasdasdasdasdasdasdasdasdsad'),
(6, 'Új túra safe2', '2022-10-31', '2022-11-04', '3', 'dasdá', 'ad', 'dsa', 'asdá'),
(7, 'Bécsi karácsonyi vásár', '2022-12-22', '2022-12-23', '1', '', '', '', ''),
(8, 'Budapest', '2022-11-11', '2022-11-17', '1', '', '', '', 'Színház'),
(9, 'Teszt 888', '2022-11-12', '2022-11-12', '1', 'dasdá', 'saasd', 'drersfd', 'asdasdassafa'),
(10, 'Teszt 999', '2022-11-12', '2022-11-12', '1', 'dasdád', 'saasds', 'drersfda', 'asdasdassafadaasd');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `alert_travel_id` (`alert_travel_id`);

--
-- A tábla indexei `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`cost_id`);

--
-- A tábla indexei `diary`
--
ALTER TABLE `diary`
  ADD PRIMARY KEY (`diary_id`),
  ADD KEY `diary_travel_id` (`diary_travel_id`),
  ADD KEY `diary_cost_id` (`diary_cost_id`),
  ADD KEY `diary_poi_id` (`diary_poi_id`);

--
-- A tábla indexei `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `package_travel_id` (`package_travel_id`);

--
-- A tábla indexei `package_parc_ref`
--
ALTER TABLE `package_parc_ref`
  ADD PRIMARY KEY (`package_parc`);

--
-- A tábla indexei `poi`
--
ALTER TABLE `poi`
  ADD PRIMARY KEY (`poi_id`);

--
-- A tábla indexei `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`travel_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alert`
--
ALTER TABLE `alert`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `cost`
--
ALTER TABLE `cost`
  MODIFY `cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `diary`
--
ALTER TABLE `diary`
  MODIFY `diary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `poi`
--
ALTER TABLE `poi`
  MODIFY `poi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `travel`
--
ALTER TABLE `travel`
  MODIFY `travel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`alert_travel_id`) REFERENCES `travel` (`travel_id`);

--
-- Megkötések a táblához `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `diary_ibfk_1` FOREIGN KEY (`diary_travel_id`) REFERENCES `travel` (`travel_id`),
  ADD CONSTRAINT `diary_ibfk_2` FOREIGN KEY (`diary_cost_id`) REFERENCES `cost` (`cost_id`),
  ADD CONSTRAINT `diary_ibfk_3` FOREIGN KEY (`diary_poi_id`) REFERENCES `poi` (`poi_id`);

--
-- Megkötések a táblához `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`package_travel_id`) REFERENCES `travel` (`travel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
