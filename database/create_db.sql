DROP DATABASE IF EXISTS control_notas;
CREATE DATABASE IF NOT EXISTS control_notas;

USE control_notas;

CREATE TABLE escuela (
    escuela INTEGER NOT NULL AUTO_INCREMENT,
    nombre_oficial VARCHAR(80) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    CONSTRAINT escuela_pk PRIMARY KEY (escuela)
);
 
CREATE TABLE tipo_personal (
    tipo_personal INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT tipo_personal_pk PRIMARY KEY (tipo_personal)
);

CREATE TABLE personal (
    personal INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(12),
    estado INTEGER NOT NULL,
    cui BIGINT,
    personal_escuela INTEGER NOT NULL,
    personal_tipo_personal INTEGER NOT NULL,
    usuario VARCHAR(30) NOT NULL,
    contrasenia VARCHAR(30) NOT NULL,
    CONSTRAINT personal_pk PRIMARY KEY (personal),
    CONSTRAINT personal_escuela_fk FOREIGN KEY (personal_escuela)
        REFERENCES escuela (escuela)
        ON DELETE CASCADE,
    CONSTRAINT personal_tipo_personal_fk FOREIGN KEY (personal_tipo_personal)
        REFERENCES tipo_personal (tipo_personal)
        ON DELETE CASCADE
);

CREATE TABLE grado (
    grado INTEGER NOT NULL AUTO_INCREMENT,
    nombre_grado VARCHAR(50) NOT NULL,
    CONSTRAINT grado_pk PRIMARY KEY (grado)
);

CREATE TABLE ciclo (
    ciclo INTEGER NOT NULL AUTO_INCREMENT,
    anio INTEGER,
    CONSTRAINT ciclo_pk PRIMARY KEY (ciclo)
);

CREATE TABLE seccion (
    seccion INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    estado INTEGER NOT NULL,
    seccion_grado INTEGER NOT NULL,
    seccion_personal INTEGER NOT NULL,
    seccion_ciclo INTEGER NOT NULL,
    CONSTRAINT seccion_pk PRIMARY KEY (seccion),
    CONSTRAINT seccion_personal_fk FOREIGN KEY (seccion_personal)
        REFERENCES personal (personal)
        ON DELETE CASCADE,
    CONSTRAINT seccion_grado_fk FOREIGN KEY (seccion_grado)
        REFERENCES grado (grado)
        ON DELETE CASCADE,
    CONSTRAINT seccion_ciclo_fk FOREIGN KEY (seccion_ciclo)
        REFERENCES ciclo (ciclo)
        ON DELETE CASCADE
);

CREATE TABLE materia (
    materia INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(70) NOT NULL,
    contenido VARCHAR(70),
    CONSTRAINT materia_pk PRIMARY KEY (materia)
);

CREATE TABLE seccion_materia (
    seccion_materia_materia INTEGER NOT NULL,
    seccion_materia_seccion INTEGER NOT NULL,
    CONSTRAINT seccion_materia_pk PRIMARY KEY (seccion_materia_materia , seccion_materia_seccion),
    CONSTRAINT seccion_materia_materia_fk FOREIGN KEY (seccion_materia_materia)
        REFERENCES materia (materia)
        ON DELETE CASCADE,
    CONSTRAINT seccion_materia_seccion_fk FOREIGN KEY (seccion_materia_seccion)
        REFERENCES seccion (seccion)
        ON DELETE CASCADE
);

CREATE TABLE alumno (
    alumno INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(12),
    cui BIGINT,
    nacionalidad VARCHAR(50),
    codigo_personal VARCHAR(50),
    encargado VARCHAR(80),
    fecha_nacimiento DATE,
    estado INTEGER,
    CONSTRAINT alumno_pk PRIMARY KEY (alumno),
    CONSTRAINT alumno_uk UNIQUE (cui, codigo_personal)
);

CREATE TABLE inscripcion (
    fecha DATE NOT NULL,
    inscripcion_seccion INTEGER NOT NULL,
    inscripcion_alumno INTEGER NOT NULL,
    CONSTRAINT inscripcion_pk PRIMARY KEY (inscripcion_seccion , inscripcion_alumno),
    CONSTRAINT inscripcion_seccion_fk FOREIGN KEY (inscripcion_seccion)
        REFERENCES seccion (seccion)
        ON DELETE CASCADE,
    CONSTRAINT inscripcion_alumno_fk FOREIGN KEY (inscripcion_alumno)
        REFERENCES alumno (alumno)
        ON DELETE CASCADE
);

CREATE TABLE bloque (
    bloque INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT bloque_pk PRIMARY KEY (bloque)
);

CREATE TABLE inscripcion_bloque (
    ib_inscripcion_seccion INTEGER NOT NULL,
    ib_inscripcion_alumno INTEGER NOT NULL,
    ib_bloque INTEGER NOT NULL,
    CONSTRAINT inscripcion_bloque_pk PRIMARY KEY (ib_inscripcion_seccion , ib_inscripcion_alumno , ib_bloque),
    CONSTRAINT ib_inscripcion_seccion_fk FOREIGN KEY (ib_inscripcion_seccion)
        REFERENCES inscripcion (inscripcion_seccion)
        ON DELETE CASCADE,
    CONSTRAINT ib_inscripcion_alumno_fk FOREIGN KEY (ib_inscripcion_alumno)
        REFERENCES inscripcion (inscripcion_alumno)
        ON DELETE CASCADE,
    CONSTRAINT bloque_inscripcion_bloque FOREIGN KEY (ib_bloque)
        REFERENCES bloque (bloque)
        ON DELETE CASCADE
);
        
CREATE TABLE aspecto (
    aspecto INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    CONSTRAINT aspecto_pk PRIMARY KEY (aspecto)
);
    
CREATE TABLE color (
    color INTEGER NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(70) NOT NULL,
    significado VARCHAR(70),
    CONSTRAINT color_pk PRIMARY KEY (color)
);
    
CREATE TABLE asignacion (
    zona FLOAT NOT NULL,
    proyecto FLOAT,
    nota_final FLOAT,
    promedio FLOAT,
    as_ib_inscripcion_seccion INTEGER NOT NULL,
    as_ib_inscripcion_alumno INTEGER NOT NULL,
    as_ib_bloque INTEGER NOT NULL,
    as_materia INTEGER NOT NULL,
    as_color INTEGER NOT NULL,
    CONSTRAINT asignacion_pk PRIMARY KEY (as_ib_inscripcion_seccion , as_ib_inscripcion_alumno , as_ib_bloque , as_materia),
    CONSTRAINT as_ib_inscripcion_seccion_fk FOREIGN KEY (as_ib_inscripcion_seccion)
        REFERENCES inscripcion_bloque (ib_inscripcion_seccion)
        ON DELETE CASCADE,
    CONSTRAINT as_ib_inscripcion_alumno_fk FOREIGN KEY (as_ib_inscripcion_alumno)
        REFERENCES inscripcion_bloque (ib_inscripcion_alumno)
        ON DELETE CASCADE,
    CONSTRAINT as_ib_bloque_fk FOREIGN KEY (as_ib_bloque)
        REFERENCES inscripcion_bloque (ib_bloque)
        ON DELETE CASCADE,
    CONSTRAINT as_materia_fk FOREIGN KEY (as_materia)
        REFERENCES materia (materia)
        ON DELETE CASCADE,
    CONSTRAINT as_color_fk FOREIGN KEY (as_color)
        REFERENCES color (color)
        ON DELETE CASCADE
);

CREATE TABLE aspecto_bloque (
    ab_ib_inscripcion_seccion INTEGER NOT NULL,
    ab_ib_inscripcion_alumno INTEGER NOT NULL,
    ab_ib_bloque INTEGER NOT NULL,
    ab_aspecto INTEGER NOT NULL,
    ab_color INTEGER NOT NULL,
    CONSTRAINT aspecto_bloque_pk PRIMARY KEY (ab_ib_inscripcion_seccion , ab_ib_inscripcion_alumno , ab_ib_bloque , ab_aspecto),
    CONSTRAINT ab_ib_inscripcion_seccion_fk FOREIGN KEY (ab_ib_inscripcion_seccion)
        REFERENCES inscripcion_bloque (ib_inscripcion_seccion)
        ON DELETE CASCADE,
    CONSTRAINT ab_ib_inscripcion_alumno_fk FOREIGN KEY (ab_ib_inscripcion_alumno)
        REFERENCES inscripcion_bloque (ib_inscripcion_alumno)
        ON DELETE CASCADE,
    CONSTRAINT ab_ib_bloque FOREIGN KEY (ab_ib_bloque)
        REFERENCES inscripcion_bloque (ib_bloque)
        ON DELETE CASCADE,    
    CONSTRAINT ab_aspecto_fk FOREIGN KEY (ab_aspecto)
        REFERENCES aspecto (aspecto)
        ON DELETE CASCADE,
	CONSTRAINT ab_color_fk FOREIGN KEY (ab_color)
        REFERENCES color (color)
        ON DELETE CASCADE
);

CREATE TABLE mensaje(
	codigo INTEGER NOT NULL,
    mensaje VARCHAR(200) NOT NULL,
    CONSTRAINT mensaje_pk PRIMARY KEY (codigo)
);

INSERT INTO mensaje(codigo, mensaje) VALUES(200, 'Se realizo correctamente la operación');
INSERT INTO mensaje(codigo, mensaje) VALUES(400, 'Error: No se encontro el registro en la tabla');
INSERT INTO mensaje(codigo, mensaje) VALUES(500, 'Error: Faltan datos obligatorios');
INSERT INTO mensaje(codigo, mensaje) VALUES(501, 'Error: Ya existe el dato que se desea ingresar.');
INSERT INTO mensaje(codigo, mensaje) VALUES(502, 'Error: No existe el registro a modificar.');
INSERT INTO mensaje(codigo, mensaje) VALUES(503, 'Error: No existe el registro a eliminar.');