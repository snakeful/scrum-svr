const $router = require('express').Router();
const $entity = require('../../data/entity/projects');
require('../resource')($router, $entity);
module.exports = $router;
