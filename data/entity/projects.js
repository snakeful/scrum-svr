const entity = require('../db-logic');
module.exports = entity({
  resource: 'projects',
  schema: 'process',
  table: 'projects',
  fields: ['name', 'stakeholderId', 'productOwnerId', 'scrumMasterId'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});