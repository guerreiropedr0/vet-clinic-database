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

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/*
 id |    full_name    | age
----+-----------------+-----
  1 | Sam Smith       |  34
  2 | Jennifer Orwell |  19
  3 | Bob             |  45
  4 | Melody Pond     |  77
  5 | Dean Winchester |  14
  6 | Jodie Whittaker |  38
(6 rows)
*/

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/*
 id |  name
----+---------
  1 | Pokemon
  2 | Digimon
(2 rows)
*/

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id
----+------------+---------------+-----------------+----------+-----------+------------+----------
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |
 10 | Blossom    | 1998-10-13    |               3 | t        |        17 |          1 |
  5 | Charmander | 2020-02-08    |               0 | f        |        11 |          1 |
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |
  2 | Gabumon    | 2018-11-15    |               2 | t        |         8 |          2 |
  4 | Devimon    | 2017-05-12    |               5 | t        |        11 |          2 |
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |          2 |
  6 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 |          2 |
  8 | Angemon    | 2005-06-12    |               1 | t        |        45 |          2 |
(10 rows)
*/

UPDATE animals
SET owner_id = 1
WHERE id = 1;
UPDATE animals
SET owner_id = 2
WHERE id IN (2, 3);
UPDATE animals
SET owner_id = 3
WHERE id IN (4, 6);
UPDATE animals
SET owner_id = 4
WHERE id IN (5, 7, 10);
UPDATE animals
SET owner_id = 5
WHERE id IN (8, 9);

/*
 id |    name    | species_id
----+------------+------------
  1 | Agumon     |          2
  3 | Pikachu    |          1
  2 | Gabumon    |          2
  4 | Devimon    |          2
  6 | Plantmon   |          2
 10 | Blossom    |          1
  5 | Charmander |          1
  7 | Squirtle   |          1
  9 | Boarmon    |          2
  8 | Angemon    |          2
(10 rows)
*/

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

/*
 id |       name       | age | date_of_graduation
----+------------------+-----+--------------------
  1 | William Tatcher  |  45 | 2000-04-23
  2 | Maisy Smith      |  26 | 2019-01-17
  3 | Stephanie Mendez |  64 | 1981-05-04
  4 | Jack Harkness    |  38 | 2008-06-08
(4 rows)
*/

INSERT INTO specializations (vets_id, species_id) VALUES (1, 1);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vets_id, species_id) VALUES (4, 2);

/*
 vets_id | species_id
---------+------------
       1 |          1
       3 |          1
       3 |          2
       4 |          2
(4 rows)
*/

INSERT INTO visits VALUES (1, 1, '2020-05-24');
INSERT INTO visits VALUES (3, 1, '2020-06-22');
INSERT INTO visits VALUES (4, 2, '2021-02-02');
INSERT INTO visits VALUES (2, 3, '2020-01-05');
INSERT INTO visits VALUES (2, 3, '2020-03-08');
INSERT INTO visits VALUES (2, 3, '2020-05-14');
INSERT INTO visits VALUES (3, 4, '2021-05-04');
INSERT INTO visits VALUES (4, 5, '2021-02-24');
INSERT INTO visits VALUES (2, 6, '2019-12-21');
INSERT INTO visits VALUES (1, 6, '2020-08-10');
INSERT INTO visits VALUES (2, 6, '2021-04-07');
INSERT INTO visits VALUES (3, 7, '2019-09-29');
INSERT INTO visits VALUES (4, 8, '2020-10-03');
INSERT INTO visits VALUES (4, 8, '2020-11-04');
INSERT INTO visits VALUES (2, 9, '2019-01-24');
INSERT INTO visits VALUES (2, 9, '2019-05-15');
INSERT INTO visits VALUES (2, 9, '2020-02-27');
INSERT INTO visits VALUES (2, 9, '2020-08-03');
INSERT INTO visits VALUES (3, 10, '2020-05-24');
INSERT INTO visits VALUES (1, 10, '2021-01-11');

/*
 vets_id | animals_id | date_of_visit
---------+------------+---------------
       1 |          1 | 2020-05-24
       3 |          1 | 2020-06-22
       4 |          2 | 2021-02-02
       2 |          3 | 2020-01-05
       2 |          3 | 2020-03-08
       2 |          3 | 2020-05-14
       3 |          4 | 2021-05-04
       4 |          5 | 2021-02-24
       2 |          6 | 2019-12-21
       1 |          6 | 2020-08-10
       2 |          6 | 2021-04-07
       3 |          7 | 2019-09-29
       4 |          8 | 2020-10-03
       4 |          8 | 2020-11-04
       2 |          9 | 2019-01-24
       2 |          9 | 2019-05-15
       2 |          9 | 2020-02-27
       2 |          9 | 2020-08-03
       3 |         10 | 2020-05-24
       1 |         10 | 2021-01-11
(20 rows)
*/