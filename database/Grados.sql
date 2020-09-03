# CRUD de la tabla GRADO

use control_notas;
#PROCEDURE insertar_grado
DROP PROCEDURE insertar_grado;
DELIMITER $$
CREATE PROCEDURE insertar_grado( p_nombre_grado VARCHAR(50))
BEGIN
    IF (SELECT nombre_grado FROM grado WHERE nombre_grado = p_nombre_grado) IS NULL THEN
        INSERT INTO  grado (nombre_grado) VALUES ( p_nombre_grado);
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
    END IF; 
END
$$

# PROCEDURE obtener_grado
DROP PROCEDURE obtener_grado;
DELIMITER $$
CREATE PROCEDURE obtener_grado(p_grado INT)
BEGIN
    IF (SELECT grado FROM grado WHERE grado = p_grado) IS NOT NULL THEN
        SELECT grado, nombre_grado FROM grado WHERE grado = p_grado;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$

# PROCEDURE actualizar_grado
DROP PROCEDURE actualizar_grado;
DELIMITER $$
CREATE PROCEDURE actualizar_grado(p_grado INT, p_nombre_grado VARCHAR(50))
BEGIN
    IF (SELECT nombre_grado FROM grado WHERE grado = p_grado) IS NOT NULL THEN
        IF (SELECT grado FROM grado WHERE nombre_grado = p_nombre_grado) IS NULL THEN
            UPDATE grado SET nombre_grado = p_nombre_grado WHERE p_grado = grado;
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
        ELSE
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
        END IF; 
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 502;
    END IF; 
END
$$

# PROCEDURE eliminar_grado
DROP PROCEDURE eliminar_grado;
DELIMITER $$
CREATE PROCEDURE eliminar_grado(p_grado INT)
BEGIN
    IF (SELECT grado FROM grado WHERE p_grado = grado) IS NOT NULL THEN
        DELETE FROM grado WHERE p_grado = grado;
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 503;
    END IF; 
END
$$
