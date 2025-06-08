CREATE TABLE Countries (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    country_name VARCHAR(100) NOT NULL UNIQUE,
    country_code CHAR(2) UNIQUE CHECK (code ~ '^[A-Z]{2}$'),  -- ISO 3166-1 alpha-2 (e.g., NO, RU)
);

COMMENT ON COLUMN countries.country_code IS 'ISO 3166-1 alpha-2 (e.g., NO, RU)';

CREATE TABLE Regions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    country_id INTEGER,
    region_name VARCHAR(100) NOT NULL,
    region_code VARCHAR(10),  -- можно использовать код региона, если есть

    FOREIGN KEY (country_id) REFERENCES country(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    UNIQUE(country_id, name)  -- нельзя два одинаковых региона в одной стране
);

COMMENT ON COLUMN regions.region_code IS 'код региона, если есть';

CREATE TABLE Cities (
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

