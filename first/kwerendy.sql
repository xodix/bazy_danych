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
SELECT Wojewodztwo,
	COUNT(*)
FROM dane_ankiet
Group By Wojewodztwo;
-- @block 6
Select Wyksztalcenie,
	AVG(Dochod)
FROM dane_ankiet
GROUP BY Wyksztalcenie;
-- @block 7
Select Wojewodztwo,
	MAX(Dochod) as najwyzszy
FROM dane_ankiet
Group By Wojewodztwo
HAVING najwyzszy > 5000;
-- @block 8
SELECT COUNT(*)
FROM zainteresowania
	INNER JOIN lokomocja on zainteresowania.id = lokomocja.id_a
WHERE zainteresowania.zainteresowanie = 'matematyka'
	AND lokomocja.srod_lok = 'autobus'
	AND lokomocja.pora_roku = 'jesien';
-- @block 9
SELECT COUNT(*) as kobiety,
	(la.l - COUNT(*)) as mezczyzni
FROM dane_ankiet,
	(
		SELECT COUNT(*) as l
		FROM dane_ankiet
	) as la
WHERE Imie LIKE '%a';
-- @block 10
SELECT lokomocja.srod_lok,
	dane_ankiet.Wojewodztwo,
	COUNT(dane_ankiet.id)
FROM lokomocja
	Inner join dane_ankiet on lokomocja.id_a = dane_ankiet.id
WHERE dane_ankiet.Wojewodztwo = 'Mazowieckie'
	AND lokomocja.pora_roku = 'lato'
GROUP BY lokomocja.srod_lok;
-- @block 11
SELECT COUNT(*),
	Wojewodztwo
FROM dane_ankiet
GROUP BY Wojewodztwo
HAVING COUNT(*) > 20;
-- @block 12
SELECT DISTINCT id,
	Imie,
	Nazwisko,
	Wojewodztwo,
	zainteresowanie,
	wyksztalcenie,
	Wiek
FROM dane_ankiet
	INNER JOIN zainteresowania USING(id)
WHERE Wiek > 50
	AND Wyksztalcenie IN ('wyzsze', 'srednie')
	AND zainteresowanie NOT IN ('informatyka', 'gry komputerowe')
ORDER BY Nazwisko;
-- @block 13
SeLECT AVG(Dochod) as srednia_dochodu
from dane_ankiet
	INNER join lokomocja ON dane_ankiet.id = lokomocja.id_a
WHERE Imie LIKE '%a'
	AND Wojewodztwo = 'Zachodniopomorskie'
	AND srod_lok = 'rower'