import { Request, Response } from 'express';
import pool from '../database';

class CalificacionAspectoController {

  public async insertarCalificacionAspecto(req: Request, res: Response) {
    const calificacion = await pool.query('call insertar_calificacion_aspecto(?, ?, ?, ?, ?)', 
    [ req.body.ab_ib_inscripcion_seccion, req.body.ab_ib_inscripcion_alumno, req.body.ab_ib_bloque,
      req.body.ab_aspecto, req.body.ab_color]);        
    res.json(calificacion);
  }

  public async obtenerCalificacionAspecto(req: Request, res: Response) {
    const calificacion = await pool.query('call obtener_calificacion_aspecto(?, ?, ?, ?)',
    [ req.body.ab_ib_inscripcion_seccion, req.body.ab_ib_inscripcion_alumno, req.body.ab_ib_bloque, req.body.ab_aspecto]);
    res.json(calificacion);
  }

  public async obtenerCalificacionesAspecto(req: Request, res: Response) {
    const calificacion = await pool.query('select * from aspecto_bloque');
    res.json(calificacion);
  }
    
  public async actualizarCalificacionAspecto(req: Request, res: Response) {
    const calificacion = await pool.query('call actualizar_calificacion_aspecto(?, ?, ?, ?, ?)',
    [ req.body.ab_ib_inscripcion_seccion, req.body.ab_ib_inscripcion_alumno, req.body.ab_ib_bloque,
        req.body.ab_aspecto, req.body.ab_color]);      
    res.json(calificacion);
  }

}

export const calificacion_aspectoController = new CalificacionAspectoController();