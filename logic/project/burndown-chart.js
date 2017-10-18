const $router = require('express').Router();
const $entity = require('../../data/entity/burndown-chart');
$router.get(`/${$entity.resource}/:id`, (req, res) => {
  $entity.getBurndownChart(req, res).then(data => {
    res.json(data.rows);
  }).catch(err => {
    res.status(500).json({
      err: err
    });
  });
});
module.exports = $router;
