-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2022-03-28 12:34:36 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE client (
    idclient    INTEGER NOT NULL,
    name        VARCHAR2(20 CHAR) NOT NULL,
    dateofbirth DATE NOT NULL
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( idclient );

CREATE TABLE floor (
    idfloor INTEGER NOT NULL,
    name    VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE floor ADD CONSTRAINT floor_pk PRIMARY KEY ( idfloor );

CREATE TABLE occupied (
    idreserve          INTEGER NOT NULL,
    room_floor_idfloor INTEGER NOT NULL,
    room_idroom        INTEGER NOT NULL,
    client_idclient    INTEGER NOT NULL,
    arrivaldate        DATE NOT NULL,
    departuredate      DATE,
    euros              NUMBER(6, 2) NOT NULL
);

ALTER TABLE occupied ADD CONSTRAINT occupied_pk PRIMARY KEY ( idreserve );

CREATE TABLE room (
    floor_idfloor INTEGER NOT NULL,
    idroom        INTEGER NOT NULL,
    beds          INTEGER NOT NULL,
    squaremeters  NUMBER(5, 2) NOT NULL
);

ALTER TABLE room ADD CONSTRAINT room_pk PRIMARY KEY ( floor_idfloor,
                                                      idroom );

ALTER TABLE occupied
    ADD CONSTRAINT occupied_client_fk FOREIGN KEY ( client_idclient )
        REFERENCES client ( idclient );

ALTER TABLE occupied
    ADD CONSTRAINT occupied_room_fk FOREIGN KEY ( room_floor_idfloor,
                                                  room_idroom )
        REFERENCES room ( floor_idfloor,
                          idroom );

ALTER TABLE room
    ADD CONSTRAINT room_floor_fk FOREIGN KEY ( floor_idfloor )
        REFERENCES floor ( idfloor )
            ON DELETE CASCADE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
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
