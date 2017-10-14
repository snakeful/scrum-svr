const $router = require('express').Router();
const $entity = require('../../data/entity/origins');
require('../resource')($router, $entity);
module.exports = $router;
