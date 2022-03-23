/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

/*
                                      Table "public.animals"
     Column      |         Type          | Collation | Nullable |             Default
-----------------+-----------------------+-----------+----------+----------------------------------
 id              | integer               |           | not null | generated by default as identity
 name            | character varying(20) |           | not null |
 date_of_birth   | date                  |           | not null |
 escape_attempts | integer               |           | not null |
 neutered        | boolean               |           | not null |
 weight_kg       | numeric               |           | not null |
 species         | character varying(50) |           |          |
Indexes:
    "animals_pkey" PRIMARY KEY, btree (id)
*/

CREATE TABLE owners (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    full_name VARCHAR(100),
    age INTEGER
);

CREATE TABLE species (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    name VARCHAR(75)
);

BEGIN;
ALTER TABLE animals
DROP COLUMN species;
SAVEPOINT my_savepoint;
ALTER TABLE animals
ADD COLUMN species_id INTEGER;
SAVEPOINT second_savepoint;
ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species (id);
SAVEPOINT third_savepoint;
ALTER TABLE animals
ADD COLUMN owner_id INTEGER;
SAVEPOINT forth_savepoint;
ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
COMMIT;

/*
                                      Table "public.animals"
     Column      |         Type          | Collation | Nullable |             Default
-----------------+-----------------------+-----------+----------+----------------------------------
 id              | integer               |           | not null | generated by default as identity
 name            | character varying(20) |           | not null |
 date_of_birth   | date                  |           | not null |
 escape_attempts | integer               |           | not null |
 neutered        | boolean               |           | not null |
 weight_kg       | numeric               |           | not null |
 species_id      | integer               |           |          |
 owner_id        | integer               |           |          |
Indexes:
    "animals_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "animals_owner_id_fkey" FOREIGN KEY (owner_id) REFERENCES owners(id)
    "animals_species_id_fkey" FOREIGN KEY (species_id) REFERENCES species(id)
*/

CREATE TABLE vets (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    name VARCHAR(75) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE NOT NULL
);

/*
                                         Table "public.vets"
       Column       |         Type          | Collation | Nullable |             Default
--------------------+-----------------------+-----------+----------+----------------------------------
 id                 | integer               |           | not null | generated by default as identity
 name               | character varying(75) |           | not null |
 age                | integer               |           | not null |
 date_of_graduation | date                  |           | not null |
Indexes:
    "vets_pkey" PRIMARY KEY, btree (id)
*/

CREATE TABLE specializations (
    vets_id INTEGER,
    species_id INTEGER,
    PRIMARY KEY (vets_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id)
);

/*
            Table "public.specializations"
   Column   |  Type   | Collation | Nullable | Default
------------+---------+-----------+----------+---------
 vets_id    | integer |           | not null |
 species_id | integer |           | not null |
Indexes:
    "specializations_pkey" PRIMARY KEY, btree (vets_id, species_id)
Foreign-key constraints:
    "fk_species" FOREIGN KEY (species_id) REFERENCES species(id)
    "fk_vets" FOREIGN KEY (vets_id) REFERENCES vets(id)
*/

CREATE TABLE visits (
    vets_id INTEGER NOT NULL,
    animals_id INTEGER NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
    CONSTRAINT fk_animals FOREIGN KEY (animals_id) REFERENCES animals(id)
);

/*
                  Table "public.visits"
    Column     |  Type   | Collation | Nullable | Default
---------------+---------+-----------+----------+---------
 vets_id       | integer |           | not null |
 animals_id    | integer |           | not null |
 date_of_visit | date    |           | not null |
Foreign-key constraints:
    "fk_animals" FOREIGN KEY (animals_id) REFERENCES animals(id)
    "fk_vets" FOREIGN KEY (vets_id) REFERENCES vets(id)
    */