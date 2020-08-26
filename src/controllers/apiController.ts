import { Request, Response } from 'express';
import pool from '../database';


class ApiController {
//Materia

public async insertarMateria(req: Request, res: Response) {
  const materia = await pool.query('SELECT insertar_materia(?, ?)', [req.body.nombre, req.body.contenido]);        
      res.json(materia);
  
}

public async obtenerMateria(req: Request, res: Response) {
  const {id} = req.params;
  const materia = await pool.query('SELECT obtener_materia(?)',[id]);
  res.json(materia);
  
}

public async obtenerMaterias(req: Request, res: Response) {
  const materia = await pool.query('select * from materia');
  res.json(materia);
}
  
public async actualizarMateria(req: Request, res: Response) {
  let emp = req.body;
  const materia = await pool.query('SELECT actualizar_materia(?, ?, ?)',[emp.id, emp.nombre, emp.contenido]);
  res.json(materia);
}
  
  
  public async eliminarMateria(req: Request, res: Response) {
  let emp = req.body;
  const materia = await pool.query('SELECT eliminar_materia(?)',[emp.id]);
  res.json(materia);
}


}

export const apiController = new ApiController();