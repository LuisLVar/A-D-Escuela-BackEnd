# CRUD de la tabla COLORES

# PROCEDURE insertar_color
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_color ( p_nombre VARCHAR(70), p_significado VARCHAR(70) )
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF( SELECT nombre 
      FROM color 
	   WHERE LOWER(p_nombre) LIKE LOWER(nombre) 
	    AND LOWER(p_significado) LIKE LOWER(significado) 
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
    SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL THEN
   INSERT INTO  color (nombre, significado) VALUES ( p_nombre, p_significado);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE obtener_color
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_color ( p_color INT )
BEGIN
 IF (SELECT color FROM color WHERE p_color = color) IS NOT NULL THEN
  SELECT * FROM color WHERE p_color = color;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_color
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_color ( p_color VARCHAR(70), p_nombre VARCHAR(70), p_significado  VARCHAR(70) )
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF (SELECT nombre FROM color WHERE color = p_color) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL THEN
   UPDATE color
    SET 
     nombre= p_nombre,
     significado = p_significado
      WHERE p_color = color;
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$

# PROCEDURE eliminar_color
USE control_notas
DELIMITER $$
CREATE PROCEDURE eliminar_color ( p_color INT )
BEGIN
 IF (SELECT color FROM color WHERE p_color = color) IS NOT NULL THEN
  DELETE FROM color 
  WHERE p_color = color;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
END;
$$