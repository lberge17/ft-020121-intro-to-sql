def blue_aliens
    # return the names and colors of all the aliens that are 'blue'
    "SELECT aliens.name, aliens.color FROM aliens WHERE alines.color = 'blue';"
end

def old_aliens
    # return the names and ages of all aliens over the age of 100
    "SELECT aliens.name, aliens.age FROM aliens WHERE aliens.age > 100;"
end

def dangerous_aliens
    # return the names of the dangerous aliens
    "SELECT aliens.name FROM aliens WHERE aliens.dangerous = true;"
end

def fastest_spaceship
    # return all of the info about the fastest spaceship
    "SELECT *  FROM spaceships ORDER BY(spaceships.speed) DESC LIMIT 1;"
end

def aliens_aboard_fastest_spaceship
    #return a list of the aliens aboard the fastest spaceship
    <<-SQL
        SELECT aliens.*  FROM aliens 
        JOIN spaceships ON aliens.spaceship_id = spaceships.id
        WHERE spaceships.speed = (SELECT MAX(spaceships.speed) FROM spaceships);
    SQL
end

def aliens_and_spaceships
    # Return a list of all aliens and the spaceship they belong to
    <<-SQL
        SELECT aliens.*, spaceships.name  FROM aliens 
        JOIN spaceships ON aliens.spaceship_id = spaceships.id;
    SQL
end

def aliens_and_planets
    # Get a list of all aliens and the planets they belong to
    <<-SQL
        SELECT aliens.*, planets.name  FROM aliens 
        JOIN spaceships ON aliens.spaceship_id = spaceships.id
        JOIN planets ON spaceships.planet_id = planets.id;
    SQL
end

def aliens_aboard_beebop
    # Get a list of all aliens aboard a the spaceship named 'Beebop'  
    <<-SQL
        SELECT aliens.* FROM aliens 
        JOIN spaceships ON aliens.spaceship_id = spaceships.id
        WHERE spaceships.name = 'Beebop';
    SQL
end

def aliens_from_gliese
    # Get a list of all aliens from the planet named 'Gliese'
    <<-SQL 
        SELECT aliens.*, planets.name FROM aliens 
        JOIN spaceships ON aliens.spaceship_id = spaceships.id
        JOIN planets ON spaceships.planet_id = planets.id
        WHERE planets.name = 'Gliese';
    SQL
end

def spaceship_count_for_each_planet
    # Return each planet's name and how many spaceships are from each planet
    <<-SQL 
        SELECT planets.name, COUNT(*) FROM planets 
        LEFT JOIN spaceships ON spaceships.planet_id = planets.id
        GROUP BY(planets.id);
    SQL
end

def alien_count_for_spaceships
    # Return each spaceships's name and how many aliens are aboard each spaceship 
    <<-SQL
        SELECT spaceships.name, COUNT(*) FROM spaceships 
        LEFT JOIN aliens ON spaceships.id = aliens.spaceship_id
        GROUP BY(spaceships.id);
    SQL 
end

def alien_count_for_planets
    # Return each planet's name and how many aliens are from each planet 
    <<-SQL 
        SELECT planets.name, COUNT(*) FROM planets 
        LEFT JOIN spaceships ON spaceships.planet_id = planets.id
        JOIN aliens ON spaceships.id = aliens.spaceship_id
        GROUP BY(planets.id);
    SQL
end

def order_planets_by_aliens
    # Order the planets from most number of aliens to least number of aliens
    <<-SQL
        SELECT planets.name, COUNT(*) FROM planets 
        LEFT JOIN spaceships ON spaceships.planet_id = planets.id
        JOIN aliens ON spaceships.id = aliens.spaceship_id
        GROUP BY(planets.id)
        ORDER BY(COUNT(*)) DESC;
    SQL
end

def spaceships_with_blue_aliens
    # return the names of spaceships that have blue aliens aboard
    <<-SQL 
        SELECT spaceships.name FROM spaceships 
        JOIN aliens ON spaceships.id = aliens.spaceship_id
        WHERE aliens.color = 'blue'
        GROUP BY(spaceships.id);
    SQL
end

def spaceship_and_alien_count
   # return a count of all spaceships from a planet and the total number of aliens from that planet
    <<-SQL 
        SELECT COUNT(a.alien_per_ship), SUM(a.alien_per_ship) FROM(
            SELECT COUNT(spaceships.planet_id) AS alien_per_ship, planets.name 
            FROM planets 
            JOIN spaceships ON planets.id = spaceships.planet_id 
            JOIN aliens ON spaceships.id = aliens.spaceship_id 
            GROUP BY spaceships.id
        ) AS a GROUP BY planets.id;
    SQL
end

def order_planets_by_old_alien_count
    ## MOST DIFFICULT 
    # order the planets based on how many aliens over the age of 100 are from that planet
    <<-SQL 
        SELECT planets.*, COUNT(planets.id) FROM planets 
        JOIN spaceships ON spaceships.planet_id = planets.id
        JOIN aliens ON spaceships.id = aliens.spaceship_id
        WHERE aliens.age > 100
        GROUP BY(planets.id)
        ORDER BY(COUNT(planets.id));
    SQL
end
