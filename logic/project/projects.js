const $router = require('express').Router();
const $entity = require('../../data/entity/projects');
$entity.onGetAll = data  => {
  return new Promise((resolve, reject) => {
    data.forEach(record => {
      record.scrumTeam = [];
    });
    resolve(data);
  });
};
require('../resource')($router, $entity);
module.exports = $router;
