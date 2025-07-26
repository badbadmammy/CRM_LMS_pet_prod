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