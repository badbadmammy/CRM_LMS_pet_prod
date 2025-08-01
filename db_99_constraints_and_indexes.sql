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