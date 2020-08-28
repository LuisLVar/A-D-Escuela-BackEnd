# CRUD de la tabla MATERIA

use control_notas;
#PROCEDURE insertar_ciclo
DROP PROCEDURE insertar_ciclo;
DELIMITER $$
CREATE PROCEDURE insertar_ciclo( p_anio INT)
BEGIN
    IF (SELECT anio FROM ciclo WHERE anio = p_anio) IS NULL THEN
        INSERT INTO  ciclo (anio) VALUES ( p_anio);
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
    END IF; 
END
$$

# PROCEDURE obtener_ciclo
DROP PROCEDURE obtener_ciclo;
DELIMITER $$
CREATE PROCEDURE obtener_ciclo(p_ciclo INT)
BEGIN
    IF (SELECT ciclo FROM ciclo WHERE ciclo = p_ciclo) IS NOT NULL THEN
        SELECT ciclo, anio FROM ciclo WHERE ciclo = p_ciclo;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$

# PROCEDURE actualizar_ciclo
DROP PROCEDURE actualizar_ciclo;
DELIMITER $$
CREATE PROCEDURE actualizar_ciclo(p_ciclo INT, p_anio INT)
BEGIN
    IF (SELECT anio FROM ciclo WHERE ciclo = p_ciclo) IS NOT NULL THEN
        IF (SELECT ciclo FROM ciclo WHERE anio = p_anio) IS NULL THEN
            UPDATE ciclo SET anio = p_anio WHERE p_ciclo = ciclo;
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
        ELSE
            SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
        END IF; 
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 502;
    END IF; 
END
$$

# PROCEDURE eliminar_ciclo
DROP PROCEDURE eliminar_ciclo;
DELIMITER $$
CREATE PROCEDURE eliminar_ciclo(p_ciclo INT)
BEGIN
    IF (SELECT ciclo FROM ciclo WHERE p_ciclo = ciclo) IS NOT NULL THEN
        DELETE FROM ciclo WHERE p_ciclo = ciclo;
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 503;
    END IF; 
END
$$
