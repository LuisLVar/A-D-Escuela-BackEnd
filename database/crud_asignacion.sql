# CRUD de la tabla CALIFICACION

# PROCEDURE insertar_calificacion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE registrar_calificacion (
    p_as_ib_inscripcion_seccion INTEGER,
    p_as_ib_inscripcion_alumno INTEGER,
    p_as_ib_bloque INTEGER,
    p_as_materia INTEGER,
	p_zona FLOAT,
    p_proyecto FLOAT,
    p_nota_final FLOAT,
    p_promedio FLOAT
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF(  SELECT as_materia 
		  FROM asignacion
		   WHERE p_as_ib_inscripcion_seccion = as_ib_inscripcion_seccion
			AND p_as_ib_inscripcion_alumno = as_ib_inscripcion_alumno
			AND p_as_ib_bloque = as_ib_bloque
			AND p_as_materia = as_materia
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
    SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL THEN
   INSERT INTO  asignacion ( 
    p_as_ib_inscripcion_seccion,
    p_as_ib_inscripcion_alumno,
    p_as_ib_bloque,
    p_as_materia,
    p_zona,
    p_proyecto,
    p_nota_final,
    p_promedio
   ) 
   VALUES (
	  p_as_ib_inscripcion_seccion,
      p_as_ib_inscripcion_alumno,
      p_as_ib_bloque,
      p_as_materia,
	  p_zona,
      p_proyecto,
      p_nota_final,
      p_promedio
   );
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE obtener_calificacion
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_calificacion ( 
    p_as_ib_inscripcion_seccion INTEGER,
    p_as_ib_inscripcion_alumno INTEGER,
    p_as_ib_bloque INTEGER,
    p_as_materia INTEGER
)
BEGIN
 IF (SELECT as_materia 
		  FROM asignacion
		   WHERE p_as_ib_inscripcion_seccion = as_ib_inscripcion_seccion
			AND p_as_ib_inscripcion_alumno = as_ib_inscripcion_alumno
			AND p_as_ib_bloque = as_ib_bloque
			AND p_as_materia = as_materia
 ) IS NOT NULL THEN
  SELECT * FROM asignacion
	WHERE p_as_ib_inscripcion_seccion = as_ib_inscripcion_seccion
		AND p_as_ib_inscripcion_alumno = as_ib_inscripcion_alumno
		AND p_as_ib_bloque = as_ib_bloque
		AND p_as_materia = as_materia;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_calificacion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_calificacion ( 
    p_as_ib_inscripcion_seccion INTEGER,
    p_as_ib_inscripcion_alumno INTEGER,
    p_as_ib_bloque INTEGER,
    p_as_materia INTEGER,
	p_zona FLOAT,
    p_proyecto FLOAT,
    p_nota_final FLOAT,
    p_promedio FLOAT
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF ( SELECT as_materia 
		  FROM asignacion
		   WHERE p_as_ib_inscripcion_seccion = as_ib_inscripcion_seccion
			AND p_as_ib_inscripcion_alumno = as_ib_inscripcion_alumno
			AND p_as_ib_bloque = as_ib_bloque
			AND p_as_materia = as_materia
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL THEN
   UPDATE color
    SET 
	 zona = p_zona,
	 proyecto = p_proyecto,
	 nota_final = p_nota_final,
	 promedio = p_promedio
	WHERE p_as_ib_inscripcion_seccion = p_as_ib_inscripcion_seccion
     AND p_as_ib_inscripcion_alumno = p_as_ib_inscripcion_alumno
     AND p_as_ib_bloque = p_as_ib_bloque
     AND p_as_materia = p_as_materia;
     
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$