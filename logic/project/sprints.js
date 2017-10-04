const $router = require('express').Router();
const $entity = require('../../data/entity/sprints');
require('../resource')($router, $entity);
module.exports = $router;
