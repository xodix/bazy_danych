-- @block tworzenie_tabel
CREATE TABLE `sklep_2`.`dostawcy` (
	`id_dostawcy` INT NOT NULL AUTO_INCREMENT,
	`adres` VARCHAR NOT NULL,
	`telefon` INT NOT NULL,
	PRIMARY KEY (`id_dostawcy`)
);
CREATE TABLE `sklep_2`.`towary` (
	`id_towaru` INT NOT NULL AUTO_INCREMENT,
	`id_dostawcy` INT NOT NULL,
	`nazwa` VARCHAR(100) NOT NULL,
	`cena` INT NOT NULL COMMENT 'cena w groszach',
	PRIMARY KEY (`id_towaru`),
	INDEX `id_dostawcy` (`id_dostawcy`)
);
CREATE TABLE `sklep_2`.`magazyn` (
	`id_towaru` INT NOT NULL,
	`liczba_sztuk` INT NOT NULL,
	INDEX `id_towaru` (`id_towaru`)
);
-- @block tworzenie_użytkowników
CREATE USER `handlowiec1`;
CREATE USER `handlowiec2`;
CREATE USER `informatyk`;
CREATE USER `prezes`;
-- @block nadawanie_uprawnień
GRANT SELECT ON sklep_2.dostawcy TO `handlowiec1`;
GRANT SELECT ON sklep_2.towary TO `handlowiec1`;
GRANT All ON sklep_2.magazyn TO `handlowiec1`;
GRANT SELECT ON sklep_2.dostawcy TO `handlowiec2`;
GRANT SELECT ON sklep_2.towary TO `handlowiec2`;
GRANT All ON sklep_2.magazyn TO `handlowiec2`;
GRANT ALL ON sklep_2.* TO `informatyk` WITH
GRANT OPTION;
GRANT All ON sklep_2.dostawcy TO `prezes`;
GRANT All ON sklep_2.towary TO `prezes`;
GRANT SELECT ON sklep_2.magazyn TO `prezes`;