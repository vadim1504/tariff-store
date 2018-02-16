CREATE DATABASE  IF NOT EXISTS `tariff_store`;
USE `tariff_store`;

DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO balance (id, value) VALUES(1, 5000);

DROP TABLE IF EXISTS `tariff`;
CREATE TABLE `tariff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO tariff (id, name,price) VALUES(1, 'tariff1','100');
INSERT INTO tariff (id, name,price) VALUES(2, 'tariff2','200');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `balance_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_balanceid_idx` (`balance_id`),
  CONSTRAINT `fk_user_balanceidbalance` FOREIGN KEY (`balance_id`) REFERENCES `balance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users (id, login,balance_id) VALUES(1, 'user1',1);

DROP TABLE IF EXISTS `user_tariff`;
CREATE TABLE `user_tariff` (
  `user_id` int(10) unsigned NOT NULL,
  `tariff_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`tariff_id`),
  KEY `fk_usertariff_tariff_idx` (`tariff_id`),
  CONSTRAINT `fk_usertariff_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usertariff_tariff` FOREIGN KEY (`tariff_id`) REFERENCES `tariff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user_tariff (user_id,tariff_id) VALUES(1,1);
INSERT INTO user_tariff (user_id,tariff_id) VALUES(1,2);

