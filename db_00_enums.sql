CREATE TYPE gender_enum AS ENUM ('мужской', 'женский');
CREATE TYPE company_type_enum AS ENUM ('реаб.центр');
CREATE TYPE company_role_enum AS ENUM ('клиент', 'поставщик', 'партнер');
CREATE TYPE manager_type_enum AS ENUM ('нет', 'лидоруб', 'хантер', 'фермер');
CREATE TYPE how_found_us_enum AS ENUM ('сарафанное радио', 'в Контакте', 'вебинар', 'поисковик');
CREATE TYPE preferred_channels_enum AS ENUM ('звонок', 'Telegram', 'WhatsApp', 'e-mail');
CREATE TYPE document_type_enum AS ENUM ('диплом', 'сертификат', 'паспорт', 'прописка', 'свидетельство смены фамилии', 'СНИЛС', 'повышение кваливикации', 'договор на обучение');
CREATE TYPE document_status_enum AS ENUM('действителен', 'истёк', 'отозван');