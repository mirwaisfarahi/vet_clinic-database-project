/* Populate database with sample data. */

INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2020-03-02', 0, true, 10.23, 'Agumon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2018-11-15', 2, true, 8, 'Gabumon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2021-01-07', 1, false, 15.04, 'Pikachu');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2017-05-12', 5, true, 11, 'Devimon');

-- Add more data to animals table
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2020-02-08', 0, false,-11, 'Charmander');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2021-11-15', 2, true,-5.7, 'Plantmon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('1993-04-02', 3, false,-12.13, 'Squirtle');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2005-06-12', 1, true,-45, 'Angemon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2005-06-07', 7, true,20.4, 'Boarmon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('1998-10-13', 3, true,17, 'Blossom');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('2022-05-14', 4, true, 22, 'Ditto');

-- insert data to owners, species tables. Update animals table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 43),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker',38);
SELECT * FROM owners;
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle',  'Blossom');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon',  'Boarmon');

-- Insert into vets, specialization and visits tables
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Vet William Tatcher', 45, ' 23/04/2000'),('Vet Maisy Smith', 26, '17/01/2019'),('Stephanie Mendez', 64, '14/05/1981'),('Vet Jack Harkness', 38, '08/06/2008');
INSERT INTO specializations (vet_id, species_id) VALUES (1, 1) , (3, 2), (3, 1), (4,2);
INSERT INTO visits (animal_id, vets_id, date_of_visit) VALUES (1, 1, '24/05/2020'), (1, 3, '22/07/2020'),
(2, 4, '02/02/2021'), (3, 2, '05/01/2020'), (3, 2,'08/03/2020'), (3, 2, '14/05/2020'),
(4, 3, '04/05/2021'), (5, 4, '24/02/2021'), (6, 2, '21/12/2019'), (6, 1, '10/08/2020'),
(6, 2, '07/04/2021'), (7, 3, '29/09/2019'), (8, 4, '03/10/2020'), (8, 4, '04/11/2020'),
(9, 2, '24/01/2019'), (9, 2, '15/05/2019'), (9, 2, '27/02/2020'), (9, 2, '03/08/2020'),
(10, 3, '24/05/2020'), (10, 1, '11/01/2021');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
