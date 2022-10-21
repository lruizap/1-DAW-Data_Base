-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2022-05-22 12:39:44 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE compartir (
    id                            VARCHAR2(40 BYTE) NOT NULL,
    usuario_id_usuario            VARCHAR2(40 BYTE) NOT NULL,
    publicación_id_publicacion    VARCHAR2(40 BYTE) NOT NULL,
    publicación_fecha_publicacion DATE NOT NULL
);

ALTER TABLE compartir ADD CONSTRAINT compartir_pk PRIMARY KEY ( id );

CREATE TABLE cont_multi (
    id_multimedia                 VARCHAR2(40 BYTE) NOT NULL,
    enlace                        CLOB NOT NULL,
    publicación_id_publicacion    VARCHAR2(40 BYTE) NOT NULL,
    publicación_fecha_publicacion DATE NOT NULL
);

ALTER TABLE cont_multi ADD CONSTRAINT contenido_multimedia_pk PRIMARY KEY ( publicación_id_publicacion );

CREATE TABLE favorito (
    id                            VARCHAR2(40 BYTE) NOT NULL,
    usuario_id_usuario            VARCHAR2(40 BYTE) NOT NULL,
    publicación_id_publicacion    VARCHAR2(40 BYTE) NOT NULL,
    publicación_fecha_publicacion DATE NOT NULL
);

ALTER TABLE favorito ADD CONSTRAINT favorito_pk PRIMARY KEY ( id );

CREATE TABLE info_adicional (
    usuario_id_usuario VARCHAR2(40 BYTE) NOT NULL,
    id_info            VARCHAR2(40 BYTE) NOT NULL,
    fecha_nacimiento   DATE,
    biografia          VARCHAR2(280),
    ubicacion          VARCHAR2(50),
    web                CLOB
);

CREATE UNIQUE INDEX info_adicional__idx ON
    info_adicional (
        usuario_id_usuario
    ASC );

ALTER TABLE info_adicional ADD CONSTRAINT info_adicional_pk PRIMARY KEY ( id_info,
                                                                          usuario_id_usuario );

CREATE TABLE perfil (
    usuario_id_usuario VARCHAR2(40 BYTE) NOT NULL,
    id_prefil          VARCHAR2(40 BYTE) NOT NULL,
    avatar             CLOB,
    fondo              CLOB,
    alias              VARCHAR2(50)
);

CREATE UNIQUE INDEX perfil__idx ON
    perfil (
        usuario_id_usuario
    ASC );

ALTER TABLE perfil ADD CONSTRAINT perfil_pk PRIMARY KEY ( id_prefil,
                                                          usuario_id_usuario );

CREATE TABLE publicación (
    usuario_id_usuario            VARCHAR2(40 BYTE) NOT NULL,
    id_publicacion                VARCHAR2(40 BYTE) NOT NULL,
    publicación_id_publicacion    VARCHAR2(40 BYTE,
    fecha_publicacion             DATE NOT NULL,
    contenido                     VARCHAR2(280) NOT NULL,
    multimedia                    CHAR(1) NOT NULL,
    publicación_fecha_publicacion DATE NOT NULL,
    fecha_publicacion1            DATE
);

ALTER TABLE publicación ADD CONSTRAINT publicación_pk PRIMARY KEY ( id_publicacion );

CREATE TABLE sigue (
    id                  VARCHAR2(40 BYTE) NOT NULL,
    usuario_id_usuario  VARCHAR2(40 BYTE) NOT NULL,
    usuario_id_usuario1 VARCHAR2(40 BYTE) NOT NULL
);

ALTER TABLE sigue ADD CONSTRAINT sigue_pk PRIMARY KEY ( id );

CREATE TABLE usuario (
    id_usuario     VARCHAR2(40 BYTE) NOT NULL,
    nombre_usuario VARCHAR2(25) NOT NULL,
    email          VARCHAR2(50) NOT NULL,
    fecha_creacion DATE NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE compartir
    ADD CONSTRAINT compartir_publicación_fk FOREIGN KEY ( publicación_id_publicacion )
        REFERENCES publicación ( id_publicacion );

ALTER TABLE compartir
    ADD CONSTRAINT compartir_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE cont_multi
    ADD CONSTRAINT cont_multi_pub_fk FOREIGN KEY ( publicación_id_publicacion )
        REFERENCES publicación ( id_publicacion )
            ON DELETE CASCADE;

ALTER TABLE favorito
    ADD CONSTRAINT favorito_publicación_fk FOREIGN KEY ( publicación_id_publicacion )
        REFERENCES publicación ( id_publicacion );

ALTER TABLE favorito
    ADD CONSTRAINT favorito_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE info_adicional
    ADD CONSTRAINT info_adicional_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario )
            ON DELETE CASCADE;

ALTER TABLE perfil
    ADD CONSTRAINT perfil_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario )
            ON DELETE CASCADE;

ALTER TABLE publicación
    ADD CONSTRAINT publicación_publicación_fk FOREIGN KEY ( publicación_id_publicacion )
        REFERENCES publicación ( id_publicacion );

ALTER TABLE publicación
    ADD CONSTRAINT publicación_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE sigue
    ADD CONSTRAINT sigue_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE sigue
    ADD CONSTRAINT sigue_usuario_fkv1 FOREIGN KEY ( usuario_id_usuario1 )
        REFERENCES usuario ( id_usuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             2
-- ALTER TABLE                             19
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
-- ERRORS                                   1
-- WARNINGS                                 0
