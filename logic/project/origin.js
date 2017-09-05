module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'origins',
    schema: 'process',
    table: 'origins',
    fields: ['desc'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true
    }
  });
};
