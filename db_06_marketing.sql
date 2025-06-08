CREATE TABLE groups {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    name_group TEXT,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
};

CREATE TABLE user_marketing_profile {
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    user_id INTEGER,
    how_found_us how_found_us_enum,
    source_detail VARCHAR(300),
    preferred_channels preferred_channels_enum NOT NULL,
    spend_for_education_yearly INTEGER,
    decision_maker BOOLEAN DEFAULT TRUE,
    competitors TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
};

COMMENT ON COLUMN user_marketing_profile.decision_maker IS 'if true - make decision himself';

CREATE TABLE utm

//Мероприятия, компании, воронки
Table Events {
  event_id uuid [primary key]
  event_id_created_at timestamp [not null]
  name varchar [not null]
  kort_name varchar [not null, note: 'teg']
  // type enum [not null, note: '']
  // product_id uuid [null, note: 'connection with products table']
  // methodology_id uuid [null, note: 'connection with  methodologes table']
}

// Человек заргистрировался на событие
Table Events_Users_Registrations {
  event_user_registration_id uuid [primary key]
  event_id uuid [note: 'connection with webinars table']
  user_id uuid [note: 'connection with users table']
  registration_created_at timestamp [not null]
  registration_utm_source varchar [default: 0, note: 'name of social']
  registration_utm_medium varchar [default: 0, note: 'type: email, banner']
  registration_utm_campaign varchar [default: 0, note: 'marketing company']
  registration_utm_term varchar [default: 0, note: 'keyword']
  registration_utm_content varchar [default: 0, note: 'something more']
//  registration_partner_key varchar [default: 0, note: 'ключ партнёра']
}

//Вебинары
Table Webinars {
  webinar_id uuid [primary key]
  webinar_id_created_at timestamp //[not null]
  webinar_type enum [not null, note: 'веб или автовеб']
  webinar_name varchar [not null]
  webinar_description varchar [default: 0]
  webinar_started timestamp [not null]
  webinar_ended timestamp [not null]
  webinar_user_count smallint [not null]
  event_id uuid [null, note: 'connection with events table']
  product_id uuid [null, note: 'connection with products table']
  methodology_id uuid [null, note: 'connection with  methodologes table']
}

//Соответствие вебинаров воронкам и товарам
Table Events_Webinars_Connections {
  event_webinar_connection_id uuid [primary key]
  event_webinar_connection_id_created_at timestamp [not null]
  webinar_id uuid [not null, note: 'connection with users table']
  event_id uuid [null, note: 'connection with deals table']
//  product_id uuid [null, note: 'connection with products table']
//  methodology_id uuid [null, note: 'connection with  methodologes table']
}

// Человек пришёл на вебинар (Бизон 365)
Table Webinars_Users_Visits {
  webinar_user_visit_id uuid [primary key]
  webinar_id uuid [note: 'connection with webinars table']
  user_id uuid [note: 'connection with users table']
  visit_created_at timestamp [not null]
  webinar_visit_utm_source varchar [default: 0, note: 'name of social']
  webinar_visit_utm_medium varchar [default: 0, note: 'type: email, banner']
  webinar_visit_utm_campaign varchar [default: 0, note: 'marketing company']
  webinar_visit_utm_term varchar [default: 0, note: 'keyword']
  webinar_visit_utm_content varchar [default: 0, note: 'something more']
//  webinar_visit_partner_key varchar [default: 0, note: 'ключ партнёра']
//  finished — флаг, означающий что зритель присутствовал до конца вебинара.
// view — метка абсолютного времени (в мс), с которого зритель присутствовал на вебинаре;
// viewTill — метка абсолютного времени (в мс), до которого зритель присутствовал на вебинаре.
// banners — массив из объектов, каждый из которых с полями id: 'название баннера', time: метка времени нажатия
// buttons — массив из объектов, каждый из которых с полями id: 'название кнопки', time: метка времени нажатия
// messages (строка) реплики зрителей в формате JSON: { userId1: ["привет","это мои сообщения в чате"], userId2:["звук есть"], ... }
// messagesTS (строка) тайминг реплик зрителей в формате JSON: { userId1: [ 60, 105 ], userId2: [ 36 ], ... } Время, указанное в массивах, — в секундах относительно начала вебинара.
}