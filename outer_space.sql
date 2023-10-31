-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Create Galaxies table
CREATE TABLE Galaxies (
    galaxy_id SERIAL PRIMARY KEY,
    galaxy_name TEXT NOT NULL
);

-- Create Moons table
CREATE TABLE Moons (
    moon_id SERIAL PRIMARY KEY,
    moon_name TEXT NOT NULL
);

-- Modify the Planets table to use foreign keys
CREATE TABLE Planets (
    planet_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around TEXT NOT NULL,
    galaxy_id INT REFERENCES Galaxies(galaxy_id),
    moon_ids INT[] REFERENCES Moons(moon_id)
);
