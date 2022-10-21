-- Los triggers son eventos que provocan la ejecucion de codigo y pueden ocurrir a distintos niveles

CREATE TABLE alumno
(
    id_alumno INTEGER,
    nombre VARCHAR2(50),
    fecha_nacimiento DATE
);

CREATE TABLE auditoria
(
    id_auditoria INTEGER,
    nombre_tabla VARCHAR(255),
    nombre_operacion VARCHAR(10)
);

1. Trigger y SEQUENCE

CREATE SEQUENCE seq_auditoria INCREMENT BY 1;
-- Esto es para crear la secuencia y esto lo que hace es incrementarnos el valor seq_auditoria en 1 siempre que se use

CREATE OR REPLACE TRIGGER on_update_alumno
BEFORE UPDATE ON alumno
FOR EACH ROW 

-- Por cada vez que se actualice la tabla alumno, ejecuta el siguiente codigo 

BEGIN

-- Tenemos que usar una secuencia a la hora de introducir los datos para que estos no se repitan
    INSERT INTO auditoria VALUES(seq_auditoria.nextval, 'alumno', 'UPDATE');
-- Le introduce el siguiente valor de la tabla auditoria al id
END;

INSERT INTO alumno VALUES(1, 'DAVID', TO_DATE('27-12-1994', 'dd-mm-yyyy'));
INSERT INTO alumno VALUES(2, 'LUCAS', TO_DATE('25-02-2002', 'dd-mm-yyyy'));
INSERT INTO alumno VALUES(3, 'JAVI', TO_DATE('23-04-1998', 'dd-mm-yyyy'));
INSERT INTO alumno VALUES(4, 'ELADIO', TO_DATE('13-07-2001', 'dd-mm-yyyy'));
INSERT INTO alumno VALUES(5, 'JUAN', TO_DATE('06-12-2000', 'dd-mm-yyyy'));

-- Vamos a cambiar uno de los valores de los insert

SELECT * FROM auditoria;

UPDATE alumno
SET nombre = 'Paco Sanz'
WHERE id_alumno = 3;

-- Con esto comprobaríamos que se han introducido los datos automáticamente

SELECT * FROM auditoria;

2. Trigger con USER Y SYSDATE

-- Ahora vamos a hacer el ejercicio entero


CREATE TABLE alumno
(
    id_alumno INTEGER,
    nombre VARCHAR2(50),
    fecha_nacimiento DATE
);

CREATE TABLE auditoria
(
    id_auditoria INTEGER,
    nombre_tabla VARCHAR(255),
    nombre_operacion VARCHAR(10),
    operador VARCHAR2(30),
    fecha_transaccion DATE
);

-- Usaremos la tabla dual para sacar las variables operador y fecha_transaccion

SELECT USER, SYSDATE FROM DUAL;

CREATE SEQUENCE seq_auditoria INCREMENT BY 1;
CREATE OR REPLACE TRIGGER on_update_alumno
BEFORE UPDATE ON alumno
FOR EACH ROW 
BEGIN
    INSERT INTO auditoria VALUES(seq_auditoria.nextval, 'alumno', 'UPDATE', USER, SYSDATE);
-- Los valores USER y SYSDATE, estan en el sistema declarados, por tanto, no necesitamos declararlos nosotros
END;

3. Tabla customer

CREATE TABLE customer (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    age INTEGER,
    address VARCHAR2(255),
    salary NUMBER(7,2)
);

INSERT INTO customer VALUES(1, 'PACO', 23, 'ALGUNA', 2000);
INSERT INTO customer VALUES(2, 'ANTONIO', 19, 'OTRA', 1100);
INSERT INTO customer VALUES(3, 'JOSE LUIS', 55, 'OTRA +', 2200);
INSERT INTO customer VALUES(4, 'JUAN', 33, 'IMAGINA', 2400);
INSERT INTO customer VALUES(5, 'LUCAS', 20, 'MI CASA', 2222);
INSERT INTO customer VALUES(6, 'ELADIO', 18, 'SU CASA', 1880);
INSERT INTO customer VALUES(7, 'JESUS', 66, 'AQUELLA CASA', 1700);

-- NOS IMPRIME POR PANTALLA LA MODIFICACIÓN DEL SALARIO

CREATE OR REPLACE TRIGGER on_update_salario
BEFORE UPDATE ON customer
FOR EACH ROW
-- si nos dejan elegir, before mejor

BEGIN

    --:NEW 
-- REGISTRO CON LOS NUEVOS VALORES
    DBMS_OUTPUT.PUT_LINE('SALARIO ANTERIOR: ' || :NEW.salary);

    --:OLD
-- REGISTRO CON LOS VIEJOS VALORES
    DBMS_OUTPUT.PUT_LINE('SALARIO ACTUALIZADO:' || :OLD.salary);

END;

UPDATE customer 
SET SALARY = 3000
WHERE id = 1;