-- Création de la base de données
CREATE DATABASE IF NOT EXISTS LDB_exos_2103;
USE LDB_exos_2103;

-- Création des tables

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    categorie_id INT,
    FOREIGN KEY (categorie_id) REFERENCES categories(id)
);

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(191) UNIQUE NOT NULL
);

CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    date_commande DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE commandes_articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT,
    article_id INT,
    quantite INT NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES commandes(id),
    FOREIGN KEY (article_id) REFERENCES articles(id)
);

-- Insertion des données

INSERT INTO categories (nom) VALUES ('Électronique'), ('Maison'), ('Vêtements'), ('Sport'), ('Livres');

INSERT INTO articles (nom, prix, categorie_id) VALUES 
('Ordinateur portable', 1200.00, 1),
('Smartphone', 800.00, 1),
('Casque audio', 150.00, 1),
('TV 55 pouces', 700.00, 1),
('Canapé', 500.00, 2),
('Table', 200.00, 2),
('Chaise', 75.00, 2),
('Lampe', 30.00, 2),
('T-shirt', 20.00, 3),
('Jeans', 50.00, 3),
('Chaussures', 80.00, 3),
('Veste', 120.00, 3),
('Ballon de foot', 25.00, 4),
('Vélo', 450.00, 4),
('Haltères', 60.00, 4),
('Tapis de yoga', 35.00, 4),
('Roman policier', 15.00, 5),
('Livre de cuisine', 20.00, 5),
('Manga', 10.00, 5),
('Encyclopédie', 50.00, 5);

INSERT INTO clients (nom, email) VALUES 
('Alice Dupont', 'alice.dupont@email.com'),
('Bob Martin', 'bob.martin@email.com'),
('Charlie Durand', 'charlie.durand@email.com'),
('David Leroy', 'david.leroy@email.com'),
('Emma Dubois', 'emma.dubois@email.com');

INSERT INTO commandes (client_id, date_commande) VALUES 
(1, '2024-03-01'),
(2, '2024-04-15'),
(3, '2023-07-20'),
(1, '2025-01-10'),
(5, '2024-12-05');

INSERT INTO commandes_articles (commande_id, article_id, quantite) VALUES 
(1, 1, 2),  -- 2 ordinateurs portables
(1, 3, 1),  -- 1 casque audio
(1, 5, 1),  -- 1 canapé
(2, 2, 1),  -- 1 smartphone
(2, 6, 2),  -- 2 tables
(2, 9, 4),  -- 4 T-shirts
(3, 4, 1),  -- 1 TV
(3, 7, 6),  -- 6 chaises
(3, 11, 2), -- 2 paires de chaussures
(4, 8, 3),  -- 3 lampes
(4, 12, 1), -- 1 veste
(4, 14, 2), -- 2 vélos
(5, 10, 3), -- 3 jeans
(5, 15, 4); -- 4 haltères
