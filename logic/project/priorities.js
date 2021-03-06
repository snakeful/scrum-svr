module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'priorities',
    schema: 'process',
    table: 'priorities',
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
