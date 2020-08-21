import mysql from 'promise-mysql';
import keys from './keys';

const pool = mysql.createPool(keys.database);//modulo de conexion de la base de datos
//pool servira para comenzar la conexion
pool.getConnection()
        .then(connection =>{
            pool.releaseConnection(connection);
            console.log('DB is connected');
    });
    
export default pool;
    