const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'tasks',
  schema: 'process',
  table: 'tasks',
  fields: ['id', 'userStoryId', 'name', 'desc', 'parentTaskId', 'statusId', 'userId', 'originId', 'points', 'executedPoints'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});