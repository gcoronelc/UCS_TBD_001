esquema scott
1-verificar esquema 
connect as sysdba
SQL> select username from all_users
2 where username like "$%";

USERNAME
SYS
SYSTEM
SI_INFORMTN_SCHEMA


esquema hr
1- verificar si existe el usuario
connect /  as sysdba

select username from all_users
where username like "$%"