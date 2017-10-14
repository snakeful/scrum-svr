const $router = require('express').Router();
const $entity = require('../../data/entity/user-story-status');
require('../resource')($router, $entity);
module.exports = $router;
