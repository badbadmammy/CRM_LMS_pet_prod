CREATE TABLE countries (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    country_name VARCHAR(100) NOT NULL UNIQUE,
    country_code CHAR(2) UNIQUE CHECK (code ~ '^[A-Z]{2}$')  -- ISO 3166-1 alpha-2 (e.g., NO, RU)
);

COMMENT ON COLUMN countries.country_code IS 'ISO 3166-1 alpha-2 (e.g., NO, RU)';

CREATE TABLE regions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    country_id INTEGER,
    region_name VARCHAR(100) NOT NULL,
    region_code VARCHAR(10),  -- можно использовать код региона, если есть

    FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    UNIQUE(country_id, name)  -- нельзя два одинаковых региона в одной стране
);

COMMENT ON COLUMN regions.region_code IS 'код региона, если есть';

CREATE TABLE cities (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    region_id INTEGER,
    city_name VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),

    FOREIGN KEY (region_id) REFERENCES regions(id) ON UPDATE CASCADE ON DELETE RESTRICT
--    UNIQUE(region_id, name)  -- два одинаковых города в одном регионе? - город и село
);

CREATE TABLE methods (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300),
    tag VARCHAR(15),
    is_PPK BOOLEAN DEFAULT FALSE
);

CREATE TABLE doubts (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100)
);

CREATE TABLE interesting_topics (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100)   -- Взрослая реабилитация, Детская реабилитация и др.
);

CREATE TABLE patients_problems (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100) -- Неврологические, Ортопедические и др.
);

CREATE TABLE specialization (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100)
);

CREATE TABLE specialization_techniques (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100)
);

--CREATE TABLE groups (
--    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--    created_at TIMESTAMP DEFAULT now(),
--    updated_at TIMESTAMP,
--    deleted_at TIMESTAMP,

--    user_id INTEGER,
--    name_group TEXT,

--    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
--);
