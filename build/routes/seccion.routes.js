"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var SeccionRoutes = /** @class */ (function () {
    function SeccionRoutes() {
        this.router = express_1.Router();
    }
    SeccionRoutes.prototype.config = function () {
        // direcciones
        // this.router.get('/', seccionController.seccion);
    };
    return SeccionRoutes;
}());
var seccionRoutes = new SeccionRoutes();
exports.default = seccionRoutes.router;
