WITH RECURSIVE sprints AS (
  SELECT DISTINCT
   	sprints.id,
  	sprints.start "daySprint",
   	date_part('day', sprints.end::DATE) - date_part('day', sprints.start::DATE) + 1 "totalDaysSprint",
   	SUM(CAST(tasks.points AS DOUBLE PRECISION)) - SUM(COALESCE(taskPoints.points, 0)) "remainingPoints",
    CASE
      WHEN MAX(taskLastDayPoints.date) IS NULL THEN
        sprints.end
      WHEN MAX(taskLastDayPoints.date) < sprints.end THEN
        sprints.end
      ELSE
        MAX(taskLastDayPoints.date)
    END "endSprint",
    SUM(CAST(tasks.points AS DOUBLE PRECISION)) - SUM(tasks.points) / (date_part('day', sprints.end::DATE) - date_part('day', sprints.start::DATE) + 1) "totalPointsPerDay",
    SUM(tasks.points) / (date_part('day', sprints.end::DATE) - date_part('day', sprints.start::DATE) + 1) "pointsPerDay"
	FROM process.sprints sprints
  JOIN process."sprintUserStories" sprintUserStories ON sprintUserStories."sprintId" = sprints.id
  JOIN process.tasks tasks ON tasks."userStoryId" = sprintUserStories."userStoryId"
  LEFT JOIN process."taskPoints" taskPoints ON taskPoints."taskId" = tasks.id AND taskPoints.date = sprints.start
  JOIN taskLastDayPoints taskLastDayPoints ON 1 = 1
  WHERE
    sprints.id = ?
  GROUP BY 1, 2, 3
  UNION ALL
  SELECT
    sprints.id,
    (sprints."daySprint" + 1 * INTERVAL '1 day')::DATE "daySprint",
    sprints."totalDaysSprint" - 1,
    sprints."remainingPoints" - COALESCE(points.points, 0) "remainingPoints",
    sprints."endSprint",
    CASE WHEN (sprints."totalDaysSprint" - 1) > 0 THEN
      (sprints."totalDaysSprint" - 2) * sprints."pointsPerDay"
    ELSE
      0
    END "totalPointsPerDay",
    sprints."pointsPerDay"
  FROM sprints sprints
  LEFT JOIN taskPointsPerDay points ON points.date = (sprints."daySprint" + 1 * INTERVAL '1 day')::DATE
  WHERE
    sprints."daySprint" < sprints."endSprint"
), taskLastDayPoints AS (
  SELECT DISTINCT
    MAX(taskPoints.date) date,
    SUM(COALESCE(taskPoints.points, 0)) points
  FROM process."sprintUserStories" sprintUserStories
  JOIN process.tasks tasks ON tasks."userStoryId" = sprintUserStories."userStoryId"
  JOIN process."taskPoints" taskPoints ON taskPoints."taskId" = tasks.id
  WHERE
    sprintUserStories."sprintId" = ?
), taskPointsPerDay AS (
  SELECT DISTINCT
    taskPoints.date::DATE,
    SUM(COALESCE(taskPoints.points, 0)) points
  FROM process."sprintUserStories" sprintUserStories
  JOIN process.tasks tasks ON tasks."userStoryId" = sprintUserStories."userStoryId"
  JOIN process."taskPoints" taskPoints ON taskPoints."taskId" = tasks.id
  WHERE
    sprintUserStories."sprintId" = ?
	GROUP BY 1
  ORDER BY 1
)
SELECT DISTINCT
  sprint."daySprint",
  sprint."totalPointsPerDay",
  CASE WHEN sprint."daySprint" <= ? THEN
    sprint."remainingPoints"
  ELSE
    NULL
  END "remainingPoints"
FROM sprints sprint
JOIN process."sprintUserStories" sprintUserStories ON sprintUserStories."sprintId" = sprint.id
JOIN process.tasks tasks ON tasks."userStoryId" = sprintUserStories."userStoryId"
ORDER BY sprint."daySprint"