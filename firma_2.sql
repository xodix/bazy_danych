-- @block tworzenie_tabel
CREATE TABLE `firma_2`.`pracownicy` (
	`id_pracownika` INT NOT NULL AUTO_INCREMENT,
	`nazwisko` VARCHAR(100) NOT NULL,
	`imie` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id_pracownika`)
);
CREATE TABLE `firma_2`.`place` (
	`id_pracownika` INT NOT NULL,
	`pensja` INT NOT NULL COMMENT 'Liczba PLN w groszach',
	`dodatki` INT NOT NULL COMMENT 'Liczba PLN w groszach',
	PRIMARY KEY (`id_pracownika`)
);
CREATE TABLE `firma_2`.`magazyn` (
	`id_towaru` INT NOT NULL AUTO_INCREMENT,
	`nazwa` VARCHAR(1000) NOT NULL,
	`cena` INT NOT NULL COMMENT 'Cena w groszach',
	`liczba_sztuk` INT NOT NULL,
	PRIMARY KEY (`id_towaru`)
);
-- @block tworzenie_użytkownikow
CREATE User `kadrowa`;
CREATE User `ksiegowa`;
CREATE USER `magazynier`;
CREATE USER `informatyk`;
CREATE USER `prezes`;
-- @block nadawanie_uprawnień
Grant ALL ON firma_2.pracownicy TO `kadrowa`;
GRANT SELECT on firma_2.place TO `kadrowa`;
GRANT SELECT ON firma_2.pracownicy TO `ksiegowa`;
GRANT ALL ON firma_2.place TO `ksiegowa`;
GRANT SELECT ON firma_2.magazyn TO `ksiegowa`;
GRANT ALL ON firma_2.magazyn TO `magazynier`;
Grant ALL ON firma_2.* TO `informatyk` WITH
GRANT OPTION;
GRANT SELECT ON firma_2.* TO `prezes`;