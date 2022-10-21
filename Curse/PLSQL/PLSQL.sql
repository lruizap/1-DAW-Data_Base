PLSQL 

1. Introducción y estructuras de control.

	1.1. Hola mundo

-- Primero debemos introducir el begin y el end; , que dentro de estos es donde
-- se va a ejecutar el código

		BEGIN
			DBMS_OUTPUT.PUT_LINE('hola mundo'); -- esto es el console write line
		END;

	1.2. variables

		DECLARE
			nombre VARCHAR2(50) := 'clase';

-- Para usar variables hay que usar la palabra Declare
-- Es al contrario que c#, primero el nombre de la variable y luego el tipo de dato
-- con los := se le asigna un valor a dicha variable
		
		BEGIN

			DBMS_OUTPUT.PUT_LINE('hola ' || nombre);

-- || equivalente al + a la hora de concatenar cadenas

		END;


	1.3 Exception

-- Exception se usa para el tratamiento de errores. No lo usamos mucho.

	1.4 Estructuras de control

		1.4.1 IF

-- if, else...

			DECLARE
				n INTEGER := 5;
			BEGIN

-- El if funciona prácticamente igual, en vez de {} para delimitarlo, usaremos:

-- IF algo THEN 
-- 	cosas 
-- END IF;

				IF n > 7 THEN 
					DBMS_OUTPUT.PUT_LINE(n ||' es mayor que 7');
				ELSE
					IF n < 3 THEN
						DBMS_OUTPUT.PUT_LINE(n ||' es menor que 3');
					ELSE
						DBMS_OUTPUT.PUT_LINE(n || ' es mayor que 3');
					END IF;
				END IF;
			END;

-- No hay que cerrar el else puesto que es una alternativa al bloque if

		1.4.2 ELSIF 

			DECLARE
				n INTEGER := 1;
			BEGIN

-- El ELSIF no hace falta que lo cerremos, solo tenemos que cerrar el primer IF

				IF n > 2 THEN 
					DBMS_OUTPUT.PUT_LINE(n ||' es mayor que 2');
				ELSIF n < 3 THEN
						DBMS_OUTPUT.PUT_LINE(n ||' es 0 o 1');
				ELSE
					DBMS_OUTPUT.PUT_LINE(n || ' es negativo');
				END IF;
			END;

		1.4.3 SWITCH CASE Y MODULO --> RESTO

			SELECT * FROM dual; -- se usa para hacer cosas que no van hacia ninguna tabla en concreto
			SELECT 2+2 FROM dual;
			SELECT MOD(2,2) FROM DUAL; -- Esto es para poner el modulo de una division

			DECLARE 
				i INTEGER := 25;

			BEGIN

				CASE -- ESTE ES NUESTRO SWITCH

					WHEN MOD(i, 3) = 0 AND MOD (i, 5) = 0 THEN
						DBMS_OUTPUT.PUT_LINE(i || ' es mmultiplo de 3 y 5');
					WHEN MOD(i, 3) = 0 THEN
						DBMS_OUTPUT.PUT_LINE(i || ' es mmultiplo de 3');
					WHEN MOD (i, 5) = 0 THEN
						DBMS_OUTPUT.PUT_LINE(i || ' es mmultiplo de 5');
					ELSE	-- Este es nuestro default
						DBMS_OUTPUT.PUT_LINE(i || ' No es multiplo de 3 o 5');

				END CASE;

			END;

2. BUCLES

	DECLARE 
		i INTEGER := 0;
	BEGIN

-- Numeros del 1 al 10 
-- Son bucles infinitos, pero se deben partir con un break(EXIT)

		LOOP -- Asi se comienza y se terminan TODOS los bucles

			i := i+1;
			DBMS_OUTPUT.PUT_LINE(i);
			EXIT WHEN i = 10; -- este es el break

		END LOOP;

	END;

	2.1 WHILE -- Para este no necesitamos el exit puesto que la confición va arriba

		DECLARE 
			i INTEGER := 0;
		BEGIN
			DBMS_OUTPUT.PUT_LINE('WHILE');

			WHILE i < 10
			LOOP

				i := i+1;
				DBMS_OUTPUT.PUT_LINE(i);

			END LOOP;

		END;

	2.2 FOR

		BEGIN
			DBMS_OUTPUT.PUT_LINE('FOR');

			FOR i IN 1..10 -- Esto lo que representa son los números del 1 al 10
			LOOP
				DBMS_OUTPUT.PUT_LINE(i);
			END LOOP;

		END;

3. Procedimientos -- Son como las funciones void

	CREATE OR REPLACE PROCEDURE saluda
	AS 
	BEGIN
		DBMS_OUTPUT.PUT_LINE('HOLA');
	END;

-- Cuando se ejecute se crea el procedimiento y está disponible en la base de datos para usarlo
-- Para usar un procedimiento, es como una finción, hay que poner el nombre y los ()

	EXECUTE saluda();

	-- Hay que tener en cuenta que hay que ejecutarlo solo, es decir, tenemos que indicarle que pare de compilarlo

	CREATE OR REPLACE PROCEDURE saluda
	AS 
	BEGIN
		DBMS_OUTPUT.PUT_LINE('HOLA');
	END;

	/ 
-- ESTA BARRA INDICA QUE SE PARA DE COMPILAR EL PROCESO(FUNCION) Y COMIENZA LO SIGUIENTE

	EXECUTE saluda();

	3.1 Pasarle argumentos a los Procedimientos

-- A los argumentos no se le pone el tamaño al tipo de dato pq es algo que viene de fuera

		CREATE OR REPLACE PROCEDURE saluda(nombre VARCHAR)
		AS 
		BEGIN
			DBMS_OUTPUT.PUT_LINE('HOLA ' || nombre );
		END;
		/ 
		EXECUTE saluda('Lucas');

	3.2 Crear variables dentro del procedimiento

		CREATE OR REPLACE PROCEDURE saluda(nombre VARCHAR)
		IS 
-- Se cambia el as por is para declarar las variables 
			mensaje VARCHAR(255);
		BEGIN
			mensaje := 'HOLA ' || nombre ;
			DBMS_OUTPUT.PUT_LINE(mensaje);
		END;
		/ 
		EXECUTE saluda('Lucas Ruiz Zapata');

4. Funciones 
--Funcionan igual que los procedimientos pero la sintaxis y el uso son distintos

	CREATE OR REPLACE FUNCTION saludar(nombre VARCHAR)
	RETURN VARCHAR 
-- Las funciones te piden el tipo de dato a devolver y tampoco se le asigna tamaño
	IS 
		mensaje VARCHAR(255);
	BEGIN
		mensaje := 'HOLA ' || nombre ;
		RETURN mensaje;
	END saludar; 
-- Aqui se indica que acaba la función
	/ 
-- En vez de EXECUTE, se usa un SELECT a la tabla DUAL

	SELECT saludar('Lucas Ruiz Zapata') FROM DUAL;

-- Al ser un select se le pueden hacer las cosas propias de los select

	SELECT saludar('Lucas Ruiz Zapata') AS Saludo FROM DUAL;

	4.1 Sin parámetros ni variables

		CREATE OR REPLACE FUNCTION hola_mundo
		RETURN VARCHAR 
		AS 
-- Al no estar usando variables se le pone el AS
		BEGIN
			RETURN 'Hola mundo';
		END hola_mundo; 
		/ 

		SELECT hola_mundo() as saludo FROM DUAL;

	4.2 Ejecutar + de 1 función

		CREATE OR REPLACE FUNCTION hola_mundo
		RETURN VARCHAR 
		AS
		BEGIN
			RETURN 'Hola mundo';
		END hola_mundo; 
		/ 

		SELECT saludar('Lucas Ruiz') as saludo, hola_mundo FROM DUAL;

		4.2.1 Ejecutar + 1 funcion como PROCEDIMIENTO

			CREATE OR REPLACE PROCEDURE saludo_panas(nombre VARCHAR)
			IS
				mensaje VARCHAR(255);
			BEGIN

				mensaje := saludar(nombre);
-- Se declaran como en cualquier otro lenguaje de programación
				DBMS_OUTPUT.PUT_LINE(mensaje);

			END;
			/

			EXECUTE saludo_panas('Paco Sanz');

5. Consultas y cursores

-- Es recomendable hacer primero la consulta y luego el requerimiento

	SELECT COUNT(*) FROM customer;

-- Vamos a hacer una funcion con esta consulta 

	CREATE OR REPLACE FUNCTION customer_number
-- Al no pasarle ningún valor, no tenemos que ponerle los paréntesis
	RETURN INTEGER IS
		numero INTEGER;
	BEGIN
		
		SELECT COUNT(*) INTO numero
-- Al decirle into y el nombre de la variable lo que se le dice es que el valor del select lo estamos volcando en la variable
		FROM customer;
		
		RETURN numero;
		
	END customer_number;
	/

	SELECT customer_number FROM dual;

-- Recordar que con la tabla dual es con la que recibimos cosas

	5.1 CURSORES 

-- Vamos a hacer un procedimiento que devuelva una coleccion de valores y esto significa que no podremos usar la palabra clave INTO

		SELECT name FROM customer;

-- Un cursor es un tipo de dato que nos permite guardar las consultas

		CREATE OR REPLACE PROCEDURE list_customer_name
		IS
			CURSOR c IS 
				SELECT name
				FROM customer;
            
-- Dentro del cursor es donde se indica la consulta que queremos hacer

			name VARCHAR2(255);
    
-- La consulta la deberemos volcar en una variable para que esta se pueda mostrar

		BEGIN
			
			OPEN c;
				LOOP
					FETCH c INTO name;
					EXIT WHEN c%NOTFOUND;
-- Tenemos que indicar cuando nos salimos del loop, es decir, cuando el cursor no tenga datos

					DBMS_OUTPUT.PUT_LINE(name);
				END LOOP;
			CLOSE c;
-- Para recorrer la consulta debemos usar bucles y se tratarían como ficheros, de forma que tendriamos que abrirlos y cerrarlos
    
		END;
		/

		EXECUTE list_customer_name();

	5.2 CURSORES ACTUALIZADOS

-- Vamos a usar bucles FOR para crearlos, esto hace que la sintaxis sea más sencilla

		CREATE OR REPLACE PROCEDURE list_customer_name
		IS
			CURSOR c IS 
				SELECT name
				FROM customer;
				
		BEGIN
					
			FOR fila IN c
			LOOP 
				DBMS_OUTPUT.PUT_LINE(fila.name);
			END LOOP;
					
		END;
		/

		EXECUTE list_customer_name();