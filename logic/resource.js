module.exports = function (router, entity) {
  if (entity.getAll) {
    router.get(`/${entity.resource}`, (req, res) => {
      entity.getAll(null, req.query.field, req.query.offset, req.query.limit, req.query.where).then(data => {
        entity.onGetAll(null, data).then(() => {
          res.json(data);
        });
      }).catch(err => {
        res.status(500).json({
          err: err,
          scope: req.query.field
        });
      });
    });
  }
  if (entity.getById) {
    router.get(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      entity.getById(null, req.query.field, req.params[entity.fieldId]).then(data => {
        if (data.length === 0) {
          return res.status(404).json({
            msg: 'Record not found'
          });
        }
        entity.onGetById(null, data[0]).then(() => {
          res.json(data[0]);
        })
      }).catch(err => {
        res.status(500).json({
          err: err,
          id: req.params[entity.fieldId]
        });
      });
    });
  }
  if (entity.insert) {
    router.post(`/${entity.resource}`, (req, res) => {
      const data = {
        new: req.body
      };
      let trx;
      entity.trx(trxp => {
        trx = trxp;
        return entity.beforeInsert(trx, data).then(() => {
          return entity.insert(trx, data.new);
        }).then(inserted => {
          return entity.afterInsert(trx, data, inserted).then(() => {
            res.status(201).json(inserted[0]);
          });
        });
      }).catch(err => {
        trx.rollback();
        res.status(500).json({
          err: err,
          data: data.new
        });
      });;
    });
  }
  if (entity.update) {
    router.put(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      const data = {
        new: req.body
      };
      data.new[entity.fieldId] = req.params[entity.fieldId];
      let trx;
      entity.trx(trxp => {
        trx = trxp;
        entity.beforeUpdate(trx, data).then(() => {
          return entity.update(trx, data.new);
        }).then(updated => {
          return entity.afterUpdate(trx, data, updated).then(() => {
            res.json(updated);
          });
        });
      }).catch(err => {
        trx.rollback();
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
  }
  if (entity.delete)
    router.delete(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      let trx;
      entity.trx(trxp => {
        trx = trxp;
        return entity.delete(trx, req.params[entity.fieldId], req.query.where).then(data => {
          return entity.onDelete(trx, req.query).then(() => {
            res.json(data);
          });
        });
      }).catch(err => {
        trx.rollback();
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
};
