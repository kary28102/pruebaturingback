-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-10-2026 a las 19:06:18
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peliculas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE IF NOT EXISTS `peliculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text,
  `genero` varchar(100) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `director` varchar(150) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `calificacion` decimal(3,1) DEFAULT '0.0',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `descripcion`, `genero`, `anio`, `director`, `duracion`, `imagen`, `calificacion`, `fecha_creacion`) VALUES
(1, 'Interestelar 1', 'Un grupo de astronautas viaja', 'Ciencia ficción', 2014, 'Christopher Nolan', 169, 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 8.7, '2026-10-02 16:11:03'),
(2, 'El caballero de la noche', 'Batman se enfrenta a un criminal que busca sumir a Gotham en el caos.', 'Acción', 2008, 'Christopher Nolan', 152, 'https://www.nacion.com/resizer/v2/BBUSFTCL4VAZ7IZI3PUNWJEC54.jpg?smart=true&auth=5a1ac5e43dbb73379f779797225f12a634c7a1fc79d30dcd8a95348cab5c40f8&width=1440', 9.0, '2026-10-02 16:11:03'),
(3, 'Harry Potter y la piedra filosofal', 'Un joven descubre que es un mago y comienza sus estudios en Hogwarts.', 'Fantasía', 2001, 'Chris Columbus', 152, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh2ue2qbJgjZprD6ot7SdwP1mISr8D2_RQUvwxE2MeCmsmk6KmzTdJbhw&s=10', 7.6, '2026-10-02 16:11:03'),
(4, 'Interestelar', 'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.', 'Ciencia ficción', 2014, 'Christopher Nolan', 169, 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 8.7, '2026-10-03 21:49:39'),
(5, 'El origen', 'Un ladrón especializado en infiltrarse en los sueños recibe la misión de implantar una idea en la mente de una persona.', 'Ciencia ficción', 2010, 'Christopher Nolan', 148, 'https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg', 8.8, '2026-10-03 21:49:39'),
(6, 'Duna', 'Paul Atreides viaja al planeta Arrakis mientras su familia se ve involucrada en una lucha por el control de un recurso muy valioso.', 'Ciencia ficción', 2021, 'Denis Villeneuve', 155, 'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg', 8.0, '2026-10-03 21:49:39'),
(7, 'El caballero de la noche', 'Batman enfrenta al Joker, un criminal que busca sumir a Gotham en el caos.', 'Acción', 2008, 'Christopher Nolan', 152, 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 9.0, '2026-10-03 21:49:39'),
(8, 'Parásitos', 'Una familia de escasos recursos comienza a relacionarse con una familia adinerada, desencadenando acontecimientos inesperados.', 'Drama', 2019, 'Bong Joon-ho', 132, 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', 8.5, '2026-10-03 21:49:39'),
(9, 'La La Land', 'Una actriz y un músico persiguen sus sueños mientras intentan mantener su relación.', 'Romance', 2016, 'Damien Chazelle', 128, 'https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg', 8.0, '2026-10-03 21:49:39'),
(10, 'Ice Age: en ebullición', 'Se aproximan un montón de películas increíbles, entre las que está la última de 20th Century Studios.', 'Animación', 2000, NULL, NULL, 'https://lumiere-a.akamaihd.net/v1/images/image_f11bfa9a.jpeg?region=0%2C0%2C540%2C810&width=320', 9.4, '2026-10-04 16:43:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

DROP TABLE IF EXISTS `personajes`;
CREATE TABLE IF NOT EXISTS `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text,
  `imagen` varchar(500) DEFAULT NULL,
  `pelicula_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkpelicula` (`pelicula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`id`, `nombre`, `descripcion`, `imagen`, `pelicula_id`) VALUES
(1, 'Cooper', 'Astronauta e ingeniero que participa en la misión para encontrar un nuevo hogar para la humanidad.', 'https://tse1.explicit.bing.net/th/id/OIP.1d38HM6eizzyKBb4o9G6HAAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 1),
(2, 'Batman', 'Bruce Wayne, un vigilante que protege Gotham City.', 'https://tse4.mm.bing.net/th/id/OIP.TuUbMPgXTGVbdIMXN9goywHaEu?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 2),
(3, 'Harry Potter', 'Un joven mago que descubre su pasado y comienza sus estudios en Hogwarts.', 'https://static0.cbrimages.com/wordpress/wp-content/uploads/2024/05/harry-potter-characters.jpg?q=49&fit=crop&w=266&h=350&dpr=2', 3),
(4, 'Marlin', 'Marlín, un pez payaso, siempre ha intentado proteger de todos los peligros a su hijo. Sin embargo, un buzo atrapa al pequeño, y ahora el padre deberá embarcarse en una increíble aventura por las aguas australianas para encontrarlo.', 'https://eresmama.com/wp-content/uploads/2023/05/buscando-nemo-768x576.jpeg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','user') NOT NULL DEFAULT 'user',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `fecha_creacion`) VALUES
(1, 'Administrador123', 'admin@peliculas.com', '$pbkdf2-sha256$29000$PEdIqdVaCwHg/J/zHuOcsw$2Mv09Rl2rkhhanelKm6qX53l3KP7fhquuA5dcaSO0C8', 'admin', '2026-10-02 16:12:14'),
(3, 'Ninfa ', 'ninfayuka@gmail.com', '$pbkdf2-sha256$29000$KGXMGYOwtlYKwbi3lnKu1Q$ItRs14Rbn.rhHG8U0mcdK6pMSSWrYVRCkukqE0Z6VgQ', 'user', '2026-10-02 19:06:02'),
(4, 'prueba', 'prueba@gmail.com', '$pbkdf2-sha256$29000$xxjDuJfSuneu1do7x3jPWQ$rVA9m0.ab/PPjNDdRE0pMhxxVljy4sO.I831PkNfgVk', 'user', '2026-10-03 15:48:47'),
(5, 'pedro', 'pedro@gmail.com', '$pbkdf2-sha256$29000$TSmF8D6nlFIqpVQqZcyZEw$O78/4kzZvES1OeXPe.fUBPJ.9/Z/3oXB9w3NcKbBPLk', 'user', '2026-10-04 00:04:08'),
(6, 'Ninfa Yukary Hernandez Vargas', 'ninfa@gmail.com', '$pbkdf2-sha256$29000$B8AYw7iXcq41RqiVcs4Zgw$T6OfPuGb/p0UoMfBPbggFIhe097l/b/TOLAAlhTFd4c', 'user', '2026-10-04 17:51:13');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `fkpelicula` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
