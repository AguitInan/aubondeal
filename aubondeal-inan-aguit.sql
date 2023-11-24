-- Table des utilisateurs (users)
CREATE TABLE IF NOT EXISTS users (
     user_UUID SERIAL PRIMARY KEY NOT NULL,
     user_pseudo VARCHAR(100),
     username VARCHAR(100),
     user_password VARCHAR(255),
     created_at DATE
);

-- Table des produits (products)
CREATE TABLE IF NOT EXISTS products (
     product_UUID SERIAL PRIMARY KEY NOT NULL,
     product_name VARCHAR(100),
     product_description TEXT,
     product_price DECIMAL(10, 2) CHECK (product_price >= 0),
     product_quantity INT CHECK (product_quantity >= 0),
     created_at DATE,
     updated_at DATE,
     CONSTRAINT chk_dates CHECK (created_at < updated_at)
);

-- Table des commandes (orders)
CREATE TABLE IF NOT EXISTS orders (
     order_number SERIAL PRIMARY KEY NOT NULL,
     order_total_cost_ht DECIMAL(10, 2) CHECK (order_total_cost_ht >= 0),
     order_total_quantity_ht INT CHECK (order_total_quantity_ht >= 0),
     created_at DATE,
     deliver_at DATE,
     CONSTRAINT chk_dates CHECK (created_at < deliver_at),
     user_uuid INT REFERENCES users(user_uuid)
);
 
-- Table de relation entre produits et commandes (belong)
CREATE TABLE IF NOT EXISTS belong (
     product_UUID SERIAL REFERENCES products(product_UUID),
     order_number SERIAL REFERENCES orders(order_number)
);
