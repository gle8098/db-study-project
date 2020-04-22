-- Сколько предметов в каждом заказе?
SELECT auction_center.order_to_sell.description, count(*) as orders_num FROM auction_center.order_to_sell
INNER JOIN auction_center.item_in_order
ON auction_center.order_to_sell.order_id = auction_center.item_in_order.order_id
GROUP BY auction_center.order_to_sell.description
ORDER BY count(*) DESC

-- Примерный вывод
-- description | orders_num
-- ------------+------------
-- Bucket 10   |          2
-- Fur bucket  |          2
-- Bucket 5    |          1
-- Bucket 3    |          1
-- Bucket 6    |          1
-- Bucket 9    |          1
-- Bucket 4    |          1
-- Bucket 2    |          1
-- Bucket 8    |          1
-- Bucket 7    |          1