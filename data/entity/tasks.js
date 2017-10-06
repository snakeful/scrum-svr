const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'sprints',
  schema: 'process',
  table: 'sprints',
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