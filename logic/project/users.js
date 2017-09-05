module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'users',
    schema: 'profile',
    table: 'users',
    fields: ['user', 'firstName', 'lastName'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true
    }
  });
};
