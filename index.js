const { express, server } = require('ful-ms-svr');
let port = 3000;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
server.use(require('body-parser').json());
server.run(port);

let router = express.Router();
server.use(express.static('public'));
server.use('/api/scrum', router);
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
require('walk-sync')('./logic/project').filter(function(file) {
  return (/\.js$/i).test(file);
}).map(function(file) {
  console.log(file);
  require('.//logic//project//' + file);
});
