const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'user-story-status',
  schema: 'process',
  table: 'userStoryStatus',
  fields: ['id', 'name', 'desc'],
  orderBy: 'id',
  operations: {
    getAll: true
  }
});