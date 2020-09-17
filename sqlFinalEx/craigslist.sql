-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    pref_regid INTEGER REFERENCES regions
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    title TEXT NOT NULL,
    details TEXT NOT NULL,
    category_id INTEGER REFERENCES categories
);


INSERT INTO regions
    (city, state)
VALUES
    ('San Francisco', 'California'),
    ('San Diego', 'California'),
    ('Seattle', 'Washington'),
    ('Portland', 'Oregon');

INSERT INTO users
    (name, pref_regid)
VALUES
    ('Megan McManus', 3),
    ('Jeff Goldman', 3),
    ('Chrissy Shantz', 1),
    ('Matty Matt', 4);


INSERT INTO categories
    (name)
VALUES
    ('Antiques'),
    ('Furniture'),
    ('Wanted'),
    ('Missed Connections');


INSERT INTO posts
    (user_id, region_id, title, details, category_id)
VALUES
    (1, 3, 'bicycle for sale', 'unicycle - good, hardly used, child-sized', 2),
    (2, 3, 'photography equipment wanted', 'ISO lightly used photography stuff', 3),
    (3, 1, 'antique barber salon chair', 'lightly used, salon closing, all must go', 1),
    (4, 4, 'puppy dog', 'Found a cute dog in the park, contact if you think its yours', 4);
