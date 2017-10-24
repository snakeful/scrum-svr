const $router = require('express').Router();
const $entity = require('../../data/entity/sprint-user-stories');
const $entityUserStory = require('../../data/entity/user-stories');
function updateUserStory (userStoryId, statusId, trx) {
  userStoryId = parseInt(userStoryId, 0);
  return new Promise((resolve, reject) => {
    $entityUserStory.getById(null, userStoryId, trx).then(userStory => {
      userStory[0].statusId = statusId;
      $entityUserStory.update(userStory[0], trx).then(() => {
        resolve();
      }, reject);
    }, reject);
  });
};
$entity.afterInsert = (obj, data, trx) => {
  return updateUserStory(obj.new.userStoryId, 1, trx);
};
$entity.afterDelete = (query, data, trx) => {
  return updateUserStory(query.where.userStoryId, 0, trx);
};
require('../resource')($router, $entity);
module.exports = $router;
