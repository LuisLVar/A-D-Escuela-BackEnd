USE control_notas;

-- Mostrar Calificaciones Grupal Backend
# PROCEDURE notas_grupal
DROP PROCEDURE notas_grupal;
DELIMITER $$
CREATE PROCEDURE notas_grupal(p_seccion INT, p_bloque INT, p_materia INT)
BEGIN
    IF (SELECT seccion FROM seccion WHERE seccion = p_seccion) IS NOT NULL THEN
        SELECT a.zona, a.proyecto, a.nota_final, a.promedio, s.seccion as idSeccion, s.nombre as nombreSeccion, 
        al.alumno as idAlumno, CONCAT(al.nombre+" "+al.apellido) as nombreAlumno, 
        m.materia as idMateria, m.nombre as nombreMateria
        FROM asignacion a
        INNER JOIN seccion s
        ON a.as_ib_inscripcion_seccion = s.seccion
        INNER JOIN alumno al
        ON al.alumno = a.as_ib_inscripcion_alumno
        INNER JOIN materia m
        ON m.materia = a.as_materia
        WHERE a.as_ib_bloque = p_bloque AND m.materia = p_materia AND s.seccion = p_seccion;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$