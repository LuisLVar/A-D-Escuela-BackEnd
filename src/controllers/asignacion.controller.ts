import { Request, Response } from 'express';
import pool from '../database';

class CalificacionController {

  public async insertarCalificacion(req: Request, res: Response) {
    const calificacion = await pool.query('call insertar_calificacion(?, ?, ?, ?, ?, ?, ?, ?)', 
    [ req.body.as_ib_inscripcion_seccion, req.body.as_ib_inscripcion_alumno, req.body.as_ib_bloque,
      req.body.as_materia, req.body.zona, req.body.proyecto, req.body.nota_final, req.body.promedio]);        
    res.json(calificacion);
  }

  public async obtenerCalificacion(req: Request, res: Response) {
    const calificacion = await pool.query('call obtener_calificacion(?, ?, ?, ?)',
    [ req.body.as_ib_inscripcion_seccion, req.body.as_ib_inscripcion_alumno, req.body.as_ib_bloque, req.body.as_materia]);
    res.json(calificacion);
  }

  public async obtenerCalificaciones(req: Request, res: Response) {
    const calificacion = await pool.query('select * from asignacion');
    res.json(calificacion);
  }
    
  public async actualizarCalificacion(req: Request, res: Response) {
    const calificacion = await pool.query('call actualizar_calificacion(?, ?, ?, ?, ?, ?, ?, ?)',
    [ req.body.as_ib_inscripcion_seccion, req.body.as_ib_inscripcion_alumno, req.body.as_ib_bloque,
      req.body.as_materia, req.body.zona, req.body.proyecto, req.body.nota_final, req.body.promedio]);        
    res.json(calificacion);
  }

}

export const calificacionController = new CalificacionController();