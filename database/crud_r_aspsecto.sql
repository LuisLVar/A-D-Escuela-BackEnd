# CRUD de la tabla CALIFICACION ASPECTO

# PROCEDURE insertar_calificacion_aspecto
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_calificacion_aspecto (
    p_ab_ib_inscripcion_seccion INTEGER,
    p_ab_ib_inscripcion_alumno INTEGER,
    p_ab_ib_bloque INTEGER,
    p_ab_aspecto INTEGER,
    p_ab_color INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF(  SELECT ab_aspecto 
		  FROM aspecto_bloque
		   WHERE p_ab_ib_inscripcion_seccion = ab_ib_inscripcion_seccion
			AND p_ab_ib_inscripcion_alumno = ab_ib_inscripcion_alumno
			AND p_ab_ib_bloque = ab_ib_bloque
			AND p_ab_aspecto = ab_aspecto
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
    SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL THEN
   INSERT INTO aspecto_bloque ( 
    ab_ib_inscripcion_seccion,
    ab_ib_inscripcion_alumno,
    ab_ib_bloque,
    ab_aspecto,
    ab_color
   ) 
   VALUES (
    p_ab_ib_inscripcion_seccion,
    p_ab_ib_inscripcion_alumno,
    p_ab_ib_bloque,
    p_ab_aspecto,
    p_ab_color
   );
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE obtener_calificacion_aspecto
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_calificacion_aspecto ( 
    p_ab_ib_inscripcion_seccion INTEGER,
    p_ab_ib_inscripcion_alumno INTEGER,
    p_ab_ib_bloque INTEGER,
    p_ab_aspecto INTEGER
)
BEGIN
 IF (SELECT ab_aspecto 
        FROM aspecto_bloque
        WHERE p_ab_ib_inscripcion_seccion = ab_ib_inscripcion_seccion
        AND p_ab_ib_inscripcion_alumno = ab_ib_inscripcion_alumno
        AND p_ab_ib_bloque = ab_ib_bloque
        AND p_ab_aspecto = ab_aspecto
 ) IS NOT NULL THEN
  SELECT * FROM aspecto_bloque
    WHERE p_ab_ib_inscripcion_seccion = ab_ib_inscripcion_seccion
    AND p_ab_ib_inscripcion_alumno = ab_ib_inscripcion_alumno
    AND p_ab_ib_bloque = ab_ib_bloque
    AND p_ab_aspecto = ab_aspecto;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_calificacion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_calificacion_aspecto ( 
    p_ab_ib_inscripcion_seccion INTEGER,
    p_ab_ib_inscripcion_alumno INTEGER,
    p_ab_ib_bloque INTEGER,
    p_ab_aspecto INTEGER,
    p_ab_color INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF ( SELECT ab_aspecto 
        FROM aspecto_bloque
        WHERE p_ab_ib_inscripcion_seccion = ab_ib_inscripcion_seccion
        AND p_ab_ib_inscripcion_alumno = ab_ib_inscripcion_alumno
        AND p_bs_ib_bloque = ab_ib_bloque
        AND p_ab_aspecto = ab_aspecto
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL THEN
   UPDATE aspecto_bloque
    SET 
        ab_color = p_ab_color
     WHERE p_ab_ib_inscripcion_seccion = ab_ib_inscripcion_seccion
        AND p_ab_ib_inscripcion_alumno = ab_ib_inscripcion_alumno
        AND p_ab_ib_bloque = ab_ib_bloque
        AND p_ab_aspecto = ab_aspecto;
     
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$