INSERT INTO Movies
    (title, runtime, genre, imdb_score, rating)
VALUES
    ('Howard the Duck', 110, 'Sci-Fi', 4.6, 'PG'),
    ('Lavalantula', 83, 'Horror', 4.7, 'TV-14'),
    ('Starship Troopers', 129, 'Sci-Fi', 7.2, 'PG-13'),
    ('Waltz With Bashir', 90, 'Documentary', 8.0, 'R'),
    ('Spaceballs', 96, 'Comedy', 7.1, 'PG'),
    ('Monsters Inc.', 92, 'Animation', 8.1, 'G'),
    ('This is the End', 107, 'Comedy', 6.6, 'R'),
    ('War Dogs', 114, 'Biography', 7.1, 'R'),
    ('Hercules', 93, 'Animation', 7.3, 'G');


-- find all movies in the Sci-Fi genre
SELECT * FROM Movies WHERE genre='Sci-Fi';


-- find all films that scored at least a 6.5
SELECT * FROM Movies WHERE imdb_score>=6.5;


-- find all of the movies rated G or PG that are less than 100 minutes long
SELECT * FROM Movies WHERE rating='PG' OR rating='G' HAVING runtime<100;


-- show the average runtimes of movies rated below a 7.5,
-- grouped by their respective genres
SELECT title, genre, imdb_score, AVG(runtime)
FROM Movies
GROUP BY genre
HAVING imdb_score<7.5;


-- Starship Troopers is actually rated R, not PG-13.
-- Create a query that finds the movie by its title and changes its rating to R
UPDATE Movies SET rating='R' WHERE title='Starship Troopers';


-- Show the ID number and rating of all of the
-- Horror and Documentary movies in the database
SELECT id, rating FROM Movies WHERE genre='Horror' OR genre='Documentary';


-- find the average, maximum, and minimum IMDB score for movies of each rating
SELECT AVG(imdb_score), MIN(imdb_score), MAX(imdb_score)
FROM Movies GROUP BY rating;


-- use a HAVING COUNT(*) > 1 clause to only show ratings with multiple movies showing
SELECT AVG(imdb_score), MIN(imdb_score), MAX(imdb_score)
FROM Movies GROUP BY rating HAVING COUNT(*)>1;


-- Delete all entries that have a rating of R
DELETE FROM Movies WHERE rating='R';