const $db = require('../database');
const fs = require('fs');
const entity = {
  resource: 'burndown-charts'
};
entity.getBurndownChart = function (req, res) {
  const sprintId = 1;//parseInt(req.query.sprintId, 0);
  const date = `'${req.query.date || new Date().toISOString().substring(1, 10)}'`;
  const sql = fs.readFileSync('./data/entity/query/burndown-chart.sql').toString();
  return $db.raw(sql, [sprintId, sprintId, date]);
};

module.exports = entity;