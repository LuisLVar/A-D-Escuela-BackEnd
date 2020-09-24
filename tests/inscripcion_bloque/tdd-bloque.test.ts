
import chai, { assert, expect } from 'chai';
import chaiHttp from 'chai-http';
const url = 'http://3.20.3.133:3010'
chai.use(chaiHttp);


describe.only('Prueba servicio inscripcion bloques', ()=>{
    it('Verificar el listado', async ()=>{
        let res: any = await chai.request(url)
        .get('/api/bloques');
        console.log(res);
        assert.isDefined(res.length,'variable definida');
    });

    it('Verificar la asignacion de bloque', async ()=> {
        let parametros = {
            id: 0,
            noBloque: 1,
            idSeccion: 2
        }
        let res: any = await chai.request(url)
        .post('/api/bloques')
        .send(parametros);
        console.log(res);
        let operacion: any = res[0];
        expect(operacion.codigo).to.equal(200);

    });

    it("Obtener alumnos de una seccion", async ()=>{
        let parametros = {
            idSeccion: 1,
            noBloque: 1
        };
        let res: any = await chai.request(url)
        .post('api/bloques')
        .send(parametros);
        console.log(res);
        assert.isDefined(res.length,'variable definida');
    });

});
