/*Queries that provide answers to the questions from all projects.*/

/*Find all animals whose name ends in "mon".*/

SELECT * FROM animals WHERE name LIKE '%mon';

/*List the name of all animals born between 2016 and 2019*/

SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-01-01'; 

/*List the name of all animals that are neutered and have less than 3 escape attempts*/

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

/*List date of birth of all animals named either "Agumon" or "Pikachu"*/

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

/*List name and escape attempts of animals that weigh more than 10.5kg*/

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/

SELECT * FROM animals WHERE neutered = true;

/*Find all animals not named Gabumon*/

SELECT * FROM ANIMALS WHERE name <> 'Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*How many animals are there?*/

SELECT COUNT(*) AS total_animals FROM animals;

/*
 total_animals
---------------
            10
(1 row)
*/

/*How many animals have never tried to escape?*/

SELECT COUNT(*) AS total_behaved_animals FROM animals WHERE escape_attempts = 0;

/*
 total_behaved_animals
-----------------------
                     2
(1 row)
*/

/*What is the average weight of animals?*/

SELECT AVG(weight_kg) AS average_weight_kg FROM animals;

/*
  average_weight_kg
---------------------
 15.5500000000000000
(1 row)
*/

/*Who escapes the most, neutered or not neutered animals?*/

SELECT neutered, COUNT(*) FROM animals GROUP BY neutered;

/*
 neutered | count
----------+-------
 f        |     3
 t        |     7
(2 rows)

Answer: Neutered
*/

/*What is the minimum and maximum weight of each type of animal?*/

SELECT species, MIN(weight_kg) AS minimum_weight_kg, MAX(weight_kg) AS max_weight_kg FROM animals GROUP BY species;

/*
 species | minimum_weight_kg | max_weight_kg
---------+-------------------+---------------
 pokemon |                11 |            17
 digimon |               5.7 |            45
(2 rows)
*/

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/

SELECT species, SUM(escape_attempts) FROM animals WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-01-01' GROUP BY species;

/*
 species | sum
---------+-----
 pokemon |   6
(1 row)
*/

/*What animals belong to Melody Pond?*/

SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.id = 4;

/*
    name
------------
 Blossom
 Charmander
 Squirtle
(3 rows)
*/

/*List of all animals that are pokemon (their type is Pokemon)*/

SELECT animals.name, animals.species_id, species.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.id = 1;

/*
    name    | species_id |  name
------------+------------+---------
 Pikachu    |          1 | Pokemon
 Blossom    |          1 | Pokemon
 Charmander |          1 | Pokemon
 Squirtle   |          1 | Pokemon
(4 rows)
*/

/*List all owners and their animals, remember to include those that don't own any animal*/

SELECT * FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id;

/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id | id |    full_name    | age
----+------------+---------------+-----------------+----------+-----------+------------+----------+----+-----------------+-----
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |        1 |  1 | Sam Smith       |  34
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |          2 |        2 |  2 | Jennifer Orwell |  19
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |        2 |  2 | Jennifer Orwell |  19
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 |          2 |        3 |  3 | Bob             |  45
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |          2 |        3 |  3 | Bob             |  45
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |        4 |  4 | Melody Pond     |  77
  5 | Charmander | 2020-02-08    |               0 | f        |        11 |          1 |        4 |  4 | Melody Pond     |  77
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |          1 |        4 |  4 | Melody Pond     |  77
  8 | Angemon    | 2005-06-12    |               1 | t        |        45 |          2 |        5 |  5 | Dean Winchester |  14
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |          2 |        5 |  5 | Dean Winchester |  14
(10 rows)
*/

/*How many animals are there per species?*/

SELECT species.name, COUNT(animals.species_id) FROM animals
JOIN species ON animals.species_id = species.id GROUP BY species.name;

/*
  name   | count
---------+-------
 Pokemon |     4
 Digimon |     6
(2 rows)
*/

/*List all Digimon owned by Jennifer Orwell*/

SELECT owners.full_name, animals.species_id, animals.name AS pokemon FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.id = 2 AND animals.species_id = 2;

/*
    full_name    | species_id | pokemon
-----------------+------------+---------
 Jennifer Orwell |          2 | Gabumon
(1 row)
*/

/*List all animals owned by Dean Winchester that haven't tried to escape*/

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE animals.owner_id = 5 AND animals.escape_attempts = 1;

/*
 id | name | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id | id | full_name | age
----+------+---------------+-----------------+----------+-----------+------------+----------+----+-----------+-----
(0 rows)
*/

/*Who owns the most animals?*/

SELECT owners.full_name, COUNT(animals.owner_id) AS total_animals FROM animals
JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(*) DESC;

/*
    full_name    | total_animals
-----------------+---------------
 Melody Pond     |             3
 Dean Winchester |             2
 Bob             |             2
 Jennifer Orwell |             2
 Sam Smith       |             1
(5 rows)
*/
