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
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

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
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;

-- Queries for owner, species and animals tables as join
SELECT a.name AS "Animal Name", o.full_name AS "Belong To"  FROM animals AS a JOIN owners AS o ON a.owners_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT a.name AS "Animal Name", s.name AS "Animal Type" FROM animals AS a JOIN species AS s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT o.full_name AS "Owner Name", a.name AS "Animal Name" FROM owners AS o LEFT JOIN animals AS a ON o.id = a.owners_id;
SELECT s.name AS "Species", COUNT(a.species_id) "Number of Animals Per Species" FROM animals AS a  JOIN species AS s  ON a.species_id = s.id  GROUP BY s.id;
SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME" FROM owners AS o  JOIN animals AS a  ON o.id = a.owners_id  WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 2;
SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME", a.escape_attempts AS "ESCAPE ATTEMPTS" FROM owners AS o  JOIN animals AS a  ON o.id = a.owners_id  WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT o.full_name AS "OWNER NAME", COUNT(a.name) as "NUMBER OF ANIMALS" FROM owners AS o  LEFT JOIN animals AS a  ON a.owners_id = o.id  GROUP BY o.full_name  ORDER BY COUNT(a.name) DESC  LIMIT 1;
