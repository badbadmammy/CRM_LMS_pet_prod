//Контент
Table Сontent {
  content_id uuid [primary key]
  content_id_created_at timestamp [not null]
  content_name varchar [not null]
  content_description varchar [default: 0]
  product_id uuid [null, note: 'connection with products table']
}

//Тренинги
Table Trainings {
  training_id uuid [primary key]
  training_id_created_at timestamp [not null]
  training_name varchar [not null]
  training_description varchar [default: 0]
  training_tag varchar [not null]
}

//Доступ к тренингам
Table Trainings_Users_Access {
  training_user_access_id uuid [primary key]
  training_user_access_id_created_at timestamp [not null]
  user_id uuid [not null, note: 'connection with users table']
  training_id uuid [not null, note: 'connection with trainings table']
  have_access boolean [default: False]
  have_access_true_created_at timestamp [not null]
  started_training timestamp [default: 0]
  finished_training timestamp [default: 0]
}
