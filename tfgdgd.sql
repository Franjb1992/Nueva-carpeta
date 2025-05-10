-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2025 a las 13:16:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfgdgd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `airports`
--

CREATE TABLE `airports` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo_iata` varchar(10) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `airports`
--

INSERT INTO `airports` (`id`, `nombre`, `codigo_iata`, `ciudad`, `pais`) VALUES
(1, 'Aeropuerto de Sabadell', 'LEBS', 'Sabadell', 'España'),
(2, 'Aeropuerto de Ibiza', 'IBZ', 'Ibiza', 'España'),
(3, 'Aeropuerto de Madrid-Barajas Adolfo Suárez', 'MAD', 'Madrid', 'España'),
(4, 'Aeropuerto de Barcelona-El Prat', 'BCN', 'Barcelona', 'España'),
(5, 'Aeropuerto de Valencia', 'VLC', 'Valencia', 'España'),
(6, 'Aeropuerto de Santiago de Compostela', 'SCQ', 'Santiago de Compostela', 'España'),
(7, 'Aeropuerto de Sevilla-San Pablo', 'SVQ', 'Sevilla', 'España'),
(8, 'Aeropuerto de Bruselas', 'BRU', 'Bruselas', 'Belgica'),
(9, 'Aeropuerto de Leipzig/Halle', 'LEJ', 'Leipzig', 'Alemania'),
(10, 'Aeropuerto de Ámsterdam-Schiphol', 'AMS', 'Ámsterdam', 'Paises Bajos'),
(11, 'Aeropuerto de Berlín Brandenburg', 'BER', 'Berlín', 'Alemania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consignee`
--

CREATE TABLE `consignee` (
  `id` bigint(20) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consignee`
--

INSERT INTO `consignee` (`id`, `direccion`, `nombre`, `telefono`) VALUES
(1, 'Calle Corona 1, Ibiza, 07800, España', 'Policlínica Ntra. Sra. del Rosario', '+34971300000'),
(2, 'Calle Villarroel 170, Barcelona, 08036, España', 'Hospital Clínic de Barcelona', '+34932275000'),
(3, 'Paseo de la Castellana 261, Madrid, 28046, España', 'Hospital La Paz', '+34912345600'),
(4, 'Avda. Manuel Siurot s/n, Sevilla, 41013, España', 'Hospital Universitario Virgen del Rocío', '+34954399000'),
(5, 'pseo de los olivos', 'Hospital General de Valencia', '+34963863400'),
(6, 'kjvbkjhbj', 'uhyfuyfuy', '9489489');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `isotope`
--

CREATE TABLE `isotope` (
  `id` bigint(20) NOT NULL,
  `actividad` double NOT NULL,
  `estado_fisico` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `isotope`
--

INSERT INTO `isotope` (`id`, `actividad`, `estado_fisico`, `nombre`) VALUES
(1, 16337, 'Líquido orgánico', 'Flúor-18 (F-18)'),
(2, 7400, 'Líquido', 'Tecnecio-99m (Tc-99m)'),
(3, 3700, 'Líquido', 'Yodo-131 (I-131)'),
(4, 1850, 'Líquido', 'Galio-68 (Ga-68)'),
(6, 8200, 'L�quido', 'Zirconio-89 (Zr-89)'),
(7, 300, 'Solido inorganico', 'Cobalto-60 (Co-60)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shipper`
--

CREATE TABLE `shipper` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `shipper`
--

INSERT INTO `shipper` (`id`, `contact`, `name`, `ciudad`, `codigo_postal`, `direccion`, `nombre`, `pais`, `telefono`) VALUES
(2, NULL, NULL, 'Esplugues de Llobregat', '08950', 'Josep Anselm Clavé 100', 'Advanced Accelerator Applications', 'España', '+34932693000'),
(3, NULL, NULL, 'Alcobendas', '28108', 'Avda. Europa 26', 'Curium Pharma', 'España', '+34910000000'),
(4, NULL, NULL, 'Tres Cantos', '28760', 'Calle Einstein 1', 'GE Healthcare', 'España', '+34912345678'),
(6, NULL, NULL, 'Alcobendas', '28108', 'Avda. Europa 26', 'Curium Pharma', 'España', '+34910000000'),
(11, NULL, NULL, 'Salamanca', '37009', 'Carretera Vitigudino', 'ETSA Global Logistics', 'Espa�a', '923923923');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consignee`
--
ALTER TABLE `consignee`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `isotope`
--
ALTER TABLE `isotope`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `consignee`
--
ALTER TABLE `consignee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `isotope`
--
ALTER TABLE `isotope`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `shipper`
--
ALTER TABLE `shipper`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
