-- Create schema and tables if not exists

CREATE SCHEMA IF NOT EXISTS auction_center;

CREATE TABLE IF NOT EXISTS auction_center.address (
  address_id   SERIAL PRIMARY KEY,
  city         VARCHAR(255),
  street       VARCHAR(255),
  house_no     INTEGER CHECK ( house_no > 0),
  flat_no      INTEGER CHECK ( house_no > 0)
);

CREATE TABLE IF NOT EXISTS auction_center.auction (
  auction_id   SERIAL PRIMARY KEY,
  address_id   INTEGER REFERENCES auction_center.address(address_id),
  name         VARCHAR(255),
  description  VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS auction_center.auctioneer (
  auctioneer_id          SERIAL PRIMARY KEY,
  auction_id             INTEGER REFERENCES auction_center.auction(auction_id),
  name                   VARCHAR(255),
  date_of_taking_office  DATE,
  salary                 INTEGER
);

CREATE TABLE IF NOT EXISTS auction_center.order_to_sell (
  order_id        SERIAL PRIMARY KEY,
  auctioneer_id   INTEGER NOT NULL REFERENCES
                                   auction_center.auctioneer(auctioneer_id),
  min_value       INTEGER,
  description     VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS auction_center.item (
  item_id   SERIAL PRIMARY KEY,
  name      VARCHAR(255),
  count     INTEGER CHECK ( count > 0 ),
  unit      VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS auction_center.item_in_order (
  order_id  SERIAL REFERENCES auction_center.order_to_sell(order_id),
  item_id   SERIAL REFERENCES auction_center.item(item_id),
  CONSTRAINT PK_item_in_order PRIMARY KEY (order_id, item_id)
);

CREATE TABLE IF NOT EXISTS auction_center.owner (
  owner_id         SERIAL PRIMARY KEY,
  address_id       INTEGER NOT NULL REFERENCES auction_center.address(address_id),
  name             VARCHAR(255),
  phone_no         VARCHAR(20),
  license_to_sell  INTEGER
);

CREATE TABLE IF NOT EXISTS auction_center.buyer (
  buyer_id         SERIAL PRIMARY KEY,
  address_id       INTEGER NOT NULL REFERENCES auction_center.address(address_id),
  name             VARCHAR(255),
  phone_no         VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS auction_center.receipt (
  order_id         INTEGER PRIMARY KEY REFERENCES auction_center.order_to_sell(order_id),
  buyer_id         INTEGER NOT NULL REFERENCES auction_center.buyer(buyer_id),
  value            VARCHAR(255),
  date_of_payment  DATE
);
