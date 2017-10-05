const entity = require('../db-logic');
module.exports = entity({
  resource: 'sprint-user-stories',
  schema: 'process',
  table: 'sprintUserStories',
  fields: ['id', 'sprintId', 'userStoryId'],
  orderBy: 'sprintId',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    delete: true
  }
});