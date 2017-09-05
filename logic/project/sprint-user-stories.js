module.exports = function (router, db) {
  return require('../resource')(router, db, {
    resource: 'sprints-user-stories',
    schema: 'process',
    table: 'sprints-user-stories',
    fields: ['desc'],
    orderBy: 'id',
    operations: {
      getAll: true,
      getById: true
    }
  });
};
