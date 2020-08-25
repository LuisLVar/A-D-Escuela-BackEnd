import {Request, Response, json} from 'express';
import pool  from '../database';

class SeccionController{
    
    public seccion(req: Request, res: Response){
        res.json({
            text: 'api/seccion'
        });
    }

    public async list(req: Request, res: Response): Promise<void>{
        const secciones = await pool.query('SELECT * FROM seccion');
        res.json(secciones);
    }

    public async getOne(req: Request, res: Response): Promise<any>{
        const {id} = req.params;
        const secciones = await pool.query('SELECT * FROM seccion WHERE seccion = ?',[id]);
        if(secciones.length > 0){
            return res.json(secciones[0]);
        }
        res.status(404).json({
            text: "the game doesn't exits "
        });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const result = await pool.query('INSERT INTO seccion set ?', [req.body]);
        res.json({
            text: 'seccion save'
        });

    }

    public async update(req: Request, res: Response): Promise<void>{
        const {id} = req.params;
        const oldseccion = req.body;
        await pool.query('UPDATE seccion set ? WHERE seccion = ? ', [oldseccion, id]);
        res.json({
            text: 'the seccion was update'
        });

    }

    public async delete(req: Request, res: Response): Promise<void>{
        const {id} = req.params ; 
        await pool.query('DELETE FROM seccion WHERE seccion = ?', [id]);
        res.json({
            text: ' the seccion was delete'
        });
    }
}


export const seccionController = new SeccionController();