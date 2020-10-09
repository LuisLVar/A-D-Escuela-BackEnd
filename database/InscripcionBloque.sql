-- Crear Inscripcion Bloque

use control_notas;

-- SELECT * FROM bloque;
INSERT INTO bloque (nombre) VALUES ('Primero');
INSERT INTO bloque (nombre) VALUES ('Segundo');
INSERT INTO bloque (nombre) VALUES ('Tercero');
INSERT INTO bloque (nombre) VALUES ('Cuarto');

#PROCEDURE inscripcion_bloque;
-- DROP PROCEDURE inscripcion_bloque;
DELIMITER $$
CREATE PROCEDURE inscripcion_bloque( p_seccion INT, p_alumno INT , p_bloque INT )
BEGIN
	IF NOT EXISTS (SELECT ib_inscripcion_seccion FROM inscripcion_bloque 
    WHERE ib_inscripcion_seccion = p_seccion 
    and ib_inscripcion_alumno = p_alumno 
    and ib_bloque = p_bloque)
    THEN
        INSERT INTO  inscripcion_bloque  VALUES ( p_seccion, p_alumno, p_bloque);
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 200;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 501;
    END IF; 
END
$$

#PROCEDURE listar_grado_bloque;
-- DROP PROCEDURE listar_grado_bloque;
DELIMITER $$
CREATE PROCEDURE listar_grado_bloque( p_seccion INT, p_bloque INT )
BEGIN
	SELECT * from alumno where alumno IN
	(SELECT ib_inscripcion_alumno FROM inscripcion_bloque 
    WHERE ib_inscripcion_seccion = p_seccion 
    and ib_bloque = p_bloque);
END
$$
