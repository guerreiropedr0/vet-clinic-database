/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true,  10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true,  8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false,  15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true,  11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false,  -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true,  -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false,  -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true,  -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true,  20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true,  17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true,  22);

/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 |
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 |
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 |
(11 rows)
*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg |   species
----+------------+---------------+-----------------+----------+-----------+-------------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | unspecified
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | unspecified
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | unspecified
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | unspecified
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 | unspecified
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 | unspecified
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | unspecified
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 | unspecified
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | unspecified
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | unspecified
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | unspecified
(11 rows)
*/
ROLLBACK;
SELECT * FROM animals;
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 |
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 |
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 |
(11 rows)
*/

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | pokemon
(11 rows)
*/

BEGIN;
DELETE FROM animals;
/*
 id | name | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------+---------------+-----------------+----------+-----------+---------
(0 rows)
*/
ROLLBACK;
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
 11 | Ditto      | 2022-05-14    |               4 | t        |        22 | pokemon
(11 rows)
*/

BEGIN;
DELETE FROM animals
WHERE date_of_birth > DATE '2022-01-01';
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |      -5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
(10 rows)
*/
SAVEPOINT my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1;
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |    -10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |        -8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |       -11 | digimon
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |        45 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |     -20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |    -15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |       -17 | pokemon
(10 rows)
*/
ROLLBACK TO my_savepoint;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |        45 | digimon
  5 | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
(10 rows)
*/