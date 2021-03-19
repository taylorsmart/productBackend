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

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

