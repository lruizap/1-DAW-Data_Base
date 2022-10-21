CREATE TABLE province (
    id int NOT NULL PRIMARY KEY,
    province varchar2(25) NOT NULL
);

create table town
(
    id integer not NULL,
    idprovince integer,
    town varchar2(50) NOT NULL,
    FOREIGN KEY (idprovince) REFERENCES province(id)
);

INSERT INTO province VALUES (1,'ÁLAVA');
INSERT INTO province VALUES (2,'ALBACETE');
INSERT INTO province VALUES (3,'ALICANTE');
INSERT INTO province VALUES (4,'ALMERÍA');
INSERT INTO province VALUES (5,'ÁVILA');
INSERT INTO province VALUES (6,'BADAJOZ');
INSERT INTO province VALUES (7,'BALEARES');
INSERT INTO province VALUES (8,'BARCELONA');
INSERT INTO province VALUES (9,'BURGOS');
INSERT INTO province VALUES (10,'CÁCERES');
INSERT INTO province VALUES (11,'CÁDIZ');

alter table town add population integer;

-- 3

UPDATE town SET population = 1000;

UPDATE town SET population = 117000 WHERE town = 'CÁDIZ';
UPDATE town SET population = 197000 WHERE town = 'ALMERÍA';
UPDATE town SET population = 16600 WHERE town = 'UBRIQUE';
UPDATE town SET population = 1602000 WHERE town = 'BARCELONA';

-- 4

SELECT * FROM town  WHERE town LIKE 'Z%';

-- 5

SELECT * FROM town order by town ASC fetch first rows only;

-- 6

SELECT town,province FROM town,province WHERE town LIKE '%Jerez%';

-- 7

SELECT province,id FROM province WHERE id = (SELECT idprovince FROM town WHERE town = 'Donjimeno');

-- 8

SELECT town FROM town WHERE population = (SELECT MAX(population) FROM town);

-- 9

SELECT COUNT(town) FROM town WHERE idprovince = (SELECT id FROM province WHERE province = 'CÁDIZ');

-- 10



-- 11

SELECT SUM(population) FROM town WHERE town = 'Cáceres' OR town = 'Badajoz';
