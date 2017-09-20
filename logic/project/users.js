const $router = require('express').Router();
const $entity = require('../../data/entity/users');
require('../resource')($router, $entity);
module.exports = $router;
