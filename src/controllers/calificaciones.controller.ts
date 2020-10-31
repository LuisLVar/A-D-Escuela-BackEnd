import { Request, Response } from 'express';
import pool from '../database';

class ConductaController {

  public async Tabla_Individual_Conducta_Con_Nota(req: Request, res: Response) {
    const aspecto = await pool.query('call tab_ind_cond_con_notas(?, ?, ?)',
    [req.body.seccion, req.body.alumno, req.body.bloque]);
    res.json(aspecto);
  }

  public async Tabla_Individual_Conducta_Sin_Nota(req: Request, res: Response) {
    const aspecto = await pool.query('call tab_ind_cond_sin_notas(?, ?, ?)',
    [req.body.seccion, req.body.alumno, req.body.bloque]);
    res.json(aspecto);
  }

}

export const conductaController = new ConductaController();