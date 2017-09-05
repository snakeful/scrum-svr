module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'user-roles',
    schema: 'profile',
    table: 'userRoles',
    fieldId: 'userId',
    fields: ['userId', 'roleId'],
    orderBy: ['userId', 'roleId'],
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true,
      delete: true
    }
  });
};
