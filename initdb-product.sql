CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    price INTEGER NOT NULL,
    image VARCHAR(255),
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION update_product_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.date_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER product_update_trigger
BEFORE UPDATE ON product
FOR EACH ROW
EXECUTE FUNCTION update_product_timestamp();


INSERT INTO Product (name, slug, price, image, date_added, date_updated)
VALUES ('Dummy Product1', 'dummy-product1', 10, 'dummy.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Product (name, slug, price, image, date_added, date_updated)
VALUES ('Dummy Product2', 'dummy-product2', 100, 'dummy2.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Product (name, slug, price, image, date_added, date_updated)
VALUES ('Dummy Product3', 'dummy-product3', 250, 'dummy3.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
