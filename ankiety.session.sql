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
-- @block tworzenie_urzytkownikow
CREATE User `kadrowa`;
CREATE User `ksiegowa`;
CREATE USER `magazynier`;
CREATE USER `informatyk`;
CREATE USER `prezes`;
-- @block nadawanie_uprawnien
Grant All ON firma_2.pracownicy TO `kadrowa`;
GRANT SELECT on firma_2.place to `kadrowa`;