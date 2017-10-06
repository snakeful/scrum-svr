const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'sprints',
  schema: 'process',
  table: 'sprints',
  fields: ['id', 'name', 'start', 'end', 'projectId'],
  orderBy: 'id',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true,
    delete: true
  }
});