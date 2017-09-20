module.exports = function (router, entity) {
  if (entity.getAll) {
    router.get(`/${entity.resource}`, (req, res) => {
      entity.getAll(req.query.field, req.query.offset, req.query.limit)
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
  if (entity.getById) {
    router.get(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      entity.getById(req.query.field, req.params[entity.fieldId])
      .then((data) => {
        if (data.length === 0) {
          return  res.status(404).json({
            msg: 'Record not found'
          });
        }
        res.json(data[0]);
      }).catch((err, data) => {
        res.status(500).json({
          err: err,
          id: req.params[entity.fieldId]
        });
      });
    });
  }
  if (entity.insert) {
    router.post(`/${entity.resource}`, (req, res) => {
      entity.insert(req.body)
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
  if (entity.update) {
    router.put(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      entity.update(req.body)
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
  if (entity.delete)
  router.delete(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
    entity.delete(req.params[entity.fieldId])
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
