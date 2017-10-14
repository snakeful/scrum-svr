const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'status',
  schema: 'process',
  table: 'status',
  fields: ['id', 'name', 'desc'],
  orderBy: 'id',
  operations: {
    getAll: true
  }
});