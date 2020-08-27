import { Request, Response } from 'express';
import pool from '../database';


class ApiController {
//Materia

public async insertarMateria(req: Request, res: Response) {
  const materia = await pool.query('select insertar_materia(?, ?)', [req.body.nombre, req.body.contenido]);        
      res.json(materia);
}

public async obtenerMateria(req: Request, res: Response) {
  const {id} = req.params;
  const materia = await pool.query('select obtener_materia(?)',[id]);
  res.json(materia);
}

public async obtenerMaterias(req: Request, res: Response) {
  const materia = await pool.query('select * from materia');
  res.json(materia);
}
  
public async actualizarMateria(req: Request, res: Response) {
  let emp = req.body;
  const materia = await pool.query('select actualizar_materia(?, ?, ?)',[emp.id, emp.nombre, emp.contenido]);
  res.json(materia);
}
  
  
public async eliminarMateria(req: Request, res: Response) {
  const {id} = req.params;
  const materia = await pool.query('select eliminar_materia(?)',[id]);
  res.json(materia);
}

public async insertarAlumno(req: Request, res: Response) {
  const materia = await pool.query('select insertar_obtener_alumno(?, ?, ?, ?, ?, ?, ?, ?)', 
  [req.body.nombre, req.body.apellido, req.body.direccion, req.body.telefono, req.body.cui, req.body.encargado, req.body.fecha_nacimiento, req.body.estado]);        
  res.set(materia);
  
}

public async obtenerAlumno(req: Request, res: Response) {
  const {id} = req.params;
  const alumno = await pool.query('SELECT obtener_alumno(?)',[id]);
  res.json(alumno);
}

public async obtenerAlumnos(req: Request, res: Response) {
  const alumno = await pool.query('select * from alumno');
  res.json(alumno);
}
  
public async actualizarAlumno(req: Request, res: Response) {
  let emp = req.body;
  const materia = await pool.query('actualizar_alumno(?, ?, ?, ?, ?, ?, ?, ?, ?)',
  [req.body.alumno, req.body.nombre, req.body.apellido, req.body.direccion, req.body.telefono, req.body.cui, req.body.encargado, req.body.fecha_nacimiento, req.body.estado]);
  res.set(materia);
}
  
  
  public async eliminarAlumno(req: Request, res: Response) {
  const {id} = req.params;
  const materia = await pool.query('eliminar_materia(?)',[id]);
  res.json(materia);
}


//Ciclo

public async getCiclos(req: Request, res: Response) {
  const ciclos = await pool.query('select * from ciclo');        
      res.json(ciclos);
  
}

public async crearCiclo(req: Request, res: Response) {
  let emp = req.body;
  await pool.query('insert into ciclo (anio) values (?)',[emp.year]);
  res.json({estado: true});
  
}

public async eliminarCiclo(req: Request, res: Response) {
  let emp = req.body;
  await pool.query('delete from ciclo where ciclo=?',[emp.ciclo]);
  res.json({estado: true});
}


}

export const apiController = new ApiController();