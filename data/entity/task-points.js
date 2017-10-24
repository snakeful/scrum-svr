const entityLogic = require('../db-logic');
module.exports = entityLogic({
  schema: 'process',
  table: 'taskPoints',
  fields: ['taskId', 'date', 'points'],
  fieldId: ['taskId', 'date'],
  orderBy: 'taskId',
  operations: {
    getAll: true,
    getById: true,
    create: true,
    update: true
  }
});