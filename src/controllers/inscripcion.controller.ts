import { Request, Response } from 'express';
import pool from '../database';

class InscripcionController {

  public async insertarInscripcion(req: Request, res: Response) {
    const inscripcion = await pool.query('call insertar_inscripcion(?, ?)', 
    [req.params.seccion, req.params.alumno]);        
    res.json(inscripcion);
  }

  public async obtenerInscripcion(req: Request, res: Response) {
    const inscripcion = await pool.query('call obtener_inscripcion(?,?)', 
    [req.params.seccion, req.params.alumno]);
    res.json(inscripcion);
  }

  public async obtenerInscripciones(req: Request, res: Response) {
    const inscripcion = await pool.query('select * from inscripcion');
    res.json(inscripcion);
  }

  public async eliminarInscripcion(req: Request, res: Response) {
    const inscripcion = await pool.query('call borrar_inscripcion(?,?)', 
    [req.params.seccion, req.params.alumno]);
    res.json(inscripcion);
  }

}

export const inscripcionController = new InscripcionController();