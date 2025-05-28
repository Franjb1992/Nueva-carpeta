-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2025 a las 18:53:45
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
-- Estructura de tabla para la tabla `airport`
--

CREATE TABLE `airport` (
  `id` bigint(20) NOT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `codigo_iata` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `airport`
--

INSERT INTO `airport` (`id`, `ciudad`, `codigo_iata`, `nombre`, `pais`) VALUES
(1, 'Sabadell', 'LEBS', 'Aeropuerto de Sabadell', 'España'),
(2, 'Ibiza', 'IBZ', 'Aeropuerto de Ibiza', 'España'),
(3, 'Madrid', 'MAD', 'Aeropuerto de Madrid-Barajas Adolfo Suárez', 'España'),
(4, 'Barcelona', 'BCN', 'Aeropuerto de Barcelona-El Prat', 'España'),
(5, 'Valencia', 'VLC', 'Aeropuerto de Valencia', 'España'),
(6, 'Santiago de Compostela', 'SCQ', 'Aeropuerto de Santiago de Compostela', 'España'),
(7, 'Sevilla', 'SVQ', 'Aeropuerto de Sevilla-San Pablo', 'España'),
(8, 'Bruselas', 'BRU', 'Aeropuerto de Bruselas', 'Bélgica'),
(9, 'Leipzig', 'LEJ', 'Aeropuerto de Leipzig/Halle', 'Alemania'),
(10, 'Ámsterdam', 'AMS', 'Aeropuerto de Ámsterdam-Schiphol', 'Países Bajos'),
(11, 'Berlín', 'BER', 'Aeropuerto de Berlín Brandenburg', 'Alemania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bulto`
--

CREATE TABLE `bulto` (
  `id` bigint(20) NOT NULL,
  `actividad` double NOT NULL,
  `autorizacion` varchar(255) DEFAULT NULL,
  `cantidad_bultos` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `dimensiones` varchar(255) DEFAULT NULL,
  `packing_instruction` varchar(255) DEFAULT NULL,
  `ti` double NOT NULL,
  `un_id` varchar(255) DEFAULT NULL,
  `dgd_id` bigint(20) DEFAULT NULL,
  `isotope_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bulto`
--

INSERT INTO `bulto` (`id`, `actividad`, `autorizacion`, `cantidad_bultos`, `categoria`, `dimensiones`, `packing_instruction`, `ti`, `un_id`, `dgd_id`, `isotope_id`) VALUES
(1, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 1, 1),
(2, 2000, '', 1, 'II-AMARILLA', '28*28*33', '-', 1, 'UN2915', 2, 1),
(3, 20245, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 3, 1),
(4, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 5, 1),
(5, 200, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 6, 1),
(6, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 8, 1),
(7, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 9, 1),
(8, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 11, 1),
(9, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 12, 1),
(10, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 13, 1),
(11, 2, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 14, 1),
(12, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 15, 1),
(13, 4, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 16, 1),
(14, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 17, 1),
(15, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 18, 1),
(16, 20, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 19, 1),
(17, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 21, 1),
(18, 2, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 22, 1),
(19, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 23, 1),
(20, 200, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 24, 1),
(21, 2, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 25, 1),
(22, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 26, 1),
(23, 5612, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 27, 3),
(24, 200, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 28, 1),
(25, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 29, 1),
(26, 2, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 30, 1),
(27, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 31, 1),
(28, 8, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 32, 1),
(29, 2000, '', 1, 'III-AMARILLA', '28*28*33', '-', 1.2, 'UN3332', 33, 7),
(30, 3000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 34, 1),
(31, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 35, 1),
(32, 200, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 36, 1),
(33, 1, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 36, 7),
(34, 1, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 37, 1),
(35, 123, '', 1, 'III-AMARILLA', '28*28*33', '-', 1.2, 'UN2915', 37, 7),
(36, 5045, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 38, 1),
(37, 5489, '', 1, 'III-AMARILLA', '28*28*33', '-', 2, 'UN2915', 38, 7),
(38, 200, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 39, 1),
(39, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 40, 1),
(40, 123123, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 40, 1),
(41, 2000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 41, 1),
(42, 3000, '', 1, 'III-AMARILLA', '28*28*33', '-', 2, 'UN2915', 41, 1),
(43, 123123, '', 1, 'II-AMARILLA', '28*28*33', '-', 1, 'UN2915', 41, 1),
(44, 213123, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 41, 8),
(45, 5455, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 42, 1),
(46, 2456, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 42, 3),
(47, 3000, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 43, 1),
(48, 2000, '', 1, 'III-AMARILLA', '28*28*33', '-', 2, 'UN2915', 43, 4),
(49, 123123, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 44, 1),
(50, 1232, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 45, 1),
(51, 23213, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 45, 1),
(52, 78987, '', 4, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 46, 1),
(53, 578, '', 1, 'III-AMARILLA', '28*28*33', '-', 2, 'UN2915', 46, 7),
(54, 544, '', 1, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 47, 3),
(55, 2000, '', 4, 'I-BLANCA', '28*28*33', '-', 0, 'UN2915', 48, 1),
(56, 7894, '', 7, 'I-WHITE', '28*28*33', '-', 0, 'UN2915', 49, 1);

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
(3, 'Paseo de la Castellana 261, Madrid, 28046, Espa�a', 'Hospital La Paz', '+34912345600'),
(4, 'Avda. Manuel Siurot s/n, Sevilla, 41013, España', 'Hospital Universitario Virgen del Rocío', '+34954399000'),
(5, 'pseo de los olivos', 'Hospital General de Valencia', '+34963863400'),
(8, 'dasdasd', 'asda', '9889751615');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dgd`
--

CREATE TABLE `dgd` (
  `id` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `firmante` varchar(255) DEFAULT NULL,
  `lugar_firma` varchar(255) DEFAULT NULL,
  `modo_transporte` varchar(255) DEFAULT NULL,
  `ruta_pdf` varchar(255) DEFAULT NULL,
  `telefono_emergencia` varchar(255) DEFAULT NULL,
  `aeropuerto_destino_id` bigint(20) DEFAULT NULL,
  `aeropuerto_origen_id` bigint(20) DEFAULT NULL,
  `consignee_id` bigint(20) DEFAULT NULL,
  `shipper_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dgd`
--

INSERT INTO `dgd` (`id`, `fecha`, `firmante`, `lugar_firma`, `modo_transporte`, `ruta_pdf`, `telefono_emergencia`, `aeropuerto_destino_id`, `aeropuerto_origen_id`, `consignee_id`, `shipper_id`) VALUES
(1, '2025-05-10', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_1.pdf', '987654321', 1, 3, 1, 2),
(2, '2025-05-09', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_2.pdf', '987654321', 1, 3, 1, 2),
(3, '2025-05-09', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_3.pdf', '987654321', 1, 3, 1, 2),
(4, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, NULL, '987654321', 1, 3, 1, 2),
(5, '2025-05-09', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_5.pdf', '987654321', 1, 3, 1, 2),
(6, '2025-05-14', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_6.pdf', '987654321', 1, 3, 1, 2),
(7, '2025-05-14', 'Francisco J. Bernal', 'Salamanca', NULL, NULL, '987654321', 4, 3, 1, 2),
(8, '2025-05-07', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_8.pdf', '987654321', 1, 3, 1, 2),
(9, '2025-05-08', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_9.pdf', '987654321', 1, 3, 1, 2),
(10, '2025-05-24', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_10.pdf', '987654321', 1, 3, 1, 2),
(11, '2025-05-08', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_11.pdf', '987654321', 1, 3, 1, 2),
(12, '2025-05-30', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_12.pdf', '987654321', 1, 3, 1, 2),
(13, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_13.pdf', '987654321', 1, 3, 1, 2),
(14, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_14.pdf', '987654321', 1, 3, 1, 2),
(15, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_15.pdf', '987654321', 1, 3, 1, 2),
(16, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_16.pdf', '987654321', 1, 3, 1, 2),
(17, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_17.pdf', '987654321', 1, 3, 1, 2),
(18, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_18.pdf', '987654321', 1, 3, 1, 2),
(19, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_19.pdf', '987654321', 1, 3, 1, 2),
(20, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, NULL, '987654321', 1, 3, 1, 2),
(21, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_21.pdf', '987654321', 1, 3, 1, 2),
(22, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_22.pdf', '987654321', 1, 3, 1, 2),
(23, '2025-05-18', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_23.pdf', '987654321', 1, 3, 1, 2),
(24, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_24.pdf', '987654321', 1, 3, 1, 2),
(25, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_25.pdf', '987654321', 1, 3, 1, 2),
(26, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_26.pdf', '987654321', 1, 3, 1, 2),
(27, '2025-05-21', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_27.pdf', '987654321', 1, 3, 1, 2),
(28, '2025-05-11', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_28.pdf', '987654321', 1, 3, 1, 2),
(29, '2025-05-06', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_29.pdf', '987654321', 5, 8, 5, 3),
(30, '2025-05-16', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_30.pdf', '987654321', 1, 3, 4, 6),
(31, '2025-05-23', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_31.pdf', '987654321', 1, 3, 1, 2),
(32, '2025-05-14', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_32.pdf', '987654321', 11, 3, 1, 2),
(33, '2025-05-02', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_33.pdf', '987654321', 11, 5, 3, 3),
(34, '2025-05-27', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_34.pdf', '987654321', 1, 3, 1, 2),
(35, '2025-05-26', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_35.pdf', '987654321', 1, 3, 1, 2),
(36, '2025-05-19', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_36.pdf', '987654321', 1, 3, 1, 2),
(37, '2025-05-21', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_37.pdf', '987654321', 1, 3, 1, 2),
(38, '2025-05-14', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_38.pdf', '987654321', 1, 3, 1, 2),
(39, '2025-06-04', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_39.pdf', '987654321', 1, 3, 1, 2),
(40, '2025-05-28', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_40.pdf', '987654321', 1, 3, 1, 2),
(41, '2025-05-28', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_41.pdf', '987654321', 1, 3, 1, 2),
(42, '2025-05-29', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_42.pdf', '987654321', 1, 3, 1, 2),
(43, '2025-05-19', 'Francisco J. Bernal', 'Madrid', NULL, 'DGD_43.pdf', '987654321', 10, 6, 1, 2),
(44, '2025-05-26', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_44.pdf', '987654321', 1, 3, 1, 2),
(45, '2025-05-13', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_45.pdf', '987654321', 1, 3, 1, 2),
(46, '2025-05-21', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_46.pdf', '987654321', 1, 3, 1, 2),
(47, '2025-05-14', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_47.pdf', '987654321', 1, 3, 1, 2),
(48, '2025-05-28', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_48.pdf', '987654321', 1, 3, 1, 2),
(49, '2025-05-22', 'Francisco J. Bernal', 'Salamanca', NULL, 'DGD_49.pdf', '987654321', 1, 3, 1, 2);

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
(1, 16337, 'Organic liquid', 'F-18'),
(2, 7400, 'Organic Liquid', 'Tc-99m'),
(3, 37000, 'Organic Liquid', 'I-131'),
(4, 1850, 'Organic Liquid', 'Ga-68'),
(7, 300, 'Inorganic Solid', 'Co-60'),
(8, 3000, 'Inorganic Solid', 'Ra-223');

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
-- Indices de la tabla `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bulto`
--
ALTER TABLE `bulto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4k97ol4fn2nr9s1aloqchwwqv` (`dgd_id`),
  ADD KEY `FK6y9jfdrqqaremsf16nh6nij1h` (`isotope_id`);

--
-- Indices de la tabla `consignee`
--
ALTER TABLE `consignee`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dgd`
--
ALTER TABLE `dgd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7slqcrp31cbalmyspj8rcwcks` (`aeropuerto_destino_id`),
  ADD KEY `FK46m2o97j7q2ifyp4ems2if03s` (`aeropuerto_origen_id`),
  ADD KEY `FK2uffvv04xbwwdg7le3qjjao76` (`consignee_id`),
  ADD KEY `FK7vao769n3ee1p38ujsqh594ws` (`shipper_id`);

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
-- AUTO_INCREMENT de la tabla `airport`
--
ALTER TABLE `airport`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `bulto`
--
ALTER TABLE `bulto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `consignee`
--
ALTER TABLE `consignee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `dgd`
--
ALTER TABLE `dgd`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `isotope`
--
ALTER TABLE `isotope`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `shipper`
--
ALTER TABLE `shipper`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bulto`
--
ALTER TABLE `bulto`
  ADD CONSTRAINT `FK4k97ol4fn2nr9s1aloqchwwqv` FOREIGN KEY (`dgd_id`) REFERENCES `dgd` (`id`),
  ADD CONSTRAINT `FK6y9jfdrqqaremsf16nh6nij1h` FOREIGN KEY (`isotope_id`) REFERENCES `isotope` (`id`);

--
-- Filtros para la tabla `dgd`
--
ALTER TABLE `dgd`
  ADD CONSTRAINT `FK2uffvv04xbwwdg7le3qjjao76` FOREIGN KEY (`consignee_id`) REFERENCES `consignee` (`id`),
  ADD CONSTRAINT `FK46m2o97j7q2ifyp4ems2if03s` FOREIGN KEY (`aeropuerto_origen_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `FK7slqcrp31cbalmyspj8rcwcks` FOREIGN KEY (`aeropuerto_destino_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `FK7vao769n3ee1p38ujsqh594ws` FOREIGN KEY (`shipper_id`) REFERENCES `shipper` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
