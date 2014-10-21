-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 21 Octobre 2014 à 16:54
-- Version du serveur: 5.5.38-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `elcodi`
--

-- --------------------------------------------------------

--
-- Structure de la table `AbstractRule`
--

CREATE TABLE IF NOT EXISTS `AbstractRule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expression_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EEB288E277153098` (`code`),
  KEY `IDX_EEB288E2ADBB65A1` (`expression_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_more` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F818BAC62AF` (`city_id`),
  KEY `IDX_D4E6F81BDBA6A61` (`postal_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `recovery_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AD8A54A98A2057A4` (`recovery_hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `admin_user`
--

INSERT INTO `admin_user` (`id`, `gender`, `username`, `password`, `email`, `firstname`, `lastname`, `birthday`, `recovery_hash`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 0, 'johnwayne', '$2y$15$NYfNPWRK8Q2HNWehAQkNcOZtwxAsxg1Wcp0ex1yz049RH6IYeDHrS', 'admin@admin.com', 'John', 'Wayne', NULL, NULL, '2014-10-21 10:34:17', '2014-10-21 10:34:17', 1);

-- --------------------------------------------------------

--
-- Structure de la table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'Size', 'Size', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 'Color', 'Color', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6F9DB8E73DA5256D` (`image_id`),
  KEY `IDX_6F9DB8E7A7F1F96B` (`principal_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `banner_banner_zone`
--

CREATE TABLE IF NOT EXISTS `banner_banner_zone` (
  `banner_id` int(11) NOT NULL,
  `banner_zone_id` int(11) NOT NULL,
  PRIMARY KEY (`banner_id`,`banner_zone_id`),
  KEY `IDX_98251B1E684EC833` (`banner_id`),
  KEY `IDX_98251B1ECB711668` (`banner_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `banner_zone`
--

CREATE TABLE IF NOT EXISTS `banner_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A852916D82F1BAF4` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA388B79395C3F3` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cart_coupon`
--

CREATE TABLE IF NOT EXISTS `cart_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A3B5D5D1AD5CDBF` (`cart_id`),
  KEY `IDX_6A3B5D5D66C5951B` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cart_line`
--

CREATE TABLE IF NOT EXISTS `cart_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_line_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `product_currency_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_amount` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3EF1B4CFBB01DC09` (`order_line_id`),
  KEY `IDX_3EF1B4CF1AD5CDBF` (`cart_id`),
  KEY `IDX_3EF1B4CF940B1F69` (`product_currency_id`),
  KEY `IDX_3EF1B4CF38248176` (`currency_id`),
  KEY `IDX_3EF1B4CF4584665A` (`product_id`),
  KEY `IDX_3EF1B4CF3B69A9AF` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `root` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1727ACA70` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `slug`, `root`, `position`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, 'Women''s', 'women-shirts', 1, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, NULL, 'Men''s', 'men-shirts', 1, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `cities_postal_codes`
--

CREATE TABLE IF NOT EXISTS `cities_postal_codes` (
  `city_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`city_id`,`postal_code_id`),
  KEY `IDX_EE86A59E8BAC62AF` (`city_id`),
  KEY `IDX_EE86A59EBDBA6A61` (`postal_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D5B0234F026BB7C` (`country_code`),
  KEY `IDX_2D5B02345D83CC1` (`state_id`),
  KEY `IDX_2D5B0234E946114A` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `country`
--

INSERT INTO `country` (`code`, `name`, `enabled`) VALUES
('ad', 'Andorra', 1),
('ae', 'United arab emirates', 1),
('af', 'Afghanistan', 1),
('ag', 'Antigua and barbuda', 1),
('ai', 'Anguilla', 1),
('al', 'Albania', 1),
('am', 'Armenia', 1),
('an', 'Netherlands antilles', 1),
('ao', 'Angola', 1),
('aq', 'Antarctica', 1),
('ar', 'Argentina', 1),
('as', 'American samoa', 1),
('at', 'Austria', 1),
('au', 'Australia', 1),
('aw', 'Aruba', 1),
('ax', 'Åland islands', 1),
('az', 'Azerbaijan', 1),
('ba', 'Bosnia and herzegovina', 1),
('bb', 'Barbados', 1),
('bd', 'Bangladesh', 1),
('be', 'Belgium', 1),
('bf', 'Burkina faso', 1),
('bg', 'Bulgaria', 1),
('bh', 'Bahrain', 1),
('bi', 'Burundi', 1),
('bj', 'Benin', 1),
('bl', 'Saint barthélemy', 1),
('bm', 'Bermuda', 1),
('bn', 'Brunei', 1),
('bo', 'Bolivia', 1),
('br', 'Brazil', 1),
('bs', 'Bahamas', 1),
('bt', 'Bhutan', 1),
('bv', 'Bouvet island', 1),
('bw', 'Botswana', 1),
('by', 'Belarus', 1),
('bz', 'Belize', 1),
('ca', 'Canada', 1),
('cc', 'Cocos (keeling) islands', 1),
('cd', 'Congo, dem. republic', 1),
('cf', 'Central african republic', 1),
('cg', 'Congo, republic', 1),
('ch', 'Switzerland', 1),
('ci', 'Ivory coast', 1),
('ck', 'Cook islands', 1),
('cl', 'Chile', 1),
('cm', 'Cameroon', 1),
('cn', 'China', 1),
('co', 'Colombia', 1),
('cr', 'Costa rica', 1),
('cu', 'Cuba', 1),
('cv', 'Cape verde', 1),
('cx', 'Christmas island', 1),
('cy', 'Cyprus', 1),
('cz', 'Czech republic', 1),
('de', 'Germany', 1),
('dj', 'Djibouti', 1),
('dk', 'Denmark', 1),
('dm', 'Dominica', 1),
('do', 'Dominican republic', 1),
('dz', 'Algeria', 1),
('ec', 'Ecuador', 1),
('ee', 'Estonia', 1),
('eg', 'Egypt', 1),
('eh', 'Western sahara', 1),
('er', 'Eritrea', 1),
('es', 'Spain', 1),
('et', 'Ethiopia', 1),
('fi', 'Finland', 1),
('fj', 'Fiji', 1),
('fk', 'Falkland islands', 1),
('fm', 'Micronesia', 1),
('fo', 'Faroe islands', 1),
('fr', 'France', 1),
('ga', 'Gabon', 1),
('gb', 'United kingdom', 1),
('gd', 'Grenada', 1),
('ge', 'Georgia', 1),
('gf', 'French guiana', 1),
('gg', 'Guernsey', 1),
('gh', 'Ghana', 1),
('gi', 'Gibraltar', 1),
('gl', 'Greenland', 1),
('gm', 'Gambia', 1),
('gn', 'Guinea', 1),
('gp', 'Guadeloupe', 1),
('gq', 'Equatorial guinea', 1),
('gr', 'Greece', 1),
('gs', 'South georgia and the south sandwich islands', 1),
('gt', 'Guatemala', 1),
('gu', 'Guam', 1),
('gw', 'Guinea-bissau', 1),
('gy', 'Guyana', 1),
('hk', 'Hongkong', 1),
('hm', 'Heard island and mcdonald islands', 1),
('hn', 'Honduras', 1),
('hr', 'Croatia', 1),
('ht', 'Haiti', 1),
('hu', 'Hungary', 1),
('id', 'Indonesia', 1),
('ie', 'Ireland', 1),
('il', 'Israel', 1),
('im', 'Isle of man', 1),
('in', 'India', 1),
('io', 'British indian ocean territory', 1),
('iq', 'Iraq', 1),
('ir', 'Iran', 1),
('is', 'Iceland', 1),
('it', 'Italy', 1),
('je', 'Jersey', 1),
('jm', 'Jamaica', 1),
('jo', 'Jordan', 1),
('jp', 'Japan', 1),
('ke', 'Kenya', 1),
('kg', 'Kyrgyzstan', 1),
('kh', 'Cambodia', 1),
('ki', 'Kiribati', 1),
('km', 'Comoros', 1),
('kn', 'Saint kitts and nevis', 1),
('kp', 'Korea, dem. republic of', 1),
('kr', 'South korea', 1),
('kw', 'Kuwait', 1),
('ky', 'Cayman islands', 1),
('kz', 'Kazakhstan', 1),
('la', 'Laos', 1),
('lb', 'Lebanon', 1),
('lc', 'Saint lucia', 1),
('li', 'Liechtenstein', 1),
('lk', 'Sri lanka', 1),
('lr', 'Liberia', 1),
('ls', 'Lesotho', 1),
('lt', 'Lithuania', 1),
('lu', 'Luxemburg', 1),
('lv', 'Latvia', 1),
('ly', 'Libya', 1),
('ma', 'Morocco', 1),
('mc', 'Monaco', 1),
('md', 'Moldova', 1),
('me', 'Montenegro', 1),
('mf', 'Saint martin', 1),
('mg', 'Madagascar', 1),
('mh', 'Marshall islands', 1),
('mk', 'Macedonia', 1),
('ml', 'Mali', 1),
('mm', 'Burma (myanmar)', 1),
('mn', 'Mongolia', 1),
('mo', 'Macau', 1),
('mp', 'Northern mariana islands', 1),
('mq', 'Martinique', 1),
('mr', 'Mauritania', 1),
('ms', 'Montserrat', 1),
('mt', 'Malta', 1),
('mu', 'Mauritius', 1),
('mv', 'Maldives', 1),
('mw', 'Malawi', 1),
('mx', 'Mexico', 1),
('my', 'Malaysia', 1),
('mz', 'Mozambique', 1),
('na', 'Namibia', 1),
('nc', 'New caledonia', 1),
('ne', 'Niger', 1),
('nf', 'Norfolk island', 1),
('ng', 'Nigeria', 1),
('ni', 'Nicaragua', 1),
('nl', 'Netherlands', 1),
('no', 'Norway', 1),
('np', 'Nepal', 1),
('nr', 'Nauru', 1),
('nu', 'Niue', 1),
('nz', 'New zealand', 1),
('om', 'Oman', 1),
('pa', 'Panama', 1),
('pe', 'Peru', 1),
('pf', 'French polynesia', 1),
('pg', 'Papua new guinea', 1),
('ph', 'Philippines', 1),
('pk', 'Pakistan', 1),
('pl', 'Poland', 1),
('pm', 'Saint pierre and miquelon', 1),
('pn', 'Pitcairn', 1),
('pr', 'Puerto rico', 1),
('ps', 'Palestinian territories', 1),
('pt', 'Portugal', 1),
('pw', 'Palau', 1),
('py', 'Paraguay', 1),
('qa', 'Qatar', 1),
('re', 'Réunion', 1),
('ro', 'Romania', 1),
('rs', 'Serbia', 1),
('ru', 'Russian federation', 1),
('rw', 'Rwanda', 1),
('sa', 'Saudi arabia', 1),
('sb', 'Solomon islands', 1),
('sc', 'Seychelles', 1),
('sd', 'Sudan', 1),
('se', 'Sweden', 1),
('sg', 'Singapore', 1),
('si', 'Slovenia', 1),
('sj', 'Svalbard and jan mayen', 1),
('sk', 'Slovakia', 1),
('sl', 'Sierra leone', 1),
('sm', 'San marino', 1),
('sn', 'Senegal', 1),
('so', 'Somalia', 1),
('sr', 'Suriname', 1),
('st', 'São tomé and príncipe', 1),
('sv', 'El salvador', 1),
('sy', 'Syria', 1),
('sz', 'Swaziland', 1),
('tc', 'Turks and caicos islands', 1),
('td', 'Chad', 1),
('tf', 'French southern territories', 1),
('tg', 'Togo', 1),
('th', 'Thailand', 1),
('tj', 'Tajikistan', 1),
('tk', 'Tokelau', 1),
('tl', 'East timor', 1),
('tm', 'Turkmenistan', 1),
('tn', 'Tunisia', 1),
('to', 'Tonga', 1),
('tr', 'Turkey', 1),
('tt', 'Trinidad and tobago', 1),
('tv', 'Tuvalu', 1),
('tw', 'Taiwan', 1),
('tz', 'Tanzania', 1),
('ua', 'Ukraine', 1),
('ug', 'Uganda', 1),
('us', 'Usa', 1),
('uy', 'Uruguay', 1),
('uz', 'Uzbekistan', 1),
('va', 'Vatican city state', 1),
('vc', 'Saint vincent and the grenadines', 1),
('ve', 'Venezuela', 1),
('vg', 'Virgin islands (british)', 1),
('vi', 'Virgin islands (u.s.)', 1),
('vn', 'Vietnam', 1),
('vu', 'Vanuatu', 1),
('wf', 'Wallis and futuna', 1),
('ws', 'Samoa', 1),
('ye', 'Yemen', 1),
('yt', 'Mayotte', 1),
('za', 'South africa', 1),
('zm', 'Zambia', 1),
('zw', 'Zimbabwe', 1);

-- --------------------------------------------------------

--
-- Structure de la table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_currency_id` int(11) DEFAULT NULL,
  `minimum_purchase_currency_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `price_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `minimum_purchase_amount` int(11) DEFAULT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64BF3F0277153098` (`code`),
  KEY `IDX_64BF3F023FFDCD60` (`price_currency_id`),
  KEY `IDX_64BF3F02B0531AA0` (`minimum_purchase_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `coupon`
--

INSERT INTO `coupon` (`id`, `price_currency_id`, `minimum_purchase_currency_id`, `code`, `name`, `type`, `price_amount`, `discount`, `count`, `used`, `priority`, `minimum_purchase_amount`, `valid_from`, `valid_to`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 2, 2, 'percent', '10 percent discount', 2, 0, 12, 100, 0, 0, 0, '2014-10-21 10:34:24', '2014-11-21 10:34:24', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 2, 2, '5euros', '5 euros discount', 1, 0, 0, 20, 0, 0, 0, '2014-10-21 10:34:24', NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(3, 1, 2, '10dollars', '10 dollars discount', 1, 1000, 0, 20, 0, 0, 0, '2014-10-21 10:34:24', NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `coupons_rules`
--

CREATE TABLE IF NOT EXISTS `coupons_rules` (
  `coupon_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`rule_id`),
  KEY `IDX_B6EC9A0B66C5951B` (`coupon_id`),
  KEY `IDX_B6EC9A0B744E0351` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6956883F61587F41` (`iso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `currency`
--

INSERT INTO `currency` (`id`, `iso`, `symbol`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'USD', '$', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 'EUR', '€', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(3, 'GBP', '£', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(4, 'JPY', '円', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `currency_exchange_rate`
--

CREATE TABLE IF NOT EXISTS `currency_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_currency_id` int(11) DEFAULT NULL,
  `source_currency_id` int(11) DEFAULT NULL,
  `exchange_rate` decimal(18,10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B9F60EECBF1ECE7C` (`target_currency_id`),
  KEY `IDX_B9F60EEC45BD1D6` (`source_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `currency_exchange_rate`
--

INSERT INTO `currency_exchange_rate` (`id`, `target_currency_id`, `source_currency_id`, `exchange_rate`) VALUES
(1, 2, 1, 0.7365960000),
(2, 3, 1, 0.5887650000),
(3, 4, 1, 101.8226250000);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_address_id` int(11) DEFAULT NULL,
  `invoice_address_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `recovery_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guest` tinyint(1) NOT NULL,
  `newsletter` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_81398E098A2057A4` (`recovery_hash`),
  UNIQUE KEY `UNIQ_81398E09EBF23851` (`delivery_address_id`),
  UNIQUE KEY `UNIQ_81398E09C6BDFEB` (`invoice_address_id`),
  KEY `IDX_81398E0982F1BAF4` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `customer`
--

INSERT INTO `customer` (`id`, `delivery_address_id`, `invoice_address_id`, `language_id`, `gender`, `username`, `password`, `email`, `firstname`, `lastname`, `birthday`, `recovery_hash`, `created_at`, `updated_at`, `enabled`, `phone`, `identity_document`, `guest`, `newsletter`) VALUES
(1, NULL, NULL, NULL, 0, 'customer', '$2y$15$zPJlqWZZbAowtLvTUzXPH.zpwRh.1wm8MbCwtViHMfBV5NdfZxYVO', 'customer@customer.com', 'Homer', 'Simpson', NULL, NULL, '2014-10-21 10:34:10', '2014-10-21 10:34:10', 1, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `customer_address`
--

CREATE TABLE IF NOT EXISTS `customer_address` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `IDX_1193CB3F9395C3F3` (`customer_id`),
  KEY `IDX_1193CB3FF5B7AF75` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expression`
--

CREATE TABLE IF NOT EXISTS `expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expression` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `name`, `content_type`, `extension`, `size`, `width`, `height`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 'product-1.jpg', 'image/jpeg', 'jpg', 87315, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 'product-2.jpg', 'image/jpeg', 'jpg', 96768, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(3, 'product-3.jpg', 'image/jpeg', 'jpg', 88868, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(4, 'product-4.jpg', 'image/jpeg', 'jpg', 88341, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(5, 'product-5.jpg', 'image/jpeg', 'jpg', 78984, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(6, 'product-6.jpg', 'image/jpeg', 'jpg', 95480, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(7, 'product-7.jpg', 'image/jpeg', 'jpg', 91752, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(8, 'product-8.jpg', 'image/jpeg', 'jpg', 70130, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(9, 'product-9.jpg', 'image/jpeg', 'jpg', 95125, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(10, 'product-10.jpg', 'image/jpeg', 'jpg', 67072, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(11, 'product-11.jpg', 'image/jpeg', 'jpg', 70903, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(12, 'product-12.jpg', 'image/jpeg', 'jpg', 61746, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(13, 'product-13.jpg', 'image/jpeg', 'jpg', 85726, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(14, 'product-14.jpg', 'image/jpeg', 'jpg', 68803, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(15, 'product-15.jpg', 'image/jpeg', 'jpg', 67269, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(16, 'product-16.jpg', 'image/jpeg', 'jpg', 82135, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(17, 'product-17.jpg', 'image/jpeg', 'jpg', 86434, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(18, 'product-18.jpg', 'image/jpeg', 'jpg', 74483, 640, 500, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `menu`
--

INSERT INTO `menu` (`id`, `code`, `description`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'admin', '', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24');

-- --------------------------------------------------------

--
-- Structure de la table `menu_node`
--

CREATE TABLE IF NOT EXISTS `menu_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Contenu de la table `menu_node`
--

INSERT INTO `menu_node` (`id`, `name`, `code`, `url`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Admin users', NULL, 'admin_admin_user_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(2, 'Customers', NULL, 'admin_customer_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(3, 'User', 'users', NULL, 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(4, 'Products', NULL, 'admin_product_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(5, 'Categories', NULL, 'admin_category_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(6, 'Manufacturers', NULL, 'admin_manufacturer_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(7, 'Catalog', 'tags', '', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(8, 'Attribute', NULL, 'admin_attribute_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(9, 'Carts', NULL, 'admin_cart_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(10, 'Orders', NULL, 'admin_order_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(11, 'Purchases', 'shopping-cart', '', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(12, 'Medias', 'picture-o', 'admin_image_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(13, 'Banner Zones', NULL, 'admin_banner_zone_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(14, 'Banners', NULL, 'admin_banner_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(15, 'Banners', NULL, '', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(16, 'Coupons', NULL, 'admin_coupon_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(17, 'Currencies', 'btc', 'admin_currency_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(18, 'Rule Groups', NULL, 'admin_rule_group_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(19, 'Rules', NULL, 'admin_rule_list', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24'),
(20, 'Rules', NULL, '', 1, '2014-10-21 10:34:24', '2014-10-21 10:34:24');

-- --------------------------------------------------------

--
-- Structure de la table `menu_node_hierarchy`
--

CREATE TABLE IF NOT EXISTS `menu_node_hierarchy` (
  `menu_node_id` int(11) NOT NULL,
  `menu_subnode_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_node_id`,`menu_subnode_id`),
  KEY `IDX_F80FD5E9CED68269` (`menu_node_id`),
  KEY `IDX_F80FD5E92CC283CA` (`menu_subnode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `menu_node_hierarchy`
--

INSERT INTO `menu_node_hierarchy` (`menu_node_id`, `menu_subnode_id`) VALUES
(1, 3),
(1, 7),
(1, 11),
(1, 12),
(1, 15),
(1, 16),
(1, 17),
(1, 20);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter_subscription`
--

CREATE TABLE IF NOT EXISTS `newsletter_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A82B55ADE7927C74` (`email`),
  UNIQUE KEY `UNIQ_A82B55ADD1B862B8` (`hash`),
  KEY `IDX_A82B55AD82F1BAF4` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `node_hierarchy`
--

CREATE TABLE IF NOT EXISTS `node_hierarchy` (
  `menu_node_id` int(11) NOT NULL,
  `menu_subnode_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_node_id`,`menu_subnode_id`),
  KEY `IDX_E1C520CDCED68269` (`menu_node_id`),
  KEY `IDX_E1C520CD2CC283CA` (`menu_subnode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `node_hierarchy`
--

INSERT INTO `node_hierarchy` (`menu_node_id`, `menu_subnode_id`) VALUES
(3, 1),
(3, 2),
(7, 4),
(7, 5),
(7, 6),
(7, 8),
(11, 9),
(11, 10),
(15, 13),
(15, 14),
(20, 18),
(20, 19);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `last_order_history_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_amount` int(11) NOT NULL,
  `coupon_amount` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E52FFDEE1AD5CDBF` (`cart_id`),
  UNIQUE KEY `UNIQ_E52FFDEE8BECF2EB` (`last_order_history_id`),
  KEY `IDX_E52FFDEE9395C3F3` (`customer_id`),
  KEY `IDX_E52FFDEE38248176` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `order_coupon`
--

CREATE TABLE IF NOT EXISTS `order_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `amount_currency_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A7302FD78D9F6D38` (`order_id`),
  KEY `IDX_A7302FD766C5951B` (`coupon_id`),
  KEY `IDX_A7302FD7ACEEF226` (`amount_currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D1C0D9008D9F6D38` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

CREATE TABLE IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_order_line_history_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_amount` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9CE58EE1593897EC` (`last_order_line_history_id`),
  KEY `IDX_9CE58EE18D9F6D38` (`order_id`),
  KEY `IDX_9CE58EE138248176` (`currency_id`),
  KEY `IDX_9CE58EE14584665A` (`product_id`),
  KEY `IDX_9CE58EE13B69A9AF` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `order_line_history`
--

CREATE TABLE IF NOT EXISTS `order_line_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_line_id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_96DE6546BB01DC09` (`order_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `postalcode`
--

CREATE TABLE IF NOT EXISTS `postalcode` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `principal_variant_id` int(11) DEFAULT NULL,
  `principal_category_id` int(11) DEFAULT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `price_currency_id` int(11) DEFAULT NULL,
  `reduced_price_currency_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `show_in_home` tinyint(1) DEFAULT NULL,
  `dimensions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reduced_price` int(11) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04ADA23B42D` (`manufacturer_id`),
  KEY `IDX_D34A04ADE2560A82` (`principal_variant_id`),
  KEY `IDX_D34A04AD5740FE34` (`principal_category_id`),
  KEY `IDX_D34A04ADA7F1F96B` (`principal_image_id`),
  KEY `IDX_D34A04AD3FFDCD60` (`price_currency_id`),
  KEY `IDX_D34A04ADB756744B` (`reduced_price_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`id`, `manufacturer_id`, `principal_variant_id`, `principal_category_id`, `principal_image_id`, `price_currency_id`, `reduced_price_currency_id`, `name`, `sku`, `slug`, `short_description`, `description`, `show_in_home`, `dimensions`, `stock`, `price`, `reduced_price`, `height`, `width`, `depth`, `weight`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `enabled`) VALUES
(1, NULL, NULL, 1, 1, 1, 1, 'Ibiza Lips', NULL, 'ibiza-lips', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 799, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(2, NULL, NULL, 1, 2, 2, 1, 'Ibiza Banana', NULL, 'ibiza-banana', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 399, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(3, NULL, NULL, 1, 3, 1, 1, 'I Was There', NULL, 'i-was-there', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 2105, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(4, NULL, NULL, 1, 4, 1, 1, 'A Life Style', NULL, 'a-life-style', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1290, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(5, NULL, NULL, 1, 5, 1, 1, 'A.M. Nesia Ibiza', NULL, 'a-m-nesia-ibiza', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(6, NULL, NULL, 1, 6, 1, 1, 'Amnesia Poem', NULL, 'amnesia-poem', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1390, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(7, NULL, NULL, 1, 7, 1, 1, 'Pyramid', NULL, 'Pyramid', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1090, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(8, NULL, NULL, 1, 8, 1, 1, 'Amnesia Pink', NULL, 'amnesia-pink', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1290, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(9, NULL, NULL, 1, 9, 1, 1, 'Pinky Fragments', NULL, 'pinky-fragments', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(10, NULL, NULL, 2, 10, 1, 1, 'I Was There II', NULL, 'i-was-there-ii', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1190, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(11, NULL, NULL, 2, 11, 1, 1, 'Amnesia', NULL, 'amnesia', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1800, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(12, NULL, NULL, 2, 12, 1, 1, 'Amnesia 100%', NULL, 'amnesia-100-percent', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1650, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(13, NULL, NULL, 2, 13, 1, 1, 'A Life Style II', NULL, 'a-life-style-ii', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1550, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(14, NULL, NULL, 2, 14, 1, 1, 'All Night Long', NULL, 'all-night-long', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1710, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(15, NULL, NULL, 2, 15, 1, 1, 'A.M. Nesia Ibiza II', NULL, 'a-m-nesia-ibiza-ii', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 18000, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(16, NULL, NULL, 2, 16, 1, 1, 'High Pyramid', NULL, 'high-pyramid', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 2000, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(17, NULL, NULL, 2, 17, 1, 1, 'Star Amnesia', NULL, 'star-amnesia', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1145, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1),
(18, NULL, NULL, 2, 18, 1, 1, 'Ibiza 4 Ever', NULL, 'ibiza-4-ever', NULL, 'Sed venenatis mauris eros, sit amet dapibus turpis consectetur et.\n                Etiam blandit erat libero. Integer a elit a tortor scelerisque\n                bibendum quis eget tortor. Donec vitae tempor tellus.', 1, NULL, 10000, 1020, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2014-10-21 10:34:24', '2014-10-21 10:34:25', 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`),
  KEY `IDX_94DA59764584665A` (`product_id`),
  KEY `IDX_94DA5976B6E62EFA` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `IDX_CDFC73564584665A` (`product_id`),
  KEY `IDX_CDFC735612469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2);

-- --------------------------------------------------------

--
-- Structure de la table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`image_id`),
  KEY `IDX_64617F034584665A` (`product_id`),
  KEY `IDX_64617F033DA5256D` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `product_image`
--

INSERT INTO `product_image` (`product_id`, `image_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18);

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

CREATE TABLE IF NOT EXISTS `province` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4ADAD40BF026BB7C` (`country_code`),
  KEY `IDX_4ADAD40B5D83CC1` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rule_group_rule`
--

CREATE TABLE IF NOT EXISTS `rule_group_rule` (
  `rule_group_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`rule_group_id`,`rule_id`),
  KEY `IDX_54337B6732A83AEB` (`rule_group_id`),
  KEY `IDX_54337B67744E0351` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A393D2FBF026BB7C` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D775834B6E62EFA` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `value`
--

INSERT INTO `value` (`id`, `attribute_id`, `name`, `display_name`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 2, 'Black', 'Black', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 2, 'White', 'White', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(3, 2, 'Gray', 'Gray', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(4, 1, 'Small', 'Small', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(5, 1, 'Medium', 'Medium', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(6, 1, 'Large', 'Large', '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `variant`
--

CREATE TABLE IF NOT EXISTS `variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `principal_image_id` int(11) DEFAULT NULL,
  `price_currency_id` int(11) DEFAULT NULL,
  `reduced_price_currency_id` int(11) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `reduced_price` int(11) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F143BFAD4584665A` (`product_id`),
  KEY `IDX_F143BFADA7F1F96B` (`principal_image_id`),
  KEY `IDX_F143BFAD3FFDCD60` (`price_currency_id`),
  KEY `IDX_F143BFADB756744B` (`reduced_price_currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `variant`
--

INSERT INTO `variant` (`id`, `product_id`, `principal_image_id`, `price_currency_id`, `reduced_price_currency_id`, `sku`, `stock`, `price`, `reduced_price`, `height`, `width`, `depth`, `weight`, `created_at`, `updated_at`, `enabled`) VALUES
(1, 1, NULL, 1, 1, '', 10000, 1099, 0, 0, 0, 0, 0, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(2, 1, NULL, 1, 1, '', 10000, 1299, 0, 0, 0, 0, 0, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(3, 1, NULL, 1, 1, '', 10000, 1199, 0, 0, 0, 0, 0, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1),
(4, 1, NULL, 1, 1, '', 10000, 1399, 0, 0, 0, 0, 0, '2014-10-21 10:34:24', '2014-10-21 10:34:24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `variant_image`
--

CREATE TABLE IF NOT EXISTS `variant_image` (
  `variant_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`variant_id`,`image_id`),
  KEY `IDX_45B79B023B69A9AF` (`variant_id`),
  KEY `IDX_45B79B023DA5256D` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `variant_options`
--

CREATE TABLE IF NOT EXISTS `variant_options` (
  `variant_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`variant_id`,`option_id`),
  KEY `IDX_BF90D7C13B69A9AF` (`variant_id`),
  KEY `IDX_BF90D7C1A7C41D6F` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `variant_options`
--

INSERT INTO `variant_options` (`variant_id`, `option_id`) VALUES
(1, 2),
(1, 4),
(2, 2),
(2, 5),
(3, 1),
(3, 4),
(4, 1),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ZoneCityMember`
--

CREATE TABLE IF NOT EXISTS `ZoneCityMember` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FFC93DE57597D3FE` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ZoneCountryMember`
--

CREATE TABLE IF NOT EXISTS `ZoneCountryMember` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_47D68F4D7597D3FE` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ZonePostalCodeMember`
--

CREATE TABLE IF NOT EXISTS `ZonePostalCodeMember` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA27D61F7597D3FE` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ZoneProvinceMember`
--

CREATE TABLE IF NOT EXISTS `ZoneProvinceMember` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_756C44C57597D3FE` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ZoneStateMember`
--

CREATE TABLE IF NOT EXISTS `ZoneStateMember` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C210C50F7597D3FE` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zone_member`
--

CREATE TABLE IF NOT EXISTS `zone_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `zone_zone_members`
--

CREATE TABLE IF NOT EXISTS `zone_zone_members` (
  `zone_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zone_member_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_code`,`zone_member_id`),
  KEY `IDX_21544314E5EDF13D` (`zone_code`),
  KEY `IDX_21544314FB01808B` (`zone_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `AbstractRule`
--
ALTER TABLE `AbstractRule`
  ADD CONSTRAINT `FK_EEB288E2ADBB65A1` FOREIGN KEY (`expression_id`) REFERENCES `expression` (`id`);

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81BDBA6A61` FOREIGN KEY (`postal_code_id`) REFERENCES `postalcode` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_D4E6F818BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `FK_6F9DB8E7A7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_6F9DB8E73DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Contraintes pour la table `banner_banner_zone`
--
ALTER TABLE `banner_banner_zone`
  ADD CONSTRAINT `FK_98251B1ECB711668` FOREIGN KEY (`banner_zone_id`) REFERENCES `banner_zone` (`id`),
  ADD CONSTRAINT `FK_98251B1E684EC833` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`);

--
-- Contraintes pour la table `banner_zone`
--
ALTER TABLE `banner_zone`
  ADD CONSTRAINT `FK_A852916D82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B79395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `cart_coupon`
--
ALTER TABLE `cart_coupon`
  ADD CONSTRAINT `FK_6A3B5D5D66C5951B` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `FK_6A3B5D5D1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`);

--
-- Contraintes pour la table `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `FK_3EF1B4CF3B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF940B1F69` FOREIGN KEY (`product_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CFBB01DC09` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `cities_postal_codes`
--
ALTER TABLE `cities_postal_codes`
  ADD CONSTRAINT `FK_EE86A59EBDBA6A61` FOREIGN KEY (`postal_code_id`) REFERENCES `postalcode` (`id`),
  ADD CONSTRAINT `FK_EE86A59E8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_2D5B0234E946114A` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
  ADD CONSTRAINT `FK_2D5B02345D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `FK_2D5B0234F026BB7C` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`);

--
-- Contraintes pour la table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `FK_64BF3F02B0531AA0` FOREIGN KEY (`minimum_purchase_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_64BF3F023FFDCD60` FOREIGN KEY (`price_currency_id`) REFERENCES `currency` (`id`);

--
-- Contraintes pour la table `coupons_rules`
--
ALTER TABLE `coupons_rules`
  ADD CONSTRAINT `FK_B6EC9A0B744E0351` FOREIGN KEY (`rule_id`) REFERENCES `AbstractRule` (`id`),
  ADD CONSTRAINT `FK_B6EC9A0B66C5951B` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`);

--
-- Contraintes pour la table `currency_exchange_rate`
--
ALTER TABLE `currency_exchange_rate`
  ADD CONSTRAINT `FK_B9F60EEC45BD1D6` FOREIGN KEY (`source_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_B9F60EECBF1ECE7C` FOREIGN KEY (`target_currency_id`) REFERENCES `currency` (`id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_81398E0982F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `FK_81398E09C6BDFEB` FOREIGN KEY (`invoice_address_id`) REFERENCES `address` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_81398E09EBF23851` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_1193CB3FF5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_1193CB3F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `menu_node_hierarchy`
--
ALTER TABLE `menu_node_hierarchy`
  ADD CONSTRAINT `FK_F80FD5E92CC283CA` FOREIGN KEY (`menu_subnode_id`) REFERENCES `menu_node` (`id`),
  ADD CONSTRAINT `FK_F80FD5E9CED68269` FOREIGN KEY (`menu_node_id`) REFERENCES `menu` (`id`);

--
-- Contraintes pour la table `newsletter_subscription`
--
ALTER TABLE `newsletter_subscription`
  ADD CONSTRAINT `FK_A82B55AD82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

--
-- Contraintes pour la table `node_hierarchy`
--
ALTER TABLE `node_hierarchy`
  ADD CONSTRAINT `FK_E1C520CD2CC283CA` FOREIGN KEY (`menu_subnode_id`) REFERENCES `menu_node` (`id`),
  ADD CONSTRAINT `FK_E1C520CDCED68269` FOREIGN KEY (`menu_node_id`) REFERENCES `menu_node` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_E52FFDEE8BECF2EB` FOREIGN KEY (`last_order_history_id`) REFERENCES `order_history` (`id`),
  ADD CONSTRAINT `FK_E52FFDEE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `order_coupon`
--
ALTER TABLE `order_coupon`
  ADD CONSTRAINT `FK_A7302FD7ACEEF226` FOREIGN KEY (`amount_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_A7302FD766C5951B` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `FK_A7302FD78D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `FK_D1C0D9008D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_9CE58EE13B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  ADD CONSTRAINT `FK_9CE58EE138248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_9CE58EE14584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9CE58EE1593897EC` FOREIGN KEY (`last_order_line_history_id`) REFERENCES `order_line_history` (`id`),
  ADD CONSTRAINT `FK_9CE58EE18D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `order_line_history`
--
ALTER TABLE `order_line_history`
  ADD CONSTRAINT `FK_96DE6546BB01DC09` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04ADB756744B` FOREIGN KEY (`reduced_price_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_D34A04AD3FFDCD60` FOREIGN KEY (`price_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_D34A04AD5740FE34` FOREIGN KEY (`principal_category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04ADA23B42D` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`),
  ADD CONSTRAINT `FK_D34A04ADA7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_D34A04ADE2560A82` FOREIGN KEY (`principal_variant_id`) REFERENCES `variant` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `FK_94DA5976B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_94DA59764584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `FK_CDFC735612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_CDFC73564584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK_64617F033DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `FK_4ADAD40B5D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `FK_4ADAD40BF026BB7C` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`);

--
-- Contraintes pour la table `rule_group_rule`
--
ALTER TABLE `rule_group_rule`
  ADD CONSTRAINT `FK_54337B67744E0351` FOREIGN KEY (`rule_id`) REFERENCES `AbstractRule` (`id`),
  ADD CONSTRAINT `FK_54337B6732A83AEB` FOREIGN KEY (`rule_group_id`) REFERENCES `AbstractRule` (`id`);

--
-- Contraintes pour la table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `FK_A393D2FBF026BB7C` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`);

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D775834B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Contraintes pour la table `variant`
--
ALTER TABLE `variant`
  ADD CONSTRAINT `FK_F143BFADB756744B` FOREIGN KEY (`reduced_price_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_F143BFAD3FFDCD60` FOREIGN KEY (`price_currency_id`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `FK_F143BFAD4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F143BFADA7F1F96B` FOREIGN KEY (`principal_image_id`) REFERENCES `image` (`id`);

--
-- Contraintes pour la table `variant_image`
--
ALTER TABLE `variant_image`
  ADD CONSTRAINT `FK_45B79B023DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_45B79B023B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`);

--
-- Contraintes pour la table `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `FK_BF90D7C1A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `value` (`id`),
  ADD CONSTRAINT `FK_BF90D7C13B69A9AF` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`);

--
-- Contraintes pour la table `ZoneCityMember`
--
ALTER TABLE `ZoneCityMember`
  ADD CONSTRAINT `FK_FFC93DE5BF396750` FOREIGN KEY (`id`) REFERENCES `zone_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FFC93DE57597D3FE` FOREIGN KEY (`member_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `ZoneCountryMember`
--
ALTER TABLE `ZoneCountryMember`
  ADD CONSTRAINT `FK_47D68F4DBF396750` FOREIGN KEY (`id`) REFERENCES `zone_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_47D68F4D7597D3FE` FOREIGN KEY (`member_id`) REFERENCES `country` (`code`);

--
-- Contraintes pour la table `ZonePostalCodeMember`
--
ALTER TABLE `ZonePostalCodeMember`
  ADD CONSTRAINT `FK_BA27D61FBF396750` FOREIGN KEY (`id`) REFERENCES `zone_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BA27D61F7597D3FE` FOREIGN KEY (`member_id`) REFERENCES `postalcode` (`id`);

--
-- Contraintes pour la table `ZoneProvinceMember`
--
ALTER TABLE `ZoneProvinceMember`
  ADD CONSTRAINT `FK_756C44C5BF396750` FOREIGN KEY (`id`) REFERENCES `zone_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_756C44C57597D3FE` FOREIGN KEY (`member_id`) REFERENCES `province` (`id`);

--
-- Contraintes pour la table `ZoneStateMember`
--
ALTER TABLE `ZoneStateMember`
  ADD CONSTRAINT `FK_C210C50FBF396750` FOREIGN KEY (`id`) REFERENCES `zone_member` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C210C50F7597D3FE` FOREIGN KEY (`member_id`) REFERENCES `state` (`id`);

--
-- Contraintes pour la table `zone_zone_members`
--
ALTER TABLE `zone_zone_members`
  ADD CONSTRAINT `FK_21544314FB01808B` FOREIGN KEY (`zone_member_id`) REFERENCES `zone_member` (`id`),
  ADD CONSTRAINT `FK_21544314E5EDF13D` FOREIGN KEY (`zone_code`) REFERENCES `zone` (`code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
