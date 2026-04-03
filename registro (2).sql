-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 03-04-2026 a las 08:25:17
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Modificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`Id`, `Nombre`, `Fecha_Creacion`, `Fecha_Modificacion`) VALUES
(1, 'Alta Verapaz', '2026-03-21 17:48:57', NULL),
(2, 'Baja Verapaz', '2026-03-21 17:48:57', NULL),
(3, 'Chimaltenango', '2026-03-21 17:48:57', NULL),
(4, 'Chiquimula', '2026-03-21 17:48:57', NULL),
(5, 'El Progreso', '2026-03-21 17:48:57', NULL),
(6, 'Escuintla', '2026-03-21 17:48:57', NULL),
(7, 'Guatemala', '2026-03-21 17:48:57', NULL),
(8, 'Huehuetenango', '2026-03-21 17:48:57', NULL),
(9, 'Izabal', '2026-03-21 17:48:57', NULL),
(10, 'Jalapa', '2026-03-21 17:48:57', NULL),
(11, 'Jutiapa', '2026-03-21 17:48:57', NULL),
(12, 'Petén', '2026-03-21 17:48:57', NULL),
(13, 'Quetzaltenango', '2026-03-21 17:48:57', NULL),
(14, 'Quiché', '2026-03-21 17:48:57', NULL),
(15, 'Retalhuleu', '2026-03-21 17:48:57', NULL),
(16, 'Sacatepéquez', '2026-03-21 17:48:57', NULL),
(17, 'San Marcos', '2026-03-21 17:48:57', NULL),
(18, 'Santa Rosa', '2026-03-21 17:48:57', NULL),
(19, 'Sololá', '2026-03-21 17:48:57', NULL),
(20, 'Suchitepéquez', '2026-03-21 17:48:57', NULL),
(21, 'Totonicapán', '2026-03-21 17:48:57', NULL),
(22, 'Zacapa', '2026-03-21 17:48:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DPI` varchar(15) NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DPI` (`DPI`),
  KEY `fk_persona_departamento` (`IdDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id`, `DPI`, `Nombres`, `IdDepartamento`, `Password`) VALUES
(1, '1234567890101', 'Juan Gomez', 22, '5987'),
(2, '2345678901202', 'Kathy Morales', 9, '1594'),
(3, '3456789012303', 'Jose Lopez', 12, '1528'),
(4, '4567890123404', 'Andy Castañon', 1, '1273'),
(5, '5678901234505', 'Luis Martinez', 13, '9756'),
(6, '6789012345606', 'Eleane Estrada', 21, '0024'),
(7, '7890123456707', 'Erick Pedroza', 20, '3485'),
(9, '9012345678909', 'Jorge Martinez', 18, '1230'),
(10, '0123456789010', 'Sofía Melendez', 5, '1275'),
(11, '3808779290101', 'Yurem Oliva', 6, '4961'),
(15, '6439115290110', 'Eddy Ramirez', 14, '4567'),
(16, '390655421890110', 'Karen Cabrera', 7, '4871'),
(17, '1645287160101', 'Luna Cabrera', 7, '9421');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_departamento` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamento` (`Id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
