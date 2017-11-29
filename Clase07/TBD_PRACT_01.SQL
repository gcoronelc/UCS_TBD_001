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




-- -----------------------------------
-- Pregunta 04
-- -----------------------------------



-- -----------------------------------
-- Pregunta 05
-- -----------------------------------




-- -----------------------------------
-- Pregunta 06
-- -----------------------------------




