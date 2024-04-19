CREATE TABLE IF NOT EXISTS category
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500)
    );

CREATE TABLE IF NOT EXISTS discovery
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(80)  NOT NULL,
    url         VARCHAR(500) NOT NULL UNIQUE,
    description VARCHAR(500) NOT NULL,
    date_added  DATETIME     NOT NULL,
    category_id INT          NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category (id)
    );

CREATE TABLE IF NOT EXISTS user
(
    id                INT PRIMARY KEY AUTO_INCREMENT,
    username          VARCHAR(50)  NOT NULL UNIQUE,
    email             VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME     NOT NULL,
    password          VARCHAR(100) NOT NULL
    );

CREATE TABLE IF NOT EXISTS user_role
(
    username  VARCHAR(50) NOT NULL,
    role_name VARCHAR(20) NOT NULL DEFAULT 'USER',
    PRIMARY KEY (username, role_name),
    FOREIGN KEY (username) REFERENCES user (username)
    );

ALTER TABLE discovery
    ADD user_id INT,
    ADD FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE discovery
    MODIFY COLUMN user_id INT NOT NULL;

CREATE TABLE vote
(
    user_id      INT                 NOT NULL,
    discovery_id INT                 NOT NULL,
    type         ENUM ('UP', 'DOWN') NOT NULL,
    date_added   DATETIME            NOT NULL,
    PRIMARY KEY (user_id, discovery_id),
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (discovery_id) REFERENCES discovery (id)
);