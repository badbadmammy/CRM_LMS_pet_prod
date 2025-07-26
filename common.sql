CREATE TYPE gender_enum AS ENUM (
    'мужской',
    'женский'
);

CREATE TYPE preferred_channels_enum AS ENUM (
    'звонок',
    'Telegram',
    'WhatsApp',
    'e-mail',
    'чат-бот',
    'другой'
);

CREATE TYPE company_type_enum AS ENUM (
    'реабилитационный центр',
    'другой'
);

CREATE TYPE company_role_enum AS ENUM (
    'клиент',
    'поставщик',
    'партнер',
    'другой'
);

CREATE TYPE manager_type_enum AS ENUM (
    'нет',
    'лидоруб',
    'хантер',
    'фермер'
);

CREATE TYPE document_type_enum AS ENUM (
    'диплом',
    'сертификат',
    'паспорт',
    'прописка',
    'свидетельство смены фамилии',
    'СНИЛС',
    'свидетельство о повышении квалификации',
    'договор на обучение',
    'закрывающие документы'
);

CREATE TYPE document_status_enum AS ENUM (
    'действителен',
    'истёк',
    'отозван'
);

CREATE TYPE course_place_enum AS ENUM (
    'оналайн',
    'МСК'
);

CREATE TYPE product_format_enum AS ENUM (
    'онлайн',
    'очно'
);

CREATE TYPE type_good_enum AS ENUM (
    'печатная продукция',
    'книга',
    'сопутствующие товары',
    'мерч'
);

CREATE TYPE object_type_enum AS ENUM (
    'продукт',
    'товар',
    'пакетное предложение'
);

CREATE TYPE price_type_enum AS ENUM (
    'базовая (с рассрочкой)',
    'внутренняя рассрочка +15%',
    'офлайн',
    'распродажа для ОМ (без рассрочки)',
    'для ОП скидка при полной оплате',
    'спец цена',
    'доп доступ'
);

CREATE TYPE deal_currency_enum AS ENUM (
    'RUB',
    'USD',
    'EUR',
    'GBP',
    'BYR',
    'BYN',
    'KZT',
    'UAH',
    'AUD',
    'DKK',
    'CHF',
    'SEK',
    'ZAR',
    'AMD',
    'RON',
    'BRL',
    'ILS',
    'MYR',
    'SGD',
    'KGS',
    'CAD',
    'MXN',
    'JPY',
    'UZS',
    'PLN',
    'AZN',
    'AED',
    'TRY',
    'INR',
    'RSD',
    'CZK',
    'MNT',
    'NZD'
);

CREATE TYPE deal_status_enum AS ENUM (
    'new',                  -- Новый
    'payed',                -- Завершен
    'cancelled',            -- Отменен
    'false',                -- Ложный
    'in_work',              -- В работе
    'payment_waiting',      -- Ожидаем оплаты
    'part_payed',           -- Частично оплачен
    'waiting_for_return',   -- Ожидаем возврата
    'not_confirmed',        -- Не подтвержден
    'pending'               -- Отложен
);

CREATE TYPE reason_of_fail_enum AS ENUM (
    'Нет бюджета',
    'Не согласовано руководством',
    'Уже купил у конкурента',
    'Неактуально',
    'Неудачное время',
    'Негативный опыт',
    'Личные причины',
    'Неизвестно'
);

CREATE TYPE payment_status_enum AS ENUM (
    'expected',             -- Ожидается
    'accepted',             -- Получен
    'returned',             -- Возвращен
    'tobalance',            -- Пополнение баланса
    'frombalance',          -- Списание с баланса
    'returned_to_balance'   -- Начисление на депозит
);

CREATE TYPE payment_type_enum AS ENUM (
    '2CO',                  -- 2Checkout
    'ALFA',                 -- Альфа-банк
    'bepaid',               -- bePaid
    'BILL',                 -- Безналичный расчёт
    'CARD',                 -- Банковской картой
    'CARD_TERMINAL',        -- Банковская карта через терминал
    'CASH',                 -- Наличные
    'cloud_payments',       -- CloudPayments
    'cloud_payments_kz',    -- CloudPaymentsKz
    'fondy',                -- Fondy
    'hutki_grosh',          -- Хуткi Грош
    'interkassa',           -- Интеркасса
    'INTERNAL',             -- Внутренний баланс
    'justclick',            -- Justclick
    'kvit',                 -- Квитанция в банк
    'mandarinpay',          -- MandarinPay
    'OTHER',                -- Другое
    'payanyway',            -- PayAnyWay
    'PAYPAL',               -- PayPal
    'perfect_money',        -- Perfect Money
    'PERFECTMONEY',         -- Perfect Money
    'platim',               -- Platim.ru
    'QIWI',                 -- Qiwi (устаревшее)
    'qiwi_kassa',           -- QIWI Касса
    'QUICKTRANSFER',        -- Системы быстрых переводов
    'RBK',                  -- РБК Деньги
    'rbkmoney',             -- РБК Деньги (устаревшее)
    'rbkmoney_new',         -- РБК Деньги (2018 г)
    'ROBOKASSA',            -- Робокасса
    'SBER',                 -- Sberbank
    'sberbank',             -- Сбербанк эквайринг
    'stripe',               -- Stripe
    'tinkoff',              -- Тинькофф Банк
    'tinkoffcredit',        -- Тинькофф Кредит
    'VIRTUAL',              -- Бонусный счет
    'walletone',            -- Единая касса
    'wayforpay',            -- WayForPay
    'WEBMONEY',             -- Webmoney
    'yandex_kassa',         -- Яндекс.Касса
    'YANDEXMONEY',          -- Яндекс.Деньги
    'zpayment',             -- Z-payment
    'ebanx',                -- EBANX
    'swedbank'              -- Swedbank
);

CREATE TYPE how_found_us_enum AS ENUM (
    'Социальные сети',
    'ВКонтакте',
    'Дзен',
    'YouTube',
    'RuTube',
    'Чат-бот',
    'ТГ Канал Бурмитрова',
    'ТГ Канал МАМР',
    'Instagram',
    'E-mail рассылка',
    'партнёр',
    'вебинар',
    'поисковики, Интернет',
    'сайт inamr',
    'сайт mamrkurs',
    'сайт academy.mamrkurs.ru',
    'учебный чат курсантов МАМР',
    'посоветовал друг/знакомый /коллега',
    'база - кто является базой?',
    'неопознанный'
);

CREATE TYPE spend_for_education_yearly_enum AS ENUM (
    'до 5 000 руб',
    'от 5 000 до 10 000 руб',
    'от 10 000 до 50 000 руб',
    'более 50 000 руб',
    'Я смотрю только бесплатно'
);

CREATE TYPE reason_of_learning_enum AS ENUM (
    'Освоить новые техники и методики',
    'Восполнить пробелы в знаниях / повторить изученное',
    'Повысить квалификацию в профессиональной деятельности',
    'Повысить стоимость услуг после прохождения обучения',
    'Другое'
);

CREATE TYPE education_level_enum AS ENUM (
    'Среднее медицинское',
    'Высшее медецинское',
    'Среднее физкультурное (АФК)',
    'Высшее физкультурное (АФК)',
    'Педагогическое',
    'Лечащий физиотерапевт',
    'Студент',
    'Непрофильное (юристы и пр.)',
    'Без образования'
);

CREATE TYPE patients_type_enum AS ENUM (
    'дети',
    'взрослые',
    'дети и взрослые'
);

CREATE TYPE webinar_type_enum AS ENUM (
    'вебинар',
    'автовебинар'
);

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

    FOREIGN KEY (country_id) REFERENCES country(id) ON UPDATE CASCADE ON DELETE RESTRICT,
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

CREATE TABLE methods {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300),
    tag VARCHAR(15),
    is_PPK BOOLEAN DEFAULT FALSE
};

CREATE TABLE doubts (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(100)
);

CREATE TABLE interesting_topics ()
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

CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_gc_id INTEGER,
    sb_id_mamr_bot VARCHAR(100),
    tg_username_mamr_bot VARCHAR(100),

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
    preferred_channel preferred_channel_enum,

    personal_data_agreement BOOLEAN DEFAULT FALSE,
    personal_data_agreement_created_at TIMESTAMP,
    stop_personal_data TIMESTAMP,

    password VARCHAR(255),
    temporary_password VARCHAR(255),
    temporary_password_sent BOOLEAN DEFAULT FALSE,
    unsubscribe_email TIMESTAMP,

    is_partner BOOLEAN DEFAULT FALSE,
--  partner_key DEFAULT gen_random_uuid()
    bonus_balance INTEGER DEFAULT 0,
    deposit_balance DECIMAL(15,2) DEFAULT 0.00
);

COMMENT ON COLUMN users.created_utm_id IS 'connection with table utm';
COMMENT ON COLUMN users.partner_key IS 'for referral program';

CREATE TABLE roles (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    delated_at TIMESTAMP,

    user_id INTEGER,
    is_patient BOOLEAN DEFAULT FALSE,
    is_student BOOLEAN DEFAULT FALSE,
    is_expert BOOLEAN DEFAULT FALSE,
    is_staff BOOLEAN DEFAULT FALSE,
    is_manager BOOLEAN DEFAULT FALSE,
    manager_type ENUM manager_type_enum,
    is_admin BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
);

CREATE TABLE companies (
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
);

CREATE TABLE company_positions (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    position_in VARCHAR(150) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE users_companies_managers_connections (
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
);

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

CREATE TABLE user_marketing_profile (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    how_found_us how_found_us_enum,
    how_found_us_comment VARCHAR(100),
    is_parent BOOLEAN DEFAULT FALSE,
    is_specialist BOOLEAN DEFAULT FALSE,
    important_in_course TEXT,
    spend_for_education_yearly spend_for_education_yearly_enum,
    decision_maker BOOLEAN DEFAULT TRUE,
    doubts doubts_enum,
    competitors TEXT,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

COMMENT ON COLUMN user_marketing_profile.decision_maker IS 'if true - make decision himself';

CREATE TABLE user_products_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    product_id INTEGER,
    interested_in_product BOOLEAN DEFAULT FALSE,
    bought_product BOOLEAN DEFAULT FALSE,
    now_learn BOOLEAN DEFAULT FALSE,
    finished_learning BOOLEAN DEFAULT FALSE,
    reason_of_learning reason_of_learning_enum,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE utm (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    utm_source VARCHAR(50),
    utm_medium VARCHAR(50),
    utm_campaign VARCHAR(50),
    utm_term VARCHAR(50),
    utm_content VARCHAR(50)
);

COMMENT ON COLUMN utm.utm_source IS 'name of social';
COMMENT ON COLUMN utm.utm_medium IS 'type: email, banner';
COMMENT ON COLUMN utm.utm_utm_campaign IS 'marketing company';
COMMENT ON COLUMN utm.utm_term IS 'keyword';
COMMENT ON COLUMN utm.utm_content IS 'something more';

CREATE TABLE events (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    name VARCHAR(300),
    kort_name VARCHAR(10),
--    type enum [not null, note: '']
   method_id INTEGER,

   FOREIGN KEY (method_id) REFERENCES methods(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE events_products_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    event_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,

    FOREIGN KEY (event_id) REFERENCES events(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE events_users_registrations (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    event_id INTEGER,
    partner_key VARCHAR(300),
    partner_id INTEGER,

    FOREIGN KEY (created_utm_id) REFERENCES utm(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (event_id) REFERENCES events(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (partner_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE webinars (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    webinar_type webinar_type_enum,
    name VARCHAR (300),
    description TEXT,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    webinar_user_count INTEGER,

    method_id INTEGER,

    FOREIGN KEY (method_id) REFERENCES methods(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE webinars_products_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    webinar_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,

    FOREIGN KEY (webinar_id) REFERENCES webinars(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE events_webinars_connections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    webinar_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,

    FOREIGN KEY (event_id) REFERENCES events(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (webinar_id) REFERENCES webinars(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE webinars_users_visits (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, --Бизон 365
    created_at TIMESTAMP DEFAULT now(),
    created_utm_id INTEGER,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    webinar_id INTEGER,
    partner_key VARCHAR(300),
    partner_id INTEGER,

    till_finished BOOLEAN NOT NULL DEFAULT FALSE,
    view_from INTEGER,
    view_till INTEGER,
    press_banner BOOLEAN NOT NULL DEFAULT FALSE,
    banner JSON,
    press_button BOOLEAN NOT NULL DEFAULT FALSE,
    button JSON,
    messages JSON,
    time_of_massages JSON,

--Бизон 365
--  finished — флаг, означающий что зритель присутствовал до конца вебинара.
-- view — метка абсолютного времени (в мс), с которого зритель присутствовал на вебинаре;
-- viewTill — метка абсолютного времени (в мс), до которого зритель присутствовал на вебинаре.
-- banners — массив из объектов, каждый из которых с полями id: 'название баннера', time: метка времени нажатия
-- buttons — массив из объектов, каждый из которых с полями id: 'название кнопки', time: метка времени нажатия
-- messages (строка) реплики зрителей в формате JSON: { userId1: ["привет","это мои сообщения в чате"], userId2:["звук есть"], ... }
-- messagesTS (строка) тайминг реплик зрителей в формате JSON: { userId1: [ 60, 105 ], userId2: [ 36 ], ... } Время, указанное в массивах, — в секундах относительно начала вебинара.

    FOREIGN KEY (created_utm_id) REFERENCES utm(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (webinar_id) REFERENCES webinars(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (partner_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

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

CREATE TABLE specialists_patients_connections (
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

CREATE UNIQUE INDEX unique_lower_email ON users (LOWER(email));

ALTER TABLE users
ADD CONSTRAINT utm_create_user FOREIGN KEY (created_utm_id) REFERENCES utm(id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE deals
ADD CONSTRAINT utm_create_deal FOREIGN KEY (created_utm_id) REFERENCES utm(id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE documents
ADD CONSTRAINT deals_document_connection FOREIGN KEY (deals_id) REFERENCES deals(id)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE price_list
ADD CONSTRAINT deal_training_connection FOREIGN KEY (training_id) REFERENCES trainings(id)
ON UPDATE CASCADE ON DELETE RESTRICT;