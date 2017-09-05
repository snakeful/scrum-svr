module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'role-privileges',
    schema: 'profile',
    table: 'rolePrivileges',
    fields: ['roleId', 'create', 'read', 'udapte', 'delete', 'execute'],
    orderBy: 'roleId',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true
    }
  });
};
