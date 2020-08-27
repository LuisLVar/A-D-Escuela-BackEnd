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

# FUNCTION obtener_alumno
USE control_notas
DELIMITER $$
CREATE FUNCTION obtener_alumno ( p_alumno INT )
 RETURNS JSON DETERMINISTIC
BEGIN
 IF (SELECT alumno FROM alumno WHERE p_alumno = alumno) IS NOT NULL THEN
  RETURN ( SELECT JSON_OBJECT (
                   'alumno', alumno,
				   'nombre', nombre,
                   'apellido', apellido,
				   'direccion', direccion,
                   'telefono', telefono,
                   'cui', cui,
                   'encargado', encargado,
                   'fecha_nacimiento', fecha_nacimiento,
			       'estado', estado 
				  ) 
            FROM alumno
             WHERE p_alumno = alumno
         );
 ELSE 
  RETURN '{"estado": 400, "mensaje": "No se puedo encontrar el registro en la tabla alumno."}';
 END IF;
END;
$$

# FUNCTION actualizar_alumno
USE control_notas;
DELIMITER $$
CREATE FUNCTION actualizar_alumno ( 
 p_alumno INT,
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
     encargado = p_encargado,
     fecha_nacimiento = p_fecha_nacimiento,
	 estado = p_estado 
      WHERE p_alumno = alumno;
    RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';
  ELSE 
   RETURN '{"estado": 500, "mensaje": "El nombre y el apellido son valores obligatorio"}';
  END IF;
 ELSE
  RETURN '{"estado": 500, "mensaje": "No existe la alumno que se desea actualizar."}';
 END IF;
END;
$$

# FUNCTION eliminar_alumno
USE control_notas
DELIMITER $$
CREATE FUNCTION eliminar_alumno ( p_alumno INT )
 RETURNS JSON DETERMINISTIC
BEGIN
 IF (SELECT alumno FROM alumno WHERE p_alumno = alumno) IS NOT NULL THEN
  DELETE FROM alumno 
   WHERE p_alumno = alumno;
  RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';   
 ELSE 
  RETURN '{"estado": 400, "mensaje": "No se puedo encontrar el registro en la tabla alumno."}';
 END IF;
END;
$$