-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

-- Create Passengers table
CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create Airlines table
CREATE TABLE Airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

-- Create Tickets table with foreign keys
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    passenger_id INT REFERENCES Passengers(passenger_id),
    airline_id INT REFERENCES Airlines(airline_id),
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    from_city TEXT NOT NULL,
    from_country TEXT NOT NULL,
    to_city TEXT NOT NULL,
    to_country TEXT NOT NULL
);
