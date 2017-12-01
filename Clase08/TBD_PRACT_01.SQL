-- -----------------------------------
-- TALLER DE BASE DE DATOS
-- EVALUACIÃ“N:   PRACTICA 01
-- FECHA:        23-NOV-2017
-- ESTUDIANTE 1: GUSTAVO CORONEL
-- ESTUDIANTE 2: 
-- -----------------------------------


-- -----------------------------------
-- ENVIO DE LA SOLUCION
-- -----------------------------------
-- CORREO: egcc.ucs@gmail.com
-- FECHA:  23-NOV-2017
-- HORA:   Hasta las 9:30 pm
-- ASUNTO: UCS TBD Practica 01
-- -----------------------------------


-- -----------------------------------
-- Pregunta 01
-- -----------------------------------

SELECT 'CURSO' TIPO, CUR_ID CODIGO, CUR_NOMBRE NOMBRE FROM EDUCA.CURSO
UNION
SELECT 'ALUMNO', ALU_ID, ALU_NOMBRE FROM EDUCA.ALUMNO;


-- -----------------------------------
-- Pregunta 02
-- -----------------------------------

SELECT C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS, SUM(M.MAT_PRECIO) COMPROMETIDO
FROM EDUCA.CURSO C
JOIN EDUCA.MATRICULA M ON C.CUR_ID = M.CUR_ID
GROUP BY C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS;

3	Inteligencia de Negocios	1	950
2	SQL Server Administración	5	4250
1	SQL Server Implementación	3	3000


SELECT CUR_ID, SUM(PAG_IMPORTE) RECAUDADO
FROM EDUCA.PAGO
GROUP BY CUR_ID;


1	1800
2	3310


SELECT 
    C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS, 
    SUM(DISTINCT M.MAT_PRECIO) COMPROMETIDO,
    NVL(SUM(P.PAG_IMPORTE),0) RECAUDADO,
    SUM(DISTINCT M.MAT_PRECIO) - NVL(SUM(P.PAG_IMPORTE),0) PENDIENTE
FROM EDUCA.CURSO C
JOIN EDUCA.MATRICULA M ON C.CUR_ID = M.CUR_ID
LEFT JOIN EDUCA.PAGO P ON M.CUR_ID = P.CUR_ID AND M.ALU_ID = P.ALU_ID
GROUP BY C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS
ORDER BY 1;


WITH 
V1 AS (
    SELECT C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS, SUM(M.MAT_PRECIO) COMPROMETIDO
    FROM EDUCA.CURSO C
    JOIN EDUCA.MATRICULA M ON C.CUR_ID = M.CUR_ID
    GROUP BY C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS),
V2 AS (
    SELECT CUR_ID, SUM(PAG_IMPORTE) RECAUDADO
    FROM EDUCA.PAGO
    GROUP BY CUR_ID)
SELECT 
    V1.CUR_ID, V1.CUR_NOMBRE, V1.CUR_MATRICULADOS,
    V1.COMPROMETIDO, NVL(V2.RECAUDADO,0) RECAUDADO,
   V1.COMPROMETIDO -  NVL(V2.RECAUDADO,0) PENDIENTE
FROM V1 LEFT JOIN V2 ON V1.CUR_ID = V2.CUR_ID;


-- -----------------------------------
-- Pregunta 03
-- -----------------------------------

select a.ALU_NOMBRE, c.CUR_NOMBRE, m.mat_nota
from EDUCA.ALUMNO a
join EDUCA.MATRICULA m on a.ALU_ID = m.alu_id
join EDUCA.CURSO c on m.CUR_ID = c.CUR_ID;

select 
    cur_id, max(mat_nota) nota
from educa.matricula
group by cur_id;
    

-- Caso 1: Combinando las consultas
    
select a.ALU_NOMBRE, c.CUR_NOMBRE, m.mat_nota
from EDUCA.ALUMNO a
join EDUCA.MATRICULA m on a.ALU_ID = m.alu_id
join EDUCA.CURSO c on m.CUR_ID = c.CUR_ID
join (    
    select 
        cur_id, max(mat_nota) nota
    from educa.matricula
    group by cur_id ) t on m.CUR_ID = t.cur_id and m.MAT_NOTA = t.nota;
    
    
select * from educa.matricula where cur_id = 1;

update EDUCA.MATRICULA
set mat_nota = 18
where cur_id = 1 and alu_id = 4;

commit;


-- Caso 2: Usandola como subb-consulta

select a.ALU_NOMBRE, c.CUR_NOMBRE, m.mat_nota
from EDUCA.ALUMNO a
join EDUCA.MATRICULA m on a.ALU_ID = m.alu_id
join EDUCA.CURSO c on m.CUR_ID = c.CUR_ID
where (m.cur_id,m.mat_nota) in (
            select 
                cur_id, max(mat_nota) nota
            from educa.matricula
            group by cur_id);

-- Caso 3: Usando With

WITH 
V1 AS (
  select cur_id, max(mat_nota) nota
  from educa.matricula
  group by cur_id
),
V2 AS (
  select cur_id, alu_id, mat_nota
  from EDUCA.MATRICULA
  where (cur_id,mat_nota) in (select cur_id, nota from V1)
)
select a.ALU_NOMBRE, c.CUR_NOMBRE, m.mat_nota
from EDUCA.ALUMNO a
join EDUCA.V2 m on a.ALU_ID = m.alu_id
join EDUCA.CURSO c on m.CUR_ID = c.CUR_ID;



-- -----------------------------------
-- Pregunta 04
-- -----------------------------------

select L.CITY, COUNT(1) EMPS
from HR.LOCATIONS L
join HR.DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
join HR.EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY L.CITY;

select count(*) from HR.EMPLOYEES
where department_id is not null;

-- Respuesta: 106
-- Verificada: SI

-- -----------------------------------
-- Pregunta 05
-- -----------------------------------

-- Respuesta: 107
-- Verificada: SI

select J.JOB_TITLE, COUNT(1) EMPS
from HR.JOBS J
join HR.EMPLOYEES E ON J.JOB_ID = E.JOB_ID
GROUP BY J.JOB_TITLE;

select count(*) from HR.EMPLOYEES
where JOB_ID is  null;



-- -----------------------------------
-- Pregunta 06
-- -----------------------------------

SELECT 
  DEPARTMENT_ID,
  count(1) emps,
  sum(salary) planilla_sin_comision,
  sum(salary + salary * nvl(commission_pct,0) ) planilla_con_comision
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;




