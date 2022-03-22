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