const $router = require('express').Router();
const $entity = require('../../data/entity/projects');
$entity.onGetAll = data  => {
  return new Promise((resolve, reject) => {
    data.forEach(record => {
      record.userStories = [];
      record.sprints = [];
      record.scrumTeam = [];
    });
    resolve(data);
  });
};
$entity.onGetById = record  => {
  return new Promise((resolve, reject) => {
    record.userStories = [];
    record.sprints = [];
    record.scrumTeam = [];
    resolve(record);
  });
};
require('../resource')($router, $entity);
module.exports = $router;
