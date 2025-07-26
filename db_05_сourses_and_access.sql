CREATE TABLE trainings (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300),
    description TEXT,
    url TEXT,
--    tag varchar [not null]

    product_id INTEGER,

    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE content (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(150),
    description TEXT,
    url TEXT,
--    tag varchar [not null]

    training_id INTEGER,
    ordinal_number INTEGER,

    FOREIGN KEY (training_id) REFERENCES trainings(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE method_product_stage (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    method_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    stage INTEGER NOT NULL,

    FOREIGN KEY (method_id) REFERENCES methods(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE trainings_users_access (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    training_id INTEGER,
    have_access BOOLEAN DEFAULT FALSE,
    have_access_start_at TIMESTAMP,
    have_access_finished_at TIMESTAMP,

--    started_training TIMESTAMP,
--    finished_training TIMESTAMP
);

CREATE TABLE trainings_staff_connection (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    training_id INTEGER,
    user_id INTEGER,
    is_expert BOOLEAN DEFAULT FALSE,
    main_expert BOOLEAN DEFAULT FALSE,
    is_curator BOOLEAN DEFAULT FALSE,

    have_access BOOLEAN DEFAULT FALSE,
    have_access_start_at TIMESTAMP,
    have_access_finished_at TIMESTAMP,

    FOREIGN KEY (training_id) REFERENCES trainings(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE calendar (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    product_id INTEGER,
    start_date TIMESTAMP,
    finish_date TIMESTAMP,
    place course_place_enum,

    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
);
