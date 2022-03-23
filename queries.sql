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

SELECT * FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

/*
 id |    full_name    | age | id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id
----+-----------------+-----+----+------------+---------------+-----------------+----------+-----------+------------+----------
  1 | Sam Smith       |  34 |  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |        1
  2 | Jennifer Orwell |  19 |  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |          2 |        2
  2 | Jennifer Orwell |  19 |  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |        2
  3 | Bob             |  45 |  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 |          2 |        3
  3 | Bob             |  45 |  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |          2 |        3
  4 | Melody Pond     |  77 |  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |        4
  4 | Melody Pond     |  77 |  5 | Charmander | 2020-02-08    |               0 | f        |        11 |          1 |        4
  4 | Melody Pond     |  77 | 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |          1 |        4
  5 | Dean Winchester |  14 |  8 | Angemon    | 2005-06-12    |               1 | t        |        45 |          2 |        5
  5 | Dean Winchester |  14 |  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |          2 |        5
  6 | Jodie Whittaker |  38 |    |            |               |                 |          |           |            |
(11 rows)
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

-- Who was the last animal seen by William Tatcher?

SELECT animals.name, MAX(visits.date_of_visit) FROM animals
JOIN visits ON visits.animals_id = animals.id WHERE vets_id = 1 GROUP BY animals.name ORDER BY MAX(visits.date_of_visit) DESC LIMIT 1;

/*
   name   |    max
----------+------------
 Blossom  | 2021-01-11
 Plantmon | 2020-08-10
 Agumon   | 2020-05-24
(3 rows)
*/

-- How many different animals did Stephanie Mendez see?

SELECT vets_id, COUNT(vets_id) FROM visits WHERE visits.vets_id = 3 GROUP BY vets_id;

/*
 vets_id | count
---------+-------
       3 |     4
(1 row)
*/

-- List all vets and their specialties, including vets with no specialties.

SELECT name, species_id FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id;

/*
       name       | species_id
------------------+------------
 William Tatcher  |          1
 Stephanie Mendez |          1
 Stephanie Mendez |          2
 Jack Harkness    |          2
 Maisy Smith      |
(5 rows)
*/

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name FROM animals
JOIN visits ON visits.animals_id = animals.id WHERE vets_id = 3 AND date_of_visit BETWEEN DATE '2020-04-01' AND '2020-08-30';

/*
  name
---------
 Agumon
 Blossom
(2 rows)
*/

-- What animal has the most visits to vets?

SELECT animals.name, COUNT(visits.animals_id) FROM animals
JOIN visits ON visits.animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

/*
  name   | count
---------+-------
 Boarmon |     4
(1 row)
*/

-- Who was Maisy Smith's first visit?

SELECT animals.name, MIN(visits.date_of_visit) FROM animals
JOIN visits ON visits.animals_id = animals.id WHERE vets_id = 2 GROUP BY animals.name ORDER BY MIN(visits.date_of_visit) LIMIT 1;

/*
  name   |    min
---------+------------
 Boarmon | 2019-01-24
(1 row)
*/

-- Details for most recent visit: animal information, vet information, and date of visit.

 SELECT animals.id, animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, animals.species_id, vets.id, vets.name, vets.date_of_graduation, MIN(visits.date_of_visit) FROM animals
 JOIN visits ON visits.animals_id = animals.id
 JOIN vets ON vets.id = animals.owner_id GROUP BY animals.id, vets.id ORDER BY MIN(visits.date_of_visit) DESC LIMIT 1;

 /*
  id |  name   | date_of_birth | escape_attempts | neutered | weight_kg | species_id | id |       name       | date_of_graduation |    min
----+---------+---------------+-----------------+----------+-----------+------------+----+------------------+--------------------+------------
  4 | Devimon | 2017-05-12    |               5 | t        |        11 |          2 |  3 | Stephanie Mendez | 1981-05-04         | 2021-05-04
(1 row)
*/

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT vets.name, COUNT(visits.vets_id) FROM visits
  JOIN vets ON visits.vets_id = vets.id
  JOIN animals ON visits.animals_id = animals.id
  JOIN specializations ON vets.id = specializations.vets_id
  WHERE specializations.species_id != animals.species_id
  GROUP BY vets.name;

/*
       name       | count
------------------+-------
 William Tatcher  |     2
 Stephanie Mendez |     4
 Jack Harkness    |     1
(3 rows)
*/

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(animals.species_id) AS most_species FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE visits.vets_id = 2
GROUP BY species.name LIMIT 1;

/*
  name   | most_species
---------+--------------
 Digimon |            6
(1 row)
*/