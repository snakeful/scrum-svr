module.exports = function () {
  const pgError = require('pg-error');
  return require('knex')({
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
};
