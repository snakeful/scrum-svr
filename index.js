const { express, server } = require('ful-ms-svr');
const pgError = require('pg-error');
let port = 3000;
console.log(`Ejecutando servidor SCRUM. ${process.pid}`);
server.port = port;
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
  },
  pool: {
    min: 1,
    max: 50,
    afterCreate: function(conn, done) {
      conn.connection.parseE = pgError.parse
      conn.connection.parseN = pgError.parse
      conn.connection.on('PgError', function (err) {
        switch (err.severity) {
          case 'ERROR':
          case 'FATAL':
          case 'PANIC': return this.emit('error', err);
          default: return this.emit('notice', err);
        }
      });
      done();
    }
  }
});
require('walk-sync')('./logic/project').filter(function(file) {
  return (/\.js$/i).test(file);
}).map(function(file) {
  require('.//logic//project//' + file)(router, db);
});
