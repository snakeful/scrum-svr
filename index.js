const { express, server } = require('ful-ms-svr');
let port = 3000;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
server.use(require('body-parser').json());
server.run(port);

let router = express.Router();
server.use(express.static('public'));
server.use('/api/histories', router);
let db = require('./data/database')({
  client: 'pg',
  version: '9.6',
  connection: {
    host : '127.0.0.1',
    user : 'postgres',
    password : '50l1d5nAk3',
    database : 'fulscrum'
  }
});
require('./logic/history/priorities')(router, db);
