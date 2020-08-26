"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var seccion_controller_1 = require("../controllers/seccion.controller");
var SeccionRoutes = /** @class */ (function () {
    function SeccionRoutes() {
        this.router = express_1.Router();
    }
    SeccionRoutes.prototype.config = function () {
        // direcciones
        // this.router.get('/', seccionController.seccion);
        this.router.get('/', seccion_controller_1.seccionController.list);
        this.router.get('/:id', seccion_controller_1.seccionController.getOne);
        this.router.post('/', seccion_controller_1.seccionController.create);
        this.router.put('/:id', seccion_controller_1.seccionController.update);
        this.router.delete('/:id', seccion_controller_1.seccionController.delete);
    };
    return SeccionRoutes;
}());
var seccionRoutes = new SeccionRoutes();
exports.default = seccionRoutes.router;
