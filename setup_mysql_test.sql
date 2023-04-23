-- This sql script prepares a test MySQL server for the project
-- Creates a database
-- creates a new uer in localhost
-- sets users password
-- grants ALL privilege on the created database
-- grants SELECT privilege on the database performance_schema

CREATE DATABASE IF NOT EXISTS hbnb_test_db;

CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';
