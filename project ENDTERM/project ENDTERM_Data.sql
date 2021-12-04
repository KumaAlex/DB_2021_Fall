CREATE SCHEMA project;

create table brands (
    brand_ID integer primary key,
    name varchar(150) NOT NULL
);

create table Products (
    UPC_code numeric(14,0) primary key,
    name varchar(40) NOT NULL,
    brand_ID integer NOT NULL references brands(brand_ID),
    weight numeric(7,3) NOT NULL,
    packaging varchar(40) NOT NULL,
    description text
);

create table Types (
    type_ID integer primary key,
    type_name varchar(40) NOT NULL
);

create table Product_Hierarchy (
    child_type_ID integer references  Types(type_ID),
    parent_type_ID integer references Types(type_ID),
    primary key (child_type_ID, parent_type_ID)
);

create table Prod_types (
    UPC_code numeric(14,0) references Products(UPC_code),
    type_ID integer references Types(type_ID),
    primary key (UPC_code, type_ID)
);

create table Vendors (
    vendor_ID integer primary key,
    first_name varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    phone_number numeric(11,0) NOT NULL,
    add_info text
);

create table Vendor_Prod (
    vendor_ID integer references Vendors(vendor_ID),
    UPC_code numeric(14,0) references Products(UPC_code),
    primary key (vendor_ID, UPC_code)
);

create table Stores (
    store_ID integer primary key,
    wallet numeric(14,2) NOT NULL,
    country varchar(83) NOT NULL,
    city varchar(168) NOT NULL,
    street varchar(148) NOT NULL,
    number numeric(5,0) NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL,
    store_name varchar(40) NOT NULL
);

create table Store_Vendor (
    store_ID integer references Stores(store_ID),
    vendor_ID integer references Vendors(vendor_ID),
    primary key (store_ID, vendor_ID)
);

create table Storage (
    store_ID integer references  Stores(store_ID),
    UPC_code numeric(14,0) references Products(UPC_code),
    amount integer NOT NULL,
    primary key (store_ID, UPC_code)
);

create table Customers (
    customer_ID integer primary key,
    frequent_shopper boolean NOT NULL,
    wallet numeric(14,2) NOT NULL
);

create table Basket (
    transatcion_ID integer primary key,
    customer_ID integer references Customers(customer_ID),
    store_ID integer references Stores(store_ID),
    UPC_code numeric(14,0) references Products(UPC_code),
    amount integer NOT NULL,
    date timestamp NOT NULL,
    status varchar(14) NOT NULL
);

create table Frequent_shopper (
    customer_ID integer references customers(customer_ID),
    first_name varchar(40),
    last_name varchar(40),
    phone_number numeric(11,0),
    country varchar(83),
    city varchar(168),
    street varchar(148),
    number numeric(5,0),
    add_info text
);

insert into brands
values (1, 'Bionova');
insert into brands
values (2, 'FITactive');
insert into brands
values (3, 'DR.Korner');
insert into brands
values (4, 'Nemoloko');
insert into brands
values (5, 'naturalKZ');
insert into brands
values (6, 'Bombbar');

insert into products
values(10000, 'milk', 6, 0.97, 'safety', 'natural product without genetically modified organism');
insert into products
values(38145, 'fish', 6, 4.34, 'production', 'natural product without additives or preservatives');
insert into products
values(33884, 'kefir', 2, 11.61, 'safety', 'natural product without genetically modified organism');
insert into products
values(10459, 'cheese', 3, 4.18, 'consumer', 'natural product without pesticide dyes');
insert into products
values(89580, 'sour cream', 3, 16.96, 'production', 'NULL');
insert into products
values(109560, 'apple', 4, 18.20, 'production', 'natural product without pesticide dyes');
insert into products
values(152866, 'beet', 6, 14.7, 'safety', 'natural product without pesticide dyes');
insert into products
values(63977, 'carrot', 4, 4.51, 'transport', 'natural product without additives or preservatives');
insert into products
values(272056, 'potato', 5, 4.5, 'consumer', 'natural product without genetically modified organism');
insert into products
values(17002, 'cucumber', 2, 1.11, 'safety', 'natural product without genetically modified organism');
insert into products
values(311060, 'tomato', 1, 2.14, 'safety', 'NULL');
insert into products
values(271855, 'pork', 3, 8.58, 'production', 'NULL');
insert into products
values(383212, 'beef', 1, 10.16, 'transport', 'natural product without additives or preservatives');
insert into products
values(269402, 'chicken', 1, 3.27, 'consumer', 'natural product without genetically modified organism');
insert into products
values(378312, 'lamb', 6, 16.16, 'consumer', 'NULL');
insert into products
values(333070, 'horse meat', 6, 3.74, 'safety', 'NULL');
insert into products
values(507840, 'strawberry', 4, 1.60, 'production', 'natural product without additives or preservatives');
insert into products
values(49202, 'raspberry', 4, 10.33, 'production', 'natural product without pesticide dyes');
insert into products
values(353296, 'currant', 3, 5.71, 'production', 'natural product without genetically modified organism');
insert into products
values(323728, 'blackberry', 4, 13.47, 'transport', 'natural product without additives or preservatives');
insert into products
values(505340, 'melon', 6, 16.53, 'production', 'natural product without additives or preservatives');
insert into products
values(34150, 'watermelon', 3, 12.71, 'production', 'natural product without pesticide dyes');
insert into products
values(674202, 'pumpkin', 4, 10.7, 'consumer', 'natural product without genetically modified organism');
insert into products
values(248809, 'dill', 4, 7.13, 'transport', 'natural product without pesticide dyes');
insert into products
values(456112, 'herring', 6, 18.34, 'transport', 'natural product without genetically modified organism');
insert into products
values(739200, 'cilantro', 4, 10.83, 'production', 'natural product without additives or preservatives');
insert into products
values(175334, 'parsley', 5, 15.51, 'safety', 'NULL');
insert into products
values(119107, 'mushroom', 2, 3.65, 'transport', 'NULL');
insert into products
values(318560, 'pepper ', 3, 16.94, 'production', 'natural product without additives or preservatives');
insert into products
values(720036, 'eggplant', 1, 19.24, 'transport', 'NULL');
insert into products
values(848140, 'cabbage', 1, 19.53, 'production', 'natural product without genetically modified organism');
insert into products
values(471683, 'garlic', 3, 7.10, 'consumer', 'NULL');
insert into products
values(221744, 'onions', 1, 1.86, 'safety', 'NULL');
insert into products
values(585883, 'ginger', 6, 16.53, 'production', 'natural product without genetically modified organism');
insert into products
values(1040302, 'lemon', 5, 16.85, 'transport', 'NULL');
insert into products
values(1154570, 'orange', 2, 9.3, 'consumer', 'NULL');
insert into products
values(67132, 'banana', 2, 3.24, 'transport', 'natural product without pesticide dyes');
insert into products
values(254866, 'avocado', 1, 0.23, 'safety', 'natural product without additives or preservatives');
insert into products
values(800324, 'mango', 6, 1.47, 'consumer', 'NULL');
insert into products
values(489388, 'grape', 5, 2.78, 'transport', 'natural product without genetically modified organism');
insert into products
values(257640, 'tangerine', 3, 17.73, 'safety', 'natural product without additives or preservatives');



insert into vendors
values(1, 'Alex', 'Kim', 87771000041);
insert into vendors
values(2, 'Sam', 'Tsoy', 87771018467);
insert into vendors
values(3, 'Leonid', 'Kim', 87771006334);
insert into vendors
values(4, 'Boris', 'Li', 87771026500);
insert into vendors
values(5, 'Victoria', 'Chircova', 87771019169);
insert into vendors
values(6, 'Rustam', 'Abduloev', 87771015724);
insert into vendors
values(7, 'Amina', 'Timohina', 87771011478);


insert into stores
values


insert into stores
values('1', 31201, 'Kazakhstan', 'Almaty', 'Seidalieva', 11, '8:00', '22:00', 'Magnum');
insert into stores
values(2, 39234, 'Kazakhstan', 'Karaganda', 'Boralday', 24, '8:00', '22:00', 'AKKU');
insert into stores
values(3, 28458, 'Kazakhstan', 'Almaty', 'Kasimova', 19, '8:00', '22:00', 'Shynar');
insert into stores
values(4, 42092, 'Kazakhstan', Nursultan'Musorskaya', 28, '8:00', '22:00', 'Ramstor');
insert into stores
values(5, 37198, 'Kazakhstan', 'Almaty', 'Seyfulina', 12, '8:00', '22:00', 'Toymart');
insert into stores
values(6, 40879, 'Kazakhstan', 'Moscow', 'Midinskaya', 15, '8:00', '22:00', 'Green');


insert into customers
values(1, 'false', 806);
insert into customers
values(2, 'false', 1099);
insert into customers
values(3, 'true', 1934);
insert into customers
values(4, 'false', 3243);
insert into customers
values(5, 'true', 3727);
insert into customers
values(6, 'true', 3470);


insert into types
values(1, 'dairy products');
insert into types
values(2, 'meat');
insert into types
values(3, 'drink');
insert into types
values(4, 'fruit');
insert into types
values(5, 'vegetable');
insert into types
values(6, 'plant');
insert into types
values(7, 'berrie');
insert into types
values(8, 'seafood');
insert into types
values(9, 'meal');

-- meal - plant, meat, seafood
-- plant - fruit, veg, berr

insert into product_hierarchy
values(8, 9);
insert into product_hierarchy
values(2, 9);
insert into product_hierarchy
values(6, 9);
insert into product_hierarchy
values(4, 6);
insert into product_hierarchy
values(5, 6);
insert into product_hierarchy
values(7, 6);


insert into prod_types
values(10000, 1);
insert into prod_types
values(10000, 3);
insert into prod_types
values(38145, 8);
insert into prod_types
values(38145, 9);
insert into prod_types
values(33884, 1);
insert into prod_types
values(33884, 3);
insert into prod_types
values(10459 , 1);
insert into prod_types
values(10459 , 9);
insert into prod_types
values(89580, 1);
insert into prod_types
values(89580, 9);
insert into prod_types
values(109560, 9);
insert into prod_types
values(109560, 4);
insert into prod_types
values(109560, 6);
insert into prod_types
values(152866, 9);
insert into prod_types
values(152866, 5);
insert into prod_types
values(152866, 6);
insert into prod_types
values(63977, 9);
insert into prod_types
values(63977, 6);
insert into prod_types
values(63977, 5);
insert into prod_types
values(272056, 9);
insert into prod_types
values(272056, 6);
insert into prod_types
values(272056, 5);
insert into prod_types
values(17002, 9);
insert into prod_types
values(17002, 6);
insert into prod_types
values(17002, 5);
insert into prod_types
values(311060, 9);
insert into prod_types
values(311060, 6);
insert into prod_types
values(311060, 5);
insert into prod_types
values(271855, 9);
insert into prod_types
values(271855, 2);
insert into prod_types
values(383212, 9);
insert into prod_types
values(383212, 2);
insert into prod_types
values(269402, 9);
insert into prod_types
values(269402, 2);
insert into prod_types
values(378312, 9);
insert into prod_types
values(378312, 2);
insert into prod_types
values(333070, 9);
insert into prod_types
values(333070, 2);
insert into prod_types
values(507840, 6);
insert into prod_types
values(507840, 7);
insert into prod_types
values(507840, 9);
insert into prod_types
values(49202, 6);
insert into prod_types
values(49202, 7);
insert into prod_types
values(49202, 9);
insert into prod_types
values(353296, 6);
insert into prod_types
values(353296, 7);
insert into prod_types
values(353296, 9);
insert into prod_types
values(323728, 6);
insert into prod_types
values(323728, 7);
insert into prod_types
values(323728, 9);
insert into prod_types
values(34150, 6);
insert into prod_types
values(34150, 7);
insert into prod_types
values(34150, 9);
insert into prod_types
values(505340, 6);
insert into prod_types
values(505340, 4);
insert into prod_types
values(505340, 9);
insert into prod_types
values(674202, 6);
insert into prod_types
values(674202, 5);
insert into prod_types
values(674202, 9);
insert into prod_types
values(248809, 6);
insert into prod_types
values(248809, 5);
insert into prod_types
values(248809, 9);
insert into prod_types
values(456112, 6);
insert into prod_types
values(456112, 5);
insert into prod_types
values(456112, 9);
insert into prod_types
values(175334, 6);
insert into prod_types
values(175334, 5);
insert into prod_types
values(175334, 9);
insert into prod_types
values(739200, 6);
insert into prod_types
values(739200, 5);
insert into prod_types
values(739200, 9);
insert into prod_types
values(119107, 9);
insert into prod_types
values(720036, 6);
insert into prod_types
values(720036, 5);
insert into prod_types
values(720036, 9);
insert into prod_types
values(318560, 6);
insert into prod_types
values(318560, 5);
insert into prod_types
values(318560, 9);
insert into prod_types
values(848140, 6);
insert into prod_types
values(848140, 5);
insert into prod_types
values(848140, 9);
insert into prod_types
values(471683, 6);
insert into prod_types
values(471683, 5);
insert into prod_types
values(471683, 9);
insert into prod_types
values(221744, 6);
insert into prod_types
values(221744, 5);
insert into prod_types
values(221744, 9);
insert into prod_types
values(585883, 6);
insert into prod_types
values(585883, 5);
insert into prod_types
values(585883, 9);
insert into prod_types
values(1040302, 6);
insert into prod_types
values(1040302, 5);
insert into prod_types
values(1040302, 9);
insert into prod_types
values(1154570, 6);
insert into prod_types
values(1154570, 4);
insert into prod_types
values(1154570, 9);
insert into prod_types
values(67132, 6);
insert into prod_types
values(67132, 4);
insert into prod_types
values(67132, 9);
insert into prod_types
values(254866, 6);
insert into prod_types
values(254866, 4);
insert into prod_types
values(254866, 9);
insert into prod_types
values(800324, 6);
insert into prod_types
values(800324, 4);
insert into prod_types
values(800324, 9);
insert into prod_types
values(489388, 6);
insert into prod_types
values(489388, 4);
insert into prod_types
values(489388, 9);
insert into prod_types
values(257640, 6);
insert into prod_types
values(257640, 4);
insert into prod_types
values(257640, 9);


insert into frequent_shopper
values (3, 'Ivan', 'Bulitco', 87772649372, 'Kazakhstan', 'Almaty', 'Borodinskya', 35);
insert into frequent_shopper
values (5, 'Egor', 'Kozlov', 87772123273, 'Kazakhstan', 'Almaty', 'Elelianskaya', 12);
insert into frequent_shopper
values (6, 'Jotaro', 'JOJO', 77777777777, 'Japan', 'Tokyo', 'Kyoto', 1);


insert into storage
values(1, 10000, 1000, 123);
insert into storage
values(1, 38145, 0, 234);
insert into storage
values(1, 33884, 0, 345);
insert into storage
values(1, 10459, 12, 345);
insert into storage
values(1, 89580, 23, 456);
insert into storage
values(1, 109560, 34, 5123);
insert into storage
values(1, 152866, 34, 8376);
insert into storage
values(1, 63977, 35, 956);
insert into storage
values(2, 272056, 7, 1852);
insert into storage
values(2, 17002, 35, 8371);
insert into storage
values(2, 311060, 7, 567);
insert into storage
values(2, 254866, 567, 935);
insert into storage
values(2, 800324, 8, 111);
insert into storage
values(2, 489388, 99, 1111);
insert into storage
values(2, 271855, 87, 8371);
insert into storage
values(2, 383212, 98, 1236);
insert into storage
values(2, 269402, 346, 971);
insert into storage
values(2, 378312, 24, 7123);
insert into storage
values(3, 333070, 574, 10000);
insert into storage
values(3, 507840, 245, 12012);
insert into storage
values(3, 49202, 13, 1241);
insert into storage
values(3, 353296, 463, 34645);
insert into storage
values(3, 323728, 5, 2352);
insert into storage
values(3, 505340, 235, 3800);
insert into storage
values(3, 34150, 34, 1200);
insert into storage
values(3, 674202, 65, 3445);
insert into storage
values(3, 248809, 7, 3400);
insert into storage
values(3, 456112, 6, 9876);
insert into storage
values(3, 739200, 5, 7592);
insert into storage
values(4, 175334, 7, 852);
insert into storage
values(4, 119107, 0, 30);
insert into storage
values(4, 318560, 0, 1232);
insert into storage
values(4, 720036, 0, 43212);
insert into storage
values(4, 848140, 0, 9777);
insert into storage
values(4, 471683, 8, 9245);
insert into storage
values(4, 221744, 1, 8123);
insert into storage
values(4, 585883, 5, 1284);
insert into storage
values(4, 1040302, 4, 8572);
insert into storage
values(4, 1154570, 2, 199);
insert into storage
values(4, 67132, 11, 21);
insert into storage
values(4, 257640, 12, 9942);
insert into storage
values(5, 848140, 0, 12314);
insert into storage
values(5, 471683, 8, 423);
insert into storage
values(5, 221744, 1, 512);
insert into storage
values(5, 585883, 5, 412);
insert into storage
values(5, 1040302, 4, 6564);
insert into storage
values(5, 1154570, 2, 435);
insert into storage
values(5, 67132, 11, 23);
insert into storage
values(5, 257640, 12, 2323);
insert into storage
values(6, 254866, 567, 9200);
insert into storage
values(6, 800324, 8, 235);
insert into storage
values(6, 489388, 99, 2);
insert into storage
values(6, 271855, 87, 21);
insert into storage
values(6, 383212, 98, 553);
insert into storage
values(6, 269402, 346, 1);
insert into storage
values(6, 378312, 24, 5326);
insert into storage
values(6, 333070, 574, 234);
insert into storage
values(6, 507840, 245, 624);
insert into storage
values(6, 49202, 13, 678);
insert into storage
values(6, 353296, 463, 789);
insert into storage
values(6, 323728, 5, 999);
insert into storage
values(6, 505340, 235, 666);
insert into storage
values(6, 34150, 34, 222);
insert into storage
values(6, 674202, 65, 1234);
insert into storage
values(6, 248809, 7, 837);

insert into store_vendor
values(1, 1);
insert into store_vendor
values(1, 3);
insert into store_vendor
values(1, 4);
insert into store_vendor
values(2, 2);
insert into store_vendor
values(2, 5);
insert into store_vendor
values(2, 4);
insert into store_vendor
values(2, 1);
insert into store_vendor
values(3, 7);
insert into store_vendor
values(3, 6);
insert into store_vendor
values(3, 5);
insert into store_vendor
values(4, 1);
insert into store_vendor
values(4, 2);
insert into store_vendor
values(5, 2);
insert into store_vendor
values(5, 3);
insert into store_vendor
values(5, 5);
insert into store_vendor
values(6, 5);


insert into vendor_prod
values(1, 10000);
insert into vendor_prod
values(3, 38145);
insert into vendor_prod
values(4, 33884);
insert into vendor_prod
values(1, 10459);
insert into vendor_prod
values(3, 89580);
insert into vendor_prod
values(4, 109560);
insert into vendor_prod
values(1, 152866);
insert into vendor_prod
values(3, 63977);
insert into vendor_prod
values(2, 272056);
insert into vendor_prod
values(5, 17002);
insert into vendor_prod
values(4, 311060);
insert into vendor_prod
values(1, 254866);
insert into vendor_prod
values(2, 800324);
insert into vendor_prod
values(5, 489388);
insert into vendor_prod
values(4, 271855);
insert into vendor_prod
values(1, 383212);
insert into vendor_prod
values(2, 269402);
insert into vendor_prod
values(5, 378312);
insert into vendor_prod
values(6, 333070);
insert into vendor_prod
values(5, 507840);
insert into vendor_prod
values(7, 49202);
insert into vendor_prod
values(6, 353296);
insert into vendor_prod
values(5, 323728);
insert into vendor_prod
values(7, 505340);
insert into vendor_prod
values(6, 34150);
insert into vendor_prod
values(5, 674202);
insert into vendor_prod
values(7, 248809);
insert into vendor_prod
values(6, 456112);
insert into vendor_prod
values(5, 739200);
insert into vendor_prod
values(1, 175334);
insert into vendor_prod
values(2, 119107);
insert into vendor_prod
values(1, 318560);
insert into vendor_prod
values(2, 720036);
insert into vendor_prod
values(1, 848140);
insert into vendor_prod
values(2, 471683);
insert into vendor_prod
values(1, 221744);
insert into vendor_prod
values(2, 585883);
insert into vendor_prod
values(1, 1040302);
insert into vendor_prod
values(2, 1154570);
insert into vendor_prod
values(1, 67132);
insert into vendor_prod
values(2, 257640);
insert into vendor_prod
values(3, 848140);
insert into vendor_prod
values(5, 221744);
insert into vendor_prod
values(3, 1040302);
insert into vendor_prod
values(5, 67132);
insert into vendor_prod
values(5, 254866);
insert into vendor_prod
values(5, 800324);
insert into vendor_prod
values(5, 271855);
insert into vendor_prod
values(5, 383212);
insert into vendor_prod
values(5, 269402)
insert into vendor_prod
values(5, 333070);
insert into vendor_prod
values(5, 49202);
insert into vendor_prod
values(5, 353296);
insert into vendor_prod
values(5, 505340);
insert into vendor_prod
values(5, 34150)
insert into vendor_prod
values(5, 248809);



insert into basket
values(1, 5, 6, 383212, 34, 553, '15/6/2021', 'commited');
insert into basket
values(2, 6, 6, 269402, 62, 1, '14/7/2021', 'rollback');
insert into basket
values(3, 3, 2, 271855, 61, 8371, '27/2/2021', 'commited');
insert into basket
values(4, 4, 3, 323728, 91, 2352, '4/4/2021', 'commited');
insert into basket
values(5, 6, 3, 34150, 21, 1200, '6/5/2021', 'commited');
insert into basket
values(6, 5, 4, 318560, 71, 1232, '26/12/2021', 'commited');
insert into basket
values(7, 4, 6, 254866, 35, 9200, '7/12/2021', 'rollback');
insert into basket
values(8, 2, 4, 257640, 73, 9942, '9/3/2021', 'commited');
insert into basket
values(9, 4, 5, 1040302, 47, 6564, '8/6/2021', 'commited');
insert into basket
values(10, 5, 2, 489388, 23, 1111, '7/10/2021', 'commited');
insert into basket
values(11, 5, 1, 109560, 90, 5123, '11/5/2021', 'commited');
insert into basket
values(12, 4, 3, 333070, 64, 10000, '10/5/2021', 'commited');
insert into basket
values(13, 4, 1, 10459, 70, 345, '9/3/2021', 'commited');
insert into basket
values(14, 5, 1, 89580, 29, 456, '20/10/2021', 'commited');
insert into basket
values(15, 5, 6, 269402, 66, 1, '24/1/2021', 'commited');
insert into basket
values(16, 5, 6, 505340, 26, 666, '15/1/2021', 'commited');
insert into basket
values(17, 6, 4, 67132, 29, 21, '10/3/2021', 'commited');
insert into basket
values(18, 3, 4, 1040302, 4, 8572, '6/8/2021', 'commited');
insert into basket
values(19, 5, 3, 456112, 21, 9876, '14/6/2021', 'commited');
insert into basket
values(20, 1, 4, 318560, 77, 1232, '5/7/2021', 'commited');
insert into basket
values(21, 6, 6, 353296, 61, 789, '18/11/2021', 'commited');
insert into basket
values(22, 5, 3, 456112, 31, 9876, '6/4/2021', 'commited');
insert into basket
values(23, 6, 4, 221744, 66, 8123, '24/10/2021', 'commited');
insert into basket
values(24, 4, 4, 257640, 57, 9942, '25/8/2021', 'rollback');