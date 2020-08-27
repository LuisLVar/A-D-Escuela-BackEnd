import {Router} from 'express';

import {alumnoController} from '../controllers/alumnos.controller';

class AlumnoRoutes{

    public router = Router();
    
    constructor(){

    }

    config():void{
        this.router.get('/', alumnoController.list);
        this.router.put('/:id', alumnoController.update);

    }


}

const alumnoRoutes = new AlumnoRoutes();

export default alumnoRoutes.router;