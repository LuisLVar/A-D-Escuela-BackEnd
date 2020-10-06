import { Request, Response } from 'express';
import pool from '../database';

class AspectoController {

  public async insertarAspecto(req: Request, res: Response) {
    const aspecto = await pool.query('call insertar_aspecto(?)', 
    [req.body.nombre]);        
    res.json(aspecto);
  }

  public async obtenerAspecto(req: Request, res: Response) {
    const aspecto = await pool.query('call obtener_aspecto(?)',
    [req.params.id]);
    res.json(aspecto);
  }

  public async obtenerAspectos(req: Request, res: Response) {
    const aspecto = await pool.query('select * from aspecto');
    res.json(aspecto);
  }
    
  public async actualizarAspecto(req: Request, res: Response) {
    const aspecto = await pool.query('call actualizar_aspecto(?, ?)',[req.body.aspecto, req.body.nombre]);
    res.json(aspecto);
  }

  public async eliminarAspecto(req: Request, res: Response) {
    const aspecto = await pool.query('call eliminar_aspecto(?)',
    [req.params.id]);
    res.json(aspecto);
  }

}

export const aspectoController = new AspectoController();