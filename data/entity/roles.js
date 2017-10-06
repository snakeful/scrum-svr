const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'roles',
  schema: 'profile',
  table: 'roles',
  fields: ['id', 'name'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true
  }
});