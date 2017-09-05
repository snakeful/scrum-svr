module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprint-user-stories',
    schema: 'process',
    table: 'sprintUserStories',
    fields: ['sprintId', 'userStoryId'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
