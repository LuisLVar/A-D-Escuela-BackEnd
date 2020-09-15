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