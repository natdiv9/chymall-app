-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema chymall
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chymall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chymall` DEFAULT CHARACTER SET utf8mb4 ;
USE `chymall` ;

-- -----------------------------------------------------
-- Table `chymall`.`chy_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_clients` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `prenom` VARCHAR(255) NOT NULL,
  `nom` VARCHAR(255) NOT NULL,
  `telephone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NULL,
  `adresse` VARCHAR(255) NOT NULL,
  `ville` VARCHAR(255) NOT NULL,
  `pays` VARCHAR(255) NOT NULL,
  `zip` VARCHAR(255) NOT NULL,
  `photo` VARCHAR(255) NOT NULL,
  `etat` INT(11) NOT NULL DEFAULT 1,
  `pwd_login` VARCHAR(255) NULL,
  `pwd_retrait` VARCHAR(255) NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_operation_tracer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_operation_tracer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `operation` VARCHAR(255) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `auteur_operation` VARCHAR(255) NOT NULL,
  `table` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_profiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_profiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `niveau_adhesion` VARCHAR(255) NOT NULL,
  `capital` DOUBLE NOT NULL,
  `produit_trading` VARCHAR(255) NOT NULL,
  `activation_compte` DOUBLE NULL DEFAULT 0,
  `activation_trading` DOUBLE NULL DEFAULT 0,
  `solde` DOUBLE NULL DEFAULT 0,
  `etat` INT(11) NOT NULL DEFAULT 1,
  `id_client` INT(11) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `etat_trading` INT(11) NOT NULL DEFAULT 0,
  `etat_activation` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_chy_profils_chy_clients_idx` (`id_client` ASC),
  CONSTRAINT `fk_chy_profils_chy_clients`
    FOREIGN KEY (`id_client`)
    REFERENCES `chymall`.`chy_clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_paiements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_paiements` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `montant_trading` DOUBLE NULL DEFAULT 0,
  `montant_inscription` DOUBLE NULL DEFAULT 0,
  `date_operation` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `id_profile` INT(11) NOT NULL,
  `frais_inscription` DOUBLE NULL,
  `frais_trading` DOUBLE NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_chy_paiements_chy_profils1_idx` (`id_profile` ASC),
  CONSTRAINT `fk_chy_paiements_chy_profils1`
    FOREIGN KEY (`id_profile`)
    REFERENCES `chymall`.`chy_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_produits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_produits` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `designation` VARCHAR(255) NOT NULL,
  `stock_initial` INT(11) NOT NULL,
  `stock_final` INT(11) NULL DEFAULT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_retraits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_retraits` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `montant` DOUBLE NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `profiles_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chy_retraits_chy_profils1_idx` (`profiles_id` ASC),
  CONSTRAINT `fk_chy_retraits_chy_profils1`
    FOREIGN KEY (`profiles_id`)
    REFERENCES `chymall`.`chy_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_stockages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_stockages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantite` INT(11) NOT NULL,
  `entree_sortie` INT(11) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `produits_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chy_stockages_chy_produits1_idx` (`produits_id` ASC),
  CONSTRAINT `fk_chy_stockages_chy_produits1`
    FOREIGN KEY (`produits_id`)
    REFERENCES `chymall`.`chy_produits` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_utilisateurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_utilisateurs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL DEFAULT 'CHARACTER SET binary',
  `pwd` VARCHAR(255) NOT NULL,
  `service` VARCHAR(255) NOT NULL,
  `droits` INT(11) NOT NULL,
  `etat` INT(11) NOT NULL DEFAULT 1,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `chymall`.`chy_retrait_produits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chymall`.`chy_retrait_produits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantite` INT(11) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `id_profile` INT(11) NOT NULL,
  `id_produit` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chy_retrait_produits_chy_profiles1_idx` (`id_profile` ASC),
  INDEX `fk_chy_retrait_produits_chy_produits1_idx` (`id_produit` ASC),
  CONSTRAINT `fk_chy_retrait_produits_chy_profiles1`
    FOREIGN KEY (`id_profile`)
    REFERENCES `chymall`.`chy_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chy_retrait_produits_chy_produits1`
    FOREIGN KEY (`id_produit`)
    REFERENCES `chymall`.`chy_produits` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
