-- Drop tables
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;

CREATE TABLE card_holder (
  id SERIAL PRIMARY KEY,
  name VARCHAR (255) NOT NULL
);


CREATE TABLE credit_card (
  card VARCHAR(20) NOT NULL PRIMARY KEY,
  cardholder_id INT,	
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant_category(
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) NOT NULL
);

CREATE TABLE merchant(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	id_merchant_category INT,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);


CREATE TABLE transaction(
	id SERIAL PRIMARY KEY,
	date TIMESTAMP,
	amount MONEY, 
	card VARCHAR(20) NOT NULL, 
	id_merchant INT, 
	FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

