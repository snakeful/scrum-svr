const $db = require('./database');
const $utils = require('./utils');
module.exports = function (config) {
  console.assert(config, 'Configuration must be sent.');
  console.assert(config.table, 'Table must be sent to update table.');
  console.assert(config.fields, 'Fields must be sent to create or update data.');
  const entity = {};
  config.fieldId = config.fieldId || 'id';
  config.orderBy = config.orderBy || 'id';
  if (config.operations.getAll) {
    entity.getAll = function (fields, offset = 0, limit = 100) {
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .select(fields || config.fields)
        .from(config.table)
        .orderBy(config.orderBy)
        .offset(offset)
        .limit(limit);
    };
  }
  if (config.operations.getById) {
    entity.getById = function (fields) {
      const where = {};
      where[config.fieldId] = req.params[config.fieldId];
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .select(config.fields || fields)
        .from(config.table)
        .where(where);
    };
  }
  if (config.operations.create) {
    entity.insert = function (object) {
      let obj = $utils.copyFields(config.fields, object);
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .returning(config.fieldId)
        .insert(obj);
    };
  }
  if (config.operations.update) {
    entity.update = function (object) {
      let obj = $utils.copyFields(config.fields, object);
      const where = {};
      where[config.fieldId] = object[config.fieldId];
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .where(where)
        .update(obj);
    };
  }
  if (config.operations.delete) {
    entity.delete = function (object) {
      const where = {};
      where[config.fieldId] = req.params[config.fieldId];
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .where(where)
        .del();
    };
  }
  return entity;
};
