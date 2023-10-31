-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Create Artists table
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name TEXT NOT NULL
);

-- Create Albums table
CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    album_name TEXT NOT NULL,
    release_date DATE NOT NULL,
    artist_id INT REFERENCES Artists(artist_id)
);

-- Create Producers table
CREATE TABLE Producers (
    producer_id SERIAL PRIMARY KEY,
    producer_name TEXT NOT NULL
);

-- Modify the Songs table to use foreign keys
CREATE TABLE Songs (
    song_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    release_date DATE NOT NULL,
    artist_id INT REFERENCES Artists(artist_id),
    album_id INT REFERENCES Albums(album_id),
    producer_id INT REFERENCES Producers(producer_id)
);
