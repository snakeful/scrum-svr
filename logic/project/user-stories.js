module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'user-stories',
    schema: 'process',
    table: 'userStories',
    fields: ['name', 'desc', 'priorityId', 'statusId'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true,
      delete: true
    }
  });
};