-- -----------------------------------
-- TALLER DE BASE DE DATOS
-- EVALUACIÓN:   PRACTICA 01
-- FECHA:        23-NOV-2017
-- ESTUDIANTE 1: ALEJANDRO VILLANUEVA MALAVER
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
Select 'Curso', cur_id, cur_nombre from curso
union
Select 'Alumno',alu_id, alu_nombre from alumno;



-- -----------------------------------
-- Pregunta 02
-- -----------------------------------

Select b.cur_nombre nombre_curso, count(*)matriculados, sum(b.Cur_precio) Comprometido, 
NVL(sum(p.pag_importe),0) Recaudado,
Sum(b.Cur_precio - NVL(p.pag_importe,0)) Pendiente
from Matricula a
inner join Curso b on
b.cur_id = a.cur_id 
Left join pago p on
p.cur_id = a.cur_id and
p.alu_id = a.alu_id
group by b.cur_nombre;




-- -----------------------------------
-- Pregunta 03
-- -----------------------------------
select b.alu_nombre, a.cur_nombre, Max(c.mat_nota) nota
from Matricula c
inner join curso a on 
a.cur_id = c.cur_id
inner join alumno b on
b.alu_id = c.alu_id
group by b.alu_nombre, a.cur_nombre
order by nota desc;





-- -----------------------------------
-- Pregunta 04
-- -----------------------------------
Select L.City, count(*)Empleados 
from Employees E 
inner join Departments D on
D.department_id = E.department_id
inner join Locations L on
L.Location_id = D.Location_id
group by L.City;

Select * from departments;



-- -----------------------------------
-- Pregunta 05
-- -----------------------------------

select J.Job_title Job, count(*) Emp
from Employees E
inner Join Jobs J on
J.Job_id = E.Job_id
group by J.Job_title
having count(*) > 2 ;



-- -----------------------------------
-- Pregunta 06
-- -----------------------------------
Select D.Department_name DPTO, count(*)EMP, sum(E.Salary)PLANILLA_SIN_COMISION, 
sum(E.Salary + NVL(E.Commission_pct,0)) PLANILLA_CON_COMISION 
from Employees E
inner Join Departments D on
D.Department_id = E.Department_id
group by D.Department_name;



