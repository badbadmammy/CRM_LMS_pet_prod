-- Users
CREATE TABLE users {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
user_gc_id INTEGER,
first_name VARCHAR(50) NOT NULL,
second_name VARCHAR(20),
last_name VARCHAR(50),
full_name VARCHAR(100),
date_of_birth DATE,
phone_number VARCHAR(20) UNIQUE NOT NULL CHECK (phone_number ~ '^\+\d{8,15}$'),
phone_verificated BOOLEAN DEFAULT FALSE,
email VARCHAR(100) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
email_verificated BOOLEAN DEFAULT FALSE,
password VARCHAR(255),
temporary_password VARCHAR(255),
temporary_password_sended BOOLEAN DEFAULT FALSE,
unsubscribe_email TIMESTAMP,
created_at TIMESTAMP DEFAULT now(),
created_utm_id INTEGER,
updated_at TIMESTAMP,
delated_at TIMESTAMP,
last_login TIMESTAMP,
is_active BOOLEAN DEFAULT FALSE,
is_partner BOOLEAN DEFAULT FALSE,
partner_key UUID,
bonus_balance INTEGER DEFAULT 0,
deposit_balance DECIMAL(15,2) DEFAULT 0.00,
--role_id INTEGER NOT NULL,
--specialization_id INTEGER,
--personal_data_id INTEGER,
--company_id INTEGER
};

COMMENT ON COLUMN users.created_utm_id IS 'connection with table utm';
COMMENT ON COLUMN users.partner_key IS 'for referal program';

-CREATE TABLE groups {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
name_group TEXT,
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
}

CREATE TABLE roles {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
is_student BOOLEAN DEFAULT TRUE,
is_expert BOOLEAN DEFAULT FALSE,
is_staff BOOLEAN DEFAULT FALSE,
is_manager BOOLEAN DEFAULT FALSE,
manager_type ENUM ('нет', 'лидоруб', 'хантер', 'фермер') DEFAULT 'нет',
is_admin BOOLEAN DEFAULT FALSE
}

CREATE TABLE users_managers_connections {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
user_id INTEGER,
-- company_id INTEGER,
manager_lid_id INTEGER,
manager_hanter_id INTEGER,
manager_fermer_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (manager_lid_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (manager_hanter_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT,
FOREIGN KEY (manager_fermer_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
}

--CREATE TABLE specializations {
specialization_id UUID PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
user_education enum [not null, note: '']
user_specialization enum [not null, note: '']
user_position enum [not null, note: '']
user_patients enum [not null, note: '']
patients_problems varchar [not null]
methods_used varchar [not null]
necessary_methods varchar [not null]
interesting_topics varchar [not null]
important_in_course varchar [not null]
doubts varchar [not null]
why_interested ?? атрибут продукта
how_find ?? атрибут продукта
user_spend_for_education_per_year
competitors - какая инфа нужна?
aggregator_agreement boolean [default: False]
aggregator_agreement_created_at timestamp [not null]
aggregator_start_show timestamp [not null]
aggregator_end_show timestamp [not null]
}

CREATE TABLE personal_data {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
personal_data_agreement BOOLEAN DEFAULT FALSE,
personal_data_agreement_created_at TIMESTAMP,
stop_personal_data TIMESTAMP,
photo TEXT,
gender ENUM ('мужской', 'женский'),
-- country_id INTEGER,
-- region_id INTEGER,
-- city_id INTEGER,
-- passport_cerier INTEGER DEFAULT '0',
-- passport_number INTEGER,
how_find_academy VARCHAR(150) NOT NULL CHECK (how_find_academy IN ('сарафанное радио', 'эксперт', 'instagram'))
}

Table Documents {
document_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
user_id INTEGER,
--company_id INTEGER,
document_type ENUM ('диплом', 'сертификат', 'паспорт', 'прописка', 'свидетельство смены фамилии', 'СНИЛС', 'повышение кваливикации', 'договор на обучение') NOT NULL,
document_url TEXT,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
}

CREATE TABLE addresses {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
user_id INTEGER,
--company_id INTEGER,
adress_registration BOOLEAN DEFAULT FALSE,
adress_fact BOOLEAN DEFAULT FALSE,
adress_delivery BOOLEAN DEFAULT FALSE,
postal_code INTEGER,
country_id INTEGER,
region_id INTEGER,
city_id INTEGER,
street VARCHAR(50),
home VARCHAR(10),
apartment VARCHAR(10),
adress_comment TEXT,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
}

CREATE TABLE countres
CREATE TABLE regions
CREATE TABLE cites

--Позиция в компании
Table Company_Positions {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
user_id INTEGER NOT NULL,
--company_id INTEGER NOT NULL,
position_in VARCHAR(150) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT
}

Table Companies {
id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
created_at TIMESTAMP DEFAULT now(),
updated_at TIMESTAMP,
delated_at TIMESTAMP,
company_name VARCHAR(500) NOT NULL,
company_sphere NOT NULL CHECK (company_sphere IN ('реаб.центр')),
company_role enum [not null, note: '']
company_phone varchar [default: 0]
company_email varchar [default: 0]
company_site varchar [default: 0]
company_bank_details_id
}

//Реквизиты компании
Table Company_Bank_Details {
  company_bank_details_id uuid [primary key]
  company_bank_details_id_created_at timestamp [not null]
//  company_short_name varchar
//  company_full_name varchar
//  company_inn
//  company_ogrn
//  company_kpp
  company_registration_date timestamp [not null]
  company_lead varchar [default: 0]
  company_bank_name varchar [default: 0]
//  company_bank_bic
//  company_bank_current_account
//  company_bank_kc
}

CREATE TABLE utm


-- Внешние ключи:
--    FOREIGN KEY (created_utm_id) REFERENCES utm(utm_id) ON DELETE SET NULL,
--    FOREIGN KEY (group_id) REFERENCES groups(group_id) ON DELETE SET NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE RESTRICT,
--    FOREIGN KEY (manager_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id) ON DELETE SET NULL,
    FOREIGN KEY (personal_data_id) REFERENCES contacts(personal_data_id) ON DELETE SET NULL
ON UPDATE CASCADE
ON DELETE RESTRICT
};