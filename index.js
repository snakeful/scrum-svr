const { express, server } = require('ful-ms-svr');
let port = 3000;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
server.run(port);

let router = express.Router();
server.use(express.static('public'));
server.use('/api/scrum', router);
let db = require('./data/database')();
require('walk-sync')('./logic/project').filter(function(file) {
  return (/\.js$/i).test(file);
}).map(function(file) {
  require('.//logic//project//' + file)(router, db);
});
