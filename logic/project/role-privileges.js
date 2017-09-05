module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'role-privileges',
    schema: 'profile',
    table: 'rolePrivileges',
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
