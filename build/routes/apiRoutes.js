"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var apiController_1 = require("../controllers/apiController");
var ApiRoutes = /** @class */ (function () {
    function ApiRoutes() {
        this.router = express_1.Router();
        this.config();
    }
    ApiRoutes.prototype.config = function () {
        //Aqui van las referencias a los get y post.
        this.router.get('/ciclos', apiController_1.apiController.getCiclos);
        this.router.post('/ciclos', apiController_1.apiController.crearCiclo);
        this.router.delete('/ciclos', apiController_1.apiController.eliminarCiclo);
        this.router.get('/ciclos/:id', apiController_1.apiController.obtenerCiclo);
        this.router.put('/ciclos', apiController_1.apiController.actualizarCiclo);
    };
    return ApiRoutes;
}());
var apiRoutes = new ApiRoutes();
exports.default = apiRoutes.router;
