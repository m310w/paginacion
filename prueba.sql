-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2017 a las 18:12:58
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `nombre`, `apellido`) VALUES
(1, 'juan', 'perez'),
(2, 'Pablito', 'Juarez'),
(3, 'prueba', 'haha'),
(4, 'alejan', ''),
(5, 'diana', ''),
(6, 'josue', ''),
(7, 'pedrito', ''),
(8, 'gabriel', ''),
(9, 'arquito', ''),
(10, 'danie', ''),
(11, 'kaka', ''),
(12, 'usuario', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion`
--

CREATE TABLE `posicion` (
  `id_posicion` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel-j-p`
--

CREATE TABLE `rel-j-p` (
  `id_relacion` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id_jugador`);

--
-- Indices de la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD PRIMARY KEY (`id_posicion`);

--
-- Indices de la tabla `rel-j-p`
--
ALTER TABLE `rel-j-p`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_jugador` (`id_jugador`),
  ADD KEY `id_posicion` (`id_posicion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rel-j-p`
--
ALTER TABLE `rel-j-p`
  ADD CONSTRAINT `rel-j-p_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugador` (`id_jugador`),
  ADD CONSTRAINT `rel-j-p_ibfk_2` FOREIGN KEY (`id_posicion`) REFERENCES `posicion` (`id_posicion`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
