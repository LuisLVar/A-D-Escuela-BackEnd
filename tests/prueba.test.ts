import { expect } from "chai"

// las assert tienen la misma funcionalidad qu en jasmine
// no use jasmine dado que no te mucha informacion sobre que pruebas estan bien 
// solo da como puntitos verdes y solo te da mensajes cuando fallan
// y asi no me gusta :p


describe('Hola1', ()=>{
    it('Sumar', ()=>{
        expect(5,'funciona').to.equal(5);
    });

    it('Sumar2', ()=>{
        expect(5,'funciona').to.equal(6);
    });

    it('Sumar3', ()=>{
        expect(5,'funciona').to.equal(6);
    });
});