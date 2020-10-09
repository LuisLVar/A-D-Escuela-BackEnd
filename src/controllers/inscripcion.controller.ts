import { Request, Response } from 'express';
import pool from '../database';

class InscripcionController {

  public async insertarInscripcion(req: Request, res: Response) {
    const inscripcion = await pool.query('call insertar_inscripcion(?, ?)',
      [req.body.seccion, req.body.alumno]);

    //Bloque
    await pool.query(`call inscripcion_bloque(?, ?, 1)`,
      [req.body.seccion, req.body.alumno]);

    await pool.query(`call inscripcion_bloque(?, ?, 2)`,
      [req.body.seccion, req.body.alumno]);

    await pool.query(`call inscripcion_bloque(?, ?, 3)`,
      [req.body.seccion, req.body.alumno]);

    await pool.query(`call inscripcion_bloque(?, ?, 4)`,
      [req.body.seccion, req.body.alumno]);

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

  public async obtenerAlumnosSeccionBloque(req: Request, res: Response) {
    const inscripcion = await pool.query('call listar_grado_bloque(?,?)',
      [req.params.seccion, req.params.bloque]);
    res.json(inscripcion);
  }

}

export const inscripcionController = new InscripcionController();