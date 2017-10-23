const $router = require('express').Router();
const $entity = require('../../data/entity/sprint-user-stories');
const $entityUserStory = require('../../data/entity/user-stories');
function updateUserStory (trx, userStoryId, statusId) {
  userStoryId = parseInt(userStoryId, 0);
  return new Promise((resolve, reject) => {
    $entityUserStory.getById(trx, null, userStoryId).then(userStory => {
      userStory[0].statusId = statusId;
      $entityUserStory.update(trx, userStory[0]).then(() => {
        resolve();
      }, reject);
    }, reject);
  });
};
$entity.afterInsert = (trx, obj, data) => {
  return updateUserStory(trx, obj.new.userStoryId, 1);
};
$entity.afterDelete = (trx, query, data) => {
  return updateUserStory(trx, query.where.userStoryId, 0);
};
require('../resource')($router, $entity);
module.exports = $router;
