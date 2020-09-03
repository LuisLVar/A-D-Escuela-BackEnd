# CRUD de la tabla ALUMNO

# PROCEDURE insertar_alumno
USE control_notas;
DELIMITER $$
CREATE PROCEDURE insertar_alumno ( 
 p_nombre VARCHAR(80),
 p_apellido VARCHAR(80),
 p_direccion VARCHAR(100),
 p_telefono VARCHAR(12),
 p_cui BIGINT,
 p_nacionalidad VARCHAR(50),
 p_codigo_personal VARCHAR(50),
 p_encargado VARCHAR(80),
 p_fecha_nacimiento DATE,
 p_estado INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;
 IF( SELECT nombre FROM alumno WHERE cui = p_cui ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  SELECT * FROM mensaje WHERE codigo = 501;
 ELSE
  IF p_nombre IS NOT NULL AND p_apellido IS NOT NULL THEN
   INSERT INTO  alumno (nombre, apellido, direccion, telefono, cui, nacionalidad, codigo_personal, encargado, fecha_nacimiento, estado) 
    VALUES (p_nombre, p_apellido, p_direccion, p_telefono, p_cui, p_nacionalidad, p_codigo_personal, p_encargado, p_fecha_nacimiento, p_estado);
   SELECT * FROM mensaje WHERE codigo = 200;
  ELSE
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 END IF;
 
END;
$$

# PROCEDURE obtener_alumno
USE control_notas
DELIMITER $$
CREATE PROCEDURE obtener_alumno ( p_alumno INT )
BEGIN
 IF (SELECT alumno FROM alumno WHERE p_alumno = alumno) IS NOT NULL THEN
  SELECT * FROM alumno WHERE p_alumno = alumno;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 400;
 END IF;
END;
$$

# PROCEDURE actualizar_alumno
USE control_notas;
DELIMITER $$
CREATE PROCEDURE actualizar_alumno ( 
 p_alumno INT,
 p_nombre VARCHAR(80),
 p_apellido VARCHAR(80),
 p_direccion VARCHAR(100),
 p_telefono VARCHAR(12),
 p_cui BIGINT,
 p_nacionalidad VARCHAR(50),
 p_codigo_personal VARCHAR(50),
 p_encargado VARCHAR(80),
 p_fecha_nacimiento DATE,
 p_estado INTEGER
)
BEGIN
 DECLARE existe INT DEFAULT 0;

 IF (SELECT nombre FROM alumno WHERE alumno = p_alumno) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  IF p_nombre IS NOT NULL AND p_apellido IS NOT NULL THEN
   UPDATE alumno
    SET 
	 nombre = p_nombre,
     apellido = p_apellido,
	 direccion = p_direccion,
     telefono = p_telefono,
     cui = p_cui,
	 nacionalidad = p_nacionalidad,
     codigo_personal = p_codigo_personal,
     encargado = p_encargado,
     fecha_nacimiento = p_fecha_nacimiento,
	 estado = p_estado 
      WHERE p_alumno = alumno;
    SELECT * FROM mensaje WHERE codigo = 200;
  ELSE 
   SELECT * FROM mensaje WHERE codigo = 500;
  END IF;
 ELSE
  SELECT * FROM mensaje WHERE codigo = 502;
 END IF;
END;
$$

# PROCEDURE eliminar_alumno
USE control_notas
DELIMITER $$
CREATE PROCEDURE eliminar_alumno ( p_alumno INT )
BEGIN
 IF (SELECT alumno FROM alumno WHERE p_alumno = alumno) IS NOT NULL THEN
  DELETE FROM alumno 
   WHERE p_alumno = alumno;
  SELECT * FROM mensaje WHERE codigo = 200;
 ELSE 
  SELECT * FROM mensaje WHERE codigo = 503;
 END IF;
END;
$$