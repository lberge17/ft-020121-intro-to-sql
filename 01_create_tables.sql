CREATE TABLE aliens (id INTEGER PRIMARY KEY, name TEXT, color TEXT, age INTEGER, dangerous BOOLEAN, spaceship_id INTEGER);
CREATE TABLE spaceships (id INTEGER PRIMARY KEY, name TEXT, speed INTEGER, description TEXT, planet_id INTEGER);
CREATE TABLE planets (id INTEGER PRIMARY KEY, name TEXT, distance INTEGER);