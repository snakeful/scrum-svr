const $router = require('express').Router();
const $entity = require('../../data/entity/roles');
require('../resource')($router, $entity);
module.exports = $router;
