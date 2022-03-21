select * from leagues l 

create table match_all as
select * from match_details md 
join leagues l 
on md.country_id  = l.id

create table players_all as
select * from players p 
join players_details pd 
on p.player_api_id = pd.player_api_id 

select * from players_details pd 

create table teams_all as
select * from teams t
join teams_details td 
on t.team_api_id = td.team_api_id 

select * from teams_details td 