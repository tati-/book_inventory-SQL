USE book_inventory;

INSERT INTO
    authors (f_name, l_name, nationality, birth_date, death_date)
VALUES
    ('Honore', 'De Balzac', 'French',  '1799-05-20', '1850-08-18'),
    ('Stratis', 'Tsirkas', 'Greek', '1911-07-23', '1980-01-27'),
    ('Leo', 'Tolstoi', 'Russian', '1828-09-09', '1910-11-20'),
    ('George', 'Orwell', 'British', '1903-06-25', '1950-01-21')
    ;

INSERT INTO
    adresses (street, no, postal_code, city, country)
VALUES
    (NULL, NULL, NULL, NULL, 'United Kingdom'),
    ('Zoodochou pigis', 99, '11473', 'Athens', 'Greece')
    ;

INSERT INTO
    publishers (name, foundation_year, website, adress_id)
VALUES
    ('kedros', NULL, 'www.kedros.gr', NULL),
    ('penguin books', NULL, 'www.penguin.co.uk', 1),
    ('agra', 1979, 'http://www.agra.gr', 2),
    ('LGF', 1954, NULL, NULL)
    ;

INSERT INTO
    translators (f_name, l_name, nationality)
VALUES
    ('Aris', 'Alexandrou', 'Greek')
    ;

INSERT INTO
    books (title, language, original_language, publication_year, n_pages, genre, series, edition, publisher_id)
VALUES
    ('Chameni anoixi', 'Greek', 'Greek', 2007, 258, 'novel', 'disekta chronia', 42, 1),
    ('I leschi', 'Greek', 'Greek', 2015, 403, 'novel', 'akivernites politeies', 11, 1),
    ('Ariagni', 'Greek', 'Greek', 2015, 405, 'novel', 'akivernites politeies', 7, 1),
    ('I nichterida', 'Greek', 'Greek', 2014, 499, 'novel', 'akivernites politeies', 7, 1),
    ('Animal farm', 'English', 'English', 2008, 95, 'novel', NULL, 18, 2),
    ('Anna Karenina', 'Greek', 'Russian', 2016, 1262, 'novel', NULL, 1, 3),
    ('Illusions perdues', 'French', 'French', 2006, 864, 'novel', 'Ldp Classiques', NULL, 4)
    ;

INSERT INTO
    authorships (book_id, author_id, writing_year)
VALUES
    (1, 2, 1967),
    (2, 2, 1961),
    (3, 2, 1962),
    (4, 2, 1965),
    (5, 4, 1945),
    (6, 3, 1877),
    (7, 1, 1843)
    ;

INSERT INTO
    translations (book_id, translator_id, from_language)
VALUES
    (6, 1, 'Russian')
    ;
