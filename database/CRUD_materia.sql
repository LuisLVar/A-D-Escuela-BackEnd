# CRUD de la tabla MATERIA

# FUNCTION insertar_materia
USE control_notas;
DELIMITER $$
CREATE FUNCTION insertar_materia
(
    p_nombre     VARCHAR(70),
 p_contenido  VARCHAR(70)
)
RETURNS JSON DETERMINISTIC
BEGIN
  DECLARE existe INT DEFAULT 0;
        
        IF (SELECT nombre FROM materia 
    WHERE LOWER(p_nombre) LIKE LOWER(nombre) 
     AND LOWER(p_contenido) LIKE LOWER(contenido)
      ) IS NULL THEN
   SET existe = 0;
  ELSE 
   SET existe = 1;
  END IF;
        
        IF existe THEN
   RETURN '{"estado": 500, "mensaje": "Error: Ya existe la materia que se desea ingresar."}';
        ELSE
   IF p_nombre IS NOT NULL THEN
      INSERT INTO  materia (nombre, contenido) VALUES ( p_nombre, p_contenido);
    RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';
   ELSE 
    RETURN '{"estado": 500, "mensaje": "Error: El nombre es un valor obligatorio"}';
   END IF;
        END IF;
END;
$$

# FUNCTION obtener_materia
USE control_notas
DELIMITER $$
CREATE FUNCTION obtener_materia
(
    p_materia INT
)
RETURNS JSON DETERMINISTIC
BEGIN

 IF (SELECT materia FROM materia WHERE p_materia = materia) IS NOT NULL THEN
 RETURN (
  SELECT 
   JSON_OBJECT('nombre', nombre, 'contenido', contenido)
   FROM materia
    WHERE p_materia = materia
            );
 ELSE 
  RETURN '{"error": 400, "mensaje": "No se puedo encontrar el registro en la tabla materia."}';
    END IF;
END;
$$

# FUNCTION actualizar_materia
USE control_notas;
DELIMITER $$
CREATE FUNCTION actualizar_materia
(
 p_materia  VARCHAR(70),
    p_nombre     VARCHAR(70),
 p_contenido  VARCHAR(70)
)
RETURNS JSON DETERMINISTIC
BEGIN
  DECLARE existe INT DEFAULT 0;
        
        IF (SELECT nombre FROM materia 
   WHERE materia = p_materia) IS NULL THEN
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
     WHERE
      p_materia = materia;
    RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';
   ELSE 
    RETURN '{"estado": 500, "mensaje": "Error: El nombre es un valor obligatorio"}';
   END IF;
        ELSE
   RETURN '{"estado": 500, "mensaje": "Error: No existe la materia que se desea actualizar."}';
        END IF;
END;
$$

# FUNCTION eliminar_materia
USE control_notas
DELIMITER $$
CREATE FUNCTION eliminar_materia
(
    p_materia INT
)
RETURNS JSON DETERMINISTIC
BEGIN
 IF (SELECT materia FROM materia WHERE p_materia = materia) IS NOT NULL THEN
  DELETE FROM materia 
   WHERE p_materia = materia;
         RETURN '{"estado": 200, "mensaje": "Operación completada con exito."}';   
 ELSE 
  RETURN '{"error": 400, "mensaje": "No se puedo encontrar el registro en la tabla materia."}';
    END IF;
END;
$$