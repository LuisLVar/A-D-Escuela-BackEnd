# CRUD de la tabla INSCRIPCION

# PROCEDURE insertar_inscripcion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_inscripcion ( 
 p_inscripcion_seccion INTEGER,
 p_inscripcion_alumno INTEGER
)
BEGIN
 DECLARE existe_seccion INT DEFAULT 0;
 DECLARE existe_alumno INT DEFAULT 0;
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT seccion FROM seccion WHERE seccion = p_inscripcion_seccion ) IS NULL THEN
  SET existe_seccion = 0;
 ELSE 
  SET existe_seccion = 1;
 END IF;
 
 IF( SELECT alumno FROM alumno WHERE alumno = p_inscripcion_alumno ) IS NULL THEN
  SET existe_alumno = 0;
 ELSE 
  SET existe_alumno = 1;
 END IF;

 IF( SELECT inscripcion FROM inscripcion WHERE inscripcion_alumno = p_inscripcion_alumno AND inscripcion_seccion = p_inscripcion_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF existe_alumno AND existe_seccion THEN
   INSERT INTO  inscripcion (inscripcion_seccion, inscripcion_alumno) 
    VALUES (p_inscripcion_seccion, p_inscripcion_alumno);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 400;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE borrar_inscripcion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE borrar_inscripcion ( 
 p_inscripcion_seccion INTEGER,
 p_inscripcion_alumno INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT inscripcion FROM inscripcion WHERE inscripcion_alumno = p_inscripcion_alumno AND inscripcion_seccion = p_inscripcion_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  DELETE FROM inscripcion
   WHERE p_inscripcion_seccion = inscripcion_seccion
    AND p_inscripcion_alumno =  inscripcion_alumno;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
 
END;
$$

# PROCEDURE obtener_inscripcion
USE control_notas;
DELIMITER $$
CREATE PROCEDURE obtener_inscripcion ( 
 p_inscripcion_seccion INTEGER,
 p_inscripcion_alumno INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT inscripcion FROM inscripcion WHERE inscripcion_alumno = p_inscripcion_alumno AND inscripcion_seccion = p_inscripcion_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM inscripcion
   WHERE p_inscripcion_seccion = inscripcion_seccion
    AND p_inscripcion_alumno =  inscripcion_alumno;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
 
END;
$$