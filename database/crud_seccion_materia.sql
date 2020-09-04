# CRUD de la tabla SECCION_MATERIA

# PROCEDURE insertar_seccion_materia
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_seccion_materia ( 
 p_seccion_materia_materia INTEGER,
 p_seccion_materia_seccion INTEGER
)
BEGIN
 DECLARE existe_materia INT DEFAULT 0;
 DECLARE existe_seccion INT DEFAULT 0;
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT materia FROM materia WHERE materia = p_seccion_materia_materia ) IS NULL THEN
  SET existe_materia = 0;
 ELSE 
  SET existe_materia = 1;
 END IF;
 
 IF( SELECT seccion FROM seccion WHERE seccion = p_seccion_materia_seccion ) IS NULL THEN
  SET existe_seccion = 0;
 ELSE 
  SET existe_seccion = 1;
 END IF;

 IF( SELECT seccion_materia_materia FROM seccion_materia WHERE seccion_materia_materia = p_seccion_materia_materia AND p_seccion_materia_seccion = seccion_materia_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF existe_materia AND existe_seccion THEN
   INSERT INTO  seccion_materia (seccion_materia_materia, seccion_materia_seccion) 
    VALUES (p_seccion_materia_materia, p_seccion_materia_seccion);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 400;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE borrar_seccion_materia
USE control_notas;
DELIMITER $$
CREATE PROCEDURE borrar_seccion_materia ( 
 p_seccion_materia_materia INTEGER,
 p_seccion_materia_seccion INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT seccion_materia_materia FROM seccion_materia WHERE seccion_materia_materia = p_seccion_materia_materia AND p_seccion_materia_seccion = seccion_materia_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  DELETE FROM seccion_materia
   WHERE p_seccion_materia_materia = seccion_materia_materia
    AND p_seccion_materia_seccion =  seccion_materia_seccion;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
 
END;
$$

# PROCEDURE borrar_seccion_materia
USE control_notas;
DELIMITER $$
CREATE PROCEDURE obtener_seccion_materia ( 
 p_seccion_materia_materia INTEGER,
 p_seccion_materia_seccion INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 
 IF( SELECT seccion_materia_materia FROM seccion_materia WHERE seccion_materia_materia = p_seccion_materia_materia AND p_seccion_materia_seccion = seccion_materia_seccion) IS NULL THEN
   SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM seccion_materia
   WHERE p_seccion_materia_materia = seccion_materia_materia
    AND p_seccion_materia_seccion =  seccion_materia_seccion;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
 
END;
$$