CALL insertar_materia('Matematica', 'Contenido Original');
CALL obtener_materia(1);
CALL obtener_materia(2);
CALL actualizar_materia(1, 'Social', 'Contenido nuevito');
CALL eliminar_materia(1);

CALL insertar_alumno('Victor', 'Lopez', 'Ciudad', '55555555', '1234567890123', 'yo mismo', '1990-08-13', 1);
CALL obtener_alumno(1);
CALL obtener_alumno(2);
CALL actualizar_alumno(1, 'Victor Alfonso', 'Lopez Morales', 'Ciudad', '55555555', '1234567890123', 'yo mismo', '1990-08-13', 1);
CALL eliminar_alumno(1);
