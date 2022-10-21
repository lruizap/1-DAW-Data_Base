-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2022-04-02 15:18:39 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE address (
    customer_id VARCHAR2(40 BYTE) NOT NULL,
    city        VARCHAR2(40 CHAR) NOT NULL,
    postal_code INTEGER NOT NULL
);

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( customer_id );

CREATE TABLE customer (
    id    VARCHAR2(40 BYTE) NOT NULL,
    name  VARCHAR2(40 CHAR) NOT NULL,
    email VARCHAR2(40) NOT NULL,
    phone INTEGER NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( id );

CREATE TABLE hasv1 (
    product_id                  VARCHAR2(40 BYTE) NOT NULL,
    product_suplier_attribute_1 VARCHAR2(40 BYTE) NOT NULL,
    spare_id                    VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE hasv1
    ADD CONSTRAINT hasv1_pk PRIMARY KEY ( product_id,
                                          product_suplier_attribute_1,
                                          spare_id );

CREATE TABLE hasv4 (
    product_id                  VARCHAR2(40 BYTE) NOT NULL,
    product_suplier_attribute_1 VARCHAR2(40 BYTE) NOT NULL,
    purchase_id                 VARCHAR2(40 BYTE) NOT NULL,
    sale_price                  INTEGER NOT NULL,
    quantity                    INTEGER NOT NULL
);

ALTER TABLE hasv4
    ADD CONSTRAINT hasv4_pk PRIMARY KEY ( product_id,
                                          product_suplier_attribute_1,
                                          purchase_id );

CREATE TABLE hasv5 (
    spare_id    VARCHAR2(40 BYTE) NOT NULL,
    purchase_id VARCHAR2(40 BYTE) NOT NULL,
    sale_price  INTEGER NOT NULL,
    quantity    INTEGER NOT NULL
);

ALTER TABLE hasv5 ADD CONSTRAINT hasv5_pk PRIMARY KEY ( spare_id,
                                                        purchase_id );

CREATE TABLE product (
    id                  VARCHAR2(40 BYTE) NOT NULL,
    brand               VARCHAR2(40) NOT NULL,
    type                VARCHAR2(2 CHAR) NOT NULL,
    model               VARCHAR2(40) NOT NULL,
    purchase_price      INTEGER NOT NULL,
    sale_price          INTEGER NOT NULL,
    units               INTEGER NOT NULL,
    suplier_attribute_1 VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE product
    ADD CHECK ( type IN ( 'BR', 'GR', 'PR', 'WB' ) );

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( id,
                                                            suplier_attribute_1 );

CREATE TABLE purchase (
    id            VARCHAR2(40 BYTE) NOT NULL,
    "date"        DATE NOT NULL,
    saleperson_id VARCHAR2(40 BYTE) NOT NULL,
    customer_id   VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( id );

CREATE TABLE saleperson (
    id            VARCHAR2(40 BYTE) NOT NULL,
    name          VARCHAR2(40 CHAR) NOT NULL,
    type          CHAR(2 CHAR) NOT NULL,
    salary        INTEGER NOT NULL,
    saleperson_id VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE saleperson
    ADD CHECK ( type IN ( 'JS', 'SS' ) );

ALTER TABLE saleperson ADD CONSTRAINT saleperson_pk PRIMARY KEY ( id );

CREATE TABLE spare (
    id                  VARCHAR2(40 BYTE) NOT NULL,
    name                VARCHAR2(40 CHAR) NOT NULL,
    units               INTEGER NOT NULL,
    purchase_price      INTEGER NOT NULL,
    sale_price          INTEGER NOT NULL,
    suplier_attribute_1 VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE spare ADD CONSTRAINT spare_pk PRIMARY KEY ( id );

CREATE TABLE suplier (
    attribute_1 VARCHAR2(40 BYTE) NOT NULL,
    name        VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE suplier ADD CONSTRAINT suplier_pk PRIMARY KEY ( attribute_1 );

ALTER TABLE address
    ADD CONSTRAINT address_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( id )
            ON DELETE CASCADE;

ALTER TABLE hasv1
    ADD CONSTRAINT hasv1_product_fk FOREIGN KEY ( product_id,
                                                  product_suplier_attribute_1 )
        REFERENCES product ( id,
                             suplier_attribute_1 );

ALTER TABLE hasv1
    ADD CONSTRAINT hasv1_spare_fk FOREIGN KEY ( spare_id )
        REFERENCES spare ( id );

ALTER TABLE hasv4
    ADD CONSTRAINT hasv4_product_fk FOREIGN KEY ( product_id,
                                                  product_suplier_attribute_1 )
        REFERENCES product ( id,
                             suplier_attribute_1 );

ALTER TABLE hasv4
    ADD CONSTRAINT hasv4_purchase_fk FOREIGN KEY ( purchase_id )
        REFERENCES purchase ( id );

ALTER TABLE hasv5
    ADD CONSTRAINT hasv5_purchase_fk FOREIGN KEY ( purchase_id )
        REFERENCES purchase ( id );

ALTER TABLE hasv5
    ADD CONSTRAINT hasv5_spare_fk FOREIGN KEY ( spare_id )
        REFERENCES spare ( id );

ALTER TABLE product
    ADD CONSTRAINT product_suplier_fk FOREIGN KEY ( suplier_attribute_1 )
        REFERENCES suplier ( attribute_1 )
            ON DELETE CASCADE;

ALTER TABLE purchase
    ADD CONSTRAINT purchase_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES customer ( id );

ALTER TABLE purchase
    ADD CONSTRAINT purchase_saleperson_fk FOREIGN KEY ( saleperson_id )
        REFERENCES saleperson ( id );

ALTER TABLE saleperson
    ADD CONSTRAINT saleperson_saleperson_fk FOREIGN KEY ( saleperson_id )
        REFERENCES saleperson ( id );

ALTER TABLE spare
    ADD CONSTRAINT spare_suplier_fk FOREIGN KEY ( suplier_attribute_1 )
        REFERENCES suplier ( attribute_1 );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0


insert INTO CUSTOMER values(1, 'Pedro', 'pedro@gmail.com', 697400765);
insert INTO CUSTOMER values(2, 'Alí', 'ali@gmail.com', 777770777);
insert INTO CUSTOMER values(3, 'Sergy', 'Sergy@gmail.com', 657433866);
insert INTO CUSTOMER values(4, 'Gibril', 'raton@gmail.com', 000121212);
insert INTO CUSTOMER values(5, 'Juan', 'juan@gmail.com', 789600600);
insert INTO CUSTOMER values(6, 'Ana', 'ana@gmail.com', 345554555);
insert INTO CUSTOMER values(7, 'antonio', 'antinio@gmail.com', 006799806);
insert INTO CUSTOMER values(8, 'francisco', 'francisco@gmail.com', 123456789);
insert INTO CUSTOMER values(9, 'trujillano', 'trujillano@gmail.com', 123121222);
insert INTO CUSTOMER values(10, 'gallardo', 'gallardo@gmail.com', 697404434);
insert INTO CUSTOMER values(11,'hernesto', 'hernesto@gmail.com', 697800555);
insert INTO CUSTOMER values(12, 'figueroa', 'figueroa@gmail.com', 698800800);

insert INTO address values(1, 'jerez de la frontera', '11404');
insert INTO address values(2, 'jerez de la frontera', '11403');
insert INTO address values(3, 'jerez de la frontera', '11402');
insert INTO address values(4, 'jerez de la frontera', '11401');
insert INTO address values(5, 'jerez de la frontera', '11405');
insert INTO address values(6, 'jerez de la frontera', '11406');
insert INTO address values(7, 'jerez de la frontera', '11407');
insert INTO address values(8, 'jerez de la frontera', '11408');
insert INTO address values(9, 'jerez de la frontera', '11409');
insert INTO address values(10, 'jerez de la frontera', '11410');
insert INTO address values(11, 'Mesas de asta', '11590');
insert INTO address values(12, 'Guadalcacín', '11591');

insert into suplier values(1, 'LG');
insert into suplier values(2, 'PANASONIC');
insert into suplier values(3, 'AOC');
insert into suplier values(4, 'SAMSUNG');
insert into suplier values(5, 'BALAY');
insert into suplier values(6, 'NESSPRESSO');
insert into suplier values(7, 'DAEWOO');
insert into suplier values(8, 'RAZER');
insert into suplier values(9, 'PHILIPS');
insert into suplier values(10, 'BOSH');
insert into suplier values(11, 'SHARK');
insert into suplier values(12, 'SONI');
insert into suplier values(13, 'LOGITECH');
insert into suplier values(14, 'BEKO');
insert into suplier values(15, 'HP');

insert into product values(1, 'LG', 'BR', 'UP80 Smart 4K UHD TV', 800, 1500, 50,1);
insert into product values(2, 'PANASONIC', 'BR', ' LUMIX S5 +', 1500, 2140, 30,2);
insert into product values(3, 'AOC', 'BR', 'Gaming 24G2U 24"', 100, 180, 200,3);
insert into product values(4, 'SAMSUNG', 'WB', 'Horno Pirolítico NV68R3370RS', 270, 559, 300,4);
insert into product values(5, 'SAMSUNG', 'WB', 'Samsung Family Hub RS6HA8880S9', 1200, 1885, 100,4);
insert into product values(6, 'BALAY', 'WB', '3BE297RW EXTRACTOR DE TECHO', 800, 1040, 150,5);
insert into product values(7, 'BALAY', 'WB', '3TI985B WHASHING MACHINE', 500, 819, 1000,5);
insert into product values(8, 'BALAY', 'WB', '3TI978B WHASHING MACHINE', 300, 700, 1250,5);
insert into product values(9, 'SAMSUNG', 'GR', 'SAMSUNG GALAXY S21 FE G990', 212, 499, 370, 4);
insert into product values(10, 'SONY', 'GR', 'Sony Xperia Tablet Z 10,1"', 68, 184, 1050,12);
insert into product values(11, 'SONY', 'GR', 'Sony Xperia Z4 Tablet 10,1"', 142, 357, 1223,12);
insert into product values(12, 'RAZER', 'GR', 'Razer BlackWidow V3', 50, 90, 1250,8);
insert into product values(13, 'HP', 'GR', 'HyperX Alloy Origins', 800, 1500, 50,15);
insert into product values(14, 'RAZER', 'GR', 'Razer Kraken', 30, 50, 1330,8);
insert into product values(15, 'HP', 'GR', 'HP Laser MFP 135a', 73, 139, 430,15);
insert into product values(16, 'HP', 'GR', 'HP LaserJet Pro M28w', 56, 129, 300,15);
insert into product values(17, 'NESSPRESSO', 'PR', 'Dolce Gusto Mini Me', 30, 50, 144,6);
insert into product values(18, 'NESSPRESSO', 'PR', 'Inissia', 29, 60, 130,6);
insert into product values(19, 'BOSH', 'PR', 'Bosch TAT3A004', 26, 55, 2000,10);
insert into product values(20, 'BEKO', 'PR', 'doble Ninja Foodi Dual Zone AF300EU', 150, 230, 1500,14);
insert into product values(21, 'BEKO', 'PR', 'Phantom', 70, 100, 1800,14);

insert into spare values(1, 'SPARE1', 100, 20, 40, 1);
insert into spare values(2, 'SPARE2', 130, 10, 30, 2);
insert into spare values(3, 'SPARE3', 1090, 5, 10, 3);
insert into spare values(4, 'SPARE4', 2000, 20, 40, 4);
insert into spare values(5, 'SPARE5', 100, 20, 40, 5);
insert into spare values(6, 'SPARE6', 50, 50, 70, 6);
insert into spare values(7, 'SPARE7', 140, 70, 120, 8);
insert into spare values(8, 'SPARE8', 150, 220, 540, 9);
insert into spare values(9, 'SPARE9', 160, 320, 640, 10);
insert into spare values(10, 'SPARE10', 60, 20, 40, 12);
insert into spare values(11, 'SPARE11', 6100, 20, 40, 12);
insert into spare values(12, 'SPARE12', 20, 60, 140, 1);
insert into spare values(13, 'SPARE13', 100, 120, 240, 15);
insert into spare values(14, 'SPARE14', 120, 220, 540, 14);
insert into spare values(15, 'SPARE15', 300, 25, 50, 13);

insert into saleperson values(1, 'José', 'JS', 1100, 1);
insert into saleperson values(2, 'Paco', 'SS', 1500, 2);
insert into saleperson values(3, 'jousep', 'SS', 1500, 1);
insert into saleperson values(4, 'Cristian', 'JS', 1200, 3);
insert into saleperson values(5, 'Cristobal', 'SS', 1500, 3);
insert into saleperson values(6, 'Eustaquio', 'JS', 1120, 4);
insert into saleperson values(7, 'María', 'SS', 1600, 5);
insert into saleperson values(8, 'Federico', 'JS', 1220, 5);
insert into saleperson values(9, 'Jorge', 'SS', 1500, 1);

INSERT INTO PURCHASE VALUES(1, TO_DATE('2022-04-1','yyyy-mm-dd'), 1, 1);
INSERT INTO PURCHASE VALUES(1, TO_DATE('2022-04-1','yyyy-mm-dd'), 1, 1);
INSERT INTO PURCHASE VALUES(2, TO_DATE('2022-03-11','yyyy-mm-dd'), 2, 2);
INSERT INTO PURCHASE VALUES(3, TO_DATE('2022-01-12','yyyy-mm-dd'), 3, 3);
INSERT INTO PURCHASE VALUES(4, TO_DATE('2022-02-17','yyyy-mm-dd'), 4, 4);
INSERT INTO PURCHASE VALUES(5, TO_DATE('2022-01-22','yyyy-mm-dd'), 5, 5);
INSERT INTO PURCHASE VALUES(6, TO_DATE('2022-04-2','yyyy-mm-dd'), 6, 6);
INSERT INTO PURCHASE VALUES(7, TO_DATE('2022-03-20','yyyy-mm-dd'), 7, 7);
INSERT INTO PURCHASE VALUES(8, TO_DATE('2022-02-28','yyyy-mm-dd'), 8, 8);
INSERT INTO PURCHASE VALUES(9, TO_DATE('2022-03-29','yyyy-mm-dd'), 9, 9);
INSERT INTO PURCHASE VALUES(10, TO_DATE('2022-03-11','yyyy-mm-dd'), 2, 10);
INSERT INTO PURCHASE VALUES(11, TO_DATE('2022-02-9','yyyy-mm-dd'), 5,11);
INSERT INTO PURCHASE VALUES(12, TO_DATE('2022-01-1','yyyy-mm-dd'), 7,12);
INSERT INTO PURCHASE VALUES(13, TO_DATE('2022-02-12','yyyy-mm-dd'), 2, 1);
INSERT INTO PURCHASE VALUES(14, TO_DATE('2022-03-6','yyyy-mm-dd'), 5, 3);

select * from customer;
select * from saleperson;
select * from address;
select * from suplier;
select * from product;
select * from spare;
select * from purchase;

select count(id) from saleperson where type = 'JS';
select * from product where type = 'PR' and units >= 2000;
select id,model,units from product where units = (SELECT MIN(units) from product);
select spare.name, spare.id from spare where units = (select max(units) from product);
select saleperson.name from saleperson where salary = (select max(salary) from saleperson);

select * from customer;
select * from saleperson;
select * from address;
select * from suplier;
select * from product;
select * from spare;
select * from purchase;