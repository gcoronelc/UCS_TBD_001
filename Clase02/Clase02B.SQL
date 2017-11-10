ESQUEMA SCOTT
=================================

1.- Verificar esquema

connect / as sysdba

select username from all_users
where username like 'S%';



SQL> select username from all_users
  2  where username like 'S%';

USERNAME
------------------------------
SYS
SYSTEM
SI_INFORMTN_SCHEMA
SPATIAL_WFS_ADMIN_USR
SPATIAL_CSW_ADMIN_USR
SYSMAN
SCOTT

7 rows selected.


2.- Modificar cuenta

alter user scott
identified by tiger
account unlock;


SQL> connect scott/tiger
Connected.
SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE
