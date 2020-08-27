# CRUD de la tabla MATERIA

# PROCEDURE insertar_materia
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_materia ( p_nombre VARCHAR(70), p_contenido VARCHAR(70) )
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF( SELECT nombre 
      FROM materia 
	   WHERE LOWER(p_nombre) LIKE LOWER(nombre) 
	    AND LOWER(p_contenido) LIKE LOWER(contenido) 
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
    SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL THEN
   INSERT INTO  materia (nombre, contenido) VALUES ( p_nombre, p_contenido);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE obtener_materia
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_materia ( p_materia INT )
BEGIN
 IF (SELECT materia FROM materia WHERE p_materia = materia) IS NOT NULL THEN
  SELECT * FROM materia WHERE p_materia = materia;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_materia
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_materia ( p_materia VARCHAR(70), p_nombre VARCHAR(70), p_contenido  VARCHAR(70) )
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF (SELECT nombre FROM materia WHERE materia = p_materia) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL THEN
   UPDATE materia
    SET 
     nombre= p_nombre,
     contenido = p_contenido
      WHERE p_materia = materia;
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$

# PROCEDURE eliminar_materia
USE control_notas
DELIMITER $$
CREATE PROCEDURE eliminar_materia ( p_materia INT )
BEGIN
 IF (SELECT materia FROM materia WHERE p_materia = materia) IS NOT NULL THEN
  DELETE FROM materia 
  WHERE p_materia = materia;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
END;
$$