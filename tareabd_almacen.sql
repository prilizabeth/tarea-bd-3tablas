-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 21:12:33
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tareabd_almacen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('20253212', 'Gabriela', 'Gascon'),
('20257848', 'Horacio', 'Hernandez'),
('28112014', 'Lucia', 'Lopez'),
('32365856', 'Cecilia', 'Costa'),
('47586553', 'Ivana', 'Islas'),
('56255698', 'Vanesa', 'Velazquez'),
('6122532', 'Daniel', 'Duran'),
('74851368', 'Facundo', 'Fernandez'),
('85859622', 'Pablo', 'Perez'),
('90859812', 'Claudio', 'Costa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_id`) VALUES
(1, 'consumidor final', '32365856'),
(2, 'consumidor final', '47586553'),
(3, 'mayorista', '85859622'),
(4, 'consumidor final', '6122532'),
(5, 'mayorista', '6122532'),
(6, 'consumidor final', '85859622'),
(7, 'consumidor final', '20253212'),
(8, 'mayorista', '32365856'),
(9, 'mayorista', '74851368'),
(10, 'mayorista', '47586553');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompras`
--

CREATE TABLE `lineascompras` (
  `numero` int(11) NOT NULL,
  `compras_id` int(11) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompras`
--

INSERT INTO `lineascompras` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'leche sin lactosa', 5000),
(2, 3, 'galletitas sin tacc', 2500),
(3, 6, 'harina de arroz', 3000),
(4, 6, 'harina de avena', 4000),
(5, 2, 'leche sin lactosa', 2000),
(6, 7, 'yogur sin lactosa', 3500),
(7, 9, 'pan sin tacc', 5000),
(8, 10, 'galletitas sin tacc', 4000),
(9, 5, 'harina premezcla', 7000),
(10, 4, 'harina premezcla', 3000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_id` (`clientes_id`);

--
-- Indices de la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`dni`);

--
-- Filtros para la tabla `lineascompras`
--
ALTER TABLE `lineascompras`
  ADD CONSTRAINT `lineascompras_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
