import {Router} from 'express';

import {seccionController} from '../controllers/seccion.controller';

class SeccionRoutes{

    public router = Router();
    
    constructor(){

    }

    config():void{
        // direcciones
        // this.router.get('/', seccionController.seccion);
        this.router.get('/', seccionController.list);
        this.router.get('/:id', seccionController.getOne);
        this.router.post('/', seccionController.create);
        this.router.put('/', seccionController.update);
        this.router.delete('/:id',seccionController.delete);
    }


}

const seccionRoutes = new SeccionRoutes();

export default seccionRoutes.router;