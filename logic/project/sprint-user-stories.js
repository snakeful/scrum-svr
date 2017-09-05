module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprints-user-stories',
    schema: 'process',
    table: 'sprintsUserStories',
    fields: ['sprintId', 'userStoryId'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
