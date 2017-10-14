const $router = require('express').Router();
const $entity = require('../../data/entity/task-status');
require('../resource')($router, $entity);
module.exports = $router;
