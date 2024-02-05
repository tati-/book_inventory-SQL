USE book_inventory;

/*DROP TRIGGER IF EXISTS check_author_duplicate;*/
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS check_author_duplicate BEFORE INSERT ON authors
    FOR EACH ROW BEGIN
        IF ((NEW.f_name, NEW.l_name, COALESCE(NEW.nationality, 0), COALESCE(NEW.birth_date, 0), COALESCE(NEW.death_date, 0))
            IN (SELECT
                    f_name, l_name, COALESCE(nationality, 0), COALESCE(birth_date, 0), COALESCE(death_date, 0)
                FROM
                    authors)
            )
        THEN
            SET @message_text = CONCAT('Author ', NEW.f_name, ' ', NEW.l_name, ' already exists!');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
        END IF;
END$$
DELIMITER ;

/*DROP TRIGGER IF EXISTS check_adress_duplicate;*/
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS check_adress_duplicate BEFORE INSERT ON adresses
    FOR EACH ROW BEGIN
        IF ((NEW.street, NEW.no, NEW.postal_code)
            IN (SELECT
                    street, no, postal_code
                FROM
                    adresses)
            )
        THEN
            SET @message_text = CONCAT('Adress ', NEW.street, ' ', NEW.no, ', ', NEW.postal_code, ' already exists!');
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
        END IF;
END$$
DELIMITER ;

/*
Warnings cannot be returned from stored functions because the
RETURN statement that causes the function to return clears the
diagnostic area. The statement thus clears any warnings that may
have been present there (and resets warning_count to 0).
TRIGGERS are special kind of stored procedures, so a warning cannot be
issued from a trigger.


NULL = NULL is false in SQL
If I want to overcome this I have to use IFNULL() [mySQL only] or COALESCE() function
*/
