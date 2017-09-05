module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'tasks',
    schema: 'process',
    table: 'tasks',
    fields: ['userStoryId', 'name', 'desc','parentTaskId', 'statusId', 'userId', 'originId', 'points', 'burnedPoints'],
    orderBy: ['id', 'userStoryId'],
    operations: {
      getAll: true,
      getById: true,
      create: true,
      update: true,
      delete: true
    }
  });
};
