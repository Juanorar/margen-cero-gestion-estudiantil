-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 06:11 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `margen_cero_gestion_cursos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` binary(16) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fecha_fin_curso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `descripcion`, `fecha_fin_curso`) VALUES
(0x36356233386638662d633537392d3131, 'Matematicas I', 'Matematicas financieras', '0000-00-00 00:00:00'),
(0xe1525babc57911ef81e7401c838254eb, 'Metodología de la investigación', 'Curso general', '2024-12-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` binary(16) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) NOT NULL,
  `id_tipo_identificacion` int(11) NOT NULL,
  `identificacion` varchar(100) NOT NULL,
  `telefono_fijo` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `id_tipo_identificacion`, `identificacion`, `telefono_fijo`, `celular`, `email`, `direccion`) VALUES
(0xdd86d5d9c58f11ef81e7401c838254eb, 'Luis', 'Alberto', 'Martínez', 'Hernández', 1, '123456789A', '555-1010', '555-2020', 'luis.martinez@example.com', 'Calle Principal 100'),
(0xdd86f03cc58f11ef81e7401c838254eb, 'Ana', 'María', 'García', 'Pérez', 1, '987654321B', '555-3030', '555-4040', 'ana.garcia@example.com', 'Avenida Central 200'),
(0xdd86f2a7c58f11ef81e7401c838254eb, 'Carlos', NULL, 'López', 'Ramírez', 1, '112233445C', NULL, '555-5050', 'carlos.lopez@example.com', 'Boulevard Secundario 300');

-- --------------------------------------------------------

--
-- Table structure for table `estudiantescursos`
--

CREATE TABLE `estudiantescursos` (
  `id` binary(16) NOT NULL,
  `id_horario_curso` binary(16) NOT NULL,
  `id_estudiante` binary(16) NOT NULL,
  `nota_final` double NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estudiantescursos`
--

INSERT INTO `estudiantescursos` (`id`, `id_horario_curso`, `id_estudiante`, `nota_final`, `aprobado`, `observaciones`) VALUES
(0x71e1e473c59211ef81e7401c838254eb, 0x96f860bbc59011ef81e7401c838254eb, 0xdd86d5d9c58f11ef81e7401c838254eb, 5, 1, 'd'),
(0x71e23a62c59211ef81e7401c838254eb, 0x96f860bbc59011ef81e7401c838254eb, 0xdd86f03cc58f11ef81e7401c838254eb, 0, 0, ''),
(0x71e23c21c59211ef81e7401c838254eb, 0x96f860bbc59011ef81e7401c838254eb, 0xdd86f2a7c58f11ef81e7401c838254eb, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `horarioscurso`
--

CREATE TABLE `horarioscurso` (
  `id` binary(16) NOT NULL,
  `dia` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sábado','Domingo') DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_profesor` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horarioscurso`
--

INSERT INTO `horarioscurso` (`id`, `dia`, `hora_inicio`, `hora_fin`, `id_profesor`) VALUES
(0x96f860bbc59011ef81e7401c838254eb, 'Lunes', '19:30:00', '22:40:00', 0x6aa98a49c58f11ef81e7401c838254eb);

-- --------------------------------------------------------

--
-- Table structure for table `materialescurso`
--

CREATE TABLE `materialescurso` (
  `id` binary(16) NOT NULL,
  `id_horario_curso` binary(16) NOT NULL,
  `nombre_archivo` varchar(80) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `ruta_archivo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profesores`
--

CREATE TABLE `profesores` (
  `id` binary(16) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) NOT NULL,
  `id_tipo_identificacion` int(11) NOT NULL,
  `identificacion` varchar(100) NOT NULL,
  `telefono_fijo` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profesores`
--

INSERT INTO `profesores` (`id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `id_tipo_identificacion`, `identificacion`, `telefono_fijo`, `celular`, `email`, `direccion`) VALUES
(0x6aa98a49c58f11ef81e7401c838254eb, 'Juan', 'Carlos', 'Gómez', 'Pérez', 1, '123456789', '555-1234', '555-9876', 'juan.gomez@gmail.com', 'Calle Falsa 123'),
(0x6aa9d067c58f11ef81e7401c838254eb, 'María', 'Luisa', 'Rodríguez', 'Torres', 1, '987654321', '555-5678', '555-4321', 'maria.rodriguez@gmail.com', 'Avenida Siempreviva 456'),
(0x6aa9d2e2c58f11ef81e7401c838254eb, 'Pedro', NULL, 'Martínez', 'Hernández', 1, '112233445', NULL, '555-8765', 'pedro.martinez@gmail.com', 'Boulevard Principal 789');

-- --------------------------------------------------------

--
-- Table structure for table `tiposidentificacionpersona`
--

CREATE TABLE `tiposidentificacionpersona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiposidentificacionpersona`
--

INSERT INTO `tiposidentificacionpersona` (`id`, `nombre`) VALUES
(1, 'Cédula de ciudadania');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD UNIQUE KEY `telefono_fijo` (`telefono_fijo`),
  ADD UNIQUE KEY `celular` (`celular`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_tipo_identificacion` (`id_tipo_identificacion`);

--
-- Indexes for table `estudiantescursos`
--
ALTER TABLE `estudiantescursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario_curso` (`id_horario_curso`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indexes for table `horarioscurso`
--
ALTER TABLE `horarioscurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indexes for table `materialescurso`
--
ALTER TABLE `materialescurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario_curso` (`id_horario_curso`);

--
-- Indexes for table `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD UNIQUE KEY `telefono_fijo` (`telefono_fijo`),
  ADD UNIQUE KEY `celular` (`celular`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_tipo_identificacion` (`id_tipo_identificacion`);

--
-- Indexes for table `tiposidentificacionpersona`
--
ALTER TABLE `tiposidentificacionpersona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tiposidentificacionpersona`
--
ALTER TABLE `tiposidentificacionpersona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tiposidentificacionpersona` (`id`);

--
-- Constraints for table `estudiantescursos`
--
ALTER TABLE `estudiantescursos`
  ADD CONSTRAINT `estudiantescursos_ibfk_1` FOREIGN KEY (`id_horario_curso`) REFERENCES `horarioscurso` (`id`),
  ADD CONSTRAINT `estudiantescursos_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`);

--
-- Constraints for table `horarioscurso`
--
ALTER TABLE `horarioscurso`
  ADD CONSTRAINT `horarioscurso_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id`);

--
-- Constraints for table `materialescurso`
--
ALTER TABLE `materialescurso`
  ADD CONSTRAINT `materialescurso_ibfk_1` FOREIGN KEY (`id_horario_curso`) REFERENCES `horarioscurso` (`id`);

--
-- Constraints for table `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tiposidentificacionpersona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
