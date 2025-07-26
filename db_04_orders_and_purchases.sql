CREATE TABLE products (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300) NOT NULL,
    description TEXT,
--    tag varchar [not null]
    academic_hours INTEGER NOT NULL,

    format product_format_enum NOT NULL,
    for_parents BOOLEAN DEFAULT FALSE,
    for_wide_audience BOOLEAN DEFAULT FALSE,
    is_basic BOOLEAN DEFAULT FALSE,
    is_specialized BOOLEAN DEFAULT FALSE
);

CREATE TABLE packets (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300) NOT NULL
    --    tag varchar [not null]
);

CREATE TABLE packets_products_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    product_id INTEGER,
    packet_id INTEGER,

    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (packet_id) REFERENCES packets(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE goods (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    type_good type_good_enum,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    good_size VARCHAR(30),
    good_weight INTEGER,
    package_size VARCHAR(30),
    package_weight INTEGER,
    amount_now INTEGER
    --    tag varchar [not null]
);

COMMENT ON COLUMN goods.good_weight IS 'weight is in grams';
COMMENT ON COLUMN goods.package_weight IS 'weight is in grams';

CREATE TABLE price_list (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    outside_id UUID DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    object_type object_type_enum,
    object_id INTEGER,
    --    tag varchar [not null]

    price DECIMAL(10, 2) NOT NULL,
    price_type price_type_enum,
    access_period INTEGER,
    price_is_active BOOLEAN DEFAULT TRUE,
    price_deactivation_date TIMESTAMP,

    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (good_id) REFERENCES goods(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (packet_id) REFERENCES packets(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

COMMENT ON COLUMN price_list.access_period IS 'number of days';

CREATE TABLE deals (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    deal_cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    promo_code VARCHAR DEFAULT NULL,
    partner_key VARCHAR(300),
    partner_id INTEGER,
    deal_finish_price DECIMAL(10, 2) NOT NULL DEFAULT 0,
    deal_currency deal_currency_enum DEFAULT 'RUB',

    payment_deadline TIMESTAMP,
    payment_url VARCHAR(300),
    deal_status deal_status_enum NOT NULL,
    is_paid BOOLEAN NOT NULL DEFAULT FALSE,
    deal_finished_at TIMESTAMP,

    deal_priority INTEGER,
    --    tag varchar [not null]
    hunter_manager INTEGER,
    farm_manager INTEGER,
    deal_comment VARCHAR(300),
    reason_of_fail reason_of_fail_enum,

--    panel_id uuid [null, note: 'ID доски продаж, connection with panels table']
--    panel_stage_id uuid [null, note: 'ID этапа на доске продаж, connection with panels table']

    FOREIGN KEY (partner_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (hunter_manager) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (farm_manager) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

COMMENT ON COLUMN deals.deal_currency IS 'код валюты заказа - rub, если нет данных';

CREATE TABLE payments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    payment_cost DECIMAL(10, 2) NOT NULL,
    payment_type payment_type_enum NOT NULL,
    payment_status payment_status_enum NOT NULL
);

CREATE TABLE deals_price_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    deal_id INTEGER NOT NULL,
    price_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,

    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (price_id) REFERENCES price_list(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE deals_users_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER NOT NULL,
    deal_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE deals_payments_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    payment_id INTEGER NOT NULL,
    deal_id INTEGER NOT NULL,
    connection_cost DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (deal_id) REFERENCES deals(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (payment_id) REFERENCES payments(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

COMMENT ON COLUMN deals_payments_connections.connection_cost IS 'сколько денег из платежа списывается за конкретный заказ'