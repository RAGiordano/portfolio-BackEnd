-- MySQL Script generated by MySQL Workbench
-- Thu Oct 13 11:17:26 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`banner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`banner` (
  `idbanner` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `url_banner` VARCHAR(100) NULL,
  PRIMARY KEY (`idbanner`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `idpersona` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `fecha_nac` DATE NULL DEFAULT NULL,
  `telefono` VARCHAR(16) NULL DEFAULT NULL,
  `titulo` VARCHAR(45) NULL DEFAULT NULL,
  `sobre_mi` VARCHAR(350) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `url_foto` VARCHAR(100) NULL DEFAULT NULL,
  `descrip_foto` VARCHAR(45) NULL,
  `banner_idbanner` INT NOT NULL,
  PRIMARY KEY (`idpersona`, `banner_idbanner`),
  INDEX `fk_persona_banner1_idx` (`banner_idbanner` ASC) VISIBLE,
  CONSTRAINT `fk_persona_banner1`
    FOREIGN KEY (`banner_idbanner`)
    REFERENCES `portfolio`.`banner` (`idbanner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia_laboral` (
  `idexperiencia_laboral` INT(11) NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL DEFAULT NULL,
  `url_logo` VARCHAR(100) NULL DEFAULT NULL,
  `puesto` VARCHAR(60) NULL DEFAULT NULL,
  `descripcion` VARCHAR(350) NULL DEFAULT NULL,
  `es_trabajo_actual` TINYINT(4) NOT NULL,
  `fecha_desde` DATE NOT NULL,
  `fecha_hasta` DATE NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `orden` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idexperiencia_laboral`, `persona_idpersona`),
  INDEX `fk_experiencia_laboral_persona` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_persona`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`formacion_academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`formacion_academica` (
  `idformacion_academica` INT(11) NOT NULL,
  `titulo` VARCHAR(50) NOT NULL,
  `url_logo` VARCHAR(100) NOT NULL,
  `institucion` VARCHAR(60) NULL DEFAULT NULL,
  `fecha_desde` DATE NULL DEFAULT NULL,
  `fecha_hasta` DATE NULL DEFAULT NULL,
  `continua` TINYINT(4) NULL DEFAULT NULL,
  `descripcion` VARCHAR(250) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `orden` TINYINT(4) NOT NULL,
  PRIMARY KEY (`persona_idpersona`, `idformacion_academica`),
  CONSTRAINT `fk_formacion_academica_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`formacion_complementaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`formacion_complementaria` (
  `idformacion_complementaria` INT(11) NOT NULL,
  `titulo` VARCHAR(80) NOT NULL,
  `url_logo` VARCHAR(100) NULL DEFAULT NULL,
  `institucion` VARCHAR(130) NULL DEFAULT NULL,
  `fecha_desde` DATE NULL DEFAULT NULL,
  `fecha_hasta` DATE NULL DEFAULT NULL,
  `continua` TINYINT(4) NULL DEFAULT NULL,
  `descripcion` VARCHAR(250) NULL DEFAULT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `orden` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idformacion_complementaria`, `persona_idpersona`),
  INDEX `fk_formacion_complementaria_persona1` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_formacion_complementaria_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`idioma` (
  `ididioma` INT(11) NOT NULL,
  `nombre_idioma` VARCHAR(15) NOT NULL,
  `utl_logo` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(300) NULL DEFAULT NULL,
  `orden` VARCHAR(45) NOT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  PRIMARY KEY (`ididioma`, `persona_idpersona`),
  INDEX `fk_idioma_persona1_idx` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_idioma_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`red_social` (
  `idred_social` INT(11) NOT NULL,
  `nombre_rs` VARCHAR(15) NOT NULL,
  `url_logo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idred_social`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`persona_has_red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona_has_red_social` (
  `idpersona_has_red_social` INT(11) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `red_social_idred_social` INT(11) NOT NULL,
  `orden` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idpersona_has_red_social`, `persona_idpersona`, `red_social_idred_social`),
  INDEX `fk_persona_has_red_social_persona1` (`persona_idpersona` ASC) VISIBLE,
  INDEX `fk_persona_has_red_social_red_social1` (`red_social_idred_social` ASC) VISIBLE,
  CONSTRAINT `fk_persona_has_red_social_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_has_red_social_red_social1`
    FOREIGN KEY (`red_social_idred_social`)
    REFERENCES `portfolio`.`red_social` (`idred_social`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyecto` (
  `idproyecto` INT(11) NOT NULL,
  `nombre_proyecto` VARCHAR(50) NOT NULL,
  `url_imagen` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `url` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_realizacion` DATE NOT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `orden` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idproyecto`, `persona_idpersona`),
  INDEX `fk_proyecto_persona1` (`persona_idpersona` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_idpersona`)
    REFERENCES `portfolio`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`.`competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`competencia` (
  `idcompetencia` INT NOT NULL,
  `nombre_competencia` VARCHAR(30) NULL,
  `descripcion` VARCHAR(45) NULL,
  `url_logo` VARCHAR(100) NULL,
  `porcentaje` TINYINT(4) NULL,
  `orden` INT NULL,
  `persona_idpersona` INT(11) NOT NULL,
  `persona_banner_idbanner` INT NOT NULL,
  PRIMARY KEY (`idcompetencia`, `persona_idpersona`, `persona_banner_idbanner`),
  INDEX `fk_competencia_persona1_idx` (`persona_idpersona` ASC, `persona_banner_idbanner` ASC) VISIBLE,
  CONSTRAINT `fk_competencia_persona1`
    FOREIGN KEY (`persona_idpersona` , `persona_banner_idbanner`)
    REFERENCES `portfolio`.`persona` (`idpersona` , `banner_idbanner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipo_usuario` (
  `idtipo_usuario` INT NOT NULL,
  `descripcion` VARCHAR(15) NULL,
  `mod_info` TINYINT(1) NULL,
  `mof_permisos` TINYINT(1) NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`usuario` (
  `idusuario` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(20) NULL,
  `tipo_usuario_idtipo_usuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`, `tipo_usuario_idtipo_usuario`),
  INDEX `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_idtipo_usuario`)
    REFERENCES `portfolio`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;