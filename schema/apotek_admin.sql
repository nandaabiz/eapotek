/*
SQLyog Ultimate v9.50 
MySQL - 5.5.27 : Database - apotek_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apotek_admin` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `apotek_admin`;

/*Table structure for table `apotek` */

DROP TABLE IF EXISTS `apotek`;

CREATE TABLE `apotek` (
  `apotek_id` int(11) NOT NULL AUTO_INCREMENT,
  `apotek_nama` varchar(255) NOT NULL,
  `apotek_alamat` varchar(255) NOT NULL,
  `apotek_koordinat_gps` varchar(255) NOT NULL,
  `apotek_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  `apotek_user_updated` int(11) NOT NULL,
  `apotek_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`apotek_id`),
  KEY `apotek_user_updated` (`apotek_user_updated`),
  CONSTRAINT `apotek_ibfk_1` FOREIGN KEY (`apotek_user_updated`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `apotek` */

/*Table structure for table `detil_resep` */

DROP TABLE IF EXISTS `detil_resep`;

CREATE TABLE `detil_resep` (
  `detil_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resep_id` bigint(20) NOT NULL,
  `obat_id` bigint(20) NOT NULL,
  `harga_obat_id` bigint(20) NOT NULL,
  `detil_qty` float NOT NULL,
  `detil_signa_qty` float NOT NULL,
  `detil_signa_frek` tinyint(4) NOT NULL,
  `detil_diskon_persen` float NOT NULL DEFAULT '0',
  `detil_diskon_nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `detil_deskripsi` text NOT NULL,
  PRIMARY KEY (`detil_id`),
  KEY `resep_id` (`resep_id`),
  KEY `obat_id` (`obat_id`),
  KEY `harga_obat_id` (`harga_obat_id`),
  CONSTRAINT `detil_resep_ibfk_1` FOREIGN KEY (`resep_id`) REFERENCES `resep` (`resep_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detil_resep_ibfk_2` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`obat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detil_resep_ibfk_3` FOREIGN KEY (`harga_obat_id`) REFERENCES `harga_obat` (`harga_obat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detil_resep` */

/*Table structure for table `harga_obat` */

DROP TABLE IF EXISTS `harga_obat`;

CREATE TABLE `harga_obat` (
  `harga_obat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obat_id` bigint(20) NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `user_updated` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`harga_obat_id`),
  KEY `obat_id` (`obat_id`),
  CONSTRAINT `harga_obat_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`obat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `harga_obat` */

/*Table structure for table `jaminan` */

DROP TABLE IF EXISTS `jaminan`;

CREATE TABLE `jaminan` (
  `jaminan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `jaminan_nama` varchar(255) NOT NULL,
  `jaminan_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`jaminan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `jaminan` */

insert  into `jaminan`(`jaminan_id`,`jaminan_nama`,`jaminan_is_aktif`) values (1,'Umum','1'),(2,'Askes','1'),(3,'Jamkesda','1'),(4,'BPJS Lain','1');

/*Table structure for table `obat` */

DROP TABLE IF EXISTS `obat`;

CREATE TABLE `obat` (
  `obat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obat_barcode` varchar(20) NOT NULL,
  `obat_nama_generik` varchar(50) DEFAULT NULL,
  `obat_nama_dagang` varchar(50) NOT NULL,
  `obat_nama_pabrik` varchar(50) NOT NULL,
  `obat_satuan` varchar(20) NOT NULL COMMENT 'cth: tablet',
  `obat_net` float NOT NULL COMMENT 'cth: 10',
  `obat_net_satuan` varchar(10) NOT NULL COMMENT 'cth: mg',
  `obat_keterangan` text,
  `obat_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`obat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `obat` */

/*Table structure for table `profil` */

DROP TABLE IF EXISTS `profil`;

CREATE TABLE `profil` (
  `profil_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profil_nama` varchar(255) NOT NULL,
  `profil_alamat` varchar(255) NOT NULL,
  `profil_jk` enum('L','P') NOT NULL DEFAULT 'L',
  `profil_foto` text,
  `profil_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`profil_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profil_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profil` */

/*Table structure for table `resep` */

DROP TABLE IF EXISTS `resep`;

CREATE TABLE `resep` (
  `resep_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resep_no` varchar(30) NOT NULL,
  `resep_tgl` date NOT NULL,
  `resep_pengguna_id` int(11) NOT NULL,
  `resep_apoteker_id` int(11) DEFAULT NULL,
  `resep_apotek_id` int(11) DEFAULT NULL,
  `resep_filename` text NOT NULL,
  `resep_nama_dokter` varchar(255) DEFAULT NULL,
  `resep_asal_klinik` varchar(255) DEFAULT NULL,
  `resep_jaminan_id` smallint(11) DEFAULT NULL,
  `resep_status_id` tinyint(11) DEFAULT NULL,
  `resep_waktu_diterima` datetime DEFAULT NULL,
  `resep_waktu_diacc` datetime DEFAULT NULL,
  `resep_waktu_diambil` datetime DEFAULT NULL,
  `resep_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  `resep_koordinat_gps` varchar(255) DEFAULT NULL,
  `resep_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resep_id`),
  KEY `resep_pengguna_id` (`resep_pengguna_id`),
  KEY `resep_apoteker_id` (`resep_apoteker_id`),
  KEY `resep_apotek_id` (`resep_apotek_id`),
  KEY `resep_jaminan_id` (`resep_jaminan_id`),
  KEY `resep_status_id` (`resep_status_id`),
  CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`resep_pengguna_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_ibfk_2` FOREIGN KEY (`resep_apoteker_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_ibfk_3` FOREIGN KEY (`resep_apotek_id`) REFERENCES `apotek` (`apotek_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_ibfk_4` FOREIGN KEY (`resep_jaminan_id`) REFERENCES `jaminan` (`jaminan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_ibfk_5` FOREIGN KEY (`resep_status_id`) REFERENCES `resep_status` (`resep_status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resep` */

/*Table structure for table `resep_status` */

DROP TABLE IF EXISTS `resep_status`;

CREATE TABLE `resep_status` (
  `resep_status_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `resep_status_nama` varchar(50) NOT NULL,
  `resep_status_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`resep_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `resep_status` */

insert  into `resep_status`(`resep_status_id`,`resep_status_nama`,`resep_status_is_aktif`) values (1,'Diterima','1'),(2,'Disetujui','1'),(3,'Diambil','1');

/*Table structure for table `stok_obat` */

DROP TABLE IF EXISTS `stok_obat`;

CREATE TABLE `stok_obat` (
  `stok_obat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obat_id` bigint(20) NOT NULL,
  `apotek_id` int(11) NOT NULL,
  `stok_jml` double NOT NULL,
  `user_updated` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stok_obat_id`),
  KEY `obat_id` (`obat_id`),
  KEY `apotek_id` (`apotek_id`),
  CONSTRAINT `stok_obat_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`obat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stok_obat_ibfk_2` FOREIGN KEY (`apotek_id`) REFERENCES `apotek` (`apotek_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stok_obat` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_tipe_id` int(11) NOT NULL DEFAULT '1',
  `user_nama` varchar(255) NOT NULL,
  `user_pass` char(32) NOT NULL COMMENT 'md5',
  `user_email` varchar(50) DEFAULT NULL,
  `user_is_aktif` enum('0','1') NOT NULL DEFAULT '1',
  `user_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `u_ut_fk1` (`user_tipe_id`),
  CONSTRAINT `u_ut_fk1` FOREIGN KEY (`user_tipe_id`) REFERENCES `user_tipe` (`user_tipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_tipe_id`,`user_nama`,`user_pass`,`user_email`,`user_is_aktif`,`user_last_updated`) values (1,1,'Dinar','helena','helena','1','2014-11-18 08:59:56'),(2,3,'Paino','paino','paino@gmail.com','1','2014-11-18 10:15:40');

/*Table structure for table `user_tipe` */

DROP TABLE IF EXISTS `user_tipe`;

CREATE TABLE `user_tipe` (
  `user_tipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_tipe_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`user_tipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user_tipe` */

insert  into `user_tipe`(`user_tipe_id`,`user_tipe_nama`) values (1,'Administrator'),(2,'Apoteker'),(3,'Pasien');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
