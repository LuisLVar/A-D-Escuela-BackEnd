import {Request, Response} from 'express';
import pool  from '../database';

class SeccionController{
    
    public seccion(req: Request, res: Response){
        res.json({
            text: 'api/seccion'
        });
    }
}


export const seccionController = new SeccionController();