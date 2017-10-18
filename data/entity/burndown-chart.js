const $db = require('../database');
const fs = require('fs');
const entity = {
  resource: 'burndown-charts'
};
entity.getBurndownChart = function (req, res) {
  const sprintId = req.params.id;
  const date = `'${req.query.date || new Date().toISOString().substring(0, 10)}'`;
  const sql = fs.readFileSync('./data/entity/query/burndown-chart.sql').toString();
  return $db.raw(sql, [sprintId, sprintId, sprintId, date]);
};

module.exports = entity;