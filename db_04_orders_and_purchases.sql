CREATE TABLE products {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300) NOT NULL,
    description TEXT,
--    tag varchar [not null]
--    chief_expert VARCHAR,
--    substitute_expert enum [not null, note: '']
    product_wide_audience BOOLEAN DEFAULT FALSE,
    product_for_parents BOOLEAN DEFAULT FALSE,
--    product_basic BOOLEAN DEFAULT FALSE,
--    product_specialized BOOLEAN DEFAULT FALSE,
--    product_advanced_training_programs BOOLEAN DEFAULT FALSE,
--    methodology_id uuid [null, note: 'connection with  methodologes table']
    product_type product_type_enum NOT NULL,
    academic_hours DECIMAL NOT NULL,
--    access_period INTEGER
};

--COMMENT ON COLUMN products.access_period IS 'number of days';

CREATE TABLE goods {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

--    type_good enum [not null, note: '']
    name VARCHAR(100) NOT NULL,
    description TEXT,
    good_size VARCHAR(30),
    good_weight INTEGER,
    package_size VARCHAR(30),
    package_weight INTEGER,
    amount_now INTEGER
};

COMMENT ON COLUMN goods.good_weight IS 'weight is in grams';
COMMENT ON COLUMN goods.package_weight IS 'weight is in grams';

CREATE TABLE price_list {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    product_id INTEGER,
    good_id INTEGER,
    price DECIMAL(10, 2) NOT NULL,
    price_type price_type_enum,
    price_is_active BOOLEAN DEFAULT TRUE,
    price_deactivation_date TIMESTAMP,

    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (goog_id) REFERENCES goods(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

CREATE TABLE deals {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    deal_cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    --    deal_currency enum [not null, note: 'код валюты заказа - rub, если нет данных']
    promo_code VARCHAR DEFAULT '-',
    partner_key VARCHAR(300),
    partner_id INTEGER,
    deal_finish_price DECIMAL(10, 2) NOT NULL DEFAULT 0,

    payment_deadline TIMESTAMP,
    payment_url VARCHAR(300),
    deal_is_paid BOOLEAN NOT NULL DEFAULT FALSE,
--    deal_status_":"код статуса заказа",
--    deal_reason_of_fail enum [not null, note: '']
    deal_finished_at TIMESTAMP,

    --    deal_priority
    hunter_manager INTEGER,
    farm_manager INTEGER,
    deal_comment VARCHAR(300),

--    panel_id uuid [null, note: 'ID доски продаж, connection with panels table']
--    panel_stage_id uuid [null, note: 'ID этапа на доске продаж, connection with panels table']

    FOREIGN KEY (partner_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (hunter_manager) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (farm_manager) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

COMMENT ON COLUMN deals.deal_currency IS 'код валюты заказа - rub, если нет данных';

CREATE TABLE deals_price_connections {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    deal_id INTEGER NOT NULL,
    price_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,

    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (price_id) REFERENCES price_list(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

CREATE TABLE deals_users_connections {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER NOT NULL,
    deal_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

CREATE TABLE payments {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    payment_cost DECIMAL(10, 2) NOT NULL,
--    payment_type enum [not null, note: '']
--    payment_status enum [not null, note: 'тип платежа из списка']
--    payment_method enum [not null, note: 'статус платежа из списка']
};

CREATE TABLE deals_payments_connections {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    payment_id INTEGER NOT NULL,
    deal_id INTEGER NOT NULL,
    connection_cost DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (payment_id) REFERENCES payments(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

COMMENT ON COLUMN deals_payments_connections.connection_cost IS 'сколько денег из платежа списывается за конкретный заказ'