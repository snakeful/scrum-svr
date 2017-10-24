module.exports = function (router, entity) {
  if (entity.getAll) {
    router.get(`/${entity.resource}`, (req, res) => {
      entity.getAll(req.query.field, req.query.offset, req.query.limit, req.query.where).then(data => {
        entity.onGetAll(data).then(() => {
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
      entity.getById(req.query.field, req.params[entity.fieldId]).then(data => {
        if (data.length === 0) {
          return res.status(404).json({
            msg: 'Record not found'
          });
        }
        entity.onGetById(data[0]).then(() => {
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
      entity.trx(trx => {
        entity.beforeInsert(data, trx).then(() => {
          return entity.insert(data.new, trx);
        }).then(inserted => {
          data.inserted = inserted;
          return entity.afterInsert(data, inserted, trx);
        }).then(trx.commit)
          .catch(trx.rollback);
      }).then(() => {
        res.status(201).json(data.inserted[0]);
      }).catch(err => {
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
      entity.trx(trx => {
        entity.beforeUpdate(data, trx).then(() => {
          return entity.update(data.new, trx);
        }).then(rowsAffected => {
          data.rowsAffected = rowsAffected;
          return entity.afterUpdate(data, rowsAffected, trx);
        }).then(trx.commit)
          .catch(trx.rollback);
      }).then(() => {
        res.json(data.rowsAffected);
      }).catch(err => {
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
  }
  if (entity.delete)
    router.delete(`/${entity.resource}/:${entity.fieldId}`, (req, res) => {
      let data = {};
      entity.trx(trx => {
        entity.beforeDelete(req.params[entity.fieldId], trx).then(() => {
          return entity.delete(req.params[entity.fieldId], req.query.where, trx);
        }).then(deleted => {
          data.deleted = deleted;
          return entity.afterDelete(req.query, trx)
            .then(trx.commit)
            .catch(trx.rollback);
        });
      }).then(() => {
        res.json(data.deleted);
      }).catch(err => {
        res.status(500).json({
          err: err,
          data: req.body
        });
      });
    });
};