CREATE TABLE documents (
    document_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    company_id INTEGER,

    -- Основная информация
    document_type document_type_enum NOT NULL,
    document_status document_status_enum DEFAULT'действителен',
    document_language VARCHAR(50),
    document_url TEXT NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    verification_date TIMESTAMP,

    -- Внешние документы
    document_series VARCHAR(50),          -- Серия (если есть)
    document_number VARCHAR(50),          -- Номер документа
    date_start DATE,                      -- Дата выдачи
    valid_until DATE,                     -- Действителен до
    who_give VARCHAR(300),                -- Кем выдан
    place VARCHAR(100),                   -- Место выдачи
    department_code VARCHAR(20),          -- Код подразделения (паспорт)

    -- Для договоров и внутренних документов (МАМР)
    contract_number VARCHAR(50),          -- Номер договора
    course_place course_place_enum,       -- Место проведения курса
    deals_id INTEGER,                     -- Структура платежей: [{"date": "...", "amount": ..., "payment_type": "..."}]
    created_by INTEGER,                   -- Кто оформил
    signed_at TIMESTAMP,                  -- Дата подписания

    -- Связи
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (created_by) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
);

CREATE TABLE addresses (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    company_id INTEGER,

    address_registration BOOLEAN DEFAULT FALSE,
    address_fact BOOLEAN DEFAULT FALSE,
    address_delivery BOOLEAN DEFAULT FALSE,
    postal_code VARCHAR(10),
    country_id INTEGER,
    region_id INTEGER,
    city_id INTEGER,
    street VARCHAR(50),
    home VARCHAR(10),
    apartment VARCHAR(10),
    address_comment TEXT,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE company_details (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    company_id INTEGER,
    company_short_name VARCHAR(300) NOT NULL,
    company_full_name VARCHAR(500) NOT NULL,
    company_inn VARCHAR(12) CHECK (company_inn ~ '^\d{10,12}$'),
    company_ogrn VARCHAR(15) CHECK (company_ogrn ~ '^\d{13,15}$'),
    company_kpp VARCHAR(9),
    company_registration_date TIMESTAMP NOT NULL,
    company_lead VARCHAR(300),

    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE bank_details (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    company_id INTEGER,

    bank_name VARCHAR(300) NOT NULL,
    bank_bic VARCHAR(20),          -- SWIFT / БИК / Sort code
    bank_account VARCHAR(34),      -- IBAN / счёт
    bank_corr_account VARCHAR(34), -- если применимо
    iban VARCHAR(34),              -- опционально
    swift_code VARCHAR(11),        -- SWIFT (8 или 11 символов)

    country_code CHAR(2) NOT NULL, -- ISO (RU, KZ, US, etc.)
    currency_code CHAR(3),         -- ISO (RUB, KZT, USD...)

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
);