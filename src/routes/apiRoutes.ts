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
        this.router.get('/getCiclos', apiController.getCiclos);
        this.router.post('/crearCiclo', apiController.crearCiclo);
        this.router.post('/eliminarCiclo', apiController.eliminarCiclo);   
        this.router.post('/materias', apiController.insertarMateria);
        this.router.put('/materias', apiController.actualizarMateria);
        this.router.get('/materias/:id', apiController.obtenerMateria); 
        this.router.get('/materias/', apiController.obtenerMaterias);
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