module.exports = function (server) {
  /**
   * CRUD's
   */
  server.use('/api', require('./roles'));
  server.use('/api', require('./users'));
  server.use('/api', require('./project-status'));
  server.use('/api', require('./projects'));
  server.use('/api', require('./user-stories'));
  server.use('/api', require('./user-story-status'));
  server.use('/api', require('./sprints'));
  server.use('/api', require('./sprint-user-stories'));
  server.use('/api', require('./tasks'));
  server.use('/api', require('./task-status'));
  server.use('/api', require('./origins'));
  /**
   * Reports
   */
  server.use('/api/reports', require('./burndown-chart'));
}
