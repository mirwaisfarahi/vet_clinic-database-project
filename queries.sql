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

/*last animal seen by William Tatcher*/
SELECT vets.name AS "VET NAME", animals.name AS "ANIMAL NAME", visits.date_of_visit AS "DATE OF VISIT" FROM vets
JOIN visits 
ON vets.id = visits.vets_id
JOIN animals
ON animals.id = visits.animal_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

/**Animals seen by Stephanie Mendez*/
SELECT vets.name AS "VET NAME", COUNT(DISTINCT visits.animal_id) AS "NUMBER OF DIFFERENT ANIMALS" FROM vets
JOIN visits
ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

/**List vets and their specialties**/
SELECT vets.name AS "VET NAME", species.name AS "SPECIALTIES" FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vet_id
LEFT JOIN species
ON specializations.species_id = species.id;

/**Animals which visited Stephanie mendez between April and August**/
SELECT vets.name AS "VET NAME", animals.name AS "ANIMAL NAME", visits.date_of_visit AS "DATE OF VISIT" FROM vets
JOIN visits
ON vets.id = visits.vets_id
JOIN animals
ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/**Animal with most vet visits*/
SELECT animals.name AS "ANIMAL NAME", COUNT(animals.id) AS "NUMBER OF VISITS TO VET" FROM visits
JOIN animals
ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;

/**who was Maisy Smith most recent visits**/
SELECT vets.name AS "VET NAME", visits.date_of_visit AS "DATE OF VISIT" FROM vets
JOIN visits
ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;

/**Details of most recent visit**/
SELECT animals.name AS "NAME",
animals.date_of_birth AS "BIRTHDATE",
animals.escape_attempts AS "ESCAPE ATTEMPTS",
animals.neutered AS "NEUTERED",
animals.weight_kg AS "WEIGHT",
species.name AS "TYPE",
vets.name AS "VET NAME",
vets.age AS "VET AGE",
vets.date_of_graduation AS "DATE OF GRAD",
visits.date_of_visit AS "DATE OF VISIT" FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
JOIN vets
ON visits.vets_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

/**Number of visits to VET with no specialization**/
SELECT animals.name AS "ANIMAL NAME",
COUNT(visits.animal_id) AS "NUMBER OF VISITS",
vets.name AS "VET NAME",
specializations.species_id AS "SPECIALTIES" FROM visits
JOIN animals
ON animals.id = visits.animal_id
FULL JOIN specializations
ON visits.vets_id = specializations.vet_id
JOIN vets
ON visits.vets_id = vets.id
GROUP BY visits.animal_id, visits.vets_id, animals.name,
specializations.species_id, vets.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;


/**Speciality Maisy Smith should consider getting**/
SELECT species.name AS "SPECIES TYPE",
COUNT(visits.animal_id) AS "NUMBER OF VISITS",
vets.name AS "VET NAME" FROM visits
JOIN vets
ON visits.vets_id = vets.id
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY vets.name, animals.species_id, species.name
ORDER BY animals.species_id DESC
LIMIT 1;

-- Queries before optimization
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';