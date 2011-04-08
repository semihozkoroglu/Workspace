SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP TABLE TAKIM ;
DROP TABLE OYUNCU ;
DROP TABLE HAKEM ;
DROP TABLE KARSILASMALAR ;
DROP TABLE TEKNIKDIREKTOR ;
DROP TABLE MAC_SONUCU ;
DROP TABLE GOL_TABLOSU ;
DROP TABLE PUAN_TABLOSU ;


CREATE SCHEMA IF NOT EXISTS `Superlig` DEFAULT CHARACTER SET latin1 ;
USE `Superlig` ;

-- -----------------------------------------------------
-- Table `Superlig`.`TAKIM`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`TAKIM` (
  `idTakim` INT NOT NULL ,
  `Adi` VARCHAR(45) NULL ,
  `K_Tarih` VARCHAR(45) NULL ,
  `Stadyum` VARCHAR(45) NULL ,
  `Stadyum_Kapasite` INT NULL ,
  PRIMARY KEY (`idTakim`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`OYUNCU`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`OYUNCU` (
  `idOyuncu` INT NOT NULL ,
  `Adi` VARCHAR(45) NULL ,
  `Soyadi` VARCHAR(45) NULL ,
  `Yas` INT NULL ,
  `Pozisyon` VARCHAR(45) NULL ,
  `Ulke` VARCHAR(45) NULL ,
  `idTakim` INT NULL ,
  PRIMARY KEY (`idOyuncu`) ,
  INDEX `idTakim` (`idTakim` ASC) ,
  CONSTRAINT `idTakim`
    FOREIGN KEY (`idTakim` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`HAKEM`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`HAKEM` (
  `idHakem` INT NOT NULL ,
  `Adi` VARCHAR(45) NULL ,
  `Soyadi` VARCHAR(45) NULL ,
  `D_Tarih` DATE NULL ,
  `Memleket` VARCHAR(45) NULL ,
  `Meslegi` VARCHAR(45) NULL ,
  PRIMARY KEY (`idHakem`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`KARSILASMALAR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`KARSILASMALAR` (
  `idMac` INT NOT NULL ,
  `Haftano` INT NULL ,
  `Tarih` DATE NULL ,
  `idEvsahibi` INT NULL ,
  `idDeplasman` INT NULL ,
  `idHakem` INT NULL ,
  PRIMARY KEY (`idMac`) ,
  INDEX `idHakem` (`idHakem` ASC) ,
  INDEX `idEvsahibi` (`idEvsahibi` ASC) ,
  INDEX `idDeplasman` (`idDeplasman` ASC) ,
  CONSTRAINT `idHakem`
    FOREIGN KEY (`idHakem` )
    REFERENCES `Superlig`.`HAKEM` (`idHakem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEvsahibi`
    FOREIGN KEY (`idEvsahibi` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDeplasman`
    FOREIGN KEY (`idDeplasman` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`TEKNIKDIREKTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`TEKNIKDIREKTOR` (
  `idTeknik` INT NOT NULL ,
  `Adi` VARCHAR(45) NULL ,
  `Soyadi` VARCHAR(45) NULL ,
  `idT_Takim` INT NOT NULL ,
  PRIMARY KEY (`idTeknik`, `idT_Takim`) ,
  INDEX `idT_Takim` (`idT_Takim` ASC) ,
  CONSTRAINT `idT_Takim`
    FOREIGN KEY (`idT_Takim` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`MAC_SONUCU`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`MAC_SONUCU` (
  `idMac` INT NOT NULL ,
  `Sonuc_evsahibi` INT NULL ,
  `Sonuc_deplasman` INT NULL ,
  PRIMARY KEY (`idMac`) ,
  CONSTRAINT `idMac`
    FOREIGN KEY (`idMac` )
    REFERENCES `Superlig`.`KARSILASMALAR` (`idMac` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`GOL_TABLOSU`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`GOL_TABLOSU` (
  `idGol` INT NOT NULL ,
  `Golsayisi` INT NULL ,
  `idG_Oyuncu` INT NOT NULL ,
  `idG_Takim` INT NOT NULL ,
  PRIMARY KEY (`idGol`) ,
  INDEX `idG_Oyuncu` (`idG_Oyuncu` ASC) ,
  INDEX `idG_Takim` (`idG_Takim` ASC) ,
  CONSTRAINT `idG_Oyuncu`
    FOREIGN KEY (`idG_Oyuncu` )
    REFERENCES `Superlig`.`OYUNCU` (`idOyuncu` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idG_Takim`
    FOREIGN KEY (`idG_Takim` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Superlig`.`PUAN_TABLOSU`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Superlig`.`PUAN_TABLOSU` (
  `idPuan` INT NOT NULL ,
  `idP_Takim` INT NOT NULL ,
  `Oynanan` INT NULL ,
  `Galibiyet` INT NULL ,
  `Beraberlik` INT NULL ,
  `Maglubiyet` INT NULL ,
  `Attigi_gol` INT NULL ,
  `Yedigi_gol` INT NULL ,
  `Averaj` INT NULL ,
  `Puan` INT NULL ,
  PRIMARY KEY (`idPuan`) ,
  INDEX `idP_Takim` (`idP_Takim` ASC) ,
  CONSTRAINT `idP_Takim`
    FOREIGN KEY (`idP_Takim` )
    REFERENCES `Superlig`.`TAKIM` (`idTakim` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
