const $router = require('express').Router();
const $entity = require('../../data/entity/sprint-user-stories');
const $entityUserStory = require('../../data/entity/user-stories');
function updateUserStory (userStoryId, statusId) {
  userStoryId = parseInt(userStoryId, 0);
  return new Promise((resolve, reject) => {
    $entityUserStory.getById(undefined, userStoryId).then(userStory => {
      userStory[0].statusId = statusId;
      $entityUserStory.update(userStory[0]).then(() => {
        resolve();
      }, reject);
    }, reject);
  });
};
$entity.onInsert = (obj, data) => {
  return updateUserStory(obj.userStoryId, 1);
};
$entity.onDelete = query => {
  return updateUserStory(query.where.userStoryId, 0);
};
require('../resource')($router, $entity);
module.exports = $router;
