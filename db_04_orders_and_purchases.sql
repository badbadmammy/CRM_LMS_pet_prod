//Продукты и услуги
Table Products {
  product_id uuid [primary key]
  product_id_created_at timestamp [not null]
  product_name varchar [not null]
  product_description varchar [default: 0]
//  product_tag varchar [not null]
  product_chief_expert enum [not null, note: '']
  product_substitute_expert enum [not null, note: '']
  product_wide_audience boolean [default: False]
  product_for_parents boolean [default: False]
  product_basic boolean [default: False]
//  product_specialized boolean [default: False]
//  product_advanced_training_programs boolean [default: False]
//  methodology_id uuid [null, note: 'connection with  methodologes table']
  product_type enum [not null, note: 'онлайн или офлайн']
  product_academic_hours decimal [default: 0]
//  product_access_period - атрибут прайса?
}

//Товары
Table Goods {
  good_id uuid [primary key]
  good_id_created_at timestamp [not null]
//  type enum [not null, note: '']
  good_name varchar [not null]
  good_description varchar [default: 0]
  good_size varchar [default: 0]
  good_weight decimal [default: 0]
//  good_volume_of_supply varchar [not null]
//  good_purchase_price decimal [not null]
}

//Прайс-лист
Table Price_list {
  price_id uuid [primary key]
  price_id_created_at timestamp [not null]
  product_id uuid [null, note: 'connection with products table']
  good_id uuid [null, note: 'connection with goods table']
  price decimal [not null]
  price_type enum [not null, note: 'базовая с рассрочкой, внутренняя рассрочка +15%, офлайн, распродажа без рассрочки для ОМ, скидка при полной оплате для ОП, спец цена, доп доступ?']
  price_activ boolean [default: True]
  price_deactivation_date timestamp [default: 0]
}

//Заказы
Table Deals {
  deal_id uuid [primary key]
  deal_cost decimal [not null]
  deal_promo_code varchar [default: 0]
  deal_currency enum [not null, note: 'код валюты заказа - rub, если нет данных']
  payment_deadline timestamp [not null]
  deal_is_paid boolean [default: False]
  deal_reason_of_fail enum [not null, note: '']
// deal_status_":"код статуса заказа",
// deal_priority
  deal_created_at timestamp [not null]
  deal_finished_at timestamp [not null]
  deal_comment varchar [default: 0]
  deal_utm_source varchar [default: 0, note: 'name of social']
  deal_utm_medium varchar [default: 0, note: 'type: email, banner']
  deal_utm_campaign varchar [default: 0, note: 'marketing company']
  deal_utm_term varchar [default: 0, note: 'keyword']
  deal_utm_content varchar [default: 0, note: 'something more']
//  deal_partner_key varchar [default: 0, note: 'ключ партнёра']
  hunter_manager_email varchar [default: 0]
  farmer_manager_email varchar [default: 0]
//  panel_id uuid [null, note: 'ID доски продаж, connection with panels table']
//  panel_stage_id uuid [null, note: 'ID этапа на доске продаж, connection with panels table']
  company_id uuid [null, note: 'connection with companies table']
}

//Количество позиций в заказе
Table Deals_Price_Connections {
  deal_price_connection_id uuid [primary key]
  deal_id uuid [not null, note: 'connection with deals table']
  price_id uuid [not null, note: 'connection with price list table']
  quantity smallint [not null]
}

//Связь заказов и пользователей
Table Deals_Users_Connections {
  deal_user_connection_id uuid [primary key]
  deal_id uuid [not null, note: 'connection with deals table']
  user_id uuid [not null, note: 'connection with users table']
}

//Платежи
Table Payments {
  payment_id uuid [primary key]
  payment_id_created_at timestamp [not null]
  payment_cost decimal [not null]
//  payment_type enum [not null, note: '']
  payment_status enum [not null, note: 'тип платежа из списка']
  payment_method enum [not null, note: 'статус платежа из списка']
//  payment_url varchar [default: 0]
}

//Привязка платежа к заказу
Table Deals_Payments_Connections {
  deal_payment_connection_id uuid [primary key]
  payment_id uuid [not null, note: 'connection with users table']
  deal_id uuid [not null, note: 'connection with users table']
  connection_cost decimal [not null, note: 'сколько денег из платежа списывается за конкретный заказ']
}