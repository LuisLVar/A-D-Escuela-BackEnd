import {Request, Response, json} from 'express';
import pool  from '../database';

class AlumnoController{
    
    //alumnos
    public async list(req: Request, res: Response) {
        const alumno = await pool.query('select * from alumno');
        res.json(alumno);
      }
        
      public async update(req: Request, res: Response): Promise<void>{
        const {alumno} = req.params;
        const alumnov = req.body;
        await pool.query('UPDATE alumno set ? WHERE  = ? ', [alumnov, alumno]);
        res.json({
            text: 'the seccion was update'
        });

    }
    
}
export const alumnoController = new AlumnoController();