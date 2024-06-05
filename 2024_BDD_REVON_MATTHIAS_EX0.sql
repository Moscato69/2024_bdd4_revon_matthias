CREATE DATABASE IF NOT EXISTS bdd_revon;
USE bdd_revon;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Materiel;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS contient;

-- TABLE UTILISATEUR
CREATE TABLE Utilisateur(
   id_etudiant INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_etudiant VARCHAR(50) NOT NULL,
   prenom_etudiant VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL
);

-- TABLE MATERIEL
CREATE TABLE Materiel(
   id_materiel INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   designation_materiel VARCHAR(50) NOT NULL,
   quantite VARCHAR(50),
   description VARCHAR(50),
   type VARCHAR(50)
);

-- TABLE DE RESERVATION
CREATE TABLE Reservation(
   id_reservation INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   id_etudiant INT NOT NULL,
   FOREIGN KEY(id_etudiant) REFERENCES Utilisateur(id_etudiant)
);

CREATE TABLE contient(
   id_materiel INT,
   id_reservation INT,
   PRIMARY KEY(id_materiel, id_reservation),
   FOREIGN KEY(id_materiel) REFERENCES Materiel(id_materiel),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation)
);
