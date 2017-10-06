const $router = require('express').Router();
const $entity = require('../../data/entity/tasks');
require('../resource')($router, $entity);
module.exports = $router;
