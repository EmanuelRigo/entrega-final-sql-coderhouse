-- USAMOS LA DB
USE peliculas_coderhouse;

-- SET GLOBAL local_infile = true;

-- LOAD DATA  LOCAL INFILE '/sql_project/data/paises.csv'
-- INTO TABLE pais
-- FIELDS TERMINATED BY ','  ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (nombre,name,cod_pais,continente);

INSERT INTO ESTUDIO (nombre, inicio_de_actividades, vigente) VALUES
('Universal Pictures', '1912-08-08', TRUE),
('Columbia Pictures', '1924-01-01', TRUE),
('Paramount Pictures', '1912-05-08', TRUE),
('Walt Disney Pictures', '1923-10-16', TRUE),
('Warner Bros. Pictures', '1923-04-04', TRUE),
('20th Century Studios', '1935-05-31', TRUE),
('DreamWorks Pictures', '1994-10-12', TRUE),
('MGM Studios', '1924-04-17', TRUE),
('Lionsgate Films', '1997-07-10', TRUE),
('New Line Cinema', '1967-03-17', TRUE),
('Miramax Films', '1979-10-01', TRUE),
('Focus Features', '2002-09-19', TRUE),
('Studio Ghibli', '1985-06-15', TRUE),
('Sony Pictures', '1987-08-07', TRUE),
('Fox Searchlight Pictures', '1994-08-01', TRUE),
('A24 Films', '2012-08-20', TRUE),
('BBC Films', '1990-06-18', TRUE),
('Pathé', '1896-09-28', TRUE),
('Amblin Entertainment', '1981-12-01', TRUE),
('Orion Pictures', '1978-12-25', TRUE);

INSERT INTO PELICULA (nombre, estreno, genero, id_estudio, cod_pais) VALUES
('Inception', '2010-07-16', 'Sci-Fi', 1, 'USA'),
('The Godfather', '1972-03-24', 'Crime', 3, 'USA'),
('Parasite', '2019-05-30', 'Thriller', 18, 'KOR'),
('Pulp Fiction', '1994-10-14', 'Crime', 11, 'USA'),
('The Matrix', '1999-03-31', 'Sci-Fi', 1, 'USA'),
('Avengers: Endgame', '2019-04-26', 'Action', 4, 'USA'),
('La La Land', '2016-12-09', 'Musical', 12, 'USA'),
('The Shawshank Redemption', '1994-09-23', 'Drama', 3, 'USA'),
('Spirited Away', '2001-07-20', 'Animation', 13, 'JPN'),
('Fight Club', '1999-10-15', 'Drama', 20, 'USA'),
('Gladiator', '2000-05-05', 'Action', 6, 'USA'),
('The Dark Knight', '2008-07-18', 'Action', 1, 'USA'),
('Forrest Gump', '1994-07-06', 'Drama', 3, 'USA'),
('Avatar', '2009-12-18', 'Sci-Fi', 6, 'USA'),
('The Grand Budapest Hotel', '2014-03-28', 'Comedy', 15, 'USA'),
('Interstellar', '2014-11-07', 'Sci-Fi', 1, 'USA'),
('Whiplash', '2014-10-10', 'Drama', 16, 'USA'),
('Mad Max: Fury Road', '2015-05-15', 'Action', 1, 'USA'),
('Joker', '2019-10-04', 'Drama', 1, 'USA'),
('The Social Network', '2010-10-01', 'Drama', 2, 'USA'),
('Moonlight', '2016-10-21', 'Drama', 16, 'USA'),
('The Revenant', '2015-12-25', 'Drama', 6, 'USA'),
('Her', '2013-12-18', 'Sci-Fi', 2, 'USA'),
('The Irishman', '2019-11-27', 'Crime', 12, 'USA'),
('Your Name', '2016-08-26', 'Animation', 13, 'JPN'),
('Once Upon a Time in Hollywood', '2019-07-26', 'Drama', 2, 'USA'),
('The Usual Suspects', '1995-08-16', 'Crime', 9, 'USA'),
('Crouching Tiger, Hidden Dragon', '2000-01-12', 'Action', 7, 'CHN'),
('A Beautiful Mind', '2001-12-21', 'Biography', 6, 'USA'),
('The Silence of the Lambs', '1991-02-14', 'Thriller', 6, 'USA'),
('The Wolf of Wall Street', '2013-12-25', 'Comedy', 2, 'USA'),
('Knives Out', '2019-11-27', 'Mystery', 9, 'USA'),
('The Big Lebowski', '1998-03-06', 'Comedy', 2, 'USA'),
('Singin in the Rain', '1952-04-11', 'Musical', 1, 'USA'),
('Inglourious Basterds', '2009-08-21', 'War', 2, 'USA'),
('Arrival', '2016-11-11', 'Sci-Fi', 2, 'USA'),
('The Shape of Water', '2017-12-08', 'Fantasy', 15, 'USA'),
('The Departed', '2006-10-06', 'Crime', 2, 'USA'),
('Django Unchained', '2012-12-25', 'Western', 2, 'USA'),
('The Kings Speech', '2010-01-07', 'Drama', 15, 'GBR'),
('Gravity', '2013-10-04', 'Sci-Fi', 1, 'USA'),
('12 Years a Slave', '2013-10-18', 'Drama', 15, 'USA'),
('The Intouchables', '2011-11-02', 'Comedy', 18, 'FRA'),
('The Hunt for Red October', '1990-03-02', 'Thriller', 3, 'USA'),
('The Prestige', '2006-10-20', 'Drama', 1, 'USA'),
('Black Swan', '2010-12-03', 'Drama', 15, 'USA'),
('Moulin Rouge!', '2001-06-01', 'Musical', 6, 'USA'),
('The Artist', '2011-11-23', 'Drama', 15, 'FRA'),
('The Revenant', '2015-12-25', 'Adventure', 6, 'USA'),
('The Truman Show', '1998-06-05', 'Drama', 1, 'USA');



INSERT INTO ACTOR_ACTRIZ (nombre, apellido, nacimiento, cod_pais) VALUES
('Meryl', 'Streep', '1949-06-22', 'USA'),
('Leonardo', 'DiCaprio', '1974-11-11', 'USA'),
('Natalie', 'Portman', '1981-06-09', 'ISR'),
('Brad', 'Pitt', '1963-12-18', 'USA'),
('Cate', 'Blanchett', '1969-05-14', 'AUS'),
('Tom', 'Hanks', '1956-07-09', 'USA'),
('Penélope', 'Cruz', '1974-04-28', 'ESP'),
('Denzel', 'Washington', '1954-12-28', 'USA'),
('Jodie', 'Foster', '1962-11-19', 'USA'),
('Michael', 'Keaton', '1951-09-05', 'USA'),
('Harrison', 'Ford', '1942-07-13', 'USA'),
('Charlize', 'Teron', '1975-08-07', 'ZAF'),
('Joaquin', 'Phoenix', '1974-10-28', 'USA'),
('Viola', 'Davis', '1965-08-11', 'USA'),
('Matthew', 'McConaughey', '1969-11-04', 'USA'),
('Saoirse', 'Ronan', '1994-04-12', 'IRL'),
('Julia', 'Roberts', '1967-10-28', 'USA'),
('Will', 'Smith', '1968-09-25', 'USA'),
('Alicia', 'Vikander', '1988-10-03', 'SWE'),
('Daniel', 'Day-Lewis', '1957-04-29', 'GBR'),
('Emma', 'Stone', '1988-11-06', 'USA'),
('Ryan', 'Reynolds', '1976-10-23', 'USA'),
('Margot', 'Robbie', '1990-07-02', 'AUS'),
('Christian', 'Bale', '1974-01-30', 'GBR'),
('Nicole', 'Kidman', '1967-06-20', 'AUS'),
('Jake', 'Gyllenhaal', '1980-12-19', 'USA'),
('Jessica', 'Chastain', '1977-03-24', 'USA'),
('Ethan', 'Hawke', '1970-11-06', 'USA'),
('Tilda', 'Swinton', '1960-11-05', 'GBR'),
('Robert', 'Redford', '1936-08-18', 'USA'),
('Emma', 'Watson', '1990-04-15', 'GBR'),
('Javier', 'Bardem', '1969-03-01', 'ESP'),
('Michelle', 'Willliams', '1980-09-09', 'USA'),
('Ben', 'Affleck', '1972-08-15', 'USA'),
('Julianne', 'Moore', '1960-12-03', 'USA'),
('Bradley', 'Cooper', '1975-01-05', 'USA'),
('Reese', 'Witherspoon', '1976-03-22', 'USA'),
('Hugh', 'Jackman', '1968-10-12', 'AUS'),
('Kate', 'Winslet', '1975-10-05', 'GBR'),
('Maggie', 'Smith', '1934-12-28', 'GBR'),
('Richard', 'Gere', '1949-08-31', 'USA'),
('Clive', 'Owen', '1964-10-03', 'GBR'),
('Jeremy', 'Renner', '1971-01-07', 'USA'),
('Scarlett', 'Johansson', '1984-11-22', 'USA'),
('Mila', 'Kunis', '1983-08-14', 'USA'),
('Naomi', 'Watts', '1968-09-28', 'AUS'),
('Janelle', 'Monáe', '1985-12-01', 'USA'),
('Timothée', 'Chalamet', '1995-12-27', 'USA'),
('Sarah', 'Paulson', '1974-12-17', 'USA'),
('Daniel', 'Kaluuya', '1989-02-24', 'GBR'),
('Paul', 'Rudd', '1969-04-06', 'USA'),
('Frances', 'McDormand', '1957-06-23', 'USA');


INSERT INTO DIRECTOR (nombre, apellido, nacimiento) VALUES
('Christopher', 'Nolan', '1970-07-30'),
('Quentin', 'Tarantino', '1963-03-27'),
('Bong', 'Joon-ho', '1969-09-14'),
('Martin', 'Scorsese', '1942-11-17'),
('James', 'Cameron', '1954-08-16'),
('David', 'Fincher', '1962-08-28'),
('Damien', 'Chazelle', '1985-01-19'),
('Frank', 'Darabont', '1959-01-28'),
('Hayao', 'Miyazaki', '1941-01-05'),
('David', 'O.Russell', '1958-08-20'),
('Ridley', 'Scott', '1937-11-30'),
('Wes', 'Anderson', '1969-05-01'),
('Steve', 'McQueen', '1969-10-09'),
('George', 'Lucas', '1944-05-14'),
('Sidney', 'Poitier', '1927-02-20'),
('M. Night', 'Shyamalan', '1970-08-06'),
('Michael', 'Haneke', '1942-03-23'),
('Pedro', 'Almodóvar', '1949-09-25'),
('Tim', 'Burton', '1958-08-25'),
('Robert', 'Zemeckis', '1952-05-14'),
('Sofia', 'Coppola', '1971-05-14'),
('Kathryn', 'Bigelow', '1951-11-27'),
('John', 'Carpenter', '1948-01-16'),
('Denis', 'Villeneuve', '1967-10-03'),
('P.T.', 'Anderson', '1970-06-26');


INSERT INTO OSCAR (edicion, id_pelicula, tipo) VALUES
('2011-02-27', 1, 'mejor_pelicula'),
('2011-02-27', 1, 'mejor_actor'),
('2011-02-27', 1, 'mejor_director'),
('1973-03-27', 2, 'mejor_pelicula'),
('1973-03-27', 2, 'mejor_actor'),
('1973-03-27', 2, 'mejor_director'),
('2020-02-09', 3, 'mejor_pelicula'),
('2020-02-09', 3, 'mejor_actor'),
('2020-02-09', 3, 'mejor_director'),
('1995-03-27', 4, 'mejor_pelicula'),
('1995-03-27', 4, 'mejor_actor'),
('1995-03-27', 4, 'mejor_director'),
('2000-03-26', 5, 'mejor_pelicula'),
('2000-03-26', 5, 'mejor_actor'),
('2000-03-26', 5, 'mejor_director'),
('2020-02-09', 6, 'mejor_pelicula'),
('2020-02-09', 6, 'mejor_actor'),
('2020-02-09', 6, 'mejor_director'),
('2017-02-26', 7, 'mejor_pelicula'),
('2017-02-26', 7, 'mejor_actor'),
('2017-02-26', 7, 'mejor_director'),
('1995-03-27', 8, 'mejor_pelicula'),
('1995-03-27', 8, 'mejor_actor'),
('1995-03-27', 8, 'mejor_director'),
('2003-03-23', 9, 'mejor_pelicula'),
('2003-03-23', 9, 'mejor_actor'),
('2003-03-23', 9, 'mejor_director'),
('2000-03-26', 10, 'mejor_pelicula'),
('2000-03-26', 10, 'mejor_actor'),
('2000-03-26', 10, 'mejor_director'),
('2001-03-25', 11, 'mejor_pelicula'),
('2001-03-25', 11, 'mejor_actor'),
('2001-03-25', 11, 'mejor_director'),
('2009-02-22', 12, 'mejor_pelicula'),
('2009-02-22', 12, 'mejor_actor'),
('2009-02-22', 12, 'mejor_director'),
('1995-03-27', 13, 'mejor_pelicula'),
('1995-03-27', 13, 'mejor_actor'),
('1995-03-27', 13, 'mejor_director'),
('2010-03-07', 14, 'mejor_pelicula'),
('2010-03-07', 14, 'mejor_actor'),
('2010-03-07', 14, 'mejor_director'),
('2015-02-22', 15, 'mejor_pelicula'),
('2015-02-22', 15, 'mejor_actor'),
('2015-02-22', 15, 'mejor_director'),
('2014-02-02', 16, 'mejor_pelicula'),
('2014-02-02', 16, 'mejor_actor'),
('2014-02-02', 16, 'mejor_director'),
('2015-02-22', 17, 'mejor_pelicula'),
('2015-02-22', 17, 'mejor_actor'),
('2016-02-28', 18, 'mejor_pelicula'),
('2016-02-28', 18, 'mejor_actor'),
('2016-02-28', 18, 'mejor_director'),
('2019-02-24', 19, 'mejor_pelicula'),
('2019-02-24', 19, 'mejor_actor'),
('2019-02-24', 19, 'mejor_director'),
('2011-02-27', 20, 'mejor_pelicula'),
('2011-02-27', 20, 'mejor_actor'),
('2011-02-27', 20, 'mejor_director'),
('2017-02-26', 21, 'mejor_pelicula'),
('2017-02-26', 21, 'mejor_actor'),
('2017-02-26', 21, 'mejor_director'),
('2016-02-28', 22, 'mejor_pelicula'),
('2016-02-28', 22, 'mejor_actor'),
('2016-02-28', 22, 'mejor_director'),
('2014-02-02', 23, 'mejor_pelicula'),
('2014-02-02', 23, 'mejor_actor'),
('2014-02-02', 23, 'mejor_director'),
('2020-02-09', 24, 'mejor_pelicula'),
('2020-02-09', 24, 'mejor_actor'),
('2020-02-09', 24, 'mejor_director'),
('2002-02-24', 25, 'mejor_pelicula'),
('2002-02-24', 25, 'mejor_actor'),
('2002-02-24', 25, 'mejor_director'),
('2020-02-09', 26, 'mejor_pelicula'),
('2020-02-09', 26, 'mejor_actor'),
('2020-02-09', 26, 'mejor_director'),
('1996-03-25', 27, 'mejor_pelicula'),
('1996-03-25', 27, 'mejor_actor'),
('1996-03-25', 27, 'mejor_director'),
('2001-03-25', 28, 'mejor_pelicula'),
('2001-03-25', 28, 'mejor_actor'),
('2001-03-25', 28, 'mejor_director'),
('2002-02-24', 29, 'mejor_pelicula'),
('2002-02-24', 29, 'mejor_actor'),
('2002-02-24', 29, 'mejor_director'),
('1992-03-30', 30, 'mejor_pelicula'),
('1992-03-30', 30, 'mejor_actor'),
('1992-03-30', 30, 'mejor_director'),
('2014-02-02', 31, 'mejor_pelicula'),
('2014-02-02', 31, 'mejor_actor'),
('2014-02-02', 31, 'mejor_director'),
('2000-03-26', 32, 'mejor_pelicula'),
('2000-03-26', 32, 'mejor_actor'),
('2000-03-26', 32, 'mejor_director'),
('2000-03-26', 33, 'mejor_pelicula'),
('2000-03-26', 33, 'mejor_actor'),
('2000-03-26', 33, 'mejor_director'),
('1953-03-19', 34, 'mejor_pelicula'),
('1953-03-19', 34, 'mejor_actor'),
('1953-03-19', 34, 'mejor_director'),
('2010-03-07', 35, 'mejor_pelicula'),
('2010-03-07', 35, 'mejor_actor'),
('2010-03-07', 35, 'mejor_director'),
('2017-02-26', 36, 'mejor_pelicula'),
('2017-02-26', 36, 'mejor_actor'),
('2017-02-26', 36, 'mejor_director'),
('2018-03-04', 37, 'mejor_pelicula'),
('2018-03-04', 37, 'mejor_actor'),
('2018-03-04', 37, 'mejor_director'),
('2007-02-25', 38, 'mejor_pelicula'),
('2007-02-25', 38, 'mejor_actor'),
('2007-02-25', 38, 'mejor_director'),
('2013-02-24', 39, 'mejor_pelicula'),
('2013-02-24', 39, 'mejor_actor'),
('2013-02-24', 39, 'mejor_director'),
('2011-02-27', 40, 'mejor_pelicula'),
('2011-02-27', 40, 'mejor_actor'),
('2011-02-27', 40, 'mejor_director'),
('2014-02-02', 41, 'mejor_pelicula'),
('2014-02-02', 41, 'mejor_actor'),
('2014-02-02', 41, 'mejor_director'),
('2014-02-02', 42, 'mejor_pelicula'),
('2014-02-02', 42, 'mejor_actor'),
('2014-02-02', 42, 'mejor_director'),
('2012-02-26', 43, 'mejor_pelicula'),
('2012-02-26', 43, 'mejor_actor'),
('2012-02-26', 43, 'mejor_director'),
('1991-02-25', 44, 'mejor_pelicula'),
('1991-02-25', 44, 'mejor_actor'),
('1991-02-25', 44, 'mejor_director'),
('2007-02-25', 45, 'mejor_pelicula'),
('2007-02-25', 45, 'mejor_actor'),
('2007-02-25', 45, 'mejor_director'),
('2011-02-27', 46, 'mejor_pelicula'),
('2011-02-27', 46, 'mejor_actor'),
('2011-02-27', 46, 'mejor_director'),
('2002-02-24', 47, 'mejor_pelicula'),
('2002-02-24', 47, 'mejor_actor'),
('2002-02-24', 47, 'mejor_director'),
('2012-02-26', 48, 'mejor_pelicula'),
('2012-02-26', 48, 'mejor_actor'),
('2012-02-26', 48, 'mejor_director'),
('2016-02-28', 49, 'mejor_pelicula'),
('2016-02-28', 49, 'mejor_actor'),
('2016-02-28', 49, 'mejor_director'),
('2000-03-26', 50, 'mejor_pelicula'),
('2000-03-26', 50, 'mejor_actor'),
('2000-03-26', 50, 'mejor_director');



INSERT INTO ACTOR_PELICULA (id_actor, id_pelicula) VALUES
(1, 1),
(2, 5),
(3, 16),
(4, 18),
(5, 21),
(6, 22),
(7, 6),
(8, 11),
(9, 30),
(10, 45);