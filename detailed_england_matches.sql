select distinct season, stage, date, home_team , away_team, home_team_goal, away_team_goal from v_ordered_hp
where name ='England'

create view v_english_matches as
select distinct season, stage, date, home_team , away_team, home_team_goal, away_team_goal from v_ordered_hp
where name ='England'

create view v_scoring as 
with home_pt as
(select *,
case when result = 'home win' then 3
when result = 'draw' then 1
when result = 'away win' then 0
end as home_points
from
(select *,
case when home_team_goal > away_team_goal then 'home win'
when home_team_goal < away_team_goal then 'away win'
when home_team_goal = away_team_goal then 'draw'
end as 'result'
from v_english_matches)),
away_pt as
(select *,
case when result = 'home win' then 0
when result = 'draw' then 1
when result = 'away win' then 3
end as away_points
from
(select *,
case when home_team_goal > away_team_goal then 'home win'
when home_team_goal < away_team_goal then 'away win'
when home_team_goal = away_team_goal then 'draw'
end as 'result'
from v_english_matches))
select DISTINCT home_pt.*,  away_points
from home_pt
join away_pt
on home_pt.result = away_pt.result

/*create table with information how many points gained home/away team per season*/
create view v_hom_awa_point as
select season, stage, date, home_team, away_team, home_team_goal, away_team_goal, 
sum(home_points) over (partition by home_team, season) as home_points, sum(away_points) over (partition by away_team, season) as away_points
from v_scoring
order by season, stage


create view v_table_home as
select distinct season, home_team, home_points
from v_hom_awa_point 
order by season, home_points desc

/*rank by home points*/
select *, RANK () over (partition by season order by home_points desc)
from v_table_home















































