# CRUD de la tabla MATERIA

# FUNCTION insertar_alumno
USE control_notas;
DELIMITER $$
CREATE FUNCTION insertar_alumno ( 
 p_nombre VARCHAR(80),
 p_apellido VARCHAR(80),
 p_direccion VARCHAR(100),
 p_telefono VARCHAR(12),
 p_cui BIGINT,
 p_encargado VARCHAR(80),
 p_fecha_nacimiento DATE,
 p_estado INTEGER
)
 RETURNS JSON DETERMINISTIC
BEGIN
 DECLARE existe INT DEFAULT 0;
 IF( SELECT nombre FROM alumno WHERE cui = p_cui ) IS NULL THEN
  SET existe = 0;
 ELSE 
  SET existe = 1;
 END IF;

 IF existe THEN
  RETURN '{"estado": 500, "mensaje": "Ya existe la alumno con ese cui que se desea ingresar."}';
 ELSE
  IF p_nombre IS NOT NULL AND p_apellido IS NOT NULL THEN
   INSERT INTO  alumno (nombre, apellido, direccion, telefono, cui, encargado, fecha_nacimiento, estado) 
    VALUES (p_nombre, p_apellido, p_direccion, p_telefono, p_cui, p_encargado, p_fecha_nacimiento, p_estado);
   RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';
  ELSE
   RETURN '{"estado": 500, "mensaje": "El nombre y el apellido son valores obligatorio"}';
  END IF;
 END IF;
 
END;
$$