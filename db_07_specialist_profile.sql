CREATE TABLE specialization_profile (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,

    education education_level_enum NOT NULL,
    patients_type patients_type_enum,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specialists_patients_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    specialization_id INTEGER,
    patients_problems_id INTEGER,   -- Неврологические, Ортопедические и др.
    patients_problems_more TEXT,

    FOREIGN KEY (specialization_id) REFERENCES specialization_profile(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (patients_problems_id) REFERENCES patients_problems(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specialists_topics_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    specialization_id INTEGER,
    topic_id INTEGER,   -- Взрослая реабилитация, Детская реабилитация и др.

    FOREIGN KEY (specialization_id) REFERENCES specialization_profile(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (topic_id) REFERENCES interesting_topics(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specialists_methods_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    specialization_id INTEGER,
    method_id INTEGER,
    interested_in_method BOOLEAN DEFAULT FALSE,
    now_learn BOOLEAN DEFAULT FALSE,
    using_method BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (specialization_id) REFERENCES specialization_profile(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (method_id) REFERENCES methods(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specialists_techniques_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    specialization_id INTEGER,
    technique_id INTEGER,
    is_using BOOLEAN DEFAULT FALSE,
    want_to_learn BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (specialization_id) REFERENCES specialization_profile(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (technique_id) REFERENCES specialization_techniques(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE aggregator (
    id UUID PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    aggregator_agreement BOOLEAN DEFAULT FALSE,
    aggregator_agreement_created_at TIMESTAMP,
    aggregator_start_show TIMESTAMP,
    aggregator_end_show TIMESTAMP
);