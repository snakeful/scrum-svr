module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprint-user-stories',
    schema: 'process',
    table: 'sprintUserStories',
    fields: ['id', 'sprintId', 'userStoryId'],
    orderBy: 'sprintId',
    operations: {
      getAll: true,
      getById: true,
      create: true,
      delete: true
    }
  });
};
