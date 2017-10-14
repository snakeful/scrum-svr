const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'origins',
  schema: 'process',
  table: 'origins',
  fields: ['id', 'name', 'desc'],
  orderBy: 'id',
  operations: {
    getAll: true
  }
});