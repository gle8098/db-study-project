
-- В таблицу receipt можно добавлять только новые строчки. Будем фиксировать любое изменение строчек и изменение
--  стоимости товаров в чеке.

CREATE TABLE IF NOT EXISTS auction_center.receipt_audit (
    action      CHAR(25) NOT NULL,
    buyer_name  VARCHAR(256),
    new_value   VARCHAR(256),
    old_value   VARCHAR(256),
    stamp       TIMESTAMP NOT NULL
);

CREATE OR REPLACE FUNCTION auction_center.update_receipt_audit() RETURNS TRIGGER AS $$
    BEGIN
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO auction_center.receipt_audit(action, buyer_name, new_value, old_value, stamp)
            VALUES (
                'Update',
                (SELECT name FROM auction_center.buyer WHERE auction_center.buyer.buyer_id=NEW.buyer_id),
                NEW.value, OLD.value, now()
            );
            RETURN NEW;
        ELSIF (TG_OP = 'DELETE') THEN
            INSERT INTO auction_center.receipt_audit(action, buyer_name, new_value, old_value, stamp)
            VALUES (
                'Remove',
                (SELECT name FROM auction_center.buyer WHERE auction_center.buyer.buyer_id=OLD.buyer_id),
                NULL, OLD.value, now()
            );
            RETURN OLD;
        END IF;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER receipt_audit
BEFORE UPDATE OR DELETE ON auction_center.receipt
    FOR EACH ROW EXECUTE PROCEDURE auction_center.update_receipt_audit();

--
UPDATE auction_center.receipt
SET value = '100';

DELETE FROM auction_center.receipt;
--
-- Примерный вывод:
--
--          action           |     buyer_name      | new_value | old_value |           stamp
-----------------------------+---------------------+-----------+-----------+----------------------------
-- Update                    | Keeleigh Devine     | 100       | 4000000   | 2020-05-19 20:14:15.988723
-- Update                    | Desiree Ratcliffe   | 100       | 3000000   | 2020-05-19 20:14:15.988723
-- Update                    | Gracie-May Richards | 100       | 2300000   | 2020-05-19 20:14:15.988723
-- Update                    | Elsa Lister         | 100       | 4000000   | 2020-05-19 20:14:15.988723
-- Update                    | Cassandra Rooney    | 100       | 1200050   | 2020-05-19 20:14:15.988723
-- Update                    | Daanyal Mcnamara    | 100       | 120000    | 2020-05-19 20:14:15.988723
-- Remove                    | Keeleigh Devine     |           | 100       | 2020-05-19 20:14:15.992603
-- Remove                    | Desiree Ratcliffe   |           | 100       | 2020-05-19 20:14:15.992603
-- Remove                    | Gracie-May Richards |           | 100       | 2020-05-19 20:14:15.992603
-- Remove                    | Elsa Lister         |           | 100       | 2020-05-19 20:14:15.992603
-- Remove                    | Cassandra Rooney    |           | 100       | 2020-05-19 20:14:15.992603
-- Remove                    | Daanyal Mcnamara    |           | 100       | 2020-05-19 20:14:15.992603
--


-- Нельзя просто так удалить строку из item, т.к. почти наверняка на нее ссылается запись их item_in_order.
-- Сделаем так, чтобы сначала удалялись ссылки на item.

CREATE TABLE IF NOT EXISTS auction_center.item_audit (
    item_name   VARCHAR(256),
    item_count  INTEGER CHECK (item_count >= 0),
    refs_count  INTEGER NOT NULL CHECK (refs_count >= 0),
    stamp       TIMESTAMP NOT NULL
);

CREATE OR REPLACE FUNCTION auction_center.on_delete_from_item() RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO auction_center.item_audit(item_name, item_count, refs_count, stamp)
        VALUES (
            OLD.name, OLD.count,
            (SELECT count(item_id) FROM auction_center.item_in_order WHERE item_id=OLD.item_id),
            now()
        );

        DELETE FROM auction_center.item_in_order
        WHERE item_id=OLD.item_id;

        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER on_delete_from_item
BEFORE DELETE ON auction_center.item
    FOR EACH ROW EXECUTE PROCEDURE auction_center.on_delete_from_item();

--
DELETE FROM auction_center.item
WHERE item_id=5;
--
-- Примерный вывод:
--
-- item_name | item_count | refs_count |           stamp
-------------+------------+------------+----------------------------
-- Ram horns |         10 |          1 | 2020-05-19 22:34:51.068106
--