-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db:3306
-- Tiempo de generación: 13-12-2021 a las 00:21:14
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tSeriesDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thingData`
--

CREATE TABLE `thingData` (
  `id` int(11) NOT NULL,
  `topic` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `payload` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `thingData`
--

INSERT INTO `thingData` (`id`, `topic`, `payload`, `timestamp`, `deleted`) VALUES
(1, 'mytimestamp', '1638066393637', '1638066393.640', 0x30),
(2, 'mytimestamp', '1638066809397', '1638066809.400', 0x30),
(3, 'mytimestamp', '1638066809397', '1638066809.401', 0x30),
(4, 'mytimestamp', '1638067667765', '1638067667.768', 0x30),
(5, 'mytimestamp', '1638067667765', '1638067667.769', 0x30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `thingData`
--
ALTER TABLE `thingData`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `thingData`
--
ALTER TABLE `thingData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
