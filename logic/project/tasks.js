const $router = require('express').Router();
const $entity = require('../../data/entity/tasks');
const $entityPoints = require('../../data/entity/task-points');
require('../resource')($router, $entity);
const $errMoreBurnPoints = 'Cannot burn equally or more points than the max points of task.';
$entity.beforeUpdate = (trx, data) => {
  const task = data.new;
  return new Promise((resolve, reject) => {
    if ((task.statusId < 3) && (task.executedPoints >= task.points)) {
      return reject($errMoreBurnPoints);
    }

    if (task.statusId === 3) {
      task.executedPoints = task.points;
    }
    $entity.getById(null, null, task.id).then(oldTask => {
      data.old = oldTask[0];
      return resolve();
    }, reject);
  });
}

$entity.afterUpdate = (trx, data, rowsAffected) => {
  return new Promise((resolve, reject) => {
    const old = data.old;
    const actual = data.new;
    const executedPoints = actual.executedPoints - old.executedPoints;
    if (executedPoints <= 0) {
      return resolve();
    }
    const date = new Date().toISOString().substring(0, 10);
    $entityPoints.getAll(null, null, 0, 1, {
      taskId: actual.id,
      date: date
    }).then(points => {
      if (points.length === 0) {
        $entityPoints.insert(trx, {
          taskId: actual.id,
          date: date,
          points: executedPoints
        }).then(resolve, reject);
      } else {
        $entityPoints.update(trx, {
          taskId: actual.id,
          date: date,
          points: executedPoints
        }).then(resolve, reject);
      }
    }, reject);
  });
}

module.exports = $router;
