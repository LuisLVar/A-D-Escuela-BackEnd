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
    }

}

const apiRoutes = new ApiRoutes();
export default apiRoutes.router;