BEGIN
    /* Attempt to drop the backup table for titles if it exists */
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE bak_titles';
    EXCEPTION
        /* Ignore any exceptions that occur (table doesnt exist) */
        WHEN OTHERS THEN NULL;
    END;
    /* Create a new backup table for titles by copying all data from the original titles table */
    EXECUTE IMMEDIATE 'CREATE TABLE bak_titles AS SELECT * FROM titles';

    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE bak_authors';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE bak_authors AS SELECT * FROM authors';

    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE bak_title_authors';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE bak_title_authors AS SELECT * FROM title_authors';

    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE bak_publishers';
    EXCEPTION
        WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE bak_publishers AS SELECT * FROM publishers';
END;


/* Selects to show it worked */
SELECT * FROM bak_titles;
SELECT * FROM bak_authors;
SELECT * FROM bak_title_authors;
SELECT * FROM bak_publishers;

/* Personal notes
   https://www.techonthenet.com/oracle/exceptions/when_others.php - traps exceptions, for non-existing tables

 */