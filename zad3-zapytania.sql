USE Portal_Siatkarski1;
GO

-- Zapytanie1
-- Program sportowy chce wybraæ najlepszego zawodnika roku. 
-- ZnajdŸ 3 zawodników z najwiêksz¹ iloœci¹ zdobytych punktów w poprzednim roku.

SELECT TOP 3
    Imie,
    Nazwisko,
    SumaPunktow
FROM (
    SELECT
        Osoby.Imie,
        Osoby.Nazwisko,
        SUM(Statystyki.Zdobyte_punkty) AS SumaPunktow
    FROM
        Zawodnicy
    JOIN 
        Osoby ON Zawodnicy.ID_Zawodnika = Osoby.ID_osoby
    JOIN 
        Statystyki ON Zawodnicy.NR_Zwiazkowy = Statystyki.ID_Zawodnika
    JOIN 
        Reprezentacje ON Zawodnicy.ID_reprezentacji = Reprezentacje.ID_reprezentacji
    JOIN 
        Mecze ON (Reprezentacje.ID_reprezentacji = Mecze.ID_Pierwszej_Reprezentacji OR Reprezentacje.ID_reprezentacji = Mecze.ID_Drugiej_Reprezentacji)
    WHERE
        YEAR(Mecze.Data_rozgrywki) = YEAR(GETDATE()) - 1
    GROUP BY
        Osoby.Imie, 
		Osoby.Nazwisko
) AS ZawodnicySumaPunktow
ORDER BY
    SumaPunktow DESC;





-- Zapytanie 2
-- Program sportowy chce stworzyæ listê najgrubszych zawodników siatkówki. 
-- Sporz¹dŸ tabelê 10 zawodników z najwiêkszym wskaŸnikiem BMI (BMI = waga/wzrost^2).

DROP VIEW IF EXISTS WidokZawodnikowBMI;
GO

CREATE VIEW WidokZawodnikowBMI AS
SELECT
    Imie,
    Nazwisko,
    Waga,
    Wzrost,
    BMI AS MaxBMI
FROM (
    SELECT TOP 10
        Z.ID_Zawodnika,
        O.Imie,
        O.Nazwisko,
        Z.Waga,
        Z.Wzrost,
        Z.Waga / POWER(Z.Wzrost / 100.0, 2) AS BMI
    FROM
        Zawodnicy Z
    JOIN 
		Osoby O ON Z.ID_Zawodnika = O.ID_osoby
   
	GROUP BY
		Z.ID_Zawodnika, 
		O.Imie,
		O.Nazwisko,
        Z.Waga,
        Z.Wzrost
	 ORDER BY 
		BMI DESC
) AS Top10ZawodnicyBMI;

GO

SELECT * FROM WidokZawodnikowBMI;




-- Zapytanie 3
-- ¯eby podnieœæ na duchu kibiców Trefla Gdañsk po ostatniej druzgocz¹cej pora¿ce program sportowy chce pokazaæ najwiêksze klêski klubów siatkarskich. 
-- Jaki by³ set z najwiêksz¹ ró¿nic¹ punktów miêdzy dru¿ynami.

SELECT TOP 1
	MAX(S.Wynik_pierwszej_druzyny - S.Wynik_drugiej_druzyny) AS MaxRoznica,
	R1.Reprezentowany_kraj AS Reprezentacja_Pierwsza,
    S.Wynik_pierwszej_druzyny,
    R2.Reprezentowany_kraj AS Reprezentacja_Druga,
	S.Wynik_drugiej_druzyny,
	M.Data_rozgrywki,
	M.Lokalizacja
FROM
    Sety S
JOIN
    Mecze M ON S.ID_Meczu = M.ID_meczu
JOIN
    Reprezentacje R1 ON M.ID_Pierwszej_Reprezentacji = R1.ID_reprezentacji
JOIN
    Reprezentacje R2 ON M.ID_Drugiej_Reprezentacji = R2.ID_reprezentacji
WHERE
    S.Wynik_pierwszej_druzyny IS NOT NULL
    AND S.Wynik_drugiej_druzyny IS NOT NULL
GROUP BY
    S.Wynik_pierwszej_druzyny,
    S.Wynik_drugiej_druzyny,
    R1.Reprezentowany_kraj,
    R2.Reprezentowany_kraj,
	M.Data_rozgrywki,
	M.Lokalizacja
ORDER BY
    MaxRoznica DESC;



-- Zapytanie 4
-- W jakiej reprezentacji zawodnicy œrednio zdobywaj¹ najwiêcej punktów.
-- Modyfikacja: Portal sportowy chce sporz¹dziæ listê najlepszych reprezentacji w historii. 
--              Sporz¹dŸ listê 5 reprezentacji, których zawodnicy œrednio zdobywaj¹ najwiêcej punktów.

WITH ReprezentacjeSredniePunktyZawodnikow AS (
    SELECT
        Reprezentacje.Reprezentowany_kraj,
        AVG(ZawodnicySredniePunkty.Zdobyte_punkty) AS SredniaPunktow
    FROM
        Reprezentacje
    JOIN 
		Zawodnicy ON Reprezentacje.ID_Reprezentacji = Zawodnicy.ID_Reprezentacji
    JOIN (
        SELECT
            Zawodnicy.ID_Zawodnika,
            AVG(Statystyki.Zdobyte_punkty) AS Zdobyte_punkty
        FROM
            Zawodnicy
        JOIN 
			Statystyki ON Zawodnicy.NR_Zwiazkowy = Statystyki.ID_Zawodnika
        GROUP BY
            Zawodnicy.ID_Zawodnika
    ) AS ZawodnicySredniePunkty ON Zawodnicy.ID_Zawodnika = ZawodnicySredniePunkty.ID_Zawodnika
    GROUP BY
        Reprezentacje.Reprezentowany_kraj
)

SELECT TOP 5
    Reprezentowany_kraj,
    SredniaPunktow
FROM
    ReprezentacjeSredniePunktyZawodnikow
ORDER BY
    SredniaPunktow DESC;



-- Zapytanie 5
-- Podaj najni¿szy oraz najwy¿szy wzrost zawodników na pozycji libero
-- Modyfikacja: Magazyn sportowy przygotowuje artyku³ na temat pozycji "Libero". Powszechnie uwa¿ane jest, ¿e na tej pozycji graj¹ najni¿si gracze. Dziennikarz chce pokazaæ, 
--              ¿e nie zawsze jest to zgodne z prawd¹, dlatego chce dowiedzieæ siê, kto jest zawodnikiem o najni¿szym i najwy¿szym wzroœcie na tej pozycji.

SELECT    
	NajnizszyWzrost AS Wzrost,
    ImieNajnizszegoLibero AS Imie,
    NazwiskoNajnizszegoLibero AS Nazwisko
FROM
    (
        SELECT TOP 1
            Osoby.Imie AS ImieNajnizszegoLibero,
            Osoby.Nazwisko AS NazwiskoNajnizszegoLibero,
            Zawodnicy.Wzrost AS NajnizszyWzrost
        FROM
            Zawodnicy
        JOIN 
            Osoby ON Zawodnicy.ID_Zawodnika = Osoby.ID_osoby
        JOIN
            Pozycje ON Pozycje.ID_Pozycji_Zawodnika = Zawodnicy.ID_Pozycji
        WHERE
            Pozycje.Pozycja = 'Libero'
        ORDER BY
            Zawodnicy.Wzrost ASC
    ) AS NajnizszyLibero

UNION ALL

SELECT	
	NajwyzszyWzrost AS Wzrost,
    ImieNajwyzszegoLibero AS Imie,
    NazwiskoNajwyzszegoLibero AS Nazwisko
    
FROM
    (
        SELECT TOP 1
            Osoby.Imie AS ImieNajwyzszegoLibero,
            Osoby.Nazwisko AS NazwiskoNajwyzszegoLibero,
            Zawodnicy.Wzrost AS NajwyzszyWzrost
        FROM
            Zawodnicy
        JOIN 
            Osoby ON Zawodnicy.ID_Zawodnika = Osoby.ID_osoby
        JOIN
            Pozycje ON Pozycje.ID_Pozycji_Zawodnika = Zawodnicy.ID_Pozycji
        WHERE
            Pozycje.Pozycja = 'Libero'
        ORDER BY
            Zawodnicy.Wzrost DESC
    ) AS NajwyzszyLibero;







-- Zapytanie 6
-- Wymieñ top 5 trenerów odpowiedzialnych za reprezentacjê z najwiêksz¹ iloœci¹ zwyciêstw.
-- Modyfikacja: Portal sportowy chce sporz¹dziæ ranking trenerów reprezentacji, które aktualnie maj¹ najwiêcej zwyciêstw. 


SELECT TOP 5
    Osoby.Imie AS ImieTrenera,
    Osoby.Nazwisko AS NazwiskoTrenera,
    Reprezentacje.Reprezentowany_kraj AS KrajReprezentacji,
    COUNT(R.ID_Wygranej_Reprezentacji) AS LiczbaZwyciestw
FROM
    (
        SELECT
            CASE
                WHEN ZwyciestwoPierwszejDruzyny >= 3 THEN ID_Pierwszej_Reprezentacji
                WHEN ZwyciestwoDrugiejDruzyny >= 3 THEN ID_Drugiej_Reprezentacji
            END AS ID_Wygranej_Reprezentacji
        FROM
            (
                SELECT
                    Sety.ID_Meczu,
                    ID_Pierwszej_Reprezentacji,
                    ID_Drugiej_Reprezentacji,
                    SUM(CASE WHEN Sety.Wynik_pierwszej_druzyny > Sety.Wynik_drugiej_druzyny THEN 1 ELSE 0 END) AS ZwyciestwoPierwszejDruzyny,
                    SUM(CASE WHEN Sety.Wynik_pierwszej_druzyny < Sety.Wynik_drugiej_druzyny THEN 1 ELSE 0 END) AS ZwyciestwoDrugiejDruzyny
                FROM
                    Mecze
                JOIN 
                    Sety ON Mecze.ID_meczu = Sety.ID_Meczu
                GROUP BY
                    Sety.ID_Meczu, ID_Pierwszej_Reprezentacji, ID_Drugiej_Reprezentacji
            ) AS WynikiMeczow
        WHERE
            ZwyciestwoPierwszejDruzyny >= 3 OR ZwyciestwoDrugiejDruzyny >= 3
    ) AS R
JOIN 
    Reprezentacje ON R.ID_Wygranej_Reprezentacji = Reprezentacje.ID_Reprezentacji
JOIN 
    Trenerzy ON Trenerzy.ID_Reprezentacji = Reprezentacje.ID_Reprezentacji
JOIN 
    Osoby ON Trenerzy.ID_trenera = Osoby.ID_osoby
GROUP BY
    Osoby.Imie, 
	Osoby.Nazwisko, 
	Reprezentacje.Reprezentowany_kraj
ORDER BY
    LiczbaZwyciestw DESC;



-- ZAPYTANIE 7
-- Portal sportowy chce opublikowaæ artyku³ o najbardziej nagrodzonej reprezentacji ubieg³ej dekady. 
-- W tym celu sporz¹dŸ listê zawodników, którzy s¹ aktualnie czêœci¹ reprezentacji, która zdoby³a najwiêcej osi¹gniêæ od roku 2014.

SELECT
    Osoby.Imie AS ImieZawodnika,
    Osoby.Nazwisko AS NazwiskoZawodnika,
    R.Reprezentowany_kraj,
    COUNT(O.ID_osi¹gniêcia) AS LiczbaOsiagniecReprezentacji
FROM
    Reprezentacje R
JOIN 
	Osiagniecia O ON R.ID_Reprezentacji = O.ID_Wyró¿nionej_Reprezentacji
JOIN 
	Zawodnicy Z ON R.ID_reprezentacji = Z.ID_Reprezentacji
JOIN 
	Osoby ON Z.ID_Zawodnika = Osoby.ID_osoby
GROUP BY
    Z.ID_Zawodnika, 
	Osoby.ID_Osoby, 
	R.ID_Reprezentacji, 
	R.Reprezentowany_kraj, 
	Osoby.Imie, 
	Osoby.Nazwisko
ORDER BY
    LiczbaOsiagniecReprezentacji DESC;





-- ZAPYTANIE 8
-- Analitycy sportowi chc¹ dowiedzieæ siê, ile ³¹cznie czasu na boisku spêdzono podczas konkretnych wydarzeñ sportowych , aby z jak najwiêksz¹ precyzj¹ rozplanowaæ nastêpne harmonogramy 
-- imprez siatkarskich. W tym celu zwrócili siê do administratorów bazy danych z proœb¹ o sporz¹dzenie zestawienia 5 wydarzeñ z najwiêksz¹ sum¹ czasu wszystkich rozegranych setów.

SELECT TOP 5
    Wydarzenia.ID_wydarzenia AS ID_Wydarzenia,
    Wydarzenia.Nazwa_wydarzenia,
    SumaCzasu
FROM (
    SELECT
        ID_Wydarzenia,
        SUM(CzasSetu) AS SumaCzasu
    FROM (
        SELECT
            Mecze.ID_Meczu,
            ID_Wydarzenia,
            DATEDIFF(MINUTE, Sety.Godzina_rozpoczecia, Sety.Godzina_zakonczenia) AS CzasSetu
        FROM
            Mecze
        JOIN 
			Sety ON Mecze.ID_Meczu = Sety.ID_Meczu
    ) AS CzasTrwaniaSetu
    GROUP BY
        ID_Wydarzenia
) AS SumaCzasuWydarzen
JOIN 
	Wydarzenia ON SumaCzasuWydarzen.ID_Wydarzenia = Wydarzenia.ID_wydarzenia
ORDER BY
    SumaCzasu DESC;



-- ZAPYTANIE 9
-- Magazyn sportowy chce napisaæ artyku³ o najlepszych blokuj¹cych w historii. Sporz¹dŸ zestawienie 3 graczy, którzy zdobyli najwiêcej punktów blokiem w ca³ej swojej karierze.

DROP VIEW IF EXISTS NajlepsiBlokujacy;
GO

CREATE VIEW NajlepsiBlokujacy AS
SELECT TOP 3
    Osoby.Imie AS ImieZawodnika,
    Osoby.Nazwisko AS NazwiskoZawodnika,
    SUM(S.Bloki) AS SumaBlokow
FROM
	dbo.Osoby -- Adjust the schema if necessary
JOIN
    Zawodnicy Z ON Osoby.ID_osoby = Z.ID_Zawodnika
JOIN
    Statystyki S ON Z.NR_Zwiazkowy = S.ID_Zawodnika
GROUP BY
    Osoby.Imie, Osoby.Nazwisko
ORDER BY
    SumaBlokow DESC;
GO

SELECT * FROM NajlepsiBlokujacy;