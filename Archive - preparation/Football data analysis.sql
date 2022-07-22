
create table leagues as
SELECT c.id, c.name, l.name as league
from Country c 
join League l 
on c.id = l.id

create table match_details as
select * FROM match 
WHERE
  (home_player_1 IS not NULL)
  AND (home_player_2 IS not NULL)
  AND (home_player_3 IS not NULL)
  and (home_player_4 is not null)
  and (home_player_5 is not null)
  and (home_player_6 is not null)
  and (home_player_7 is not null)
  and (home_player_8 is not null)
  and (home_player_9 is not null)
  and (home_player_10 is not null)
  and (home_player_11 is not null)
  and (away_player_1 is not null)
  and (away_player_2 is not null)
  and (away_player_3 is not null)
  and (away_player_4 is not null)
  and (away_player_5 is not null)
  and (away_player_6 is not null)
  and (away_player_7 is not null)
  and (away_player_8 is not null)
  and (away_player_9 is not null)
  and (away_player_10 is not null)
  and (away_player_11 is not null)
  and (goal is not null)
  and (shoton is not null)
  and (shotoff is not null)
  and (foulcommit is not null)
  and (card is not null)
  and (cross is not null)
  and (corner is not null)
  and (possession is not null)
  and (PSH is not null)
  and (PSD is not null)
  and (PSA is not null)
  
 select *
 from match_details md 

create table players as  
select * from Player p 
where (birthday and height and weight) is not null

create table players_details as 
select * from Player_Attributes pa 
group by player_api_id 
having max(date)

create table teams as
select * from Team t 
where team_fifa_api_id is not null

create table teams_details as
select * from Team_Attributes ta 
where buildUpPlayDribbling is not null