--CREATE TABLE specializations {
--    specialization_id UUID PRIMARY KEY,
--    created_at TIMESTAMP DEFAULT now(),
--    updated_at TIMESTAMP,
--    deleted_at TIMESTAMP,
--
--    user_education ENUM ('', '', '', '') NOT NULL,
--    user_specialization ENUM ('ДЦП', '', '') NOT NULL,
--    user_position ENUM ('', '', '', '') NOT NULL,
--    user_patients ENUM ('дети', 'взрослые'),
--    patients_problems TEXT,
--    methods_used ENUM ('Войта-терапия', 'ПНФ', '') NOT NULL,
--   necessary_methods ENUM ('Войта-терапия', 'ПНФ', '') NOT NULL,
--   interesting_topics varchar [not null]
--    important_in_course varchar [not null]
--    doubts varchar [not null]
--    why_interested ?? атрибут продукта
--    how_find ?? атрибут продукта
--    user_spend_for_education_per_year
--    competitors - какая инфа нужна?
--};

CREATE TABLE aggregator {
    id UUID PRIMARY KEY,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    aggregator_agreement BOOLEAN DEFAULT FALSE,
    aggregator_agreement_created_at TIMESTAMP,
    aggregator_start_show TIMESTAMP,
    aggregator_end_show TIMESTAMP
};

//Календарь
Table Сalendar {
  calendar_id uuid [primary key]
  calendar_id_created_at timestamp [not null]
}