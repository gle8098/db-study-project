INSERT INTO auction_center.address (
  city,
  street,
  house_no,
  flat_no)
VALUES ('London', 'Northumberland St.', 5, NULL),
 /*2*/ ('London', 'Northumberland St.', 7, NULL),
 /*3*/ ('London', 'Piccadilly St.', 10, NULL),
 /*4*/ ('London', 'Oxford St.', 1, 2),
 /*5*/ ('London', 'Oxford St.', 1, 3),
 /*6*/ ('Moscow', 'Leninsky Prospekt', 57, NULL),
 /*7*/ ('Moscow', 'Red Square', 1, NULL),
 /*8*/ ('Moscow', 'Zelenogradskaya St.', 56, 45),
 /*9*/ ('Saint Petersburg', 'Malaya Sadovaya Ulitsa', 13, 20),
 /*10*/('Saint Petersburg', 'Bolshaya Morskaya Ulitsa', 56, 32),
 /*11*/('Saint Petersburg', 'Bolshaya Morskaya Ulitsa', 58, NULL),
 /*12*/('Amsterdam', 'Javastraat', 100, NULL),
 /*13*/('Amsterdam', 'Jan Pieter Heijestraat', 33, NULL),
 /*13*/('The Hague', 'Wassenaar', 12, 1);

INSERT INTO auction_center.auction (
  address_id,
  name,
  description)
VALUES (1, 'Northumberland Fur Action Center', 'Best Fur Actions in England!'),
 /*2*/ (2, 'Northumberland Fish Action Center', 'Best Fish Actions in England!'),
 /*3*/ (7, 'Holy Kremlin Action Center', 'Founded in 1993, closed forever in 1999.'),
 /*4*/ (8, 'Khovrino "South gates" A.C.', 'Sells fur, corn, wheat & salad.'),
 /*5*/ (12, 'Jansen''s Flower Auctions', 'Amsterdam branch.'),
 /*6*/ (13, 'Jansen''s Flower Auctions', 'The Hague branch.'),
 /*7*/ (2, 'London State Auction Center', 'Sells debtor''s property.'),
 /*8*/ (13, 'Gentlemen''s Marijuana A.C.', 'First legal auction center of marijuana.'),
 /*9*/ (1, 'Thumb land pub', 'Sorry, it''s a pub, not an auction center.'),
 /*10*/(9, 'Saint Auction', 'Sells fishs, cabs and other seafood.');

INSERT INTO auction_center.auctioneer (
  auction_id,
  name,
  date_of_taking_office,
  salary)
VALUES (1, 'Grigory Perelman', '2000-01-01', 10000),
 /*2*/ (2, 'James Bond', '1969-06-01', 10000000),
 /*3*/ (3, 'Max Ducks', '2018-05-21', 500000),
 /*4*/ (4, 'Bill the Gangstar Trevori', '2010-10-11', 100000),
 /*5*/ (5, 'Robert Jansen', '2013-04-30', 123456),
 /*6*/ (6, 'Stan Jansen', '2013-04-30', 654321),
 /*7*/ (7, 'Stan Kubrik', '1950-01-02', 3294853),
 /*8*/ (8, 'Jerald Statem', '2007-07-07', 200707),
 /*9*/ (9, 'sir Valentine Watersburg', '1999-12-31', 302020),
 /*10*/(10, 'Kevin the God Watson', '0001-12-25', NULL);

INSERT INTO auction_center.owner (
  address_id,
  name,
  phone_no,
  license_to_sell)
VALUES (1, 'Aron English', '(299) 660-3332', 43),
 /*2*/ (2, 'Aurora Chung', '(895) 984-8070', 10),
 /*3*/ (3, 'Junior Allison', '(427) 873-4102', 94),
 /*4*/ (4, 'Kristopher Hernandez', '(677) 664-0946', 1),
 /*5*/ (5, 'Macy Taylor', '(806) 608-9020', 70),
 /*6*/ (6, 'Jamal Shelton', '(726) 710-9620', 69),
 /*7*/ (7, 'Leanna Juarez', '(202) 262-2243', 49),
 /*8*/ (8, 'Maliyah Gay', '(444) 469-2121', 58),
 /*9*/ (9, 'Jazmine Juarez', '(474) 828-3416', 3),
 /*10*/(10, 'Jarrett French', '(933) 900-6347', 98);

INSERT INTO auction_center.buyer (
  address_id,
  name,
  phone_no)
VALUES (1, 'Keeleigh Devine', '(903) 352-7097'),
 /*2*/ (2, 'Desiree Ratcliffe', '(896) 404-7338'),
 /*3*/ (3, 'Gracie-May Richards', '(943) 588-6899'),
 /*4*/ (4, 'Elsa Lister', '(578) 721-6474'),
 /*5*/ (5, 'Cassandra Rooney', '(817) 746-4675'),
 /*6*/ (6, 'Daanyal Mcnamara', '(723) 358-3129'),
 /*7*/ (7, 'Ianis Moses', '(690) 274-6227'),
 /*8*/ (8, 'Magdalena White', '(907) 942-2686'),
 /*9*/ (9, 'Hajrah Oneal', '(532) 464-3006'),
 /*10*/(10, 'Adnaan Irving', '(262) 678-1362');

INSERT INTO auction_center.item (
  name,
  count,
  unit)
VALUES ('Fur stacked #1', 10, 'kg'),
 /*2*/ ('Fur stacked #2', 20, 'kg'),
 /*3*/ ('Wheat for cows', 10, 'kg'),
 /*4*/ ('Shit of elephants', 100, 'g'),
 /*5*/ ('Ram horns', 10, NULL),
 /*6*/ ('Gold fishs', 8, NULL),
 /*7*/ ('Salted carps', 1500, 'g'),
 /*8*/ ('Lost Nemo', 1, NULL),
 /*9*/ ('Frightened chicken', 2, 'kg'),
 /*10*/('Fried chicken', 10, 'kg'),
 /*11*/('Roses', 1, 'football field'),
 /*12*/('Lilies', 2, 'football fields');

INSERT INTO auction_center.order_to_sell (
  auctioneer_id,
  min_value,
  description)
VALUES (1, 20000, 'Bucket 1'),
 /*2*/ (2, 30202, 'Bucket 2'),
 /*3*/ (3, 32324, 'Bucket 3'),
 /*4*/ (4, 33232, 'Bucket 4'),
 /*5*/ (5, 12220, 'Bucket 5'),
 /*6*/ (1, 20000, 'Bucket 6'),
 /*7*/ (2, 30202, 'Bucket 7'),
 /*8*/ (6, 32324, 'Bucket 8'),
 /*9*/ (7, 33232, 'Bucket 9'),
 /*10*/(8, 12220, 'Bucket 10');

INSERT INTO auction_center.item_in_order (
  order_id,
  item_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 4),
       (4, 5),
       (5, 6),
       (6, 7),
       (7, 8), 
       (8, 9),
       (9, 10),
       (10, 11),
       (10, 12);

INSERT INTO auction_center.receipt (
  order_id,
  buyer_id,
  value,
  date_of_payment)
VALUES (1, 1, 4000000, '2020-01-01'),
       (3, 2, 3000000, '2020-01-02'),
       (5, 3, 2300000, '2020-01-03'),
       (7, 4, 4000000, '2020-01-04'),
       (9, 5, 1200050, '2020-01-05'),
       (10, 6, 120000, '2020-01-06');