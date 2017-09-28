const $router = require('express').Router();
const $entity = require('../../data/entity/user-stories');
require('../resource')($router, $entity);
module.exports = $router;
