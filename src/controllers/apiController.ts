import { Request, Response } from 'express';
import pool from '../database';


class ApiController {

//Ciclo

public async getCiclos(req: Request, res: Response) {
  const ciclos = await pool.query('select * from ciclo');        
      res.json(ciclos);
}

public async crearCiclo(req: Request, res: Response) {
  const ciclo = await pool.query('call insertar_ciclo(?)', [req.body.anio]);        
      res.json(ciclo);
}

public async obtenerCiclo(req: Request, res: Response) {
  const {id} = req.params;
  const ciclo = await pool.query('call obtener_ciclo(?)',[id]);
  res.json(ciclo);
}

public async actualizarCiclo(req: Request, res: Response) {
  let emp = req.body;
  const ciclo = await pool.query('call actualizar_ciclo(?, ?)',[emp.ciclo, emp.anio]);
  res.json(ciclo);
}
  
  
  public async eliminarCiclo(req: Request, res: Response) {
  const {id} = req.params;
  const ciclo = await pool.query('call eliminar_ciclo(?)',[id]);
  res.json(ciclo);
}


}

export const apiController = new ApiController();