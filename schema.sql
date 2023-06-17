-- Add Animal Table
CREATE TABLE animals
    (id serial PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL, 
    date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, 
    weight_kg NUMERIC(5,2) NOT NULL
    );

-- Query and update animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(50);

-- Create owners and species tables and alter animals table.
CREATE TABLE owners(id serial PRIMARY KEY, full_name VARCHAR(50) NOT NULL, age INT NOT NULL);
CREATE TABLE species(id serial PRIMARY KEY, name VARCHAR(50) NOT NULL);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);
