DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE notes_db;

USE notes_db;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
id INT unsigned NOT NULL AUTO_INCREMENT,
name varchar(100) NOT NULL,
email varchar(100) NOT NULL,
primary key (id)
);
INSERT INTO users VALUES (default, 'Tomas', 'prueba1@email.com'),(default, 'Tomas', 'prueba2@email.com'),(default, 'Tomas', 'prueba3@email.com'),
(default, 'Tomas', 'prueba4@email.com'),(default, 'Tomas', 'prueba5@email.com'),(default, 'Tomas', 'prueba6@email.com'),(default, 'Tomas', 'prueba7@email.com'),
(default, 'Tomas', 'prueba8@email.com'),(default, 'Tomas', 'prueba9@email.com'),(default, 'Tomas', 'prueba10@email.com');
select * from users;


DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
id INT unsigned NOT NULL AUTO_INCREMENT,
category varchar(100) NOT NULL,
primary key (id)
);
INSERT INTO categories VALUES (default, 'Document'),(default, 'Text'),(default, 'Contacts'),
(default, 'Music'),(default, 'Movies'),(default, 'Books'),(default, 'News'),
(default, 'Study'),(default, 'Games'),(default, 'personal diary');
select * from categories;


DROP TABLE IF EXISTS notes;
CREATE TABLE notes(
id INT unsigned NOT NULL AUTO_INCREMENT,
title varchar(100) NOT NULL,
created_date timestamp NULL DEFAULT NULL,
updated_date timestamp NULL DEFAULT NULL,
description TEXT NOT NULL,
note_delete TINYINT(4) NOT NULL,
user_id int unsigned NOT NULL,
category_id int unsigned NOT NULL,
primary key (id),
FOREIGN KEY (user_id) REFERENCES  users(id),
FOREIGN KEY (category_id) REFERENCES categories(id)
);
INSERT INTO notes(id, title, created_date, updated_date, description, note_delete, user_id, category_id) 
VALUES (default, 'Nota1', NULL, NULL, 'Prueba de nota 1', 0, 1, 1),(default, 'Nota2', NULL, NULL, 'Prueba de nota 2', 1, 2, 2),
(default, 'Nota3', NULL, NULL, 'Prueba de nota 3', 1, 3, 3),(default, 'Nota4', NULL, NULL, 'Prueba de nota 4', 0, 4, 4),
(default, 'Nota5', NULL, NULL, 'Prueba de nota 5', 1, 5, 5),(default, 'Nota6', NULL, NULL, 'Prueba de nota 6', 0, 6, 6),
(default, 'Nota7', NULL, NULL, 'Prueba de nota 7', 1, 7, 7),(default, 'Nota8', NULL, NULL, 'Prueba de nota 8', 0, 8, 8),
(default, 'Nota9', NULL, NULL, 'Prueba de nota 9', 1, 9, 9),(default, 'Nota10', NULL, NULL, 'Prueba de nota 10', 0, 10, 10),
(default, 'Nota11', NULL, NULL, 'Prueba de nota 11', 1, 1, 5);
select * from notes;

select notes.id, title, created_date, updated_date, description, note_delete, users.name, users.email, categories.category from notes
inner join users on notes.user_id = users.id
inner join categories on notes.category_id = categories.id;