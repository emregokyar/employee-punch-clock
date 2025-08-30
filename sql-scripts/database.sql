CREATE DATABASE punch_clock;
USE punch_clock;

CREATE TABLE roles(
    id INT PRIMARY KEY AUTO_INCREMENT,
    role VARCHAR(49) NOT NULL UNIQUE
);

INSERT INTO roles(role) VALUES ("admin", "regular");

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(49) UNIQUE NOT NULL,
    password VARCHAR(49) NOT NULL,
    firstname VARCHAR(49) NOT NULL,
    lastname VARCHAR(49) NOT NULL,
    profile_photo VARCHAR(255) DEFAULT NULL,
    about VARCHAR(255) DEFAULT NULL,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	role_id INT NOT NULL,
    FOREIGN KEY(role_id) REFERENCES roles(id)
);

CREATE TABLE departments(
	id INT PRIMARY KEY AUTO_INCREMENT,
	code VARCHAR(49) UNIQUE NOT NULL,
    name VARCHAR(49) DEFAULT NULL,
);

CREATE TABLE registered_departments(
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(department_id) REFERENCES departments(id)
);

-- Inserting dummy data
INSERT INTO users(username, password, firstname, lastname, role_id) VALUES ("101", "123", "e", "g", 1);




