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

-- call notas_grupal(1,1,1);

-- Mostrar Calificaciones Individual
# PROCEDURE notas_individual
DROP PROCEDURE notas_individual;
DELIMITER $$
CREATE PROCEDURE notas_individual(p_seccion INT, p_bloque INT, p_alumno INT)
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
        WHERE a.as_ib_bloque = p_bloque AND s.seccion = p_seccion AND al.alumno = p_alumno;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$

-- notas_ind_mat(1,1,1,1);

-- Mostrar Calificaciones Individual por materia

DROP PROCEDURE notas_ind_mat;
DELIMITER $$
CREATE PROCEDURE notas_ind_mat(p_seccion INT, p_bloque INT, p_materia INT, p_alumno INT)
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
        WHERE a.as_ib_bloque = p_bloque AND s.seccion = p_seccion AND al.alumno = p_alumno AND m.materia = p_materia;
    ELSE
        SELECT codigo, mensaje FROM mensaje WHERE codigo = 400;
    END IF; 
END
$$
