import { Request, Response } from 'express';
import pool from '../database';

class ColorController {

  public async insertarColor(req: Request, res: Response) {
    const color = await pool.query('call insertar_color(?, ?)', [req.body.nombre, req.body.significado]);        
    res.json(color);
  }

  public async obtenerColor(req: Request, res: Response) {
    const color = await pool.query('call obtener_color(?)',
    [req.params.id]);
    res.json(color);
  }

  public async obtenerColores(req: Request, res: Response) {
    const color = await pool.query('select * from color');
    res.json(color);
  }
    
  public async actualizarColor(req: Request, res: Response) {
    const color = await pool.query('call actualizar_color(?, ?, ?)',
    [req.body.color, req.body.nombre, req.body.significado]);
    res.json(color);
  }

  public async eliminarColor(req: Request, res: Response) {
    const color = await pool.query('call eliminar_color(?)',
    [req.params.id]);
    res.json(color);
  }

}

export const colorController = new ColorController();