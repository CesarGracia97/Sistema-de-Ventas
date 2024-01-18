CREATE DATABASE SV_angc;

#Tablas
CREATE TABLE `SV_angc`.`DB_Rol` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `FechaRegistro` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'DB_Rol';

CREATE TABLE `SV_angc`.`DB_Menu` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Icono` VARCHAR(45) NULL,
  `URL` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'DB_Menu';

CREATE TABLE `SV_angc`.`DB_MenuRol` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `IdMenu` INT NOT NULL,
  `IdRol` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Relacion Menu Rol';

CREATE TABLE `SV_angc`.`DB_Usuario` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `NombreCompleto` VARCHAR(100) NULL,
  `Correo` VARCHAR(45) NULL,
  `IdRol` INT NOT NULL,
  `Contrasena` VARCHAR(70) NULL,
  `Estado` VARCHAR(1) NULL,
  `FechaRegistro` DATETIME NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Tabla de Usuarios';

CREATE TABLE `SV_angc`.`DB_Categoria` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Estado` VARCHAR(1) NULL,
  `FechaRegistro` DATETIME NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Tabla de Categoria';

CREATE TABLE `SV_angc`.`DB_Producto` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `IdCategoria` INT NOT NULL,
  `Stock` INT NULL,
  `Precio` DECIMAL(10,2) NULL,
  `Estado` VARCHAR(1) NULL,
  `FechaRegistro` DATETIME NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Tabal de Producto';

CREATE TABLE `SV_angc`.`DB_NumeroDocumento` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `UltimoNumero` VARCHAR(45) NOT NULL,
  `FechaRegistro` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Documentos';

CREATE TABLE `SV_angc`.`DB_Venta` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `TipoPago` VARCHAR(45) NULL,
  `Total` DECIMAL(10,2) NULL,
  `FechaRegistro` DATETIME NULL,
  `NumeroDocumento` VARCHAR(40) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Tabla de Ventas';

CREATE TABLE `SV_angc`.`DB_DetallesVenta` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `IdVenta` INT NOT NULL,
  `IdProducto` INT NOT NULL,
  `Cantidad` INT NULL,
  `Precio` DECIMAL(10,2) NULL,
  `Total` DECIMAL(10,2) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC))
COMMENT = 'Tabla de detalles de VEnta';

#Relaciones
USE SV_angc; ALTER TABLE DB_MenuRol ADD CONSTRAINT fk_MenuRol_Menu FOREIGN KEY (IdMenu) REFERENCES DB_Menu(Id);
USE SV_angc; ALTER TABLE DB_MenuRol ADD CONSTRAINT fk_MenuRol_Rol FOREIGN KEY (IdRol) REFERENCES DB_Rol(Id);  
USE SV_angc; ALTER TABLE DB_Usuario ADD CONSTRAINT fK_Usuario_Rol FOREIGN KEY (IdRol) REFERENCES BD_Rol (Id);
USE SV_angc; ALTER TABLE DB_Producto ADD CONSTRAINT fk_Producto_Categoria FOREIGN KEY (IdCategoria) REFERENCES DB_Categoria(Id);
USE SV_angc; ALTER TABLE DB_DetallesVenta ADD CONSTRAINT fk_DetallesVenta_Venta FOREIGN KEY (IdVenta) REFERENCES DB_Venta(Id);
USE SV_angc; ALTER TABLE DB_DetallesVenta ADD CONSTRAINT fk_DetallesVenta_Producto FOREIGN KEY (IdProducto) REFERENCES DB_Producto(Id);

#Triggers

CREATE TRIGGER tr_upD_Role_all BEFORE INSERT ON DB_Rol FOR EACH ROW SET NEW.FechaRegistro = NOW();
CREATE TRIGGER tr_upD_User_all BEFORE INSERT ON DB_Usuario FOR EACH ROW SET NEW.FechaRegistro = NOW();
CREATE TRIGGER tr_upD_Cate_all BEFORE INSERT ON DB_Categoria FOR EACH ROW SET NEW.FechaRegistro = NOW();
CREATE TRIGGER tr_upD_Prod_all BEFORE INSERT ON DB_Producto FOR EACH ROW SET NEW.FechaRegistro = NOW();
CREATE TRIGGER tr_upD_NuDo_all BEFORE INSERT ON DB_NumeroDocumento FOR EACH ROW SET NEW.FechaRegistro = NOW();
