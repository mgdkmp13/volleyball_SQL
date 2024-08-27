USE Portal_Siatkarski1;
GO

-- Zapytanie1
-- Program sportowy chce wybra� najlepszego zawodnika roku. 
-- Znajd� 3 zawodnik�w z najwi�ksz� ilo�ci� zdobytych punkt�w w poprzednim roku.

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
-- Program sportowy chce stworzy� list� najgrubszych zawodnik�w siatk�wki. 
-- Sporz�d� tabel� 10 zawodnik�w z najwi�kszym wska�nikiem BMI (BMI = waga/wzrost^2).

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
-- �eby podnie�� na duchu kibic�w Trefla Gda�sk po ostatniej druzgocz�cej pora�ce program sportowy chce pokaza� najwi�ksze kl�ski klub�w siatkarskich. 
-- Jaki by� set z najwi�ksz� r�nic� punkt�w mi�dzy dru�ynami.

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
-- W jakiej reprezentacji zawodnicy �rednio zdobywaj� najwi�cej punkt�w.
-- Modyfikacja: Portal sportowy chce sporz�dzi� list� najlepszych reprezentacji w historii. 
--              Sporz�d� list� 5 reprezentacji, kt�rych zawodnicy �rednio zdobywaj� najwi�cej punkt�w.

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
-- Podaj najni�szy oraz najwy�szy wzrost zawodnik�w na pozycji libero
-- Modyfikacja: Magazyn sportowy przygotowuje artyku� na temat pozycji "Libero". Powszechnie uwa�ane jest, �e na tej pozycji graj� najni�si gracze. Dziennikarz chce pokaza�, 
--              �e nie zawsze jest to zgodne z prawd�, dlatego chce dowiedzie� si�, kto jest zawodnikiem o najni�szym i najwy�szym wzro�cie na tej pozycji.

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
-- Wymie� top 5 trener�w odpowiedzialnych za reprezentacj� z najwi�ksz� ilo�ci� zwyci�stw.
-- Modyfikacja: Portal sportowy chce sporz�dzi� ranking trener�w reprezentacji, kt�re aktualnie maj� najwi�cej zwyci�stw. 


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
-- Portal sportowy chce opublikowa� artyku� o najbardziej nagrodzonej reprezentacji ubieg�ej dekady. 
-- W tym celu sporz�d� list� zawodnik�w, kt�rzy s� aktualnie cz�ci� reprezentacji, kt�ra zdoby�a najwi�cej osi�gni�� od roku 2014.

SELECT
    Osoby.Imie AS ImieZawodnika,
    Osoby.Nazwisko AS NazwiskoZawodnika,
    R.Reprezentowany_kraj,
    COUNT(O.ID_osi�gni�cia) AS LiczbaOsiagniecReprezentacji
FROM
    Reprezentacje R
JOIN 
	Osiagniecia O ON R.ID_Reprezentacji = O.ID_Wyr�nionej_Reprezentacji
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
-- Analitycy sportowi chc� dowiedzie� si�, ile ��cznie czasu na boisku sp�dzono podczas konkretnych wydarze� sportowych , aby z jak najwi�ksz� precyzj� rozplanowa� nast�pne harmonogramy 
-- imprez siatkarskich. W tym celu zwr�cili si� do administrator�w bazy danych z pro�b� o sporz�dzenie zestawienia 5 wydarze� z najwi�ksz� sum� czasu wszystkich rozegranych set�w.

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
-- Magazyn sportowy chce napisa� artyku� o najlepszych blokuj�cych w historii. Sporz�d� zestawienie 3 graczy, kt�rzy zdobyli najwi�cej punkt�w blokiem w ca�ej swojej karierze.

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