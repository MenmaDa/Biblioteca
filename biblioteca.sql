-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 06:55:01
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `ID` int(11) NOT NULL,
  `RUTA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_LIBRO` int(11) NOT NULL,
  `ISBN` varchar(255) DEFAULT NULL,
  `AUTOR` varchar(255) DEFAULT NULL,
  `DISPONIBILIDAD` tinyint(1) DEFAULT 0,
  `GENERO` varchar(255) DEFAULT NULL,
  `TITULO` varchar(255) DEFAULT NULL,
  `YEAR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_LIBRO`, `ISBN`, `AUTOR`, `DISPONIBILIDAD`, `GENERO`, `TITULO`, `YEAR`) VALUES
(4, '9781451638901', 'James R. Milton', 1, 'Accion', 'The Silent Echo', '2018-03-15'),
(5, '9780345499124', 'Sarah J. Miller', 0, 'Psicologico', 'Whispers in the Dark', '2021-11-20'),
(6, '9780062316097', 'Patricia G. Jones', 1, 'Accion', 'Shadows of the Past', '2017-07-12'),
(7, '9780062316097', 'Michael H. Patterson', 1, 'Ciencia Ficcion', 'A Journey Beyond', '2020-09-05'),
(8, '9780399178573', 'Emily L. Thompson', 1, 'Aventura', 'The Forgotten City', '2019-12-11'),
(9, '9781501139338', 'Anthony P. Garcia', 0, 'Psicologico', 'Beneath the Surface', '2016-02-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_PRESTAMOS` int(11) NOT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA_DEVOLUCION` varchar(255) DEFAULT NULL,
  `FECHA_PRESTAMO` varchar(255) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `UNUSUARIO_ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_PRESTAMOS`, `ESTADO`, `FECHA_DEVOLUCION`, `FECHA_PRESTAMO`, `id_libro`, `UNUSUARIO_ID_USUARIO`) VALUES
(1, 'disponible', '2024-10-21', '2024-10-20', 4, 3),
(2, 'disponible', '2024-10-21', '2024-10-20', 5, 3),
(3, 'disponible', '2024-12-11', '2024-12-10', 7, 2),
(4, 'no devuelto', '2024-12-19', '2024-12-21', 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposespacios`
--

CREATE TABLE `tiposespacios` (
  `ID_TIPO_ESPACIO` int(11) NOT NULL,
  `TIPO_ESPACIO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CONTRASENIA_ENCRIPT` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `ROL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `APELLIDO`, `CONTRASENIA_ENCRIPT`, `EMAIL`, `NOMBRE`, `ROL`) VALUES
(2, 'Agudelo', 'MTIzNDU=', 'danielalfonsoag@gmail.com', 'Daniel', 'Admin'),
(3, 'FERNANDO', 'MTIzNDU=', 'PRUEBA@ucompensar.edu.co', 'MARIO', 'Usuario'),
(4, 'hugo', 'MTIzNDU=', 'pruebasSoftware@ucompensar.edu.co', 'carlos', 'Bibliotecario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_LIBRO`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_PRESTAMOS`),
  ADD KEY `FK_PRESTAMOS_UNUSUARIO_ID_USUARIO` (`UNUSUARIO_ID_USUARIO`),
  ADD KEY `FK_PRESTAMOS_id_libro` (`id_libro`);

--
-- Indices de la tabla `tiposespacios`
--
ALTER TABLE `tiposespacios`
  ADD PRIMARY KEY (`ID_TIPO_ESPACIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `datos`
--
ALTER TABLE `datos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_LIBRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_PRESTAMOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiposespacios`
--
ALTER TABLE `tiposespacios`
  MODIFY `ID_TIPO_ESPACIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `FK_PRESTAMOS_UNUSUARIO_ID_USUARIO` FOREIGN KEY (`UNUSUARIO_ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `FK_PRESTAMOS_id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`ID_LIBRO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
