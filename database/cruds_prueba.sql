CALL insertar_materia('Matematica', 'Contenido Original');
CALL obtener_materia(1);
CALL obtener_materia(2);
CALL actualizar_materia(1, 'Social', 'Contenido nuevito');
CALL eliminar_materia(1);

CALL insertar_alumno('Victor', 'Lopez', 'Ciudad', '55555555', 1234567890123, 'Guatemalteca', 'AD22A', 'yo mismo', '1990-08-13', 1);
CALL obtener_alumno(1);
CALL obtener_alumno(2);
CALL actualizar_alumno(1, 'Victor Alfonso', 'Lopez Morales', 'Ciudad', '55555555', 1234567890123, 'Guatemalteca', 'AD22A', 'yo mismo', '1990-08-13', 1);
CALL eliminar_alumno(2);

SELECT * FROM ALUMNO;

CALL insertar_personal('Juan', 'Perez', 'Ciudad', '55555555', 1, 1234567890123, 1, 1, 'jperez', '1234567890');
CALL obtener_personal(1);
CALL obtener_personal(2);
CALL actualizar_personal(1, 'Juan2', 'Perez2', 'Ciudad', '55555555', 1, 1234567890123, 1, 1, 'jperez', '1234567890');
CALL eliminar_personal(1);


INSERT INTO escuela(nombre_oficial, direccion, telefono) VALUES('Escuela Maritza Hurtarte Guillen', 'NUEVO AMANECER, LOTE 6 MANZANA 82 SECTOR I, Cdad. de Guatemala', '55555555');
INSERT INTO tipo_personal(nombre) VALUES('Docente');

INSERT INTO personal(nombre, apellido, direccion, telefono, estado, cui, personal_escuela, personal_tipo_personal, usuario, contrasenia)
	VALUES ('nombre', 'apellido', 'direccion', '55555555', 1, 1234567890123, 1, 1, 'usuario', 'contrasenia');
INSERT INTO ciclo(anio) VALUES(2021);
INSERT INTO grado(nombre_grado) VALUES('Primero Primaria');
INSERT INTO seccion(nombre, estado, seccion_grado, seccion_personal, seccion_ciclo) VALUES('SECCION A', 1,1,1,1);
INSERT INTO materia(nombre, contenido) VALUES('matematicas', 'contenido matematicas');