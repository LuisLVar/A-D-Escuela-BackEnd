import { Router } from 'express';
import { apiController } from '../controllers/apiController';
import pool from '../database';

import {seccionController} from '../controllers/seccion.controller';

class ApiRoutes{
    public router: Router = Router();

    constructor(){
        this.config();
    }

    config():void {
        //Aqui van las referencias a los get y post. 
        this.router.post('/materias', apiController.insertarMateria);
        this.router.put('/materias', apiController.actualizarMateria);
        this.router.get('/materias/:id', apiController.obtenerMateria); 
        this.router.get('/materias/', apiController.obtenerMaterias);
        this.router.delete('/materias', apiController.eliminarMateria); 
        
        this.router.get('/ciclos', apiController.getCiclos);
        this.router.post('/ciclos', apiController.crearCiclo);
        this.router.delete('/ciclos/:id', apiController.eliminarCiclo);  
        this.router.get('/ciclos/:id', apiController.obtenerCiclo); 
        this.router.put('/ciclos', apiController.actualizarCiclo); 
        this.router.delete('/materias/:id', apiController.eliminarMateria); 
       
        this.router.post('/alumnos', apiController.insertarAlumno);
        this.router.put('/alumnos', apiController.actualizarAlumno);
        this.router.get('/alumnos/:id', apiController.obtenerAlumno); 
        this.router.get('/alumnos/', apiController.obtenerAlumnos);
        this.router.delete('/alumnos/:id', apiController.eliminarAlumno); 
        
        this.router.post('/personal', apiController.insertarPersonal);
        this.router.put('/personal', apiController.actualizarPersonal);
        this.router.get('/personal/:id', apiController.obtenerPersonal); 
        this.router.get('/personal/', apiController.obtenerPersonales);
        this.router.delete('/personal/:id', apiController.eliminarPersonal); 

        //Secciones
        this.router.get('/secciones', seccionController.list);
        this.router.get('/secciones/:id', seccionController.getOne);
        this.router.post('/secciones', seccionController.create);
        this.router.put('/secciones', seccionController.update);
        this.router.delete('/secciones/:id', seccionController.delete);

        //Grados
        this.router.get('/grados', apiController.getGrados);
        this.router.get('/grados/:id', apiController.obtenerGrado);
        this.router.post('/grados', apiController.crearGrado);
        this.router.put('/grados', apiController.actualizarGrado);
        this.router.delete('/grados/:id', apiController.eliminarGrado);
        
    }

}

const apiRoutes = new ApiRoutes();
export default apiRoutes.router;