const entityLogic = require('../db-logic');
module.exports = entityLogic({
  resource: 'project-status',
  schema: 'process',
  table: 'projectStatus',
  fields: ['id', 'name', 'desc'],
  orderBy: 'id',
  operations: {
    getAll: true
  }
});