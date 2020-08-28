"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var apiController_1 = require("../controllers/apiController");
var ApiRoutes = /** @class */ (function() {
    function ApiRoutes() {
        this.router = express_1.Router();
        this.config();
    }
    ApiRoutes.prototype.config = function() {
        //Aqui van las referencias a los get y post.
        this.router.get('/getCiclos', apiController_1.apiController.getCiclos);
        this.router.post('/crearCiclo', apiController_1.apiController.crearCiclo);
        this.router.post('/eliminarCiclo', apiController_1.apiController.eliminarCiclo);
        this.router.post('/materias', apiController_1.apiController.insertarMateria);
        this.router.put('/materias', apiController_1.apiController.actualizarMateria);
        this.router.get('/materias/:id', apiController_1.apiController.obtenerMateria);
        this.router.get('/materias/', apiController_1.apiController.obtenerMaterias);
        this.router.delete('/materias/:id', apiController_1.apiController.eliminarMateria);
        this.router.post('/alumnos', apiController_1.apiController.insertarAlumno);
        this.router.put('/alumnos', apiController_1.apiController.actualizarAlumno);
        this.router.get('/alumnos/:id', apiController_1.apiController.obtenerAlumno);
        this.router.get('/alumnos/', apiController_1.apiController.obtenerAlumnos);
        this.router.delete('/alumnos/:id', apiController_1.apiController.eliminarAlumno);
    };
    return ApiRoutes;
}());
var apiRoutes = new ApiRoutes();
exports.default = apiRoutes.router;