import { Request, Response, json } from 'express';
import pool from '../database';

class SeccionController {

    public seccion(req: Request, res: Response) {
        res.json({
            text: 'api/seccion'
        });
    }

    public async list(req: Request, res: Response): Promise<void> {
        const secciones = await pool.query('SELECT * FROM seccion');
        res.json(secciones);
    }

    public async getOne(req: Request, res: Response): Promise<any> {
        const { id } = req.params;
        const secciones = await pool.query('call obtener_seccion(?)', [id]);
        res.json(secciones);
    }

    public async create(req: Request, res: Response): Promise<void> {
        const result = await pool.query('call insertar_seccion(?, ?, ?, ?, ?)', [req.body.nombre,
        req.body.estado, req.body.grado, req.body.personal, req.body.ciclo]);
        res.json(result);
    }

    public async update(req: Request, res: Response): Promise<void> {
        const param = req.body;
        const result = await pool.query('call actualizar_seccion(?, ?, ?, ?, ?, ?)', [param.seccion, param.nombre,
        param.estado, param.grado, param.personal, param.ciclo]);
        res.json(result);

    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const result = await pool.query('call eliminar_seccion(?)', [id]);
        res.json(result);
    }

    //Seccion - Personal
    public async seccionPersonal(req: Request, res: Response) {
        const seccion_personal = await pool.query(`SELECT s.seccion as idSeccion, s.nombre as nombreSeccion, g.grado as idGrado,
            g.nombre_grado as nombreGrado, p.personal as idPersonal, p.nombre as nombrePersonal,
           p.apellido as apellidoPersonal, c.ciclo as idCiclo, c.anio as anio
           FROM seccion s 
           INNER JOIN grado g 
           ON s.seccion_grado = g.grado
           INNER JOIN personal p 
           ON s.seccion_personal = p.personal
           INNER JOIN ciclo c 
           ON s.seccion_ciclo = c.ciclo
           WHERE p.personal = ? and c.anio = ?`, [req.body.personal, req.body.anio]);
        res.json(seccion_personal);
    }
}


export const seccionController = new SeccionController();