const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'user-stories',
  schema: 'process',
  table: 'userStories',
  fields: ['id', 'name', 'desc', 'projectId', 'priorityId', 'statusId'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});