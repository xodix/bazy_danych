-- @block 1
SELECT Imie,
	Nazwisko
FROM dane_ankiet
WHERE Wiek < 25;
-- @block 2
SELECT Nazwisko,
	Imie,
	Wyksztalcenie,
	Wojewodztwo
From dane_ankiet
WHERE Wyksztalcenie = 'podstawowe'
	AND Wojewodztwo IN ('Lubuskie', 'Lubelskie');
-- @block 3
SELECT dane_ankiet.Imie,
	dane_ankiet.Nazwisko
FROM dane_ankiet
	INNER JOIN zainteresowania USING(id)
WHERE zainteresowania.zainteresowanie = 'matematyka';
-- @block 4
SELECT dane_ankiet.Imie,
	dane_ankiet.Nazwisko
FROM dane_ankiet
	INNER JOIN lokomocja on dane_ankiet.id = lokomocja.id_a
WHERE srod_lok = 'rower'
	AND pora_roku = 'wiosna';
-- @block 5