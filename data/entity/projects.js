const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'projects',
  schema: 'process',
  table: 'projects',
  fields: ['id', 'name', 'desc', 'productOwnerId', 'scrumMasterId', 'scrumTeam', 'stakeholders', 'statusId'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});