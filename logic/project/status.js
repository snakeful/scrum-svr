const $router = require('express').Router();
const $entity = require('../../data/entity/status');
require('../resource')($router, $entity);
module.exports = $router;
