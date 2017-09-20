module.exports = function (server) {
  server.use('/api/scrum', require('./users'));
}
