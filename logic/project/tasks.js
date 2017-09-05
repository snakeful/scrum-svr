module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'tasks',
    schema: 'process',
    table: 'tasks',
    fields: ['name', 'desc', 'priorityId', 'statusId'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true,
      delete: true
    }
  });
};
