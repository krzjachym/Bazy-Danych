-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-11-22 16:47:20.879

-- tables
-- Table: producenci
CREATE TABLE producenci (
    id_producenta int  NOT NULL,
    nazwa_producenta varchar(255)  NOT NULL,
    mail varchar(255)  NOT NULL,
    telefon varchar(255)  NOT NULL,
    zamowienia_id_zamowienia int  NOT NULL,
    CONSTRAINT producenci_pk PRIMARY KEY (id_producenta)
);

CREATE INDEX producenci_idx_1 on producenci (nazwa_producenta ASC);

-- Table: produkty
CREATE TABLE produkty (
    id_produktu int  NOT NULL,
    nazwa_produktu varchar(255)  NOT NULL,
    cena real  NOT NULL,
    id_producenta int  NOT NULL,
    zamowienia_id_zamowienia int  NOT NULL,
    CONSTRAINT produkty_pk PRIMARY KEY (id_produktu)
);

CREATE INDEX produkty_idx_1 on produkty (id_producenta ASC);

-- Table: zamowienia
CREATE TABLE zamowienia (
    id_zamowienia int  NOT NULL,
    id_produktu int  NULL,
    id_producenta int  NULL,
    ilosc_produktow int  NOT NULL,
    CONSTRAINT zamowienia_pk PRIMARY KEY (id_zamowienia)
);

CREATE INDEX zamowienia_idx_1 on zamowienia (id_produktu ASC);

-- foreign keys
-- Reference: producenci_zamowienia (table: zamowienia)
ALTER TABLE zamowienia ADD CONSTRAINT producenci_zamowienia
    FOREIGN KEY (id_producenta)
    REFERENCES producenci (id_producenta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: produkty_zamowienia (table: zamowienia)
ALTER TABLE zamowienia ADD CONSTRAINT produkty_zamowienia
    FOREIGN KEY (id_produktu)
    REFERENCES produkty (id_produktu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

