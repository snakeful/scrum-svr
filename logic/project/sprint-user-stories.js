const $router = require('express').Router();
const $entity = require('../../data/entity/sprint-user-stories');
require('../resource')($router, $entity);
module.exports = $router;
