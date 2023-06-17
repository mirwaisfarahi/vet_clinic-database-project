-- Add Animal Table
CREATE TABLE animals
    (id serial PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL, 
    date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, 
    weight_kg NUMERIC(5,2) NOT NULL
    );

-- Query and update animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(50);
