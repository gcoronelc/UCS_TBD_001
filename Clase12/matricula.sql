CREATE OR REPLACE PROCEDURE uspMatricula(
	pCurso matricula.cur_id%TYPE,
	pAlumno matricula.alu_id%TYPE,
	pCuotas matricula.mat_cuotas%TYPE,
	pPrecio matricula.mat_precio%TYPE
) AS
	vVacante      curso.cur_vacantes%type;
	vMatriculados curso.cur_matriculados%type;
	vPrecio       curso.cur_Precio%type;
	vCont         numeric;
	vMensaje      varchar2(2000);
BEGIN

	select count(*) into vCont
	from matricula 
	where cur_id = pCurso and alu_id = palumno;
	
	if( vCont > 0 ) then
		raise_application_error(-20000,'Ya esta matriculado');
	end if;

	select cur_vacantes, cur_matriculados, cur_precio
	into vVacante, vMatriculados, vPrecio
	from curso where cur_id = pCurso 
	for update;
	
	DBMS_LOCK.SLEEP(2);
	
	if( vVacante - vMatriculados <= 0 ) then
		raise_application_error(-20000,'Error no hay vacantes');
	end if;
	
	if( pPrecio > vPrecio OR pPrecio < 0.0 ) then
		raise_application_error(-20000,'Error en el precio');
	end if;

	vMatriculados := vMatriculados + 1;
	update curso 
	set cur_matriculados = vMatriculados
	where cur_id = pCurso;
	
	insert into matricula(cur_id,alu_id,mat_fecha,
	mat_precio,mat_cuotas) 
	values(pCurso,pAlumno,SYSDATE,pPrecio, pCuotas);
	
	commit;

EXCEPTION

	when others then
		vMensaje := sqlerrm;
		rollback;
		raise_application_error(-20000,vMensaje);	
	

END;
/