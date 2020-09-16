# CRUD de la tabla ASPECTO

# PROCEDURE insertar_aspecto
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_aspecto ( p_nombre VARCHAR(70))
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF( SELECT aspecto 
      FROM aspecto 
	   WHERE LOWER(p_nombre) LIKE LOWER(nombre) 
 ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
    SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL THEN
   INSERT INTO  aspecto (nombre) VALUES ( p_nombre);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$