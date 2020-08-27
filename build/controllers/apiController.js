"use strict";
<<<<<<< HEAD
Object.defineProperty(exports, "__esModule", { value: true });
exports.apiController = void 0;
var ApiController = /** @class */ (function () {
    function ApiController() {
    }
=======
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.apiController = void 0;
var database_1 = __importDefault(require("../database"));
var ApiController = /** @class */ (function () {
    function ApiController() {
    }
    //Materia
    ApiController.prototype.insertarMateria = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var materia;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, database_1.default.query('call insertar_materia(?, ?)', [req.body.nombre, req.body.contenido])];
                    case 1:
                        materia = _a.sent();
                        res.json(materia);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.obtenerMateria = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var id, materia;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        id = req.params.id;
                        return [4 /*yield*/, database_1.default.query('call obtener_materia(?)', [id])];
                    case 1:
                        materia = _a.sent();
                        res.json(materia);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.obtenerMaterias = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var materia;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, database_1.default.query('select * from materia')];
                    case 1:
                        materia = _a.sent();
                        res.json(materia);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.actualizarMateria = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var emp, materia;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        emp = req.body;
                        return [4 /*yield*/, database_1.default.query('call actualizar_materia(?, ?, ?)', [emp.id, emp.nombre, emp.contenido])];
                    case 1:
                        materia = _a.sent();
                        res.json(materia);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.eliminarMateria = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var id, materia;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        id = req.params.id;
                        return [4 /*yield*/, database_1.default.query('call eliminar_materia(?)', [id])];
                    case 1:
                        materia = _a.sent();
                        res.json(materia);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.insertarAlumno = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var alumno;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, database_1.default.query('call insertar_obtener_alumno(?, ?, ?, ?, ?, ?, ?, ?)', [req.body.nombre, req.body.apellido, req.body.direccion, req.body.telefono, req.body.cui, req.body.encargado, req.body.fecha_nacimiento, req.body.estado])];
                    case 1:
                        alumno = _a.sent();
                        res.json(alumno);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.obtenerAlumno = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var id, alumno;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        id = req.params.id;
                        return [4 /*yield*/, database_1.default.query('call obtener_alumno(?)', [id])];
                    case 1:
                        alumno = _a.sent();
                        res.json(alumno);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.obtenerAlumnos = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var alumno;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, database_1.default.query('select * from alumno')];
                    case 1:
                        alumno = _a.sent();
                        res.json(alumno);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.actualizarAlumno = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var emp, alumno;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        emp = req.body;
                        return [4 /*yield*/, database_1.default.query('call actualizar_alumno(?, ?, ?, ?, ?, ?, ?, ?, ?)', [req.body.alumno, req.body.nombre, req.body.apellido, req.body.direccion, req.body.telefono, req.body.cui, req.body.encargado, req.body.fecha_nacimiento, req.body.estado])];
                    case 1:
                        alumno = _a.sent();
                        res.json(alumno);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.eliminarAlumno = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var id, alumno;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        id = req.params.id;
                        return [4 /*yield*/, database_1.default.query('call eliminar_alumno(?)', [id])];
                    case 1:
                        alumno = _a.sent();
                        res.json(alumno);
                        return [2 /*return*/];
                }
            });
        });
    };
    //Ciclo
    ApiController.prototype.getCiclos = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var ciclos;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, database_1.default.query('select * from ciclo')];
                    case 1:
                        ciclos = _a.sent();
                        res.json(ciclos);
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.crearCiclo = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var emp;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        emp = req.body;
                        return [4 /*yield*/, database_1.default.query('insert into ciclo (anio) values (?)', [emp.year])];
                    case 1:
                        _a.sent();
                        res.json({ estado: true });
                        return [2 /*return*/];
                }
            });
        });
    };
    ApiController.prototype.eliminarCiclo = function (req, res) {
        return __awaiter(this, void 0, void 0, function () {
            var emp;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        emp = req.body;
                        return [4 /*yield*/, database_1.default.query('delete from ciclo where ciclo=?', [emp.ciclo])];
                    case 1:
                        _a.sent();
                        res.json({ estado: true });
                        return [2 /*return*/];
                }
            });
        });
    };
>>>>>>> 21cfeead8ebb7bd8963abdb2fc5a1daef668a46b
    return ApiController;
}());
exports.apiController = new ApiController();
