-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 31 mars 2023 à 08:28
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bloc2_php_projet_formations`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `numClient` int NOT NULL AUTO_INCREMENT,
  `NomClient` text NOT NULL,
  `PrenomClient` text NOT NULL,
  `tel` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `DateDeNaissance` date NOT NULL,
  `CP` varchar(5) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`numClient`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`numClient`, `NomClient`, `PrenomClient`, `tel`, `email`, `DateDeNaissance`, `CP`, `mdp`, `admin`) VALUES
(37, 'BARRET', 'FranÃ§ois', '0637227223', 'm@gmail.com', '2001-02-01', '93001', '$2y$10$kOZLReVrfDOdMlbsdDdAn.catLqpZ9BJaMSmbJmoJD9bU94MbcM6S', NULL),
(39, 'HUGO', 'Hector', '0639857112', 'h@gmail.com', '1978-10-06', '75013', '$2y$10$rGTJt6DYF0N5Pjkd7MxJEOEe1o60F61mbhp1xYFvbxhYgK528eY56', 1),
(40, 'LONGHI', 'Nicolas', '0637227223', 'n@gmail.com', '2003-04-14', '78800', '$2y$10$cWeAodf56l4iCqXMo7HF6eyzu9AnXjoesHvigjZvBpCEWT4w5AXAG', NULL),
(42, '', 'Maxime', 'ougcfuihbo', 'p@gmail.com', '0623-04-08', 'ihcgu', '$2y$10$pPw6fx60yPGkzSvah03ufu1T2mDuOa3YMkjguRw14hBT6U8Uq7Gmm', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230314133610', '2023-03-14 13:36:18', 135),
('DoctrineMigrations\\Version20230314154026', '2023-03-14 15:40:45', 303),
('DoctrineMigrations\\Version20230314163722', '2023-03-14 16:37:38', 132),
('DoctrineMigrations\\Version20230319141044', '2023-03-19 14:11:13', 46);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F804D3B9F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `username`, `roles`, `password`, `nom`, `prenom`) VALUES
(0, 'administrateur', '[\"ROLE_ADMIN\"]', '$2y$13$O5/E4tWbauHJzRY8AltQi.xNf7/E8lINkCcmSp74MPIOGyW08XEBi', '', ''),
(1, 'btahiri', '[\"ROLE_ADMIN\"]', '$2y$13$qI/tuFRau0gIm8cKngc4l.Bxym3Jtz1QzwYX1g5SzmFtl3nz8Ynpq', 'Tahiri', 'Brahim'),
(2, 'njanvier', '[]', '$2y$13$P/Zbl4kTzhdqu8Q9l07BdOSGwKq7a1HMn7ptafvf8AS2Uayi1od/y', 'Nathan', 'Janvier'),
(3, 'crakotomalala', '[]', '$2y$13$/S.WyKWWu/M9iOXdOpW0ueIrXkfucup10/Lh/AR/kBFrQ5L8GLhB6', 'Rakotomalala', 'Cédric'),
(5, 'csofiane', '[]', '$2y$13$JesIE5zU6UOOG.UqHrEJPeGHCoCiD7DzfOra9z7Sbz3geaxgio9Hq', 'Chaoui', 'Sofiane'),
(6, 'lafonso', '[]', '$2y$13$XB2yjFm6.zlfflSMDg5fBeotUJoYey8IyJBunXa98j2uANt6AtVp6', 'Afonso', 'Lucas');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `nombre_heures` int NOT NULL,
  `departement` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produit_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_404021BFF347EFB` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `date_debut`, `nombre_heures`, `departement`, `produit_id`, `description`) VALUES
(1, '2023-04-01', 5, 'Paris', 1, 'Aucune'),
(2, '2023-04-01', 30, 'Seine et Marne', 2, 'Aucune'),
(3, '2023-04-01', 20, 'Seine Saint Denis', 4, 'Aucune'),
(4, '2023-04-01', 50, 'Yvelines', 3, 'Aucune'),
(5, '2023-04-01', 30, 'Paris', 5, 'Aucune');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statut` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `formation_id` int NOT NULL,
  `employe_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E90F6D65200282E` (`formation_id`),
  KEY `IDX_5E90F6D61B65292` (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `statut`, `formation_id`, `employe_id`) VALUES
(1, 'En attente', 1, 2),
(2, 'Acceptée', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
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
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BFF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D61B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `FK_5E90F6D65200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
