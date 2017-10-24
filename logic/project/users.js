const $router = require('express').Router();
const $entity = require('../../data/entity/users');
const $entityToken = require('../../data/entity/tokens')
require('../resource')($router, $entity);

function validatePassword(password, confirm) {
  return password === confirm;
}

function validatePasswordPolicy (password) {
  return password.length >= 10;
}

$entity.beforeInsert = (data, trx) => {
  const user = data.new;
  if (user.password && user.confirm) {
    if (!validatePassword(user.password, user.confirm)) {
      throw new Error('Password do not match.');
    }
    if (!validatePasswordPolicy(user.password)) {
      throw new Error('Password has not pass the policy rules.');
    }
    data.setToken = true;
  }
  return Promise.resolve();
}

$entity.afterInsert = (data, inserted, trx) => {
  return new Promise((resolve, reject) => {
    console.log(inserted);
    reject('Error');
  });
}

$entity.afterUpdate = (data, rowsAffected, trx) => {
  return new Promise((resolve, reject) => {
    resolve();
  });
}

module.exports = $router;
