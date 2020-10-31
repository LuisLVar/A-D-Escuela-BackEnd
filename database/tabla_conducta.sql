use control_notas;

# PROCEDURE insertar_calificacion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE tab_ind_cond_con_notas (
    p_seccion INTEGER,
    p_alumno INTEGER,
    p_bloque INTEGER
)
BEGIN
select 
	alumno.nombre as 'nombre', 
	alumno.apellido as "apellido", 
    seccion.nombre  as 'seccion',
	bloque.nombre as 'bloque', 
	aspecto.nombre as 'aspecto',
    color.nombre as 'color'
from aspecto_bloque 
	INNER JOIN inscripcion_bloque 
		ON ab_ib_inscripcion_seccion = ib_inscripcion_seccion
		AND ab_ib_inscripcion_alumno = ib_inscripcion_alumno
		AND ab_ib_bloque = ib_bloque
	INNER JOIN inscripcion 
		ON inscripcion_seccion = ab_ib_inscripcion_seccion
		AND inscripcion_alumno = ab_ib_inscripcion_alumno
	INNER JOIN alumno 
		ON inscripcion_alumno = alumno
	INNER JOIN aspecto 
		ON ab_aspecto = aspecto
	INNER JOIN seccion
		ON inscripcion_seccion = seccion
	INNER JOIN bloque
		ON ib_bloque = bloque
	INNER JOIN color
		ON ab_color = color
	WHERE ab_ib_inscripcion_seccion = p_seccion
		AND ab_ib_inscripcion_alumno = p_alumno
		AND ab_ib_bloque = p_bloque;
END;
$$

# PROCEDURE insertar_calificacion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE tab_ind_cond_sin_notas (
    p_seccion INTEGER,
    p_alumno INTEGER,
    p_bloque INTEGER
)
BEGIN
SELECT DISTINCT 
	alumno.nombre as 'nombre', 
	alumno.apellido as "apellido", 
    seccion.nombre  as 'seccion',
	bloque.nombre as 'bloque', 
	aspecto.nombre as 'aspecto'
from aspecto_bloque 
	INNER JOIN inscripcion_bloque 
		ON ab_ib_inscripcion_seccion = ib_inscripcion_seccion
		AND ab_ib_inscripcion_alumno = ib_inscripcion_alumno
		AND ab_ib_bloque = ib_bloque
	INNER JOIN inscripcion 
		ON inscripcion_seccion = ab_ib_inscripcion_seccion
		AND inscripcion_alumno = ab_ib_inscripcion_alumno
	INNER JOIN alumno 
		ON inscripcion_alumno = alumno
	INNER JOIN aspecto 
		ON ab_aspecto = aspecto
	INNER JOIN seccion
		ON inscripcion_seccion = seccion
	INNER JOIN bloque
		ON ib_bloque = bloque
	WHERE ab_ib_inscripcion_seccion = p_seccion
		AND ab_ib_inscripcion_alumno = p_alumno
		AND ab_ib_bloque = p_bloque;
END;
$$
