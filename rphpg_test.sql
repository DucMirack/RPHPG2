-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 18 Janvier 2015 à 20:43
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `rphpg_test`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `afficher_perso_menu`()
    READS SQL DATA
SELECT p_name, p_hp, p_mana
FROM perso$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `afficher_stuff`()
    READS SQL DATA
SELECT armor_name, armor_defense, a_type
FROM armor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `changer_arme_id`()
    MODIFIES SQL DATA
UPDATE perso
SET p_weapon_id = (SELECT w_id
		   FROM weapon)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `change_armor_id`()
    MODIFIES SQL DATA
UPDATE perso
SET p_armor_id = (SELECT id_armor
		   FROM armor)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `return_id_loot`(OUT `e_loot_id` INT)
    READS SQL DATA
SELECT e_loot_id 
FROM ennemy$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stat_ennemy`()
    READS SQL DATA
SELECT e_name, e_life, e_mana, e_slowhit, e_fasthit, e_defense, e_speed
FROM ennemy$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `stat_weapon`()
    READS SQL DATA
SELECT w_name, w_damage, w_crit, w_hit, w_type
FROM weapon$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_arme`()
    MODIFIES SQL DATA
UPDATE perso
SET p_weapon_id = (SELECT w_id
		   FROM weapon),

    p_weapon_damage = (SELECT w_damage
			FROM weapon),
    p_weapon_name = (SELECT w_name
		     FROM weapon)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_armor`()
    MODIFIES SQL DATA
UPDATE perso
SET p_armor_id = (SELECT id_armor
		   FROM armor),
    p_armor_name = (SELECT armor_name
			FROM armor),
    p_armor_defense = (SELECT armor_defense
			FROM armor)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_inventory`()
    READS SQL DATA
SELECT *
FROM inventory$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `afficher inventaire`
--
CREATE TABLE IF NOT EXISTS `afficher inventaire` (
`id_inventory` int(1)
,`nb_object` int(11)
,`item_name` varchar(255)
,`item_type` varchar(255)
,`effect` varchar(255)
);
-- --------------------------------------------------------

--
-- Structure de la table `armor`
--

CREATE TABLE IF NOT EXISTS `armor` (
  `id_armor` int(11) NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(255) NOT NULL,
  `armor_defense` int(11) NOT NULL,
  `a_type` varchar(255) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id_armor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `armor`
--

INSERT INTO `armor` (`id_armor`, `armor_name`, `armor_defense`, `a_type`, `updated_at`, `created_at`) VALUES
(3, 'peau d''ours', 15, 'torse', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ennemy`
--

CREATE TABLE IF NOT EXISTS `ennemy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) NOT NULL,
  `e_life` int(11) NOT NULL,
  `e_mana` int(11) NOT NULL,
  `e_hit` int(11) NOT NULL,
  `e_defense` int(11) NOT NULL,
  `e_speed` int(11) NOT NULL,
  `e_loot_id` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `e_lifemax` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `ennemy`
--

INSERT INTO `ennemy` (`id`, `e_name`, `e_life`, `e_mana`, `e_hit`, `e_defense`, `e_speed`, `e_loot_id`, `updated_at`, `created_at`, `e_lifemax`, `image`) VALUES
(1, 'Ours', 80, 10, 35, 30, 15, 0, 2015, 0, 80, 'ours.jpg'),
(2, 'Loup', 80, 0, 15, 20, 30, 2, 0, 0, 80, 'loup.jpg'),
(3, 'Troll', 150, 0, 40, 40, 20, 4, 0, 0, 150, 'troll.jpg'),
(4, 'Orc', 50, 20, 20, 15, 30, 3, 0, 0, 50, 'orc.jpg'),
(5, 'LaBelleMere', 5, 0, 75, 0, 3, 5, 0, 0, 5, 'labellemere.jpg'),
(6, 'Reine Araignée', 100, 30, 35, 30, 60, 6, 0, 0, 100, 'araignee.jpg'),
(7, 'Dragon', 200, 160, 80, 70, 50, 7, 0, 0, 200, 'dragon.jpg'),
(8, 'Faucheuse', 130, 60, 60, 40, 35, 8, 0, 0, 130, 'faucheuse.jpg'),
(9, 'Gargouille', 110, 50, 65, 70, 50, 9, 0, 0, 110, 'gargouille.jpg'),
(10, 'Centaure', 140, 20, 0, 0, 0, 0, 0, 0, 0, 'centaure.jpg'),
(11, 'Harpie', 80, 30, 50, 40, 65, 11, 0, 0, 80, 'harpie.jpg'),
(12, 'Loup-Garou', 190, 0, 90, 110, 80, 12, 0, 0, 190, 'loupgarou.jpg'),
(13, 'Minotaure', 195, 40, 100, 120, 60, 13, 0, 0, 195, 'minotaure.jpg'),
(14, 'Meduse', 120, 80, 50, 50, 55, 14, 0, 0, 120, 'meduse.jpg'),
(15, 'Cerbère', 170, 50, 80, 60, 80, 15, 0, 0, 170, 'cerbere.jpg'),
(16, 'Hydre', -120, 50, 110, 80, 100, 16, 2015, 0, 230, 'hydre.jpg'),
(17, 'Manticore', 250, 30, 110, 100, 90, 17, 0, 0, 250, 'manticore.jpg'),
(18, 'Cyclope', 280, 0, 140, 110, 60, 18, 0, 0, 280, 'cyclope.jpg'),
(19, 'Sirène', 90, 70, 70, 40, 100, 19, 0, 0, 90, 'sirene.jpg'),
(20, 'Géant', 290, 50, 160, 130, 50, 20, 0, 0, 290, 'geant.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id_inventory` int(1) NOT NULL AUTO_INCREMENT,
  `nb_object` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `effect` varchar(255) NOT NULL,
  `armor_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantite` int(100) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id_inventory`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `inventory`
--

INSERT INTO `inventory` (`id_inventory`, `nb_object`, `item_name`, `item_type`, `effect`, `armor_id`, `weapon_id`, `item_id`, `quantite`, `updated_at`, `created_at`) VALUES
(1, 10, 'potion', 'soin', 'Redonne 50hp à l''utilisateur', 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `effect` varchar(255) NOT NULL,
  `quantite` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id_item`, `item_name`, `item_type`, `effect`, `quantite`, `updated_at`, `created_at`) VALUES
(1, 'Pomme', 'Soin', 'Redonne 25 HP', 1, 0, 0),
(2, 'potion', 'soin', 'Redonne 50 points de vie', 3, 0, 0),
(3, 'Ether', 'Soin', 'Redonne 30 point de mana', 1, 0, 0),
(4, 'Epée courte', 'Arme', 'Epée +2 en force', 1, 0, 0),
(5, 'Testament', 'Aléatoire', 'Donne objet aléatoire ou met les HP du personnage à 1', 1, 0, 0),
(6, 'Super Potion', 'Soin', 'Redonne 100hp', 1, 0, 0),
(7, 'Armure de lave', 'Armure', 'Donne +10 en défense', 1, 0, 0),
(8, 'Queue de phénix', 'Soin', 'À une chance de ressusciter le personnage en cas de décès ', 1, 0, 0),
(9, 'Bouclier de Pierre', 'Armure', '+6 point de défense et réduit les dégâts élémentaires ', 1, 0, 0),
(10, 'Lance de l''olympe', 'Arme', '+7 force et dégâts accrus sur les adversaires volants', 1, 0, 0),
(11, 'Ether+', 'Soin', 'Redonne 60 points de mana', 1, 0, 0),
(12, 'Gants du lycanthrope', 'Armure', '+5 points de défense et défense aux dégâts élémentaires accrue', 1, 0, 0),
(13, 'Hyper Potion', 'Soin', 'Redonne 120 HP', 1, 0, 0),
(14, 'Elixir', 'Soin', 'Soigne les altérations d''état et redonne 50hp et 30 point de mana', 1, 0, 0),
(15, 'Bottes du gardien', 'Armure', '+8 en défense et octroie 10% d''être immunisé à la prochaine attaque de feu.', 1, 0, 0),
(16, 'Ashdautas', 'Arme, Epée à deux mains', '+13 en force', 1, 0, 0),
(17, 'Jambières de Némée', 'Armure', '+9 en défense', 1, 0, 0),
(18, 'Masse de Crom', 'Arme', '+15 en force, à une chance d''étourdir un ennemi', 1, 0, 0),
(19, 'Hyper Ether', 'Soin', 'Redonne 100 points de mana', 1, 0, 0),
(20, 'Casque de Xul', 'Armure', '+6 en défense, empêche tout effet d''étourdissement', 1, 0, 0),
(21, 'Antidote', 'Soin', 'Guéri l''altération d''état poison', 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `perso`
--

CREATE TABLE IF NOT EXISTS `perso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_hp` int(11) NOT NULL,
  `p_mana` int(11) NOT NULL,
  `p_fasthit` int(11) NOT NULL,
  `p_slowhit` int(11) NOT NULL,
  `p_defense` int(11) NOT NULL,
  `p_speed` int(11) NOT NULL,
  `p_weapon_id` int(11) NOT NULL,
  `p_armor_id` int(11) NOT NULL,
  `p_weapon_damage` int(11) NOT NULL,
  `p_weapon_name` varchar(255) NOT NULL,
  `p_armor_defense` int(11) NOT NULL,
  `p_armor_name` varchar(255) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `p_hpmax` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `perso`
--

INSERT INTO `perso` (`id`, `p_name`, `p_hp`, `p_mana`, `p_fasthit`, `p_slowhit`, `p_defense`, `p_speed`, `p_weapon_id`, `p_armor_id`, `p_weapon_damage`, `p_weapon_name`, `p_armor_defense`, `p_armor_name`, `updated_at`, `created_at`, `p_hpmax`) VALUES
(1, 'Titi', -270, 30, 50, 25, 40, 45, 1, 3, 30, 'epee longue', 15, 'peau d''ours', 2015, 0, 500),
(2, 'Xavier', 500, 200, 30, 60, 50, 50, 1, 1, 2000, 'Arc', 9, 'Elfique', 2015, 0, 500);

-- --------------------------------------------------------

--
-- Structure de la table `weapon`
--

CREATE TABLE IF NOT EXISTS `weapon` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(255) NOT NULL,
  `w_damage` int(11) NOT NULL,
  `w_crit` int(11) NOT NULL,
  `w_hit` int(11) NOT NULL,
  `w_type` varchar(255) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `weapon`
--

INSERT INTO `weapon` (`w_id`, `w_name`, `w_damage`, `w_crit`, `w_hit`, `w_type`, `updated_at`, `created_at`) VALUES
(1, 'epee longue', 30, 50, 80, 'arme a une main', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la vue `afficher inventaire`
--
DROP TABLE IF EXISTS `afficher inventaire`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `afficher inventaire` AS select `inventory`.`id_inventory` AS `id_inventory`,`inventory`.`nb_object` AS `nb_object`,`inventory`.`item_name` AS `item_name`,`inventory`.`item_type` AS `item_type`,`inventory`.`effect` AS `effect` from `inventory`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
