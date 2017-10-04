const { express, server } = require('ful-ms-svr');
let port = 4201;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
server.run(port);

let router = express.Router();
server.use(express.static('public'));
server.use((req, res, next) => {
  if (req.query.where) {
    try {
      req.query.where = JSON.parse(req.query.where);
    } catch (ex) {
      console.log(ex);
      return res.status(400).json({
        err: 'where query param must be a JSON object. Cannot parse JSON.',
        msg: ex.message,
        stack: ex.stack
      });
    }
  }
  next();
});
require('./logic/project/resource')(server);
server.get('*', (req, res, next) => {
  if (!res.headersSent) {
    res.status(404).json({
      err: 'Url not found on FUL-SCRUM server'
    });
  }
  next();
})
