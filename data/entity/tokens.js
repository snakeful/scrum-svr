const entityLogic = require('../db-logic');
module.exports = entityLogic({
  schema: 'profile',
  table: 'tokens',
  fields: ['id', 'salt', 'toekn', 'expiration'],
  orderBy: 'id',
  operations: {
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});