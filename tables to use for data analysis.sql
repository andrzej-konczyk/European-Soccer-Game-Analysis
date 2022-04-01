
create view v_ordered_hp as
select * from home_players hp 
order by season, name, stage asc

select distinct name from v_ordered_hp /* analysis will be performed on 6 leagues: England | France | Germany | Italy | Spain | */

/* general analysis for England league*/
select round(avg(home_team_goal),2) as avg_home_team_goals, round(avg(away_team_goal),2) as avg_away_team_goals  from v_ordered_hp
where name = 'England'

/*since 2012/2013 till 2015/2016 avg no of goals by home team = 1.52 and away teams = 1.18 in whole season (38 stages)*/

create view avg_goals as
select stage, round(avg(home_team_goal),2) as avg_home_team_goals, round(avg(away_team_goal),2) as avg_away_team_goals  from v_ordered_hp
where name = 'England'
group by stage

create view v_avg_better_is as
select *,
case when avg_home_team_goals > avg_away_team_goals then 'home average goals better'
when avg_home_team_goals < avg_away_team_goals then 'away average goals better'
when avg_home_team_goals = avg_away_team_goals then 'the same average goals'
end as 'which_average_is_better'
from avg_goals

select distinct (select count(which_average_is_better)
from v_avg_better_is
where which_average_is_better like 'home%')  as no_of_avg_home_better_goals,
(select count(which_average_is_better) 
from v_avg_better_is
where which_average_is_better like 'away%') no_of_avg_away_better_goals
from v_avg_better_is

/* only in first stages avg no of goals of away teams is better than home teams*/

create view v_stage_avg_better as
select season, stage, round(avg(home_team_goal),2) as avg_home_team_goals, round(avg(away_team_goal),2) as avg_away_team_goals  from v_ordered_hp
where name = 'England'
group by stage, season


create view v_which_better_stage as
select *,
case when avg_home_team_goals > avg_away_team_goals then 'home average goals better'
when avg_home_team_goals < avg_away_team_goals then 'away average goals better'
when avg_home_team_goals = avg_away_team_goals then 'the same average goals'
end as 'which_average_is_better'
from v_stage_avg_better

select distinct (select count(which_average_is_better)
from v_which_better_stage
where which_average_is_better like 'home%')  as no_of_avg_home_better_goals,
(select count(which_average_is_better) 
from v_which_better_stage
where which_average_is_better like 'away%') no_of_avg_away_better_goals
from v_which_better_stage

/* home better avg ratio including stages is 104 vs away where it is 32*/

select season,stage
from v_which_better_stage
where which_average_is_better like 'away%'
order by season



/*data checking: in which half of season average number of goals by home/away team is better?*/
select season, part_of_season, count(part_of_season)
from
(select season,stage,
case when (which_average_is_better like 'away%' and  stage < 19) then 'first_half_of_season_away_win'
when (which_average_is_better like 'away%' and  stage >= 19) then 'second_half_of_season_away_win'
when (which_average_is_better like 'home%' and  stage < 19) then 'first_half_of_season_home_win'
when (which_average_is_better like 'home%' and  stage >= 19) then 'second_half_of_season_home_win'
when (which_average_is_better like 'the%' and  stage < 19) then 'first_half_of_season_no_better_team'
when (which_average_is_better like 'the%' and  stage >= 19) then 'second_half_of_season_no_better_team'
end as part_of_season
from v_which_better_stage
group by season, stage
order by season)ps
group by season, part_of_season


/*deeper analysis - 14 away better ration in 1 st part of season vs 2nd part (18) - no big difference */

select season,stage
from v_which_better_stage
where which_average_is_better like 'away%' and  stage > (3*38/4)
order by season

/* 8 of 18 away better ratio is from last quoter of seson*/

select season,stage
from v_which_better_stage
where which_average_is_better like 'away%' and  stage < (38/4)
order by season

/* 8 of 14 away better ratio is from first quoter of seson*/

create view v_diff_goals as
select season, stage, home_team_goal , away_team_goal ,abs((home_team_goal - away_team_goal)) as goal_diff  from v_ordered_hp
where name = 'England'

select season, round(avg(goal_diff),2) as avg_diff_goals
from v_diff_goals 
group by season



select * from away_players 
order by season, name, stage asc

select * from players_data pd 

select * from teams_data td 

select distinct * from buck 
order by season, name, stage asc