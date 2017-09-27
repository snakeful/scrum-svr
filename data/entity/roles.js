const entity = require('../db-logic');
module.exports = entity({
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