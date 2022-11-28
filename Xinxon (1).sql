-- Creacio de les taules
CREATE TABLE Factura (
  Numero_factura number(10) PRIMARY KEY,
  Exercici_facturacio number(10),
  Serie_facturacio varchar2(255),
  Data timestamp(0),
  Descripcio varchar2(255) NULL,
  ID_client number(10),
  NSS_treballador number(11),
  Pagament varchar2(255) NOT NULL,
  Import number(10) NULL
);


CREATE TABLE Producte (
  Codi number(10) PRIMARY KEY,
  Nom_comercial varchar2(255),
  Preu_unitat number(10),
  Volumen varchar2(255),
  Refrigeracio varchar2(255),
  Reciclatge varchar2(255),
  Descompte number(10) CHECK (Descompte in (3, 7, 10))
);


CREATE TABLE Detalls_factura (
  ID number(10) PRIMARY KEY,
  Quantitat number(10),
  Preu_final number(10),
  ID_Producte number(10),
  ID_Factura number(10)
);


CREATE TABLE Client (
  Nom varchar2(255),
  Nom_comercial varchar2(255),
  Poblacio varchar2(255),
  Direccio varchar2(255),
  CIF varchar2(255) NOT NULL UNIQUE,
  Telefon_contacte number(10),
  ID number(10) PRIMARY KEY
);


CREATE TABLE Treballador (
  NSS number(11) PRIMARY KEY,
  DNI varchar2(255) NOT NULL UNIQUE,
  Nom varchar2(255),
  Data_incorporacio timestamp(0),
  Telefon number(9)
);


CREATE TABLE Nomina (
  Sou number(10),
  Data_nomina timestamp(0),
  Any_nomina number(4),
  Treballador_NSS number(11),
  ID number(10) PRIMARY KEY
);

-- Relacions entre taules
ALTER TABLE Detalls_factura ADD FOREIGN KEY (ID_Producte) REFERENCES Producte (Codi);

ALTER TABLE Detalls_factura ADD FOREIGN KEY (ID_Factura) REFERENCES Factura (Numero_factura);

ALTER TABLE Factura ADD FOREIGN KEY (ID_client) REFERENCES Client (ID);

ALTER TABLE Factura ADD FOREIGN KEY (NSS_treballador) REFERENCES Treballador (NSS);

ALTER TABLE Nomina ADD FOREIGN KEY (Treballador_NSS) REFERENCES Treballador (NSS);

-- INSERTS 

INSERT INTO Treballador VALUES (98351009436, '54801170R', 'Aleix Enrich', '11-NOV-2020', 671091234);

INSERT INTO Treballador VALUES (11028356100, '97129844U', 'Francisco Zahinos', '22-NOV-2018', 665897709);

INSERT INTO Treballador VALUES (77612091238, '43187234I', 'Pol Obalat', '05-OCT-2019', 621564401);

INSERT INTO Nomina VALUES (1180, '05-DEC-2019', 2019, 98351009436, 1);

INSERT INTO Nomina VALUES (1200, '22-NOV-2021', 2021, 11028356100, 2);

INSERT INTO Nomina VALUES (1050, '11-OCT-2021', 2021, 77612091238, 3);

INSERT INTO Client VALUES ('Julen Martinez', 'Amazon', 'La senia', 'Carrer / Lo Roig 4', 'W32912340', 977190299, 1);

INSERT INTO Client VALUES ('Angel Barneto', 'eBay', 'Amposta', 'Carrer / Barcelona 17', 'O91546129', 671032104, 2);

INSERT INTO Client VALUES ('Anas Zimout', 'HiperEuropa', 'Amposta', 'Carrer / Gracia 22', 'P10082466', 634018322, 3);

INSERT INTO Producte VALUES (1, 'Auriculars Samsung', 29, '16g', 'No necessaria', 'Si', 3);

INSERT INTO Producte VALUES (2, 'RAM HyperX', 114, '38.9g', 'No necessaria', 'Si', 7);

INSERT INTO Producte VALUES (3, 'Font de alimentacio URANO', 50, '1.42kg', 'No necessaria', 'Si', 10);

INSERT INTO Factura VALUES (1, 2019, 'Serie A', '30-OCT-2019', 'Paquet de Amazon', 1, 98351009436, 'Si ha estat pagat', 87);

INSERT INTO Factura VALUES (2, 2020, 'Serie B', '01-NOV-2020', 'Paquet de eBay ', 2, 11028356100,'Si ha estat pagat', 114);

INSERT INTO Factura VALUES (3, 2021, 'Serie B', '29-OCT-2021', 'Paquet de HiperEuropa', 3, 77612091238, 'Si ha estat pagat', 300);

INSERT INTO Factura VALUES (4, 2019, 'Serie A', '30-OCT-2019', 'Paquet de Amazon', 1, 98351009436, 'No ha pagat', 0);

INSERT INTO Detalls_factura VALUES (1, 3, 87, 1, 1);

INSERT INTO Detalls_factura VALUES (2, 2, 200, 2, 3);

INSERT INTO Detalls_factura VALUES (3, 2, 100, 3, 3);

INSERT INTO Detalls_factura VALUES (4, 1, 114, 3, 2);
