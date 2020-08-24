DROP DATABASE IF EXISTS control_notas;
CREATE DATABASE IF NOT EXISTS control_notas;

USE control_notas;

CREATE TABLE escuela 
(
	escuela 		INTEGER NOT NULL AUTO_INCREMENT,
    nombre_oficial	VARCHAR(80) NOT NULL,
    dirección 	  	VARCHAR(100) NOT NULL,
    telefono 		VARCHAR(50) NOT NULL,
    
    CONSTRAINT escuela_pk 
		PRIMARY KEY (escuela)
);
 
CREATE TABLE tipo_personal (
    tipo_personal	INTEGER NOT NULL AUTO_INCREMENT,
    nombre      	VARCHAR(50) NOT NULL,
    
    CONSTRAINT tipo_personal_pk 
		PRIMARY KEY ( tipo_personal )
);

CREATE TABLE personal (
    personal        INTEGER NOT NULL AUTO_INCREMENT,
    nombre          VARCHAR(80) NOT NULL,
    apellido        VARCHAR(80) NOT NULL,
    direccion       VARCHAR(100),
    telefono        VARCHAR(12),
    estado          INTEGER NOT NULL,
    escuela    		INTEGER NOT NULL,
    tipo_personal	INTEGER NOT NULL,
    usuario         VARCHAR(30) NOT NULL,
    contrasenia 	VARCHAR(30) NOT NULL,
    
    CONSTRAINT personal_pk 
		PRIMARY KEY ( personal ),
        
	CONSTRAINT escuela_personal
		FOREIGN KEY (escuela)
			REFERENCES escuela(escuela),
            
	CONSTRAINT tipo_personal_personal
			FOREIGN KEY (tipo_personal)
				REFERENCES tipo_personal(tipo_personal)
);

CREATE TABLE grado 
(
    grado	INTEGER NOT NULL AUTO_INCREMENT,
    nombre	VARCHAR(50) NOT NULL,
    
    CONSTRAINT grado_pk 
		PRIMARY KEY (grado)
);

CREATE TABLE ciclo (
    ciclo  INTEGER NOT NULL auto_increment,
    anio   INTEGER,
    
    CONSTRAINT ciclo_pk 
		PRIMARY KEY (ciclo)
);

CREATE TABLE seccion 
(
    seccion     INTEGER NOT NULL AUTO_INCREMENT,
    nombre      VARCHAR(50) NOT NULL,
    estado      INTEGER NOT NULL,
    grado       INTEGER NOT NULL,
    personal	INTEGER NOT NULL,
    ciclo       INTEGER NOT NULL,
    
    CONSTRAINT seccion_pk 
		PRIMARY KEY (seccion),
	
    CONSTRAINT personal_seccion
		FOREIGN KEY (personal)
			REFERENCES personal(personal),
            
	CONSTRAINT grado_seccion
		FOREIGN KEY (grado)
			REFERENCES grado(grado),
            
	CONSTRAINT ciclo_seccion
		FOREIGN KEY (ciclo)
			REFERENCES ciclo(ciclo)
);

CREATE TABLE materia (
    materia    INTEGER NOT NULL AUTO_INCREMENT,
    nombre     VARCHAR(70) NOT NULL,
    contenido  VARCHAR(70),
    
    CONSTRAINT materia_pk 
		PRIMARY KEY ( materia )
);

CREATE TABLE seccion_materia (
    materia INTEGER NOT NULL,
    seccion INTEGER NOT NULL,
	CONSTRAINT seccion_materia_pk 
		PRIMARY KEY ( materia, seccion ),
        
	CONSTRAINT materia_seccion_materia
		FOREIGN KEY (materia)
			REFERENCES materia(materia),
            
	CONSTRAINT seccion_seccion_materia
		FOREIGN KEY (seccion)
			REFERENCES seccion(seccion)
);

CREATE TABLE alumno (
    alumno         	  	INTEGER NOT NULL AUTO_INCREMENT,
    nombre            	VARCHAR(80) NOT NULL,
    apellido          	VARCHAR(80) NOT NULL,
    direccion         	VARCHAR(100),
    telefono          	VARCHAR(12),
    cui			      	INTEGER,
    encargado         	VARCHAR(80),
    fecha_nacimiento	DATE,
    estado            	INTEGER,
    
    CONSTRAINT alumno_pk 
		PRIMARY KEY (alumno)
);

CREATE TABLE inscripcion (
    fecha            DATE NOT NULL,
    seccion  INTEGER NOT NULL,
    alumno    INTEGER NOT NULL,
    
    CONSTRAINT inscripcion_pk 
		PRIMARY KEY ( seccion, alumno ),
        
	CONSTRAINT seccion_inscripcion
		FOREIGN KEY (seccion)
			REFERENCES seccion(seccion),
    
    CONSTRAINT alumno_inscripcion
		FOREIGN KEY (alumno)
			REFERENCES alumno(alumno)
);

CREATE TABLE bloque (
    bloque  INTEGER NOT NULL AUTO_INCREMENT,
    nombre  VARCHAR(50) NOT NULL,
    
    CONSTRAINT bloque_pk 
		PRIMARY KEY ( bloque )
);

CREATE TABLE inscripcion_bloque (
    seccion	INTEGER NOT NULL,
    alumno	INTEGER NOT NULL,
    bloque	INTEGER NOT NULL,
    
    CONSTRAINT inscripcion_bloque_pk
		PRIMARY KEY ( seccion, alumno, bloque ),
	
    CONSTRAINT seccion_inscripcion_bloque
		FOREIGN KEY (seccion)
			REFERENCES inscripcion( seccion ),
	
    CONSTRAINT alumno_inscripcion_bloque
		FOREIGN KEY (alumno)
			REFERENCES inscripcion( alumno ),
	    
	CONSTRAINT bloque_inscripcion_bloque
		FOREIGN KEY (bloque)
			REFERENCES bloque( bloque )
);
        
CREATE TABLE aspecto (
    aspecto  INTEGER NOT NULL AUTO_INCREMENT,
    nombre   VARCHAR(80) NOT NULL,
    
    CONSTRAINT aspecto_pk 
		PRIMARY KEY ( aspecto )
);
    
CREATE TABLE color (
    color        INTEGER NOT NULL AUTO_INCREMENT,
    nombre       VARCHAR(70) NOT NULL,
    significado  VARCHAR(70),
    
    CONSTRAINT color_pk 
		PRIMARY KEY ( color )
);
    
CREATE TABLE asignacion (
    zona        FLOAT NOT NULL,
    proyecto    FLOAT,
    nota_final	FLOAT,
    promedio    FLOAT,
    seccion  	INTEGER NOT NULL,
    alumno   	INTEGER NOT NULL,
    bloque      INTEGER NOT NULL,
    materia     INTEGER NOT NULL,
    color       INTEGER NOT NULL,
    
	CONSTRAINT asignacion_pk 
		PRIMARY KEY ( seccion, alumno, bloque, materia ),
        
	CONSTRAINT seccion_asignacion
		FOREIGN KEY (seccion)
			REFERENCES inscripcion_bloque(seccion),
            
	CONSTRAINT alumno_asignacion
		FOREIGN KEY (alumno)
			REFERENCES inscripcion_bloque(alumno),
            
	CONSTRAINT bloque_asignacion
		FOREIGN KEY (bloque)
			REFERENCES inscripcion_bloque(bloque),
            
	CONSTRAINT color_asignacion
		FOREIGN KEY (color)
			REFERENCES color(color)
);

CREATE TABLE aspecto_bloque (
    seccion  INTEGER NOT NULL,
    alumno   INTEGER NOT NULL,
    bloque   INTEGER NOT NULL,
    aspecto  INTEGER NOT NULL,
    color    INTEGER NOT NULL,
    
	CONSTRAINT aspecto_bloque_pk 
		PRIMARY KEY ( seccion, alumno, bloque, aspecto ),
        
	CONSTRAINT seccion_aspecto_bloque
		FOREIGN KEY (seccion)
			REFERENCES inscripcion_bloque(seccion),
            
	CONSTRAINT alumno_aspecto_bloque
		FOREIGN KEY (alumno)
			REFERENCES inscripcion_bloque(alumno),
            
	CONSTRAINT bloque_aspecto_bloque
		FOREIGN KEY (bloque)
			REFERENCES inscripcion_bloque(bloque),
            
	CONSTRAINT color_aspecto_bloque
		FOREIGN KEY (color)
			REFERENCES color(color),
            
	CONSTRAINT aspecto_aspecto_bloque
		FOREIGN KEY (aspecto)
			REFERENCES aspecto(aspecto)
);

