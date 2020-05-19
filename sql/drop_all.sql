DROP TABLE IF EXISTS
           auction_center.address,
           auction_center.auction,
           auction_center.auctioneer,
           auction_center.order_to_sell,
           auction_center.item,
           auction_center.item_in_order,
           auction_center.owner,
           auction_center.buyer,
           auction_center.receipt,
           auction_center.receipt_audit,
           auction_center.item_audit
CASCADE;
DROP TRIGGER IF EXISTS
		   receipt_audit ON auction_center.receipt;
DROP TRIGGER IF EXISTS
		   on_delete_from_item ON auction_center.item;