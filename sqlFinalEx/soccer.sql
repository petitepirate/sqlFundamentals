-- from the terminal run:
-- psql < soccer.sql

DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    startdate TEXT NOT NULL,
    enddate TEXT NOT NULL
);

INSERT INTO seasons
    (startdate, enddate)
VALUES
    ('08/06/2020', '05/10/2021');

CREATE TABLE refs
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO refs
    (name)
VALUES
    ('ted'),
    ('fred'),
    ('max'),
    ('leo');

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO teams
    (name)
VALUES
    ('Knights'),
    ('Kings'),
    ('Queens'),
    ('Fools'),
    ('Tigers'),
    ('Lions'),
    ('Bears'),
    ('Penguins');

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams,
    jersey_num INTEGER
);

INSERT INTO players
    (name, team_id, jersey_num)
VALUES
    ('fred', 1, 4),
    ('george', 1, 3),
    ('wilson', 1, 2),
    ('thomas', 1, 14),
    ('ginny', 1, 43),
    ('oliver', 1, 44);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    gamedate TEXT NOT NULL,
    ref1_id INTEGER REFERENCES refs,
    ref2_id INTEGER REFERENCES refs
);

INSERT INTO matches
    ( team1_id, team2_id, gamedate, ref1_id, ref2_id)
VALUES
    (1, 2, '09/19/2020', 1, 2),
    (3, 4, '09/19/2020', 3, 4),
    (5, 6, '09/19/2020', 1, 2),
    (7, 8, '09/19/2020', 3, 4),
    (2, 3, '10/19/2020', 1, 2),
    (4, 5, '10/19/2020', 3, 4),
    (6, 7, '10/19/2020', 1, 2),
    (8, 1, '10/19/2020', 3, 4);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);


INSERT INTO goals
    (player_id, match_id)
VALUES
    (1, 1),
    (2, 1),
    (6, 2),
    (1, 3),
    (5, 3);

CREATE TABLE finalscore
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT NOT NULL
);

INSERT INTO finalscore
    (team_id, match_id, result)
VALUES
    (1, 1, 'win'),
    (2, 1, 'lose'),
    (3, 2, 'win'),
    (4, 2, 'lose');

