		USE sakila;

	     CREATE TABLE actor (
              actor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              first_name VARCHAR(45) NOT NULL,
              last_name VARCHAR(45) NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (actor_id),
              KEY idx_actor_last_name (last_name)
             );
             CREATE TABLE address (
              address_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              address VARCHAR(50) NOT NULL,
              address2 VARCHAR(50) DEFAULT NULL,
              district VARCHAR(20) NOT NULL,
              city_id SMALLINT UNSIGNED NOT NULL,
              postal_code VARCHAR(10) DEFAULT NULL,
              phone VARCHAR(20) NOT NULL,
              /*!50705 location GEOMETRY NOT NULL,*/
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (address_id),
              KEY idx_fk_city_id (city_id)
             );
             CREATE TABLE category (
              category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
              name VARCHAR(25) NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (category_id)
             );
             CREATE TABLE city (
              city_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              city VARCHAR(50) NOT NULL,
              country_id SMALLINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (city_id),
              KEY idx_fk_country_id (country_id)
             );
             CREATE TABLE country (
              country_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              country VARCHAR(50) NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (country_id)
             );
             CREATE TABLE customer (
              customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              store_id TINYINT UNSIGNED NOT NULL,
              first_name VARCHAR(45) NOT NULL,
              last_name VARCHAR(45) NOT NULL,
              email VARCHAR(50) DEFAULT NULL,
              address_id SMALLINT UNSIGNED NOT NULL,
              active BOOLEAN NOT NULL DEFAULT TRUE,
              create_date DATETIME NOT NULL,
              last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (customer_id),
              KEY idx_fk_store_id (store_id),
              KEY idx_fk_address_id (address_id),
              KEY idx_last_name (last_name)
             );
             CREATE TABLE film (
              film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              title VARCHAR(255) NOT NULL,
              description TEXT DEFAULT NULL,
              release_year YEAR DEFAULT NULL,
              language_id TINYINT UNSIGNED NOT NULL,
              original_language_id TINYINT UNSIGNED DEFAULT NULL,
              rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
              rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
              length SMALLINT UNSIGNED DEFAULT NULL,
              replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
              rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
              special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (film_id),
              KEY idx_title (title),
              KEY idx_fk_language_id (language_id),
              KEY idx_fk_original_language_id (original_language_id)
             );
             CREATE TABLE film_actor (
              actor_id SMALLINT UNSIGNED NOT NULL,
              film_id SMALLINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (actor_id,film_id),
              KEY idx_fk_film_id (`film_id`)
             );
             CREATE TABLE film_category (
              film_id SMALLINT UNSIGNED NOT NULL,
              category_id TINYINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY (film_id, category_id)
             );
             CREATE TABLE film_text (
              film_id SMALLINT NOT NULL,
              title VARCHAR(255) NOT NULL,
              description TEXT,
              PRIMARY KEY  (film_id),
              FULLTEXT KEY idx_title_description (title,description)
             );
             CREATE TABLE inventory (
              inventory_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
              film_id SMALLINT UNSIGNED NOT NULL,
              store_id TINYINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (inventory_id),
              KEY idx_fk_film_id (film_id),
              KEY idx_store_id_film_id (store_id,film_id)
             );
             CREATE TABLE language (
              language_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
              name CHAR(20) NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY (language_id)
             );
             CREATE TABLE payment (
              payment_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
              customer_id SMALLINT UNSIGNED NOT NULL,
              staff_id TINYINT UNSIGNED NOT NULL,
              rental_id INT DEFAULT NULL,
              amount DECIMAL(5,2) NOT NULL,
              payment_date DATETIME NOT NULL,
              last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (payment_id),
              KEY idx_fk_staff_id (staff_id),
              KEY idx_fk_customer_id (customer_id)
             );
             CREATE TABLE rental (
              rental_id INT NOT NULL AUTO_INCREMENT,
              rental_date DATETIME NOT NULL,
              inventory_id MEDIUMINT UNSIGNED NOT NULL,
              customer_id SMALLINT UNSIGNED NOT NULL,
              return_date DATETIME DEFAULT NULL,
              staff_id TINYINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY (rental_id),
              UNIQUE KEY  (rental_date,inventory_id,customer_id),
              KEY idx_fk_inventory_id (inventory_id),
              KEY idx_fk_customer_id (customer_id),
              KEY idx_fk_staff_id (staff_id)
             );
             CREATE TABLE staff (
              staff_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
              first_name VARCHAR(45) NOT NULL,
              last_name VARCHAR(45) NOT NULL,
              address_id SMALLINT UNSIGNED NOT NULL,
              picture BLOB DEFAULT NULL,
              email VARCHAR(50) DEFAULT NULL,
              store_id TINYINT UNSIGNED NOT NULL,
              active BOOLEAN NOT NULL DEFAULT TRUE,
              username VARCHAR(16) NOT NULL,
              password VARCHAR(40) BINARY DEFAULT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (staff_id),
              KEY idx_fk_store_id (store_id),
              KEY idx_fk_address_id (address_id)
             );
             CREATE TABLE store (
              store_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
              manager_staff_id TINYINT UNSIGNED NOT NULL,
              address_id SMALLINT UNSIGNED NOT NULL,
              last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              PRIMARY KEY  (store_id),
              UNIQUE KEY idx_unique_manager (manager_staff_id),
              KEY idx_fk_address_id (address_id)
             );
