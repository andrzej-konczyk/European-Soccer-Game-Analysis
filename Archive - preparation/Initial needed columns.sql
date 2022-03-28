create table matches_data as
select season, name, league, stage,teams_all.team_long_name, home_team_goal, away_team_goal, 
b365h, b365d, b365a, bwh, bwd, bwa, iwh, iwd, iwa, lbh, lbd, lba, psh, psd, psa, whh, whd, wha, sjh, sjd, sja, vch, vcd, vca, gbh, gbd, gba,
bsh, bsd, bsa, home_team_api_id, away_team_api_id
from match_all
join teams_all 
on match_all.home_team_api_id = team_api_id


create table players_data as
select player_name, birthday, height, weight, overall_rating, potential, preferred_foot, attacking_work_rate, defensive_work_rate, crossing,
finishing, heading_accuracy, short_passing, volleys, dribbling, curve, free_kick_accuracy, long_passing, ball_control, acceleration, sprint_speed,
agility, reactions, balance, shot_power, jumping, stamina, strength, long_shots, aggression, interceptions, positioning, vision, penalties, marking, standing_tackle, 
sliding_tackle, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes
from players_all

create table teams_data as
select team_long_name, buildUpPlaySpeed, buildUpPlaySpeedClass, buildUpPlayDribbling, buildUpPlayDribblingClass, buildUpPlayPassing, buildUpPlayPassingClass,
buildUpPlayPositioningClass, chanceCreationPassing, chanceCreationPassingClass, chanceCreationCrossing, chanceCreationCrossingClass, chanceCreationShooting,
chanceCreationShootingClass, chanceCreationPositioningClass, defencePressure, defencePressureClass, defenceAggression, defenceAggressionClass,
defenceTeamWidth, defenceTeamWidthClass, defenceDefenderLineClass
from teams_all
group by team_api_id
having max(date)