const $router = require('express').Router();
const $entity = require('../../data/entity/projects');
$entity.onGetAll = data  => {
  return new Promise((resolve, reject) => {
    data.forEach(record => {
    });
    resolve(data);
  });
};
$entity.onGetById = record  => {
  return new Promise((resolve, reject) => {
    resolve(record);
  });
};
require('../resource')($router, $entity);
module.exports = $router;
