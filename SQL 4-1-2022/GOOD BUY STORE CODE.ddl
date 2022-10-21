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
