<<<<<<< HEAD
-- DROP DATABASE IF EXISTS product_information

-- CREATE DATABASE product_information
\c product_information

DROP TABLE IF EXISTS product CASCADE;
CREATE TABLE product (
  id INTEGER NOT NULL ,
  name VARCHAR(256),
  slogan VARCHAR(1000),
  description VARCHAR(1000),
  category VARCHAR(1000),
  default_price INTEGER,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS feature CASCADE;
CREATE TABLE feature (
  id INTEGER NOT NULL ,
  product_id INTEGER,
  name VARCHAR(256),
  value VARCHAR(1000),
  PRIMARY KEY (id),
  CONSTRAINT fk_product_id 
    FOREIGN KEY(product_id)
      REFERENCES product(id)
);


DROP TABLE IF EXISTS styles CASCADE;
CREATE TABLE styles (
  id INTEGER NOT NULL ,
  product_id INTEGER,
  name VARCHAR(256),
  sale_price INTEGER,
  original_price INTEGER,
  default_style BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT fk_product_id 
    FOREIGN KEY(product_id)
      REFERENCES product(id)
);


DROP TABLE IF EXISTS photo_list CASCADE;
CREATE TABLE photo_list (
  id INTEGER NOT NULL  ,
  style_id INTEGER,
  thumbnail_url VARCHAR(1000),
  photo_url VARCHAR(1000),
  PRIMARY KEY (id),
  CONSTRAINT fk_style_id 
    FOREIGN KEY(style_id)
      REFERENCES styles(id)
);


DROP TABLE IF EXISTS sku_list CASCADE;
CREATE TABLE sku_list (
  id INTEGER NOT NULL  ,
  style_id INTEGER,
  size TEXT,
  quantity INTEGER,
  PRIMARY KEY (id),
  CONSTRAINT fk_style_id 
    FOREIGN KEY(style_id)
      REFERENCES styles(id)
);


DROP TABLE IF EXISTS related CASCADE;
CREATE TABLE related (
  related_id INTEGER NOT NULL ,
  product_id INTEGER,
  PRIMARY KEY (related_id),
  CONSTRAINT fk_product_id 
    FOREIGN KEY(product_id)
      REFERENCES product(id)
);

=======
-- CREATE DATABASE chat; /* Consoling this out as we can see the chat database by using `use chat`*/

USE chat;

-- -- CREATE TABLE messages (
-- --   /* Describe your table here.*/
-- -- );

-- -- CREATE TABLE test_table (
-- --   id int,
-- --   col1 varChar(256),
-- --   col2 int,
-- --   col3 int,
-- --   PRIMARY KEY (id)
-- --   /* Describe your table here.*/
-- -- );

-- -- CREATE TABLE test_table2 (
-- --   id int,
-- --   col1 varChar(256),
-- --   col2 int,
-- --   col3 int,
-- --   PRIMARY KEY (id)
--   /* Describe your table here.*/
-- -- );

-- /* Create other tables and define schemas for them here! */
-- ------------------------------------------------------
-- ------------------------------------------------------
-- ------------------------------------------------------

-- ---
-- Table 'users'
--
-- ---

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INTEGER ,
  `github_handle` VARCHAR(256),
  `username` VARCHAR(256),
  unique (`username`),
  PRIMARY KEY (`id`, `username`)
);

-- ---
-- Table 'rooms'
--
-- ---

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` INTEGER,
  `roomname` VARCHAR(256),
  unique (`roomname`),
  PRIMARY KEY (`id`, `roomname`)
);

-- -- ---
-- -- Table 'messages'
-- --
-- -- ---

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` INTEGER ,
  `text` VARCHAR(256) ,
  `github_handle` VARCHAR(256) ,
  `sent_time` INTEGER,
  `roomname` VARCHAR(256),
  `username` VARCHAR(256),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`roomname`)
    REFERENCES rooms(`roomname`),
  FOREIGN KEY (`username`)
    REFERENCES users(`username`)
);


-- ---
-- Foreign Keys
-- ---




>>>>>>> dbefecdcf59fd8c16c00fd93a9f509ca43050d2d
/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

