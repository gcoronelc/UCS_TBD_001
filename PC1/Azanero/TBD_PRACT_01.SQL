-- -----------------------------------
-- TALLER DE BASE DE DATOS
-- EVALUACIÃ“N:   PRACTICA 01
-- FECHA:        23-NOV-2017
-- ESTUDIANTE 1:  CESAR ASON AZAÑERO FERNANDEZ
-- ESTUDIANTE 2:  MANUEL DUEÑAS GUERRA
-- -----------------------------------


-- -----------------------------------
-- ENVIO DE LA SOLUCION
-- -----------------------------------
-- CORREO: egcc.ucs@gmail.com
-- FECHA:  23-NOV-2017
-- HORA:   Hasta las 9:30 pm
-- ASUNTO: UCS TBD Practica 01
-- -----------------------------------


--- PRACTICA CON ESQUEMA EDUCA
-- -----------------------------------
--- Pregunta 1
-- -----------------------------------
select c.cur_id as Codigo,c.CUR_NOMBRE as Curso,a.alu_id as Codigo, a.alu_nombre as Alumno  from matricula m
inner join curso c on m.CUR_ID = c.CUR_ID
inner join alumno a on m.alu_id = a.ALU_ID;

-- -----------------------------------
-- Pregunta 02
-- -----------------------------------
select c.CUR_NOMBRE, c.CUR_MATRICULADOS, m.MAT_PRECIO,p.PAG_IMPORTE, p.pag_importe from curso c
inner join matricula m on c.CUR_ID = m.CUR_ID
inner join pago p on p.CUR_ID = m.cur_id;


-- -----------------------------------
-- Pregunta 03
-- -----------------------------------
select a.alu_nombre as Alumno, c.CUR_NOMBRE as Curso, m.MAT_NOTA as Nota  from matricula m
inner join curso c on m.CUR_ID = c.CUR_ID
inner join alumno a on m.alu_id = a.ALU_ID
where m.MAT_NOTA >= '18';



--- PRACTICA CON ESQUEMA HR

-- -----------------------------------
--- Pregunta 1
-- -----------------------------------
select l.city, count(d.DEPARTMENT_ID) as Empledos from locations l 
inner join departments d on l.location_id = d.location_id
inner join EMPLOYEES e on d.DEPARTMENT_ID = e.DEPARTMENT_ID group by l.city;

-- -----------------------------------
--- Pregunta 2
-- -----------------------------------
select job_id ,count(job_id) from EMPLOYEES group by job_id HAVING COUNT(job_id) > 2;

-- -----------------------------------
---- Pregunta 3
-- -----------------------------------
select department_id, first_name, salary as Sin_Comision, salary * (1 + nvl(COMMISSION_PCT, 0)) as Con_Comision 
from EMPLOYEES;




