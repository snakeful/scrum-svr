module.exports = function (router, db, config) {
  console.assert(config, 'Configuration must be sent.');
  console.assert(config.table, 'Table must be sent to update table.');
  console.assert(config.fields, 'Fields must be sent to create or update data.');
  console.assert(config.operations && Object.keys(config.operations).length > 1, 'Operations must be sent and have at least one key to set http operations.');
  let $utils = require('./utils');
  config.orderBy = config.orderBy || 'id';
  if (config.operations.getAll) {
    router.get(`/${config.resource}`, (req, res) => {
      (config.schema ? db.withSchema(config.schema) : db)
      .select(req.query.field)
      .from(config.table)
      .orderBy(config.orderBy)
      .offset(req.query.offset || 0)
      .limit(req.query.limit || 100)
      .then((data) => {
        res.json(data);
      }).catch((err) => {
        res.status(500).json({
          err: err,
          scope: req.query.field
        });
      });
    });
  }
  if (config.operations.getById) {
    router.get(`/${config.resource}/:id`, (req, res) => {
      (config.schema ? db.withSchema(config.schema) : db)
      .select(req.query.field)
      .from(config.table)
      .where({
        id: req.params.id
      }).then((data) => {
        if (data.length === 0) {
          return  res.status(404).json({
            msg: 'Record not found'
          });
        }
        res.json(data[0]);
      }).catch((err, data) => {
        res.status(500).json({
          err: err,
          id: req.params.id
        });
      });
    });
  }
  if (config.operations.create) {
    router.post(`/${config.resource}`, (req, res) => {
      let obj = $utils.copyFields(config.fields, req.body);
      (config.schema ? db.withSchema(config.schema) : db)
      .table(config.table)
      .returning('id')
      .insert(obj)
      .then((data) => {
        res.status(201).json(data[0]);
      }).catch((err) => {
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
  }
  if (config.operations.update) {
    router.put(`/${config.resource}/:id`, (req, res) => {
      let obj = $utils.copyFields(config.fields, req.body);
      (config.schema ? db.withSchema(config.schema) : db)
      .table(config.table)
      .where({
        id: req.params.id
      }).update(obj)
      .then((data) => {
        res.json(data);
      }).catch((err) => {
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
  }
  if (config.operations.delete)
  router.delete(`/${config.resource}/:id`, (req, res) => {
    (config.schema ? db.withSchema(config.schema) : db)
    .table(config.table)
    .where({
      id: req.params.id
    }).del()
    .then((data) => {
      res.json(data);
    }).catch((err) => {
      res.status(500).json({
        err: err,
        data: req.body
      });
    });
  });
};
