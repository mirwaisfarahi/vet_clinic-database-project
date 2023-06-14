-- Queries implemented on animals table
SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-12-31';
SELECT name FROM animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth FROM animals where name LIKE '%Agumon' OR name LIKE '%Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name NOT LIKE '%Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Transaction queries
BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';
Select * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

BEGIN WORK;
UPDATE animal SET species = 'digimon' WHERE name LIKE '@mon';
UPDATE animal SET species = 'pokemon' WHERE name NOT LIKE '@mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
SELECT FROM animals;
SELECT FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_operation;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SAVEPOINT delete_operation;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

-- Write queries to answer the following questions
SELECT COUNT(*) FROM animals;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-01-01'
GROUP BY species;