UPDATE auction_center.order_to_sell 
SET    description='Fur bucket'
WHERE  order_id=1;

INSERT INTO auction_center.item (
  name,
  count,
  unit)
VALUES ('Canon photocamera', 1, NULL);

INSERT INTO auction_center.order_to_sell (
  auctioneer_id,
  min_value,
  description)
VALUES (3, 20000, 'Photocameras');

INSERT INTO auction_center.item_in_order (
  order_id,
  item_id)
VALUES (11, 13);

-- He is fired!
UPDATE auction_center.order_to_sell
SET    auctioneer_id=5
WHERE  auctioneer_id=4;

DELETE FROM auction_center.auctioneer
WHERE  auctioneer_id=4;

UPDATE auction_center.auctioneer
SET    salary = 100
WHERE  auctioneer_id = 5;

INSERT INTO auction_center.receipt (
  order_id,
  buyer_id,
  value,
  date_of_payment)
VALUES (2, 7, 10000, '2021-03-04'),
       (4, 7, 20000, '2021-03-04');

UPDATE auction_center.order_to_sell
SET    min_value = min_value + 10000;

DELETE FROM auction_center.item_in_order
WHERE  order_id = 11 and item_id = 13;