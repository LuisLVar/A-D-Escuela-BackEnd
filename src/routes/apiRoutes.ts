import { Router } from 'express';
import { apiController } from '../controllers/apiController';
import pool from '../database';

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


        
    }

}

const apiRoutes = new ApiRoutes();
export default apiRoutes.router;