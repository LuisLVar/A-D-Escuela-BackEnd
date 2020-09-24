import { expect } from "chai"

// las assert tienen la misma funcionalidad qu en jasmine
// no use jasmine dado que no te mucha informacion sobre que pruebas estan bien 
// solo da como puntitos verdes y solo te da mensajes cuando fallan
// y asi no me gusta :p
// esto solo es un archivo de como estaria la estructura basica para hacer su puebas

describe('Hola1', ()=>{
    // funciona
    it('Sumar', ()=>{
        expect(5,'funciona').to.equal(5);
    });
    // falla
    it('Sumar2', ()=>{
        expect(5,'funciona').to.equal(6);
    });
    // falla
    it('Sumar3', ()=>{
        expect(5,'funciona').to.equal(6);
    });
});