import chai, {expect} from 'chai';
import chaiHttp from 'chai-http';
chai.use(chaiHttp);
const url = 'http://3.20.3.133:3010';

describe('Listar Bloques', ()=>{

    let res: any ;

    //@Given
    it('Que se quiera ver los bloques', async() =>{
        expect(url).to.equal(url);
    });

    //@When
    it('Realizar una solicitud a los datos para extraer los bloques', async ()=>{
        res = await chai.request(url)
        .get('/api/bloques');
        console.log(res);
        expect(res).not.null;
    });

    //@Then
    it('Obtener una lista de bloques', async ()=>{
        expect(res.length).not.undefined;
    })
});

describe('Listar bloques y no existan', ()=>{

    let res: any ;

    //@Given
    it('Que se quiera ver los bloques', async() =>{
        expect(url).to.equal(url);
    });

    //@When
    it('realizar una solicitud a los datos para extraer los bloques', async ()=>{
        res = await chai.request(url)
        .get('/api/bloques');
        console.log(res);
        expect(res).not.null;
    });

    //@Then
    it('Obtener un informacion vacia', async ()=>{
        expect(res.length).to.undefined;
    });
});


describe('Creacion de un bloque', () =>{
    let res: any ;
    
    //@Given 
    it('Que se quiera crear un nuevo bloque', async() =>{
        expect(url).to.equal(url);
    });

    //@When 
    it('Enviar los datos a la base y que se registre', async () =>{
        let parametros = {
            id: 0,
            noBloque: 1,
            idSeccion: 2
        }
        res = await chai.request(url)
        .post('/api/bloques')
        .send(parametros);
        expect(res).not.null;
    });

    //@Then 
    it('Obtener un codigo del estado de la operacion', async ()=>{
        let operacion: any = res[0];
        expect(operacion.codigo).to.equal(200);
    });

})
