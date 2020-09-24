
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
});