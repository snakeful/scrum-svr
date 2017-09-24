const entity = require('../db-logic');
module.exports = entity({
  resource: 'users',
  schema: 'profile',
  table: 'users',
  fields: ['id', 'user', 'firstName', 'lastName', 'roleId'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true
  }
});