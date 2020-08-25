import {Router} from 'express';

import {seccionController} from '../controllers/seccion.controller';

class SeccionRoutes{

    public router = Router();
    
    constructor(){

    }

    config():void{
        // direcciones
        this.router.get('/', seccionController.seccion);
    }


}

const seccionRoutes = new SeccionRoutes();

export default seccionRoutes.router;