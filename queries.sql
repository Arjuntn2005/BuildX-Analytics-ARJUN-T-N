-- Query 1: Batter hit a six

SELECT
    batter,
    batting_team,
    bowler,
    runs_batter,
    season
FROM ipl
WHERE runs_batter = 6;


-- Query 2: Total runs by team

SELECT
    batting_team,
    SUM(runs_total) AS total_runs
FROM ipl
GROUP BY batting_team
ORDER BY total_runs DESC;


-- Query 3: Top 10 run scorers

SELECT
    batter,
    SUM(runs_batter) AS total_runs
FROM ipl
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;


-- Query 4: Batters with more than 500 runs

SELECT
    batter,
    SUM(runs_batter) AS total_runs
FROM ipl
GROUP BY batter
HAVING SUM(runs_batter) > 500
ORDER BY total_runs DESC;


-- Query 5: Matches from 2018 to 2023

SELECT
    match_id,
    batter,
    batting_team,
    bowling_team,
    year
FROM ipl
WHERE year BETWEEN 2018 AND 2023;


-- Query 6: Batter performance analysis

SELECT
    batter,
    COUNT(*) AS balls_faced,
    SUM(runs_batter) AS total_runs,
    ROUND(AVG(runs_batter), 2) AS average_runs_per_ball
FROM ipl
GROUP BY batter
HAVING COUNT(*) >= 100
ORDER BY total_runs DESC;