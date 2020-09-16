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

# PROCEDURE obtener_aspecto
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_aspecto ( p_aspecto INT )
BEGIN
 IF (SELECT aspecto FROM aspecto WHERE p_aspecto = aspecto) IS NOT NULL THEN
  SELECT * FROM aspecto WHERE p_aspecto = aspecto;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_aspecto
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_aspecto ( p_aspecto VARCHAR(70), p_nombre VARCHAR(70) )
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF (SELECT aspecto FROM aspecto WHERE aspecto = p_aspecto) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL THEN
   UPDATE aspecto
    SET 
     nombre= p_nombre
      WHERE p_aspecto = aspecto;
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$

# PROCEDURE eliminar_aspecto
USE control_notas
DELIMITER $$
CREATE PROCEDURE eliminar_aspecto ( p_aspecto INT )
BEGIN
 IF (SELECT aspecto FROM aspecto WHERE aspecto = aspecto) IS NOT NULL THEN
  DELETE FROM aspecto 
  WHERE p_aspecto = aspecto;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
END;
$$