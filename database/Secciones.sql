# CRUD de la tabla SECCIONES

use control_notas;
#PROCEDURE insertar_seccion
DROP PROCEDURE insertar_seccion;
DELIMITER $$
CREATE PROCEDURE insertar_seccion( p_nombre VARCHAR(50), p_estado INT,
 p_seccion_grado INT, p_seccion_personal INT, p_seccion_ciclo INT)
BEGIN
    IF (SELECT seccion FROM seccion WHERE nombre = p_nombre AND seccion_grado = p_seccion_grado
     AND seccion_ciclo = p_seccion_ciclo) IS NULL THEN
        INSERT INTO  seccion (nombre, estado, seccion_grado, seccion_personal, seccion_ciclo) 
        VALUES ( p_nombre, p_estado, p_seccion_grado, p_seccion_personal, p_seccion_ciclo );
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
    END IF; 
END
$$

# PROCEDURE obtener_seccion
DROP PROCEDURE obtener_seccion;
DELIMITER $$
CREATE PROCEDURE obtener_seccion(p_seccion INT)
BEGIN
    IF (SELECT seccion FROM seccion WHERE seccion = p_seccion) IS NOT NULL THEN
        SELECT * FROM seccion WHERE seccion = p_seccion;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$

# PROCEDURE actualizar_seccion
DROP PROCEDURE actualizar_seccion;
DELIMITER $$
CREATE PROCEDURE actualizar_seccion(p_seccion INT, p_nombre VARCHAR(50), p_estado INT,
p_seccion_grado INT, p_seccion_personal INT, p_seccion_ciclo INT)
BEGIN
    IF (SELECT seccion FROM seccion WHERE seccion = p_seccion) IS NOT NULL THEN
        IF (SELECT seccion FROM seccion WHERE nombre = p_nombre AND seccion_grado = p_seccion_grado
     AND seccion_ciclo = p_seccion_ciclo) IS NULL THEN
            UPDATE seccion SET nombre = p_nombre, seccion_grado = p_seccion_grado,
            seccion_ciclo = p_seccion_ciclo, estado = p_estado
            WHERE seccion = p_seccion;
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
        ELSE
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
        END IF; 
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 502;
    END IF; 
END
$$

# PROCEDURE eliminar_seccion
DROP PROCEDURE eliminar_seccion;
DELIMITER $$
CREATE PROCEDURE eliminar_seccion(p_seccion INT)
BEGIN
    IF (SELECT seccion FROM seccion WHERE seccion = p_seccion) IS NOT NULL THEN
        DELETE FROM seccion WHERE seccion = p_seccion;
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 503;
    END IF; 
END
$$
