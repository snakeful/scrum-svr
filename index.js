const { express, server } = require('ful-ms-svr');
let port = 4201;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
server.run(port);

let router = express.Router();
server.use(express.static('public'));
require('./logic/project/resource')(server);
