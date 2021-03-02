# sql-queries-challenge

## Instructions

Complete this challenge by first creating a db and the 3 tables. You can do this in your terminal with the following commands: 

```sql
sqlite3 alien.db < 01_create_tables.sql
```

After creating the tables, add some of the previously created data: 
```sql
sqlite3 alien.db < 02_insert_data.sql
```

Use the `queries.rb` file to record your answers to each query challenge listed below. 

# Congratulations, Secret Agent


You have been chosen to help us discover and track aliens around the universe.

Before we can go public with our UFO findings, we need all the data we can get. That is where you come in. 

---

We have a little information for you, but we need to get organized. We need YOU to collect and store data on aliens, the UFOs (or spaceship) they are using, and the planets they come from.

In your terminal, create a sqlite3 database to hold all of this information.

We need to keep track of aliens, spaceships, and planets. 

Aliens will have a name, color, age, and a dangerous attribute that is either true or false. Aliens should belong to a spaceship.

Spaceships will have a name, a speed, a description, and should belong to a planet and have many aliens aboard.

A planet should have a name and a distance from Earth in Light-Years. It should also have many spaceships (and many aliens through spaceships)


Once you have the database set up, start gathering data. Here is what we know so far:

---

**Known Aliens**

name: Dalek, color: blue, age: 200, dangerous: false, belongs to the Bebop spaceship

---

**Known Spaceships**

name: Bebop, speed: 450, description: shaped like a cowboy hat, is from the Gliese planet

---

**Known Planets**

name: Gliese, distance: 25

---

You are in charge of adding more information! Try using the Faker Gem in IRB to fake some more planets, aliens, and spaceships! Don't stress about making Alien sounding names.


Once you have gathered your data, now you need to teach us non-techies how to access your work. I need to be able to:

- return the names and colors of all the aliens that are 'blue'
- return the names and ages of all aliens over the age of 100
- return the names of the dangerous aliens
- return all of the info about the fastest spaceship
- return a list of the aliens aboard the fastest spaceship
- return a list of all aliens and the spaceship they belong to
- get a list of all aliens and the planets they belong to 
- get a list of all aliens aboard a the spaceship named 'Beebop'  
- get a list of all aliens from the planet named 'Gliese'
- return each planet's name and how many spaceships are from each planet
- return each spaceships's name and how many aliens are aboard each spaceship    
- return each planet's name and how many aliens are from each planet  
- order the planets from most number of aliens to least number of aliens
- return the names of spaceships that have blue aliens aboard
- return a count of all spaceships from a planet and the total number of aliens from that planet
- order the planets based on how many aliens are from that planet
- MOST DIFFICULT: order the planets based on how many aliens over the age of 100 are from that planet


Deliver your report by the end of the study group!