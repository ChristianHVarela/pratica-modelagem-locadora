CREATE TABLE IF NOT EXISTS categories (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS countries (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS actors_countries (
    id SERIAL NOT NULL PRIMARY KEY,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    actor_id INTEGER NOT NULL REFERENCES actors(id)
);

CREATE TABLE IF NOT EXISTS actors (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    date_birth DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS address (
    id SERIAL NOT NULL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT NOT NULL,
    district TEXT NOT NULL,
    zip_code INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS customers (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    phone INTEGER NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    address_id INTEGER NOT NULL REFERENCES address(id)
);

CREATE TABLE IF NOT EXISTS rentals (
    id SERIAL NOT NULL PRIMARY KEY,
    date_rental DATE NOT NULL,
    date_return DATE,
    satisfaction_survey_id INTEGER REFERENCES satisfaction_survey(id)
);

CREATE TABLE IF NOT EXISTS satisfaction_survey (
    id SERIAL NOT NULL PRIMARY KEY,
    movie_rating INTEGER NOT NULL DEFAULT 0,
    service_rating INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS movies (
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    category_id INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS rentals_movies (
    id SERIAL NOT NULL PRIMARY KEY,
    rental_id INTEGER NOT NULL REFERENCES rentals(id),
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE IF NOT EXISTS discs (
    id SERIAL NOT NULL PRIMARY KEY,
    number INTEGER NOT NULL UNIQUE,
    barcode INTEGER NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);