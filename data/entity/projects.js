const entity = require('../db-logic');
module.exports = entity({
  resource: 'projects',
  schema: 'process',
  table: 'projects',
  fields: ['id', 'name', 'desc', 'productOwnerId', 'scrumMasterId', 'scrumTeam', 'stakeholders'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});