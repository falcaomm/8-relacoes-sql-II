-- Active: 1681844932229@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(datetime()) NOT NULL 
);

DROP TABLE users;

SELECT * FROM users;

INSERT INTO users (id, name, email, password)
VALUES
("u001", "fulano", "fulanoemail", "123"),
("u002", "ciclano", "ciclanoemail", "568"),
("u003", "beltrano", "belatranoemail", "133");

CREATE TABLE follows(
    seguidor_id TEXT NOT NULL,
    seguido_id TEXT NOT NULL,

    FOREIGN KEY (seguidor_id) REFERENCES users(id),
    FOREIGN KEY (seguido_id) REFERENCES users(id) 
);

SELECT * FROM follows;

INSERT INTO follows VALUES
("u001", "u002"),
("u001", "u003"), 
("u002", "u001");

SELECT * FROM users
INNER JOIN follows 
ON follows.seguidor_id = users.id;

SELECT * FROM users
LEFT JOIN follows 
ON follows.seguidor_id = users.id;

SELECT * FROM follows
LEFT JOIN users 
ON follows.seguidor_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON follows.seguidor_id = users.id
LEFT JOIN users AS user2
ON follows.seguido_id = user2.id;

--vendo valores especificos
SELECT 
    users.id AS userID,
    users.name AS userName,
    follows.seguido_id AS seguindoID,
    user2.name AS seguindoName
FROM users
LEFT JOIN follows 
ON follows.seguidor_id = users.id
LEFT JOIN users AS user2 
ON follows.seguido_id = user2.id;