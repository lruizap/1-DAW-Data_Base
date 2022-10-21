select * from floor;
select * from room;
SELECT * FROM CLIENT;

INSERT INTO FLOOR VALUES(0, 'Reception');
INSERT INTO FLOOR VALUES(1, '1st floor');
INSERT INTO FLOOR VALUES(2, '2nd floor');
INSERT INTO FLOOR VALUES(3, '3rd floor');

INSERT INTO ROOM VALUES(1, 1, 2, 8);
INSERT INTO ROOM VALUES(1, 2, 4, 12);
INSERT INTO ROOM VALUES(1, 3, 3, 12);
INSERT INTO ROOM VALUES(2, 1, 2, 8);
INSERT INTO ROOM VALUES(2, 2, 1, 8);
INSERT INTO ROOM VALUES(2, 3, 4, 12);
INSERT INTO ROOM VALUES(3, 1, 1, 8);
INSERT INTO ROOM VALUES(3, 2, 4, 12);

insert into Client values (1, 'LUCAS', TO_DATE('25-02-2002', 'dd-mm-yyyy'));
insert into Client values (2, 'PACO', TO_DATE('12-06-1990', 'dd-mm-yyyy'));
insert into Client values (3, 'JOSÉ', TO_DATE('03-11-1999', 'dd-mm-yyyy'));
insert into Client values (4, 'DANI', TO_DATE('10-10-1996', 'dd-mm-yyyy'));
insert into Client values (5, 'ANTONIO', TO_DATE('11-05-2000', 'dd-mm-yyyy'));
insert into Client values (6, 'JAVI', TO_DATE('27-09-2002', 'dd-mm-yyyy'));
insert into Client values (7, 'ÁLVARO', TO_DATE('30-01-1997', 'dd-mm-yyyy'));

INSERT INTO OCCUPIED VALUES(1, 1, 1,1, TO_DATE('25-02-2022', 'dd-mm-yyyy'), TO_DATE('28-02-2022', 'dd-mm-yyyy'), 100);
INSERT INTO OCCUPIED VALUES(2, 1, 2,2, TO_DATE('30-03-2022', 'dd-mm-yyyy'), TO_DATE('04-04-2022', 'dd-mm-yyyy'), 650);
INSERT INTO OCCUPIED VALUES(3, 2, 2,3, TO_DATE('13-02-2022', 'dd-mm-yyyy'), TO_DATE('16-02-2022', 'dd-mm-yyyy'), 400);
INSERT INTO OCCUPIED VALUES(4, 3, 1,4, TO_DATE('12-03-2022', 'dd-mm-yyyy'), TO_DATE('14-03-2022', 'dd-mm-yyyy'), 90);
INSERT INTO OCCUPIED VALUES(5, 1, 1,5, TO_DATE('25-04-2022', 'dd-mm-yyyy'), TO_DATE('26-04-2022', 'dd-mm-yyyy'), 33);
INSERT INTO OCCUPIED VALUES(6, 3, 2,6, TO_DATE('06-05-2022', 'dd-mm-yyyy'), TO_DATE('07-05-2022', 'dd-mm-yyyy'), 50);
INSERT INTO OCCUPIED VALUES(7, 2, 3,7, TO_DATE('12-06-2022', 'dd-mm-yyyy'), TO_DATE('15-06-2022', 'dd-mm-yyyy'), 130);

SELECT * FROM ROOM;
SELECT * FROM CLIENT;
SELECT * FROM FLOOR; 
SELECT * FROM OCCUPIED;

select * from occupied where euros > 100;

select * from client WHERE dateofbirth BETWEEN TO_DATE('01-01-1999', 'dd-mm-yyyy') AND TO_DATE('31-12-2002', 'dd-mm-yyyy');

SELECT client.name, occupied.client_idclient FROM client INNER JOIN occupied ON client.idclient=occupied.client_idclient ORDER BY client.name;

select idroom, floor_idfloor from room where beds < 2;

select occupied.arrivaldate, occupied.departuredate from occupied where room_floor_idfloor = 1;

select client.idclient, floor.idfloor from client inner join floor in 

select client.name, occupied.idreserve from client inner join occupied on client.idclient=occupied.client_idclient WHERE dateofbirth BETWEEN TO_DATE('01-01-2000', 'dd-mm-yyyy') AND TO_DATE('31-12-2000', 'dd-mm-yyyy');

select floor.name, occupied.idreserve from occupied right join floor on floor.idfloor > 0 order by floor.idfloor;

select sum(SQUAREMETERS) from room where room.floor_idfloor = 1;

select sum(euros) from occupied inner join floor on floor.idfloor > 1;