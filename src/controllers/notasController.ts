import { Request, Response } from 'express';
import pool from '../database';

class NotasController {

  public async notasGrupal(req: Request, res: Response) {
    const notas = await pool.query('call notas_grupal(?, ?, ?)',
      [req.params.seccion, req.params.bloque, req.params.materia]);
    res.json(notas);
  }

  public async notasIndividual(req: Request, res: Response) {
    const notas = await pool.query('call notas_individual(?, ?, ?)',
      [req.params.seccion, req.params.bloque, req.params.alumno]);
    res.json(notas);
  }

  public async notasIndividualMateria(req: Request, res: Response) {
    const notas = await pool.query('call notas_ind_mat(?, ?, ?, ?)',
      [req.params.seccion, req.params.bloque, req.params.materia, req.params.alumno]);
    res.json(notas);
  }

}

export const notasController = new NotasController();