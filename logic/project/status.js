module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'status',
    schema: 'process',
    table: 'status',
    fields: ['desc'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
