CREACION DEL ESQUEMA DEMO
============================

1.- Crear el usuario

create user demo 
identified by demo;

2.- Asignar permisos y recursos

grant resource to demo;

grant connect to demo;

3.- Conectar como usuario demo

connect demo/demo

show user

4.- Crear una tabla

create table mensaje(
de varchar2(20),
para varchar2(20),
msg varchar2(200)
);

SQL> desc mensaje;
 Name        Null?    Type
 ----------- -------- ----------------
 DE                   VARCHAR2(20)
 PARA                 VARCHAR2(20)
 MSG                  VARCHAR2(200)

insert into mensaje
values('gustavo','aula','Como van con Oracle?');

SQL> set linesize 600

SQL> select * from mensaje;

DE           PARA       MSG
------------ ---------- ---------------------------
gustavo      aula       Como van con Oracle?


4.- Conexión remota







