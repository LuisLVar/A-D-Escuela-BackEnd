import {Request,response, Response} from 'express';

class IndexController{
    public index(req: Request, res:Response){
        res.json({text:'API is /api'}) 
    }

}
export const indexController = new IndexController();