-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 02:40:36
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mega_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(3, 'Sandalias Plataforma'),
(4, 'Sandalias Planas'),
(5, 'Sandalias Niñas '),
(6, 'Sandalias Hombres'),
(7, 'Sandalias Semiplataforma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `user_id`) VALUES
(174, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders_details`
--

INSERT INTO `orders_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(238, 174, 71, 2),
(239, 174, 70, 1),
(240, 174, 72, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `cat_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `images`, `description`, `price`, `quantity`, `short_desc`, `cat_id`) VALUES
(3, 'Sandalias Negras', 'https://i.imgur.com/MsAkvbG.png', NULL, 'Una locura de sandalias, nada mas que decir xD', 50000, 53, 'Sandalias', 4),
(54, 'Sandalias modernas', 'https://i.imgur.com/PADNi9G.png', NULL, 'Con estas sandalias podras lucir de todo fabricada en chinu cordoba', 50000, 52, 'Sandalias', 4),
(55, 'Sandalias de Cuero', 'https://i.imgur.com/8LRyAxj.png', NULL, 'Sandalias fabricada en chinu cordoba', 50000, 38, 'Sandalias luce con todo', 4),
(56, 'Sandalias Niñas blancas', 'https://i.imgur.com/dlPnrCk.png', NULL, 'Sandalias bonitas, baratas, cheveres', 33000, 50, 'Sandalias bonitas, baratas, cheveres', 5),
(57, 'Sandalias Niñas rosadas', 'https://i.imgur.com/Mabz46M.png', NULL, 'Sandalias rosadas, fabricadas por la mano de Fany Lucila Castro Torres, diseñadora industrial desde hace milenios, una fortuna', 33000, 50, 'Sandalias', 5),
(58, 'Sandalias Niñas de cuero ', 'https://i.imgur.com/xz1rgwe.png', NULL, 'Sandilas de la nina fany,s adasjk, disenedas por ella misma con su propia mano', 33000, 50, 'Sandilas de la nina fany,s adasjk, disenedas por ella misma con su propia mano', 5),
(59, 'Sandialas niñas doradas', 'https://i.imgur.com/cCdzurP.png', NULL, 'Sandalias doradas niñas ', 33000, 50, 'Sandalias doradas niñas ', 5),
(60, 'Sandalias plataforma material yute', 'https://i.imgur.com/FB83Qfp.png', NULL, 'El materia el yuto es lo mas lujoso, es la moda de hoy en dia, te van a envidiar', 80000, 44, 'Sandalias con material yute', 3),
(62, 'Sandalias plataforma rosadas', 'https://i.imgur.com/RwelNzG.png', NULL, 'Sandalias livianas', 65000, 47, 'sandalias', 3),
(63, 'Sandalias Plataforma yute v2', 'https://i.imgur.com/lzLwDua.png', NULL, 'Sandalias plataforma con material yute, el mas lujos, te envioasdnas', 65000, 50, 'Sandalias', 3),
(64, 'Sandalias plataforma negras', 'https://i.imgur.com/hLnOVVb.png', NULL, 'Sandalias con tira negra muy bonitas la verda, te lo digo yo ', 100000, 50, 'Sandalias', 3),
(65, 'Sandalias de hombre cuero puro', 'https://i.imgur.com/lwRVDKu.png', NULL, 'El cuero puro de vaca muerta', 65000, 50, 'Cuero puro', 6),
(66, 'Sandalias negras hombres cuero puro', 'https://i.imgur.com/afZjOh8.png', NULL, 'Sandalias negras para hombre varonil', 65000, 50, 'Sandalias', 6),
(67, 'Sandalias para hombre de raza', 'https://i.imgur.com/kjPgChY.png', NULL, 'Sandalias varoniles, para hombres hombres', 65000, 47, 'Sandalias', 6),
(68, 'Sandalias hombre que no son iguales', 'https://i.imgur.com/hBbEcxz.png', NULL, 'Sandalias para hombres hombres', 65000, 50, 'Sandalias varoniles', 6),
(69, 'Sandalia Tipo Semi Plataforma <3', 'https://i.imgur.com/BIWz2K4.png', NULL, 'La mejor sandalias en nuestro stock, cómpralas ahora mismo LPM!', 65000, 50, 'Sandalias semi plataforma', 7),
(70, 'Sandalias tipo semi plataforma bonitas', 'https://i.imgur.com/masC2tY.png', NULL, 'Sandalias tipo semiplataforma muy bonitas, para salir a cualquier parte', 65000, 48, 'semiplataforma', 7),
(71, 'Sandalias tipo semiplataforma de RELAX', 'https://i.imgur.com/cwUadeS.png', NULL, 'Sandalias tipo semiplataforma para descansara sjasjas compralas xd', 65000, 40, 'semiplataforma', 7),
(72, 'Sandalias tipo semiplataforma', 'https://i.imgur.com/NQ9uFgS.png', NULL, 'estas sandalias te salvaran la vida, compralas xd', 65000, 42, 'sandalias', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT 'not set',
  `lname` varchar(255) DEFAULT 'not set',
  `age` int(10) DEFAULT 18,
  `role` int(10) DEFAULT 555,
  `photoUrl` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`, `age`, `role`, `photoUrl`, `type`) VALUES
(22, 'alancamo', '123', 'alancamo2015@gmail.com', 'Alex', 'Carlo', 18, 555, NULL, 'local'),
(23, 'alancamo10', '$2b$10$4qYjMOrUZWlYem2AUeumMeQz3T.UBgzYmkPm/ENxn/ES29TbQtQXa', 'alancamo10@gmail.com', NULL, NULL, 18, 555, NULL, 'local'),
(24, 'alancamo100', '$2b$10$gLw0hRfq9fggyWAIVGCmaeK/QEe.Sk4iujRA2V5ru/a2VV87bitUy', 'alancamo100@gmail.com', NULL, NULL, 18, 555, NULL, 'local'),
(25, 'alexito', '$2b$10$KrIuA9mRK/nSW6sORWxbduHIzlxy7Qzq5GxhmnFcsx0ivcEciRvae', 'alexito@gmail.com', 'Alex', 'Carlo', 18, 555, NULL, 'local'),
(26, 'oscar.hernandez', '$2b$10$oyi31I1iTojDWukdph.vOuMRXM6OEARYbH46CSf9oxe99UfJmjj32', 'oscar.hernandez@cecar.edu.co', 'Oscar', 'Hernadez', 18, 555, NULL, 'local');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addresses_users1_idx` (`user_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users1_idx` (`user_id`);

--
-- Indices de la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_has_products_products1_idx` (`product_id`),
  ADD KEY `fk_orders_has_products_orders1_idx` (`order_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`cat_id`);
ALTER TABLE `products` ADD FULLTEXT KEY `description` (`description`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT de la tabla `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
