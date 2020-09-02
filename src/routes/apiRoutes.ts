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
        this.router.get('/secciones', seccionController.list);
        this.router.get('/secciones/:id', seccionController.getOne);
        this.router.post('/secciones', seccionController.create);
        this.router.put('/secciones', seccionController.update);
        this.router.delete('/secciones/:id', seccionController.delete);
        
    }

}

const apiRoutes = new ApiRoutes();
export default apiRoutes.router;