module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'roles',
    schema: 'profile',
    table: 'roles',
    fields: ['name'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
