USE Portal_Siatkarski1;

-- Osoby
INSERT INTO Osoby(Imie, Nazwisko, Kraj_pochodzenia, Data_urodzenia, Poczatek_kariery, Koniec_kariery, Liczba_meczow, Data_smierci, Plec) 
VALUES
( 'Bartosz', 'Kurek', 'Polska', '1988-04-17', 2007, NULL, 284, NULL, 'M'),
( 'Wilfredo', 'Leon', 'Kuba', '1993-07-31', 2019, NULL, 70, NULL, 'M'),
( 'Piotr', 'Nowakowski', 'Polska', '1987-12-18', 2008, 2022, 230, NULL, 'M'),
( 'Aleksander', '�liwka', 'Polska', '1995-05-24', 2015, NULL, 103, NULL, 'M'),
( 'Pawel', 'Zatorski', 'Polska', '1990-06-21', 2009, NULL, 250, NULL, 'M'),
( 'Marcin', 'Janusz', 'Polska', '1994-07-31', 2012, NULL, 90, NULL, 'M'),
( 'Jakub', 'Kochanowski', 'Polska', '1997-07-17', 2017, NULL, 77, NULL, 'M'),
( 'Elena', 'Garcia', 'Hiszpania', '1990-11-30', 2010, NULL, 120, NULL, 'F'),
( 'Yuki', 'Tanaka', 'Japonia', '1988-02-18', 2002, 2018, 180, '2018-06-10', 'M'),
( 'Anna', 'Domaradzka', 'Polska', '1995-07-12', 2015, NULL, 90, NULL, 'F'),
( 'Ahmed', 'Rashid', 'Egipt', '1983-09-05', 2003, NULL, 110, NULL, 'M'),
( 'Mia', 'Johnson', 'Australia', '1998-04-25', 2017, NULL, 60, NULL, 'F'),
( 'Carlos', 'Lopez', 'Argentyna', '1987-06-03', 2007, NULL, 140, NULL, 'M'),
( 'Sophie', 'Dupont', 'Francja', '1994-01-14', 2013, NULL, 75, NULL, 'F'),
( 'Mateusz', 'Nowak', 'Polska', '1985-08-20', 2003, NULL, 350, NULL, 'M'),
( 'Elena', 'Kovacs', 'W�gry', '1990-03-15', 2008, 2019, 220, NULL, 'F'),
( 'Andreas', 'M�ller', 'Niemcy', '1988-12-02', 2005, 2017, 280, NULL, 'M'),
( 'Alessia', 'Ricci', 'W�ochy', '1992-06-28', 2010, 2022, 180, NULL, 'F'),
( 'Nikolai', 'Ivanov', 'Rosja', '1987-02-10', 2006, 2018, 320, NULL, 'M'),
( 'Katarzyna', 'Nowakowska', 'Polska', '1990-09-22', 2008, NULL, 220, NULL, 'F'),
( 'Ivan', 'Petrov', 'Rosja', '1985-05-14', 2007, 2019, 180, '2020-02-01', 'M'),
( 'Sophia', 'Gomez', 'Hiszpania', '1993-11-08', 2012, NULL, 150, NULL, 'F'),
( 'Takashi', 'Yamamoto', 'Japonia', '1987-03-30', 2005, NULL, 200, NULL, 'M'),
( 'Alice', 'Smith', 'Kanada', '1992-08-22', 2012, NULL, 80, NULL, 'F'),

('Jan', 'Kowalski', 'Polska', '1980-01-15', 1998, 2015, 300, NULL, 'M'),
('Luisa', 'Martinez', 'Hiszpania', '1985-04-20', 2003, 2019, 250, NULL, 'F'),
('Tomasz', 'Nowak', 'Polska', '1982-09-10', 2000, 2018, 280, NULL, 'M'),
('Svetlana', 'Ivanova', 'Rosja', '1983-12-05', 2001, 2017, 200, NULL, 'F'),
('Marek', 'W�jcik', 'Polska', '1978-07-28', 1996, 2014, 320, NULL, 'M'),
('Ewa', 'Kowalczyk', 'Polska', '1984-06-14', 2002, 2020, 180, NULL, 'F'),
('Rafal', 'Lis', 'Polska', '1981-03-02', 1999, 2016, 270, NULL, 'M'),
('Catherine', 'Johnson', 'Australia', '1986-11-18', 2004, 2021, 210, NULL, 'F'),
('Antoni', 'Sokolowski', 'Polska', '1975-09-08', 1993, 2010, 350, NULL, 'M'),
('Maria', 'Garcia', 'Hiszpania', '1983-05-30', 2001, 2018, 190, NULL, 'F'),
('Jacek', 'Wrobel', 'Polska', '1980-12-12', 1998, 2015, 280, NULL, 'M'),
('Hiroshi', 'Tanaka', 'Japonia', '1976-04-25', 1994, 2012, 230, NULL, 'M'),
('Olga', 'Kovaleva', 'Rosja', '1984-08-17', 2002, 2019, 180, NULL, 'F'),
('Krzysztof', 'Lewandowski', 'Polska', '1979-02-03', 1997, 2014, 300, NULL, 'M'),
('Monika', 'Novak', 'Polska', '1986-06-28', 2004, 2021, 220, NULL, 'F'),
('Adam', 'Kaminski', 'Polska', '1982-11-10', 2000, 2017, 260, NULL, 'M'),
('Laura', 'Rossi', 'W�ochy', '1987-03-15', 2005, 2022, 190, NULL, 'F'),
('Marek', 'Pawlak', 'Polska', '1977-09-22', 1995, 2013, 310, NULL, 'M'),
('Ewelina', 'Nowakowska', 'Polska', '1983-10-18', 2001, 2018, 200, NULL, 'F'),
('Daniel', 'Lopez', 'Hiszpania', '1976-05-12', 1994, 2012, 240, NULL, 'M');

-- Reprezentacje
INSERT INTO Reprezentacje(Reprezentowany_kraj)
VALUES
( 'Polska'),
( 'Kanada'),
( 'Brazylia'),
( 'Hiszpania'),
( 'Japonia'),
( 'Stany Zjednoczone'),
( 'Egipt'),
( 'Australia'),
( 'Argentyna'),
( 'Chiny'),
( 'Niemcy'),
( 'Holandia'),
( 'Serbia'),
( 'S�owenia'),
( 'Kuba'),
( 'Turcja'),
( 'Ukraina'),
( 'Belgia'),
( 'Czechy'),
( 'Bu�garia');


-- Pozycje
INSERT INTO Pozycje(ID_Pozycji_Zawodnika, Pozycja)
VALUES
(1,'Rozgrywaj�cy'),
(2,'Przyjmuj�cy'),
(3,'Atakuj�cy'),
(4,'�rodkowy'),
(5,'Libero');




-- Zawodnicy
INSERT INTO Zawodnicy(NR_Zwiazkowy, ID_Pozycji, Nr_koszulki, Waga, Wzrost, ID_Zawodnika, ID_Reprezentacji)
VALUES
(1234, 3, 6, 85.0, 205.0, 1, 1),
(1235, 2, 9, 79.2, 186.3, 2, 1),
(1236, 4, 5, 82.0, 188.0, 3, 1),
(1237, 2, 8, 79.2, 186.3, 4, 1),
(1238, 5, 2, 80.5, 183.0, 5, 1),
(1239, 1, 7, 78.2, 181.3, 6,1),
(1240, 4, 4, 82.0, 188.0, 7, 1),
(1241, 3, 9, 88.5, 195.0, 8, 5),
(1242, 3, 6, 75.0, 180.0, 9, 6),
(1243, 4, 3, 79.5, 187.0, 10, 7),
(1244, 1, 10, 87.0, 192.0, 11, 8),
(1245, 3, 12, 91.2, 200.0,12, 9),
(1246, 5, 1, 65.8, 170.0, 13, 10),
(1247, 2, 4, 79.2, 186.3, 14, 11),
(1248, 4, 4, 91.0, 204.0, 15, 12),
(1249, 3, 9, 88.5, 197.0, 16, 13),
(1250, 3, 6, 75.0, 198.5, 17, 14),
(1251, 5, 1, 68.8, 171.0, 18, 15),
(1252, 2, 4, 80.2, 182.5, 19, 16),
(1253, 3, 6, 89.3, 199.4, 20, 17),
(1254, 5, 2, 74.5, 175.0, 21, 18),
(1255, 3, 7, 90.6, 196.7, 22, 19),
(1256, 4, 4, 91.7, 200.4, 23, 20);


-- Trenerzy
INSERT INTO Trenerzy(Wyksztalcenie, Lata_doswiadczenia, ID_trenera, ID_Reprezentacji) 
VALUES
('Doktorat w Nauce o Sporcie', 20, 24, 1),
('Magister Trenerski w Dziedzinie Psychologii Sportu', 15, 25, 2),
('Licencjat w Anatomii i Fizjologii Sportu', 10, 26, 3),
('Doktorat w Zarz�dzaniu Sportem i Rekreacj�', 18, 27, 4),
('Magister Sztuki Trenerskiej w Technologii Sportowej', 12, 28, 5),
('In�ynieria Biomedyczna w Kontek�cie Siatk�wki', 8, 29, 6),
('Licencjat w Komunikacji i Motywacji Sportowej', 14, 30, 7),
('Doktorat w Pedagogice Ruchu i Rozwoju Sportowego', 16, 31, 8),
('Magister Fizjoterapii Sportowej', 10, 32, 9),
('Licencjat w Naukach o �ywieniu w Sporcie', 13, 33, 10),
('Doktorat w Rozwoju Umiej�tno�ci Zespo�owych w Siatk�wce', 20, 34, 11),
('Magister In�ynierii Materia�owej w Sprz�cie Sportowym', 14, 35, 12),
('Licencjat w Teorii i Praktyce Taktyki Siatkarskiej', 10, 36, 13),
('Doktorat w Psychologii Kondycji Mentalnej Zawodnika', 13, 37, 14),
('Magister Sztuki Szkolenia Motorycznego w Sportach Zespo�owych', 18, 38, 15),
('Licencjat w Projektowaniu Program�w Treningowych dla Dzieci', 7, 39, 16),
('Doktorat w Naukach o Zdrowiu i Bezpiecze�stwie w Siatk�wce', 15, 40, 17),
('Magister Architektury Obiekt�w Sportowych i Ich Ergonomii', 19, 41, 18),
('Licencjat w Technologii Videoanalizy Meczowej', 6, 42, 19),
('Doktorat w Dydaktyce i Metodologii Nauczania Technik Siatk�wki', 15, 43, 20);

-- Wydarzenia
INSERT INTO Wydarzenia(Nazwa_wydarzenia, Poczatek_wydarzenia, Koniec_wydarzenia) 
VALUES
( 'Mistrzostwa �wiata', '2023-01-01', '2022-01-15'),
( 'Igrzyska Olimpijskie', '2022-02-01', '2022-02-10'),
( 'Puchar Kontynentalny', '2022-03-01', '2022-03-10'),
( 'Wielki Szlem', '2022-04-01', '2022-04-07'),
( 'Mistrzostwa Europy', '2022-05-01', '2022-05-15'),
( 'Puchar Azji', '2022-06-01', '2022-06-10'),
( 'Igrzyska Ameryki Po�udniowej', '2022-07-01', '2022-07-15'),
( 'Puchar Narod�w Afryki', '2023-08-01', '2022-08-10'),
( 'Pacyficzne Mistrzostwa', '2023-09-01', '2023-09-15'),
( 'Liga Narod�w', '2023-07-01', '2023-08-10'),
( 'Mistrzostwa Europy', '2023-04-02', '2023-05-03'),
( 'Igrzyska Olimpijskie', '2023-02-05', '2023-02-11'),
( 'Puchar Kontynentalny', '2023-05-07', '2023-05-21'),
( 'Memoria� Nowakowskiego', '2023-10-10', '2023-11-07'),
( 'Mistrzostwa Ameryki P�nocnej', '2023-06-02', '2023-06-29'),
( 'Puchar Europy Wschodniej', '2023-11-12', '2023-11-30'),
( 'Igrzyska Narodowe', '2023-09-13', '2023-10-14'),
( 'Liga Europejska', '2023-02-17', '2023-03-10'),
( 'Kwalifikacje do Igrzysk Olimpijskich', '2023-09-23', '2023-09-19'),
( 'Puchar Amryki Po�udniowej', '2023-08-26', '2022-09-12');


-- Mecze
INSERT INTO Mecze(Data_rozgrywki, Lokalizacja, ID_Pierwszej_Reprezentacji, ID_Drugiej_Reprezentacji, ID_Wydarzenia) 
VALUES
( '2022-01-05', 'Nowy Jork', 1, 2, 1),
( '2022-02-05', 'Toronto', 2, 3, 2),
( '2022-03-05', 'Rio de Janeiro', 3, 1, 3),
( '2022-04-10', 'Pary�', 15, 5, 4),
( '2022-05-15', 'Tokio', 5, 6, 5),
( '2022-06-20', 'Pekin', 6, 12, 6),
( '2022-07-25', 'Buenos Aires', 14, 8, 7),
( '2022-08-30', 'Kair', 8, 9, 8),
( '2022-09-05', 'Sydney', 9, 10, 9),
( '2023-10-10', 'Montreal', 10, 1, 10),
( '2023-01-05', 'Nowy Jork', 1, 2, 1),
( '2023-02-05', 'Toronto', 2, 3, 2),
( '2023-03-05', 'Rio de Janeiro', 3, 1, 3),
( '2023-04-10', 'Pary�', 16, 5, 4),
( '2023-05-15', 'Tokio', 5, 6, 5),
( '2023-06-20', 'Pekin', 6, 13, 6),
( '2023-07-25', 'Buenos Aires', 7, 8, 7),
( '2023-08-30', 'Kair', 8, 9, 8),
( '2023-09-05', 'Sydney', 9, 10, 9),
( '2023-10-10', 'Montreal', 10, 1, 10);

-- Sety
INSERT INTO Sety(Godzina_rozpoczecia, Godzina_zakonczenia, Wynik_pierwszej_druzyny, Wynik_drugiej_druzyny, ID_Meczu) 
VALUES
( '12:00:00', '13:30:00', 25, 20, 1),
( '14:00:00', '15:45:00', 22, 25, 1),
( '16:30:00', '16:48:00', 26, 24, 1),
( '18:15:00', '19:40:00', 25, 21, 1),
( '20:00:00', '21:22:00', 25, 23, 2),
( '11:45:00', '12:30:00', 25, 18, 2),
( '13:00:00', '14:15:00', 24, 26, 2),
( '15:30:00', '15:55:00', 21, 25, 2),
( '16:45:00', '17:10:00', 15, 9, 2),
( '18:30:00', '19:45:00', 25, 22, 3),
( '20:15:00', '21:00:00', 25, 20, 3),
( '12:30:00', '13:15:00', 26, 24, 3),
( '14:45:00', '15:20:00', 21, 25, 4),
( '16:00:00', '16:25:00', 25, 20, 4),
( '17:15:00', '17:40:00', 23, 25, 4),
( '18:50:00', '19:15:00', 25, 18, 4),
( '20:30:00', '21:10:00', 15, 12, 4),
( '12:15:00', '13:00:00', 25, 27, 5),
( '13:30:00', '13:55:00', 21, 25, 5),
( '15:00:00', '16:20:00', 22, 25, 5),
( '10:00:00', '11:30:00', 25, 20, 6),
( '11:45:00', '13:15:00', 22, 25, 6),
( '14:30:00', '15:15:00', 26, 24, 6),
( '16:00:00', '17:25:00', 25, 21, 6),
( '18:30:00', '19:52:00', 25, 23, 7),
( '20:15:00', '21:00:00', 25, 18, 7),
( '12:45:00', '13:30:00', 24, 26, 7),
( '14:00:00', '15:15:00', 21, 25, 7),
( '15:30:00', '15:55:00', 15, 9, 7),
( '16:45:00', '17:10:00', 25, 22, 8),
( '18:30:00', '19:45:00', 25, 20, 8),
( '20:15:00', '21:00:00', 26, 24, 8),
( '12:30:00', '13:05:00', 21, 25, 9),
( '14:00:00', '14:25:00', 25, 20, 9),
( '15:30:00', '15:55:00', 23, 25, 9),
( '17:00:00', '17:25:00', 25, 18, 9),
( '18:45:00', '19:25:00', 15, 12, 9),
( '20:30:00', '21:10:00', 25, 27, 10),
( '12:15:00', '13:00:00', 21, 25, 10),
( '13:30:00', '13:55:00', 22, 25, 10),
( '15:00:00', '16:20:00', 25, 20, 11),
( '10:30:00', '11:15:00', 22, 25, 11),
( '12:00:00', '13:15:00', 26, 24, 11),
( '14:30:00', '15:45:00', 25, 23, 11),
( '16:00:00', '16:25:00', 25, 20, 12),
( '17:15:00', '17:40:00', 25, 21, 12),
( '18:50:00', '19:15:00', 25, 18, 12),
( '20:30:00', '21:10:00', 22, 25, 13),
( '12:15:00', '13:00:00', 25, 27, 13),
( '13:30:00', '13:55:00', 24, 25, 13),
( '15:00:00', '16:20:00', 25, 20, 14),
( '10:45:00', '11:30:00', 25, 19, 14),
( '12:30:00', '13:15:00', 26, 24, 14),
( '14:45:00', '15:20:00', 21, 25, 15),
( '16:00:00', '16:25:00', 25, 20, 15),
( '17:15:00', '17:40:00', 23, 25, 15),
( '18:50:00', '19:15:00', 19, 25, 15),
( '20:30:00', '21:10:00', 25, 13, 16),
( '12:15:00', '13:00:00', 25, 17, 16),
( '13:30:00', '13:55:00', 25, 15, 16),
( '16:00:00', '16:40:00', 25, 21, 17),
( '11:45:00', '12:30:00', 25, 21, 17),
( '13:30:00', '14:15:00', 26, 24, 17),
( '15:45:00', '16:20:00', 20, 25, 18),
( '18:00:00', '18:25:00', 25, 21, 18),
( '19:05:00', '19:40:00', 23, 25, 18),
( '13:50:00', '14:15:00', 20, 25, 18),
( '21:30:00', '22:10:00', 25, 19, 19),
( '10:15:00', '11:00:00', 25, 19, 19),
( '14:15:00', '14:55:00', 25, 21, 19),
( '17:00:00', '17:50:00', 20, 25, 20),
( '20:05:00', '20:30:00', 23, 25, 20),
( '22:30:00', '23:15:00', 26, 24, 20),
( '16:45:00', '17:20:00', 20, 25, 20);

-- Osi�gni�cia
INSERT INTO Osiagniecia(Data_osi�gni�cia, Nazwa_osi�gni�cia, ID_Wyr�nionego_Zawodnika, ID_Wyr�nionego_Trenera, ID_Wyr�nionej_Reprezentacji) 
VALUES
( '2022-01-10', 'Najbardziej Warto�ciowy Gracz Turnieju', 1234, NULL, NULL),
( '2022-02-05', 'Najlepszy Trener', NULL, 33, NULL),
( '2022-03-08', 'Wybitny Zawodnik', 1235, NULL, NULL),
( '2022-04-15', 'Z�oty But za Najwi�cej Punkt�w', 1235, NULL, NULL),
( '2022-05-20', 'Najlepszy Blokuj�cy Sezonu', 1236, NULL, NULL),
( '2022-06-25', 'Z�ota R�czka za Perfekcyjne Przyj�cia',1237, NULL, NULL),
( '2022-07-10', 'Mistrz Serwisu za Najwi�cej As�w', 1238, NULL, NULL),
( '2022-08-15', 'Diamentowa D�o� za Precyzyjne Zagrywki', 1239, NULL, NULL),
( '2022-09-20', 'Najlepszy Skrzyd�owy Sezonu', 1240, NULL, NULL),
( '2022-10-25', 'Najlepszy Libero Mistrzostw', 1241, NULL, NULL),
( '2022-11-10', 'Wirtuoz Ataku za Skuteczno�� Powy�ej 60%', 1242, NULL, NULL),
( '2022-12-15', 'Z�ota R�czka za Perfekcyjne Zagrywki', 1243, NULL, NULL),
( '2023-01-20', 'Mistrzyni Przyj�� Sezonu', 1244, NULL, NULL),
( '2023-02-25', 'Najlepszy Blokuj�cy Mistrzostw', 1245, NULL, NULL),
( '2023-03-10', 'Kr�l Ataku za Najwi�cej Punkt�w', 1246, NULL, NULL),
( '2023-04-15', 'Mistrz Zagrywki za Asy w Kluczowych Momentach', 1247, NULL, NULL),
( '2023-05-20', 'Najlepszy Libero Sezonu', 1248, NULL, NULL),
( '2023-06-25', 'Duch Mistrz�w za Wyj�tkow� Dzielno�� Reprezentacji', NULL, NULL, 3),
( '2023-07-10', 'Mistrzowska Reprezentacja Roku', NULL, NULL, 1),
( '2023-08-15', 'Z�ote Wyskoki za Najwy�sz� Skuteczno�� w Ataku', 1249, NULL, NULL);

-- Statystyki
INSERT INTO Statystyki(Zdobyte_punkty, Stracone_punkty, Bloki, Ataki, Asy_serwisowe, ID_Zawodnika) 
VALUES
( 25, 10, 2, 20, 2, 1234),
( 18, 15, 1, 18, 1, 1235),
( 22, 12, 4, 15, 3, 1236),
( 20, 8, 2, 25, 2, 1237),
( 15, 18, 1, 17, 0, 1238),
( 23, 7, 5, 22, 4, 1239),
( 20, 10, 2, 20, 2, 1240),
( 18, 15, 1, 18, 1, 1241),
( 21, 12, 3, 15, 3, 1242),
( 25, 5, 2, 30, 1, 1243),
( 22, 13, 2, 25, 2, 1244),
( 24, 6, 3, 23, 5, 1245),
( 20, 10, 2, 20, 2, 1246),
( 18, 20, 1, 16, 0, 1247),
( 23, 7, 3, 22, 4, 1248),
( 20, 8, 2, 25, 2, 1249),
( 23, 12, 3, 20, 3, 1250),
( 20, 13, 2, 22, 2, 1251),
( 18, 15, 1, 18, 1, 1252),
( 21, 12, 3, 15, 3, 1253),
( 23, 2, 5, 5, 15, 1239);