const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'task-status',
  schema: 'process',
  table: 'status',
  fields: ['id', 'name', 'desc'],
  orderBy: 'id',
  operations: {
    getAll: true
  }
});