-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off


-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS film_cast;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS studios;

-- Create new tables, according to your domain model
-- TODO!

-- creating table for studio
CREATE TABLE studios (
  studio_id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT
);

-- creating table for movies
CREATE TABLE movies (
  movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_title TEXT,
  year_released INTEGER,
  mpaa_rating TEXT,
  studio_id INTEGER,
  FOREIGN KEY(studio_id) REFERENCES studios(studio_id)
);

-- creating table for actors
CREATE TABLE actors (
  actor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor_name TEXT
);

-- creating table for cast
CREATE TABLE film_cast (
  film_cast_id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  actor_id INTEGER,
  actor_role TEXT,
  FOREIGN KEY(actor_id) REFERENCES actors(actor_id),
  FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

-- insert values to cast table
INSERT INTO studios VALUES (1,'Warner Bros.');

-- insert values to movies table
INSERT INTO movies VALUES (10001,'Batman Begins',2005,'PG-13',1);
INSERT INTO movies VALUES (10002,'The Dark Knight',2008,'PG-13',1);
INSERT INTO movies VALUES (10003,'The Dark Knight Rises',2012,'PG-13',1);

-- insert values to actors table
INSERT INTO actors VALUES (20001,'Christian Bale');
INSERT INTO actors VALUES (20002,'Michael Caine');
INSERT INTO actors VALUES (20003,'Liam Neeson');
INSERT INTO actors VALUES (20004,'Katie Holmes');
INSERT INTO actors VALUES (20005,'Gary Oldman');
INSERT INTO actors VALUES (20006,'Heath Ledger');
INSERT INTO actors VALUES (20007,'Aaron Eckhart');
INSERT INTO actors VALUES (20008,'Maggie Gyllenhaal');
INSERT INTO actors VALUES (20009,'Tom Hardy');
INSERT INTO actors VALUES (20010,"Joseph Gordon-Levitt");
INSERT INTO actors VALUES (20011,'Anne Hathaway');

-- insert values to cast table
INSERT INTO film_cast VALUES (1, 10001, 20001, 'Bruce Wayne');
INSERT INTO film_cast VALUES (2, 10001, 20002, 'Alfred');
INSERT INTO film_cast VALUES (3, 10001, 20003, "Ra's Al Ghul");
INSERT INTO film_cast VALUES (4, 10001, 20004, 'Rachel Dawes');
INSERT INTO film_cast VALUES (5, 10001, 20005, 'Commissioner Gordon');
INSERT INTO film_cast VALUES (6, 10002, 20001, 'Bruce Wayne');
INSERT INTO film_cast VALUES (7, 10002, 20006, 'Joker');
INSERT INTO film_cast VALUES (8, 10002, 20007, 'Harvey Dent');
INSERT INTO film_cast VALUES (9, 10002, 20002, 'Alfred');
INSERT INTO film_cast VALUES (10, 10002, 20008, 'Rachel Dawes');
INSERT INTO film_cast VALUES (11, 10003, 20001, 'Bruce Wayne');
INSERT INTO film_cast VALUES (12, 10003, 20005, 'Commissioner Gordon');
INSERT INTO film_cast VALUES (13, 10003, 20009, 'Bane');
INSERT INTO film_cast VALUES (14, 10003, 20010, 'John Blake');
INSERT INTO film_cast VALUES (15, 10003, 20011, 'Selina Kyle');




-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
-- I tried to google how to make auto-adjust but have not succeeded 
.width 22 13 5 20

select 
movies.movie_title,
movies.year_released,
movies.mpaa_rating,
studios.studio_name
from movies
    left join studios
    on movies.studio_id = studios.studio_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
-- I tried to google how to make auto-adjust but have not succeeded 
.width 22 20 20

select 
movies.movie_title,
actors.actor_name,
film_cast.actor_role

from movies
    left join film_cast
    on movies.movie_id = film_cast.movie_id
    left join actors
    on film_cast.actor_id = actors.actor_id


