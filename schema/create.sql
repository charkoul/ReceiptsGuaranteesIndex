CREATE SCHEMA `receiptsdb` DEFAULT CHARACTER SET greek ;

CREATE TABLE `receiptsdb`.`users` (
  `idUsers` INT NOT NULL,
  `FirstName` VARCHAR(250) NULL,
  `LastName` VARCHAR(250) NULL,
  `Email` VARCHAR(250) NULL,
  PRIMARY KEY (`idUsers`));
  
CREATE TABLE `shops` (
  `idShops` int(11) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idShops`)
) ENGINE=InnoDB DEFAULT CHARSET=greek
  
  
  CREATE TABLE `receiptsdb`.`shopcategories` (
  `idShopCategories` INT NOT NULL,
  `Description` VARCHAR(250) NULL,
  PRIMARY KEY (`idShopCategories`));
 
ALTER TABLE `receiptsdb`.`shops` 
ADD CONSTRAINT `categoryFK`
  FOREIGN KEY (`CategoryId`)
  REFERENCES `receiptsdb`.`shopcategories` (`idShopCategories`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  CREATE TABLE `receiptsdb`.`filelocator` (
  `idFileLocator` INT NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idFileLocator`));
  
  CREATE TABLE `receiptsdb`.`receipts` (
  `IdReceipts` INT NOT NULL,
  `Shop` INT NOT NULL,
  `User` INT NOT NULL,
  `PurchaseDate` DATETIME NOT NULL,
  `FileLocation` VARCHAR(500) NOT NULL,
  `Locator` INT NOT NULL,
  `GuaranteeExperationDate` DATETIME NOT NULL,
  `YearsOfGuarantee` INT NOT NULL,
  `PurchaseItems` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`IdReceipts`));
  
  
  ALTER TABLE `receiptsdb`.`receipts` 
ADD CONSTRAINT `ShopFK`
  FOREIGN KEY (`Shop`)
  REFERENCES `receiptsdb`.`shops` (`idShops`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `UserFK`
  FOREIGN KEY (`User`)
  REFERENCES `receiptsdb`.`users` (`idUsers`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `LocatorFK`
  FOREIGN KEY (`Locator`)
  REFERENCES `receiptsdb`.`filelocator` (`idFileLocator`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;