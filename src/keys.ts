export default{//encargado de la configuracion de db

  database:{
      host: 'localhost',
      user: process.env.USER_DB,
      password: process.env.PWD_DB,
      database: ''
  }

}