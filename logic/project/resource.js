module.exports = function (server) {
  server.use('/api', require('./roles'));
  server.use('/api', require('./users'));
  server.use('/api', require('./projects'));
  server.use('/api', require('./user-stories'));
  server.use('/api', require('./sprints'));
}
