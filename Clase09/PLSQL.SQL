-- Bloque anonimo

declare
  sFecha varchar2(40);
begin
  select to_char(sysdate,'dd/mm/yyyy hh24:mm:ss')
    into sFecha from dual;
  dbms_output.put_line('Hoy es: ' || sFecha);	
end;


-- Funcion

create or replace function fnSuma
( num1 number, num2 number ) return number
is
  suma number;
begin
  suma := num1 + num2;
  return suma;
end;


select fnSuma( 13, 16 ) suma  from dual;



create or replace function fnPrecio
( idCurso number ) return number
is
  precio number;
begin
  select cur_precio into precio from curso 
  where cur_id = idCurso;
  return precio;
end;


select fnPrecio( 4 ) precio  from dual;


-- Procedimiento

create or replace procedure prSuma
( num1 number, num2 number )
is
  suma number;
begin
  suma := num1 + num2;
  dbms_output.put_line(' Suma: ' || suma );
end;


-- llamada

begin
	prSuma(13,15);
end;
