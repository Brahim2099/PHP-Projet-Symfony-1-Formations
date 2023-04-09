-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Host: cs287757-001.privatesql:35511
-- Generation Time: Apr 09, 2023 at 04:27 PM
-- Server version: 8.0.32
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sauve14`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230314133610', '2023-03-14 13:36:18', 135),
('DoctrineMigrations\\Version20230314154026', '2023-03-14 15:40:45', 303),
('DoctrineMigrations\\Version20230314163722', '2023-03-14 16:37:38', 132),
('DoctrineMigrations\\Version20230319141044', '2023-03-19 14:11:13', 46);

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int NOT NULL,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `username`, `roles`, `password`, `nom`, `prenom`) VALUES
(0, 'administrateur', '[\"ROLE_ADMIN\"]', '$2y$13$O5/E4tWbauHJzRY8AltQi.xNf7/E8lINkCcmSp74MPIOGyW08XEBi', '', ''),
(1, 'btahiri', '[\"ROLE_ADMIN\"]', '$2y$13$qI/tuFRau0gIm8cKngc4l.Bxym3Jtz1QzwYX1g5SzmFtl3nz8Ynpq', 'Tahiri', 'Brahim'),
(2, 'njanvier', '[]', '$2y$13$P/Zbl4kTzhdqu8Q9l07BdOSGwKq7a1HMn7ptafvf8AS2Uayi1od/y', 'Nathan', 'Janvier'),
(3, 'crakotomalala', '[]', '$2y$13$/S.WyKWWu/M9iOXdOpW0ueIrXkfucup10/Lh/AR/kBFrQ5L8GLhB6', 'Rakotomalala', 'Cédric'),
(5, 'schaoui', '[]', '$2y$13$GxctKGfOOmlRDazJdYNDTe6f0f2a6CPdLAes01WePe1rzSBEI1x1O', 'Chaoui', 'Sofiane'),
(6, 'lafonso', '[]', '$2y$13$XB2yjFm6.zlfflSMDg5fBeotUJoYey8IyJBunXa98j2uANt6AtVp6', 'Afonso', 'Lucas'),
(7, 'akapri', '[]', '$2y$13$sPnhR5OZvUX0CoqOrFi43OvipBGmWSFsfkbKOs31Xix5ezqpS8OQy', 'Kapri', 'Anish');

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id` int NOT NULL,
  `date_debut` date NOT NULL,
  `nombre_heures` int NOT NULL,
  `departement` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produit_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id`, `date_debut`, `nombre_heures`, `departement`, `produit_id`, `description`) VALUES
(1, '2023-04-01', 5, 'Paris', 1, 'Système de gestion de contenu'),
(2, '2023-04-01', 30, 'Seine-et-Marne', 2, 'Langage de programmation de haut niveau orienté objet'),
(3, '2023-04-01', 20, 'Yvelines', 4, 'Langage de programmation principalement employé dans les pages web'),
(4, '2023-04-01', 20, 'Paris', 8, 'Framework MVC'),
(5, '2023-04-01', 50, 'Seine-Saint-Denis', 3, 'Langage de programmation orientée objet'),
(6, '2023-04-01', 30, 'Val-de-Marne', 7, 'Permet de produire des pages Web dynamiques via un serveur HTTP'),
(7, '2023-04-01', 20, 'Seine-Saint-Denis', 5, 'Aucune');

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id` int NOT NULL,
  `statut` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `formation_id` int NOT NULL,
  `employe_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id`, `statut`, `formation_id`, `employe_id`) VALUES
(1, 'Acceptée', 1, 2),
(2, 'Acceptée', 2, 3),
(3, 'Acceptée', 7, 7),
(4, 'Refusée', 3, 5),
(5, 'Acceptée', 1, 6),
(6, 'Refusée', 3, 6),
(7, 'Acceptée', 5, 3),
(8, 'En attente', 7, 5),
(9, 'Acceptée', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int NOT NULL,
  `libelle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `libelle`) VALUES
(1, 'WordPress'),
(2, 'Java'),
(3, 'C#'),
(4, 'JavaScript'),
(5, 'Systèmes et réseaux'),
(6, 'HTML/CSS'),
(7, 'PHP'),
(8, 'Symfony');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F804D3B9F85E0677` (`username`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_404021BFF347EFB` (`produit_id`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5E90F6D65200282E` (`formation_id`),
  ADD KEY `IDX_5E90F6D61B65292` (`employe_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BFF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D61B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `FK_5E90F6D65200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
