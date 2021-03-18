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




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

