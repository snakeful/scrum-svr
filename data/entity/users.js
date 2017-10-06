const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'users',
  schema: 'profile',
  table: 'users',
  fields: ['id', 'user', 'firstName', 'lastName', 'email', 'admin'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true
  }
});