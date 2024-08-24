/*https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database*/

CREATE DATABASE universe;

CREATE TABLE scientist (
  scientist_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  famous BOOLEAN NOT NULL,
  year_graduated INT,
  final_grade NUMERIC(4,1)
);

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  scientist_id INT NOT NULL,
  description TEXT,
  year_discovered INT,
  FOREIGN KEY (scientist_id) REFERENCES scientist(scientist_id)
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  galaxy_id INT NOT NULL,
  scientist_id INT,
  year_discovered INT,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
  FOREIGN KEY (scientist_id) REFERENCES scientist(scientist_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  star_id INT NOT NULL,
  scientist_id INT,
  reachable BOOLEAN,
  year_discovered INT,
  FOREIGN KEY (scientist_id) REFERENCES scientist(scientist_id),
  FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  planet_id INT NOT NULL,
  scientist_id INT,
  year_discovered INT,
  FOREIGN KEY (scientist_id) REFERENCES scientist(scientist_id),
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);


INSERT INTO scientist(name, famous, year_graduated, final_grade) 
VALUES ('Luciano', true, 2004, 98.3), ('Thomas', false, 2005, 95.7), ('Penelope', false, 2004, 100);

INSERT INTO galaxy(name, scientist_id, description, year_discovered) 
VALUES ('Andor', 1, 'a galaxy far far away', 2004), ('Babylon', 3, 'full of mysteries', 2005), ('Caftee', 2, 'unknown', 2005),
('Dorime', 1, 'musical galaxy', 2006), ('Epsilon Galaxy', 1, 'galaxy with mathematical properties', 2007), ('Faber', 3, 'colorfull galaxy', 2008);

INSERT INTO star(name, scientist_id, galaxy_id, year_discovered) 
VALUES ('Abessa', 1, 1, 2005), ('Bethesda', 3, 2, 2006), ('Cobbertone', 2, 3, 2006),
('Daphne', 1, 4, 2007), ('Eger', 1, 5, 2008), ('Fabulous', 3, 6, 2009);

INSERT INTO planet(name, scientist_id, star_id, year_discovered, reachable) 
VALUES ('Alexander', 1, 1, 2005, true), ('Bellator', 2, 1, 2006, false), ('Coghlan', 3, 2, 2005, true),
('Domain', 3, 2, 2005, false), ('Estero', 1, 3, 2007, true), ('Faisbuk', 2, 3, 2008, false),
('Garabal', 2, 6, 2008, true), ('Highland', 1, 4, 2008, true), ('Igor', 3, 4, 2008, true),
('Java', 1, 5, 2009, true), ('Kakona', 1, 5, 2010, false), ('Luciano', 3, 6, 2014, true);

INSERT INTO moon(name, scientist_id, planet_id, year_discovered) 
VALUES ('Akron', 1, 1, 2005), ('Belgar', 2, 1, 2006), ('Cockroach', 3, 2, 2005),
('Deber', 3, 2, 2005), ('Eberl', 1, 3, 2007), ('Fuimba', 2, 3, 2008),
('Gogol', 2, 6, 2008), ('Herr', 1, 4, 2008), ('Ivanov', 3, 4, 2008),
('Javascript', 1, 5, 2009), ('Karlovi', 1, 5, 2010), ('Lobot', 3, 6, 2014),
('Mormon', 3, 7, 2011), ('Nomad', 1, 7, 2012), ('Obstruk', 2, 8, 2012),
('Polanc', 2, 9, 2013), ('Quasch', 1, 10, 2014), ('Roberto', 3, 11, 2015),
('Solana', 1, 12, 2015), ('Torton', 1, 12, 2018);
