-- -----------------------------------
-- TALLER DE BASE DE DATOS
-- EVALUACIÓN:   PRACTICA 02
-- FECHA:        07-DIC-2017
-- ESTUDIANTE 1: GUSTAVO CORONEL
-- ESTUDIANTE 2: 
-- -----------------------------------


-- -----------------------------------
-- ENVIO DE LA SOLUCION
-- -----------------------------------
-- CORREO: egcc.ucs@gmail.com
-- FECHA:  07-DIC-2017
-- HORA:   Hasta las 9:30 pm
-- ASUNTO: UCS TBD Practica 01
-- -----------------------------------

CREATE OR REPLACE FUNCTION fnSalarioPromedio(iddepartamento number)
return number
is
result number;
begin
select avg(sueldo + comision) into result from EMPLEADO where iddepartamento = iddepartamento;
return (result);
end;


-- -----------------------------------
-- Pregunta 01
-- -----------------------------------

SELECT IDDEPARTAMENTO, round(AVG(fnSalarioPromedios(sueldo)),2) as PROMEDIO FROM EMPLEADO GROUP BY IDDEPARTAMENTO;

-- -----------------------------------
-- Pregunta 02
-- -----------------------------------



-- -----------------------------------
-- Pregunta 03
-- -----------------------------------


