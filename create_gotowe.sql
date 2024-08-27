USE Portal_Siatkarski1;

-- Tworzenie tabeli Osoby
CREATE TABLE Osoby (
    ID_osoby INT PRIMARY KEY Identity(1,1),
    Imie NVARCHAR(50) NOT NULL,
    Nazwisko NVARCHAR(50) NOT NULL,
    Kraj_pochodzenia NVARCHAR(50) NOT NULL,
    Data_urodzenia DATE NOT NULL,
    Poczatek_kariery INT NOT NULL,
    Koniec_kariery INT,
    Liczba_meczow INT NOT NULL CHECK(Liczba_meczow > 0),
    Data_smierci DATE,
    Plec NVARCHAR(10) NOT NULL
);

-- Tworzenie tabeli Reprezentacje
CREATE TABLE Reprezentacje (
    ID_reprezentacji INT PRIMARY KEY Identity(1,1),
    Reprezentowany_kraj NVARCHAR(255) NOT NULL
);

-- Tworzenie tabeli s³ownikowej Pozycje
CREATE TABLE Pozycje (
    ID_Pozycji_Zawodnika INT PRIMARY KEY,
    Pozycja NVARCHAR(25) NOT NULL
);


-- Tworzenie tabeli Zawodnicy
CREATE TABLE Zawodnicy (
	NR_Zwiazkowy INT PRIMARY KEY,
	ID_Zawodnika INT,
    Nr_koszulki INT CHECK(Nr_koszulki >= 0),
    Waga DECIMAL(5,2) CHECK(Waga >= 0),
    Wzrost DECIMAL(5,2) CHECK(Wzrost >= 0),
    ID_Reprezentacji INT NOT NULL,
	ID_Pozycji INT NOT NULL,
    FOREIGN KEY (ID_Zawodnika) REFERENCES Osoby(ID_osoby) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Reprezentacji) REFERENCES Reprezentacje(ID_reprezentacji) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_Pozycji) REFERENCES Pozycje(ID_Pozycji_Zawodnika) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Tworzenie tabeli Trenerzy
CREATE TABLE Trenerzy (
    Wyksztalcenie NVARCHAR(255),
    Lata_doswiadczenia INT NOT NULL CHECK(Lata_doswiadczenia > 0),
	ID_trenera INT PRIMARY KEY,
    ID_Reprezentacji INT NOT NULL,
    FOREIGN KEY (ID_trenera) REFERENCES Osoby(ID_osoby) ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY (ID_Reprezentacji) REFERENCES Reprezentacje(ID_reprezentacji) ON UPDATE CASCADE ON DELETE CASCADE
);


-- Tworzenie tabeli Wydarzenia
CREATE TABLE Wydarzenia (
    ID_wydarzenia INT PRIMARY KEY Identity(1,1),
    Nazwa_wydarzenia NVARCHAR(255) NOT NULL,
    Poczatek_wydarzenia DATE NOT NULL,
    Koniec_wydarzenia DATE
);


-- Tworzenie tabeli Mecze
CREATE TABLE Mecze (
    ID_meczu INT PRIMARY KEY Identity(1,1),
    Data_rozgrywki DATE NOT NULL,
    Lokalizacja NVARCHAR(255) NOT NULL,
    ID_Pierwszej_Reprezentacji INT NULL,
    ID_Drugiej_Reprezentacji INT NULL,
    ID_Wydarzenia INT NOT NULL,
    FOREIGN KEY (ID_Pierwszej_Reprezentacji) REFERENCES Reprezentacje(ID_reprezentacji) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (ID_Drugiej_Reprezentacji) REFERENCES Reprezentacje(ID_reprezentacji)  ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (ID_Wydarzenia) REFERENCES Wydarzenia(ID_wydarzenia)
);

-- Tworzenie tabeli Sety
CREATE TABLE Sety (
    ID_setu INT PRIMARY KEY Identity(1,1),
	Godzina_rozpoczecia TIME NOT NULL,
	Godzina_zakonczenia TIME,
    Wynik_pierwszej_druzyny INT NOT NULL,
    Wynik_drugiej_druzyny INT NOT NULL,
    ID_Meczu INT NOT NULL,
    FOREIGN KEY (ID_Meczu) REFERENCES Mecze(ID_meczu) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tworzenie tabeli Osi¹gniêcia
CREATE TABLE Osiagniecia (
    ID_osi¹gniêcia INT PRIMARY KEY Identity(1,1),
    Data_osi¹gniêcia DATE NOT NULL,
    Nazwa_osi¹gniêcia NVARCHAR(255) NOT NULL,
    ID_Wyró¿nionego_Zawodnika INT,
    ID_Wyró¿nionego_Trenera INT,
    ID_Wyró¿nionej_Reprezentacji INT NULL,
    FOREIGN KEY (ID_Wyró¿nionego_Zawodnika) REFERENCES Zawodnicy(NR_Zwiazkowy) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Wyró¿nionego_Trenera) REFERENCES Trenerzy(ID_trenera) ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY (ID_Wyró¿nionej_Reprezentacji) REFERENCES Reprezentacje(ID_reprezentacji) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Tworzenie tabeli Statystyki
CREATE TABLE Statystyki (
    ID_statystyki INT PRIMARY KEY Identity(1,1),
    Zdobyte_punkty INT CHECK(Zdobyte_punkty >= 0),
    Stracone_punkty INT CHECK(Stracone_punkty >= 0),
    Bloki INT CHECK(Bloki >= 0),
    Ataki INT CHECK(Ataki >= 0),
    Asy_serwisowe INT CHECK(Asy_serwisowe >= 0),
    ID_Zawodnika INT NOT NULL,
    FOREIGN KEY (ID_Zawodnika) REFERENCES Zawodnicy(NR_Zwiazkowy) ON DELETE CASCADE ON UPDATE CASCADE

);

