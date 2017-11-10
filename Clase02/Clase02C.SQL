SELECT BASICO
==============================


SQL> conn recursos/admin
Connected.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
CARGO                          TABLE
CONTROL                        TABLE
DEPARTAMENTO                   TABLE
EMPLEADO                       TABLE
UBICACION                      TABLE

SQL> select * from cargo;

IDC NOMBRE               SUELDO_MIN SUELDO_MAX
--- -------------------- ---------- ----------
C01 Gerente General           15000      50000
C02 Gerente                   10000      15000
C03 Empleado                   7000      10000
C04 Analista                   5000       7000


SQL> select idcargo, sueldo_max from cargo;

IDC SUELDO_MAX
--- ----------
C01      50000
C02      15000
C03      10000
C04       7000



SQL> select idcargo codigo, sueldo_max maximo from cargo;

COD     MAXIMO
--- ----------
C01      50000
C02      15000
C03      10000
C04       7000


SQL> column codigo format a10

SQL> select idcargo codigo, sueldo_max maximo from cargo;

CODIGO         MAXIMO
---------- ----------
C01             50000
C02             15000
C03             10000
C04              7000
C05              5000
C06              3000




¿Que departamentos tienen empleados?


SQL> select distinct iddepartamento from empleado;

IDDEPARTAMENTO
--------------
           100
           102
           101
           105
           103


SQL> select nombre, iddepartamento
  2  from empleado
  3  where NOT(iddepartamento >= 30);

NOMBRE               IDDEPARTAMENTO
-------------------- --------------
Gustavo                         100
Claudia                         100
Sergio                          102
Mariela                         102
Roberto                         102


select nombre, count(*) cant
from empleado 
group by nombre;


select apellido, count(*) cant
from empleado 
group by apellido;



select idcargo, count(*) cant
from empleado 
group by idcargo;




select * from empleado
where idcargo = 'C01'  and  sueldo < 4000;



