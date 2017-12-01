Desarrollar una consulta que muestre
la siguiente información con relación 
a los empleados del esquema HR:

CITY        CANT-EMP   PORC-DEL-TOTAL
------------------------------------------
Aaaaaaa       40          40
Bbbbbbb       25          25
Ccccccc       35          25


WITH 
V_TOTAL AS (
  SELECT COUNT(1) TOTAL
  FROM HR.EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT NULL
),
V_RESUMEN AS (
  SELECT L.CITY, COUNT(1) EMPS
  FROM HR.LOCATIONS L
  JOIN HR.DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
  JOIN HR.EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
  WHERE D.DEPARTMENT_ID IS NOT NULL
  GROUP BY L.CITY
)
SELECT R.CITY, R.EMPS, T.TOTAL
FROM V_TOTAL T
CROSS JOIN V_RESUMEN R 







