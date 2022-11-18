-- ------------------------ Creating Database Tables

CREATE TABLE MovieDB (
    movie_ID int PRIMARY KEY,
    movie_title VARCHAR(50),
    movie_launch_year YEAR,
    movie_runtime INT,
    movie_language VARCHAR(3),
    movie_country VARCHAR(20)
);

INSERT INTO MovieDB VALUES (12008, "Iron Man", "2008", 126, "ENG", "USA");
INSERT INTO MovieDB VALUES (22008, "The Incredible Hulk", "2008", 112, "ENG", "USA");
INSERT INTO MovieDB VALUES (32010, "Iron Man 2", "2010", 124, "ENG", "USA");
INSERT INTO MovieDB VALUES (42011, "Thor", "2011", 114, "ENG", "USA");
INSERT INTO MovieDB VALUES (52011, "Captain America: The First Avenger", "2011", 124, "ENG", "USA");


CREATE TABLE ActorDB (
		actor_ID VARCHAR(5),
  	actor_first_name VARCHAR(20),
  	actor_last_name VARCHAR(20),
  	actor_gender VARCHAR(1)
);

INSERT INTO ActorDB VALUES ("ACT001","Robert","Downey Jr.","M");
INSERT INTO ActorDB VALUES ("ACT002","Chris","Hemsworth","M");
INSERT INTO ActorDB VALUES ("ACT003","Chris","Evens","M");
INSERT INTO ActorDB VALUES ("ACT004","Mark","Raffalo","M");


CREATE TABLE DirectorDB (
		director_ID VARCHAR(5),
  	director_first_name VARCHAR(20),
  	director_last_name VARCHAR(20)
);

INSERT INTO DirectorDB VALUES ("DIR001","Jon","Favreau");
INSERT INTO DirectorDB VALUES ("DIR002","Louis","Leterrier");
INSERT INTO DirectorDB VALUES ("DIR003","Kenneth","Branagh");
INSERT INTO DirectorDB VALUES ("DIR004","Joe","Johnston");
INSERT INTO DirectorDB VALUES ("DIR005","Joss","Whedon");

CREATE TABLE MovieDirectionDB (
		director_ID VARCHAR(5),
	 	movie_ID INT
);

INSERT INTO MovieDirectionDB VALUES ("DIR001", 12008);
INSERT INTO MovieDirectionDB VALUES ("DIR002", 22008);
INSERT INTO MovieDirectionDB VALUES ("DIR001", 32010);
INSERT INTO MovieDirectionDB VALUES ("DIR003", 42011);
INSERT INTO MovieDirectionDB VALUES ("DIR004", 52011);
INSERT INTO MovieDirectionDB VALUES ("DIR005", 62011);

CREATE TABLE MovieCastDB (
		actor_ID VARCHAR(5),
	 	movie_ID INT,
  	role VARCHAR(20)
);

INSERT INTO MovieCastDB VALUES ("ACT001", 12008, "Lead");
INSERT INTO MovieCastDB VALUES ("ACT004", 22008, "Lead");
INSERT INTO MovieCastDB VALUES ("ACT001", 32010, "Lead");
INSERT INTO MovieCastDB VALUES ("ACT002", 42011, "Lead");
INSERT INTO MovieCastDB VALUES ("ACT003", 52011, "Lead");
INSERT INTO MovieCastDB VALUES ("ACT001", 62012, "Lead");

CREATE TABLE GenreDB (		
  	genre_ID VARCHAR(5),
		genre_title VARCHAR(10)
);

INSERT INTO GenreDB VALUES ("GEN001", "Action");
INSERT INTO GenreDB VALUES ("GEN002", "Sci-Fi");
INSERT INTO GenreDB VALUES ("GEN003", "Fantasy");


CREATE TABLE MovieGenreDB (		
  	movie_ID INT,
   	genre_ID VARCHAR(5)
);

INSERT INTO MovieGenreDB VALUES (12008, "GEN002");
INSERT INTO MovieGenreDB VALUES (22008, "GEN001");
INSERT INTO MovieGenreDB VALUES (32010, "GEN002");
INSERT INTO MovieGenreDB VALUES (42011, "GEN003");
INSERT INTO MovieGenreDB VALUES (52011, "GEN002");
INSERT INTO MovieGenreDB VALUES (62011, "GEN002");

CREATE TABLE ReviewerDB (		
  	reviewer_ID VARCHAR(5),
  	reviewer_name VARCHAR(30)
);

INSERT INTO ReviewerDB VALUES ("REV001", "Rotten Tomatoes");
INSERT INTO ReviewerDB VALUES ("REV002", "IMDB");

CREATE TABLE RatingsDB (		
  	movie_ID INT,
  	reviewer_ID VARCHAR(5),
   	reviewer_stars INT,
    no_of_reviews INT
);

INSERT INTO RatingsDB VALUES (12008, "REV002", 4.7, 2052);
INSERT INTO RatingsDB VALUES (22008, "REV001", 4.1, 664);
INSERT INTO RatingsDB VALUES (32010, "REV002", 4.2, 701);
INSERT INTO RatingsDB VALUES (42011, "REV001", 4.1, 1156);
INSERT INTO RatingsDB VALUES (52011, "REV002", 4.5, 1293);
INSERT INTO RatingsDB VALUES (62011, "REV002", 4.7, 2271);

-- ------------------------ RUNNING FETCH QUERIES : Write an SQL query to find

-- year and name of movies

SELECT movie_title, movie_launch_year from MovieDB;

-- when the movie was released

SELECT movie_title, movie_launch_year 
		FROM MovieDB
    WHERE movie_title="Iron Man" OR movie_title="Iron Man 2";

-- all movies released in the year 2011

SELECT movie_title  
		FROM MovieDB
    WHERE movie_launch_year=2011;

-- all movies released before the year 2010
SELECT movie_title, movie_launch_year  
		FROM MovieDB
    WHERE movie_launch_year<2010;

-- name of all reviewers and movies together in a single list



-- all reviewers who have rated 4.5 or more stars in their rating. Return reviewers names

SELECT RatingsDB.reviewer_stars, ReviewerDB.reviewer_name
		FROM RatingsDB
    JOIN ReviewerDB
    ON ReviewerDB.reviewer_ID = RatingsDB.reviewer_ID
    WHERE RatingsDB.reviewer_stars<4.5
    ORDER BY ReviewerDB.reviewer_name;

-- movies without any rating

SELECT MovieDB.movie_ID, RatingsDB.reviewer_stars
		FROM MovieDB
    JOIN ReviewerDB
    ON ReviewerDB.movie_ID = MovieDB.movie_ID
    WHERE RatingsDB.reviewer_stars IS NULL;

-- sort results in ascending order of movie year 2011 

SELECT movie_title, movie_launch_year
		FROM MovieDB
    WHERE movie_launch_year=2011
    ORDER BY movie_title;

-- all actors with the comman first name "Chris"

SELECT actor_id, actor_first_name, actor_last_name
		FROM ActorDB
    WHERE actor_first_name="Chris";

-- all movies that containt "Iron" in their title

SELECT movie_ID, movie_title
		FROM MovieDB
    WHERE movie_title LIKE 'Iron%';
