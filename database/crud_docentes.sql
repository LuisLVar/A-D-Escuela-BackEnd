# CRUD de la tabla personal

# PROCEDURE insertar_personal
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_personal ( 
 p_nombre VARCHAR(80),
 p_apellido VARCHAR(80),
 p_direccion VARCHAR(100),
 p_telefono VARCHAR(12),
 p_estado INTEGER,
 p_cui BIGINT,
 p_personal_escuela INTEGER,
 p_personal_tipo_personal INTEGER,
 p_usuario VARCHAR(30),
 p_contrasenia VARCHAR(30)
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 IF( SELECT cui FROM personal WHERE cui = p_cui ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL AND p_apellido IS NOT NULL THEN
   INSERT INTO  personal (nombre, apellido, direccion, telefono, estado, cui, personal_escuela, personal_tipo_personal, usuario, contrasenia) 
    VALUES (p_nombre, p_apellido, p_direccion, p_telefono, p_estado, p_cui, p_personal_escuela, p_personal_tipo_personal, p_usuario, p_contrasenia);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;

END;
$$

# PROCEDURE obtener_personal
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_personal ( p_personal INT )
BEGIN
 IF (SELECT personal FROM personal WHERE p_personal = personal) IS NOT NULL THEN
  SELECT * FROM personal WHERE p_personal = personal;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_personal
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_personal ( 
 p_personal INT,
 p_nombre VARCHAR(80),
 p_apellido VARCHAR(80),
 p_direccion VARCHAR(100),
 p_telefono VARCHAR(12),
 p_estado INTEGER,
 p_cui BIGINT,
 p_personal_escuela INTEGER,
 p_personal_tipo_personal INTEGER,
 p_usuario VARCHAR(30),
 p_contrasenia VARCHAR(30)
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF (SELECT nombre FROM personal WHERE personal = p_personal) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL AND p_apellido IS NOT NULL THEN
   UPDATE personal
    SET 
	 nombre = p_nombre,
     apellido = p_apellido,
	 direccion = p_direccion,
     telefono = p_telefono,
	 estado = p_estado,
     cui = p_cui,
     personal_escuela = p_personal_escuela,
     personal_tipo_personal = p_personal_tipo_personal,
     usuario = p_usuario,
     contrasenia = p_contrasenia
      WHERE p_personal = personal;
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$

# PROCEDURE eliminar_personal
USE control_notas
DELIMITER $$
CREATE PROCEDURE eliminar_personal ( p_personal INT )
BEGIN
 IF (SELECT personal FROM personal WHERE p_personal = personal) IS NOT NULL THEN
  DELETE FROM personal 
   WHERE p_personal = personal;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
END;
$$