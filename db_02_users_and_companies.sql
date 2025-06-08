CREATE TABLE users {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_gc_id INTEGER,

    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT FALSE,

    first_name VARCHAR(50) NOT NULL,
    second_name VARCHAR(20),
    last_name VARCHAR(50),
    full_name VARCHAR(100),
    photo TEXT,
    gender gender_enum,

    phone_number VARCHAR(20) UNIQUE NOT NULL CHECK (phone_number ~ '^\+\d{8,15}$'),
    phone_verified BOOLEAN DEFAULT FALSE,
    email VARCHAR(100) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    email_verified BOOLEAN DEFAULT FALSE,
    unsubscribe_email TIMESTAMP,

    personal_data_agreement BOOLEAN DEFAULT FALSE,
    personal_data_agreement_created_at TIMESTAMP,
    stop_personal_data TIMESTAMP,

    password VARCHAR(255),
    temporary_password VARCHAR(255),
    temporary_password_sent BOOLEAN DEFAULT FALSE,
    unsubscribe_email TIMESTAMP,

    is_partner BOOLEAN DEFAULT FALSE,
    partner_key UUID,
    bonus_balance INTEGER DEFAULT 0,
    deposit_balance DECIMAL(15,2) DEFAULT 0.00
};

COMMENT ON COLUMN users.created_utm_id IS 'connection with table utm';
COMMENT ON COLUMN users.partner_key IS 'for referral program';

CREATE TABLE companies {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    company_name VARCHAR(500) NOT NULL,
    company_type company_type_enum NOT NULL,
    company_role company_role_enum NOT NULL,
    company_phone VARCHAR(20) CHECK (company_phone ~ '^\+\d{8,15}$'),
    company_email VARCHAR(100) UNIQUE NOT NULL CHECK (company_email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    company_site VARCHAR(300)
};

CREATE TABLE users_managers_connections {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    company_id INTEGER,
    manager_lid_id INTEGER,
    manager_hunter_id INTEGER,
    manager_farm_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (manager_lid_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (manager_hunter_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (manager_farm_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
};


CREATE TABLE company_positions {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    position_in VARCHAR(150) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
};