CREATE TABLE trainings {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100),
    description TEXT,
    url TEXT,
--  tag varchar [not null]
};

CREATE TABLE content {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100),
    description TEXT,
    url TEXT,

--    product_id INTEGER,

--    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

Table Trainings_Users_Access {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    training_id INTEGER,
    have_access BOOLEAN DEFAULT FALSE,
    have_access_start_at TIMESTAMP,
    have_access_finished_at TIMESTAMP,
    started_training TIMESTAMP,
    finished_training TIMESTAMP
}
