DROP SCHEMA IF EXISTS v3 CASCADE;

CREATE SCHEMA v3;

CREATE TABLE v3.city (
    id   SERIAL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE v3.car (
    id       SERIAL,
    model    VARCHAR NOT NULL,
    km_price REAL    NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE v3.driver (
    id            SERIAL,
    name          VARCHAR NOT NULL,
    surname       VARCHAR NOT NULL,
    birth_date    DATE    NOT NULL,
    driving_since DATE    NOT NULL,
    car_id        INTEGER NOT NULL,
    city_id       INTEGER NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (car_id) REFERENCES v3.car(id),

    FOREIGN KEY (city_id) REFERENCES v3.city(id)
        ON DELETE CASCADE
);

CREATE TABLE v3.order (
    id        SERIAL,
    date      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    distance  REAL      NOT NULL,
    driver_id INTEGER   NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (driver_id) REFERENCES v3.driver(id)
);

SET timezone = 'Asia/Novosibirsk';
