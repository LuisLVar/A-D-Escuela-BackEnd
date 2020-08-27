"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var ApiRoutes = /** @class */ (function () {
    function ApiRoutes() {
        this.router = express_1.Router();
        this.config();
    }
    ApiRoutes.prototype.config = function () {
        //Aqui van las referencias a los get y post.
    };
    return ApiRoutes;
}());
var apiRoutes = new ApiRoutes();
exports.default = apiRoutes.router;
