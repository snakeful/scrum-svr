module.exports = function (server) {
  server.use('/api', require('./users'));
  server.use('/api', require('./projects'));
}