CREATE DATABASE IF NOT EXISTS book_inventory;
USE book_inventory;

CREATE TABLE IF NOT EXISTS books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30),
    language VARCHAR(15),
    original_language VARCHAR(15),
    publication_year SMALLINT(4),
    n_pages SMALLINT,
    genre VARCHAR(20),
    series VARCHAR(30),
    edition SMALLINT,
    publisher_id INT
    -- availability BIT(1),
    -- location VARCHAR(40) -- (shelf etc)
    );

CREATE TABLE IF NOT EXISTS authors(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    nationality VARCHAR(20),
    birth_date DATE,
    death_date DATE
    );

CREATE TABLE IF NOT EXISTS translators(
    translator_id INT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    nationality VARCHAR(20)
    );

CREATE TABLE IF NOT EXISTS adresses(
    adress_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(25),
    no SMALLINT(4),
    postal_code VARCHAR(8),
    city VARCHAR(15),
    country VARCHAR(20)
    );

CREATE TABLE IF NOT EXISTS publishers(
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    foundation_year SMALLINT(4),
    website VARCHAR(50),
    adress_id INT,
    FOREIGN KEY (adress_id) REFERENCES adresses(adress_id) ON DELETE SET NULL
    );

CREATE TABLE IF NOT EXISTS translations(
    book_id INT,
    translator_id INT,
    from_language VARCHAR(15),
    PRIMARY KEY (book_id, translator_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (translator_id) REFERENCES translators(translator_id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS authorships(
    book_id INT,
    author_id INT,
    writing_year SMALLINT(4),
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
    );

/* publisher table is not created before books, so I cannot
define the foreign key in the books creation */
ALTER TABLE books
    ADD FOREIGN KEY(publisher_id) REFERENCES publishers(publisher_id) ON DELETE SET NULL
