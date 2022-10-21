CREATE TABLE Cliente
(
    "id" INT NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    nif CHAR(9) NOT NULL,
    fecha_alta DATE,
    poblacion VARCHAR2(40) DEFAULT 'Jerez',
    email VARCHAR2(255),
    PRIMARY KEY ("id")
);

CREATE TABLE Articulo
(
    codigo VARCHAR2(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR2(280),
    precio  NUMBER(6,2) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE Factura
(
  numero INT NOT NULL,
  id_cliente INT NOT NULL,
  forma_pago CHAR(1) DEFAULT 'C',
  PRIMARY KEY (numero),
  FOREIGN KEY (id_cliente) REFERENCES Cliente("id"),
  CHECK (forma_pago IN ('C', 'T'))
);



/*insert into table values(x,x,x,x) -------> PARA INSERTAR EN TABLAS*/
/*Select x from table where x = 'x'; ---------> VER ALGO DE LA TABLA EN ESPECIFICO*/
/*SELECT trunc((to_date('2013', 'yyyy')-nacimiento)/365) AS edad from tabla1 where nombre='Rosa';*/
/*SELECT title, year FROM movies order by year limit 5; --------> 5 PRIMERAS*/
/*SELECT title, director FROM movies 
WHERE title LIKE "Toy Story%"; */
/*SELECT DISTINCT director FROM movies
ORDER BY director ASC-DESC;*/
/*SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;*/
/*SELECT title FROM movies
ORDER BY title ASC
LIMIT 5;*/

/*SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;   PARA PODER SALTAR A LAS 5 SIGUIENTES DE LAS 5 PRIMERAS*/


/*# Listar los nombres de los usuarios
SELECT nombre FROM tblUsuarios;

# Calcular el saldo máximo de los usuarios de sexo "Mujer"
SELECT MAX(saldo) FROM tblUsuarios WHERE sexo = 'M';

#Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
SELECT nombre, telefono FROM tblUsuarios WHERE marca IN('NOKIA', 'BLACKBERRY', 'SONY');

#Contar los usuarios sin saldo o inactivos
SELECT COUNT(*) FROM tblUsuarios WHERE NOT activo OR saldo <= 0;

#Listar el login de los usuarios con nivel 1, 2 o 3
SELECT usuario FROM tblUsuarios WHERE nivel IN(1, 2, 3);

#Listar los números de teléfono con saldo menor o igual a 300
SELECT telefono FROM tblUsuarios WHERE saldo <= 300;

#Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
SELECT SUM(saldo) FROM tblUsuarios WHERE compañia = 'NEXTEL';

#Contar el número de usuarios por compañía telefónica
SELECT compañia, COUNT(*) FROM tblUsuarios GROUP BY compañia;

#Contar el número de usuarios por nivel
SELECT nivel, COUNT(*) FROM tblUsuarios GROUP BY nivel;

#Listar el login de los usuarios con nivel 2
SELECT usuario FROM tblUsuarios WHERE nivel = 2;

#Mostrar el email de los usuarios que usan gmail
SELECT email FROM tblUsuarios WHERE email LIKE '%gmail.com';

#Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
SELECT nombre, telefono FROM tblUsuarios WHERE marca IN('LG', 'SAMSUNG', 'MOTOROLA');*/

/*Funciona como INSERT, pero si la clave primaria del registro que
se inserta ya se encuentra en la tabla, entonces REEMPLAZA el
registro de la tabla por el nuevo registro.

REPLACE INTO opera (idopera,nombre) VALUES
(13,'Fidelio'),(14,'Norma');*/

/*Borra registros de una tabla.
DELETE FROM mitabla WHERE columna1 = valor1
DELETE FROM opera WHERE nombre LIKE '%Norma%';*/

/*Vacía una tabla completamente.
TRUNCATE TABLE mitabla*/

/*afufu*/

/*HAVING permite poner condiciones, como WHERE, pero estas
condiciones se aplican después del ORDER BY y GROUP BY. Además,
HAVING puede llevar funciones de agregación (max, min, count, avg...),
mientras que WHERE no puede.
SELECT autor_idautor, COUNT(nombre) FROM opera GROUP BY
autor_idautor HAVING COUNT(nombre)>=2;
● Es posible enviar la consulta a un fichero de texto:
SELECT nombre,fecha_estreno,lugar_estreno FROM opera
INTO OUTFILE 'opera.txt';*/

/*Permiten obtener datos de una consulta completa o con GROUP
BY.
AVG. Retorna el valor medio de la expresión.

SELECT ciudad, AVG(aforo) FROM teatro GROUP BY ciudad;
COUNT. Retorna el contador del número de valores no NULL en los registros
recibidos por un comando SELECT.

SELECT COUNT(distinct autor_idautor) FROM opera;*/

/*SELECT COUNT(*) FROM opera;

MIN, MAX. Retornas los valores máximos y mínimos.
SELECT MAX(fecha_estreno) FROM opera;

SUM. Retorna la suma de la expresión.

SELECT SUM(espectadores) FROM representa WHERE
opera_idopera=1;

Subconsultas
Corresponden a un comando SELECT dentro de otro comando.
Ejemplo:
SELECT * FROM t1
WHERE column1 = (SELECT column1 FROM t2);
● Una subconsulta puede retornar un valor único, un registro, una
columna o una tabla (uno o más registros de una o más columnas). En su
forma más sencilla, una subconsulta es una subconsulta escalar que
retorna un único valor.
SELECT nombre FROM autor WHERE idautor = (SELECT
autor_idautor FROM opera WHERE nombre = 'Aida');
● La palabra clave ANY, que debe seguir a un operador de comparación,
significa “return TRUE si lacomparación es TRUE para cualquiera de los
valores en la columna que retorna la subconsulta.”
SELECT nombre FROM opera WHERE autor_idautor = ANY (SELECT
idautor FROM autor WHERE nombre LIKE '%Beethoven%' OR
nombre LIKE '%Verdi%');
● La palabra IN es un alias para = ANY.
SELECT nombre FROM opera WHERE autor_idautor NOT IN
(SELECT idautor FROM autor WHERE nombre LIKE '%Verdi%');

Gestión de Bases de Datos 1o Administración de Sistemas Informáticos en Red

Tema 4. DML (I). Página 8 de 9
● La palabra ALL, que debe seguir a un operador de comparación, significa
“return TRUE si la comparación es TRUE para todos los valores en la
columna que retorna la subconsulta.”

Ejemplos de Funciones
A continuación se presentan algunos ejemplos de uso de diferentes funciones
MySQL:
- Con operadores de comparación

SELECT * FROM opera WHERE autor_idautor IS NULL;
SELECT nombre, fecha_nacimiento FROM autor WHERE
fecha_nacimiento BETWEEN '1800-01-01' AND '1900-12-31';

- De control de flujo

SELECT nombre, CASE idioma WHEN 'I' THEN 'Italiano' WHEN
'A' THEN 'Alemán' WHEN 'F' THEN 'Francés' ELSE
'Desconocido' END AS 'Idioma' FROM opera;
SELECT nombre, if(idioma='I','',idioma) as 'Idioma' from
opera;
- De cadenas

SELECT CONCAT('My', 'S', 'QL');
SELECT UPPER(nombre) FROM opera;
SELECT LTRIM(' Quítame
los espacios del principio');
SELECT nombre FROM opera WHERE LOCATE('Violeta',sinopsis)
!= 0;
SELECT IF(STRCMP('a','a')=0,'Son iguales','No lo son');

Gestión de Bases de Datos 1o Administración de Sistemas Informáticos en Red

Tema 4. DML (I). Página 9 de 9
- De fecha y hora

SELECT CURDATE();// CURRENT_DATE(), NOW(), ...
SELECT nombre,
DATEDIFF(fecha_defuncion,fecha_nacimiento) AS 'Dias
vividos' FROM autor;
SELECT nombre, YEAR(fecha_defuncion) -
YEAR(fecha_nacimiento) - ( RIGHT(fecha_defuncion,5) >
RIGHT(fecha_nacimiento,5) ) as 'Murio con (años)' FROM
autor WHERE fecha_nacimiento IS NOT NULL AND
fecha_defuncion IS NOT NULL ORDER BY 2 DESC;
SELECT nombre, DAYNAME(fecha_nacimiento),
DATE_FORMAT(fecha_nacimiento,'%e de %M de %Y') FROM
autor;
SELECT SEC_TO_TIME(2378);

- Numéricas

SELECT PI(); SELECT SQRT(4);
SELECT 5*4 MOD 2;
SELECT nombre FROM opera ORDER BY RAND() LIMIT 1;*/

