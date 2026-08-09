CREATE DATABASE IF NOT EXISTS instagram;

SHOW DATABASES;

USE instagram;

CREATE TABLE user (
	id INT NOT NULL,
    age INT,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT,
    PRIMARY KEY (id),
    CONSTRAINT CHECK (age >= 13)
);

CREATE TABLE post (
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO user
(id ,age , name, email, followers, following)
VALUES
(1, 14, "adam", "adam@yahoo.in", 123, 145),
(2, 15, "bob", "bob123@gmail.com", 200, 200),
(3, 16, "casey", "casey@email.com", 300, 306),
(4, 17, "donald", "donald@gmail.com", 200, 105);

SELECT DISTINCT age FROM user;
SELECT * FROM user;

SELECT name, followers
FROM user
WHERE followers >= 200;

SELECT name, followers
FROM user
WHERE email in ("adam@yahoo.in", "donald@gmail.com");

SELECT name, followers
FROM user
WHERE followers >= 200
ORDER BY followers ASC
LIMIT 3;

-- Aggregate functions
SELECT max(followers)
FROM user;

SELECT count(age)
FROM user
WHERE age = 14;

SELECT count(age)
FROM user
GROUP BY age;

SELECT age, count(age)
FROM user
GROUP BY age;

SELECT age, max(followers)
FROM user
GROUP BY age
HAVING max(followers) > 200;

UPDATE user
SET followers = 600
WHERE age = 16;

SELECT * FROM user;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM user 
WHERE age = 14;


ALTER TABLE user
ADD COLUMN city VARCHAR(25) DEFAULT "Delhi";

ALTER TABLE user
DROP COLUMN city;

ALTER TABLE user
RENAME TO instaUser;

ALTER TABLE instaUser
CHANGE COLUMN followers subs INT DEFAULT 0;

ALTER TABLE instaUser
MODIFY subs INT DEFAULT 5;

SELECT * FROM instaUser;

TRUNCATE TABLE post;

DROP TABLE post;