const entityLogic = require('../db-logic');
module.exports = entityLogic({
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