const $router = require('express').Router();
const $entity = require('../../data/entity/project-status');
require('../resource')($router, $entity);
module.exports = $router;
