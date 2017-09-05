module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprints',
    schema: 'process',
    table: 'sprints',
    fields: ['name', 'start', 'end', 'projectId'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true,
      insert: true,
      update: true,
      delete: true
    }
  });
};
