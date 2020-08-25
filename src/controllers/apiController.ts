import { Request, Response } from 'express';
import pool from '../database';


class ApiController {

//Ciclo

public async getCiclos(req: Request, res: Response) {
  const ciclos = await pool.query('select * from ciclo');        
      res.json(ciclos);
  
}

public async crearCiclo(req: Request, res: Response) {
  let emp = req.body;
  const ciclo = await pool.query('insert into ciclo (anio) values (?)',[emp.year]);
      res.json(ciclo);
  
}

public async eliminarCiclo(req: Request, res: Response) {
  let emp = req.body;
  const ciclo = await pool.query('delete from ciclo where ciclo=?',[emp.ciclo]);
  res.json(ciclo);
}


}

export const apiController = new ApiController();