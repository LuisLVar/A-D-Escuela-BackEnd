Feature: Inscripcion bloque
    Tarea de la historia de inscripcion bloque, que se encarga de poder listar
    crear y visualizar un bloque en especifico 


Scenario: Listar Bloques
    Given Que se quiera ver los bloques
    When Realizar una solicitud a los datos para extraer los bloques
    Then Obtener una lista de bloques


Scenario: Listar bloques y no existan
    Given Que se quiera ver los bloques
    When realizar una solicitud a los datos para extraer los bloques
    Then Obtener un informacion vacia


Scenario: Creacion de un bloque
    Given Que se quiera crear un nuevo bloque 
    When Enviar los datos a la base y que se registre
    Then Obtener un codigo del estado de la operacion


Scenario: Obtener alumnos de una seccion
    Given Que se quiera saber que alumnos estan en cierta seccion
    When Enviar la seccion y el bloque a la base
    Then Obtener un lista de alumnos







