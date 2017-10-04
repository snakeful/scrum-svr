const $db = require('./database');
const $utils = require('./utils');
module.exports = function (config) {
  console.assert(config, 'Configuration must be sent.');
  console.assert(config.table, 'Table must be sent to update table.');
  console.assert(config.fields, 'Fields must be sent to create or update data.');
  const entity = {
    resource: config.resource,
    fieldId: config.fieldId || 'id'
  };
  config.orderBy = config.orderBy || 'id';
  if (config.operations.getAll) {
    entity.getAll = function (fields, offset = 0, limit = 100, where) {
      let query = (config.schema ? $db.withSchema(config.schema) : $db)
        .select(fields || config.fields)
        .from(config.table)
        .orderBy(config.orderBy)
        .offset(offset)
        .limit(limit);
      if (where) {
        query = query.where(where);
      }
      return query;
    };
    entity.onGetAll = config.onGetAll ? config.onGetAll : data => {
      return Promise.resolve(data);
    }
  }
  if (config.operations.getById) {
    entity.getById = function (fields, id) {
      const where = {};
      where[entity.fieldId] = id;
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .select(config.fields || fields)
        .from(config.table)
        .where(where);
    };
    entity.onGetById = config.onGetById ? config.onGetById : data => {
      return Promise.resolve(data);
    }
  }
  if (config.operations.create) {
    entity.insert = function (object) {
      let obj = $utils.copyFields(config.fields, object);
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .returning(entity.fieldId)
        .insert(obj);
    };
  }
  if (config.operations.update) {
    entity.update = function (object) {
      let obj = $utils.copyFields(config.fields, object);
      const where = {};
      where[entity.fieldId] = object[entity.fieldId];
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .where(where)
        .update(obj);
    };
  }
  if (config.operations.delete) {
    entity.delete = function (object) {
      const where = {};
      where[entity.fieldId] = req.params[entity.fieldId];
      return (config.schema ? $db.withSchema(config.schema) : $db)
        .table(config.table)
        .where(where)
        .del();
    };
  }
  return entity;
};
