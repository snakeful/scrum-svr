module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprints',
    schema: 'process',
    table: 'sprints',
    fields: ['desc'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
