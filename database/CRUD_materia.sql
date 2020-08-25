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