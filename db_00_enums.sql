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
