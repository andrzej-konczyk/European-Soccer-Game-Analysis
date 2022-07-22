-- list of tables needed for matches analysis (we will start from football players, then teams)
-- needed to start to have comparisable table

select *
from match_team_u mtu 

select *
from players_all pa 

select * 
from players_details pd 

select *
from match_details md

select *
from Player p 

select *
from "Match" m 

select *
from match_all

create table prep_match_footballers_4 as
select distinct home.date, home_team_api_id, away_team_api_id, match_api_id,
home_player_1,
home_player_2,
home_player_3,
home_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11,
away_player_1,
away_player_2,
away_player_3,
away_player_4,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select home_team_api_id, away_team_api_id,season,name, league, stage, match_all.date, home_team_api_id, team_long_name as home_team, away_team_api_id, home_team_goal, away_team_goal,match_api_id,
home_player_1,
home_player_2,
home_player_3,
home_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11,
away_player_1,
away_player_2,
away_player_3,
away_player_4,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from match_all 
join teams_all
on match_all.home_team_api_id = teams_all.team_api_id)home
join teams_all 
on home.away_team_api_id = teams_all.team_api_id


select *
from prep_match_footballers_4 

create table table_home_for_analysis_3 as
select * from
(select home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
home_player_6,
age_player_6,
height_player_6,
weight_player_6,
home_player_7,
age_player_7,
height_player_7,
weight_player_7,
home_player_8,
age_player_8,
height_player_8,
weight_player_8,
home_player_9,
age_player_9,
height_player_9,
weight_player_9,
home_player_10,
age_player_10,
height_player_10,
weight_player_10,
player_name  as home_player_11,
h10.date - birthday as age_player_11,
height as height_player_11,
weight as weight_player_11
from
(select h9.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
home_player_6,
age_player_6,
height_player_6,
weight_player_6,
home_player_7,
age_player_7,
height_player_7,
weight_player_7,
home_player_8,
age_player_8,
height_player_8,
weight_player_8,
home_player_9,
age_player_9,
height_player_9,
weight_player_9,
player_name  as home_player_10,
h9.date - birthday as age_player_10,
height as height_player_10,
weight as weight_player_10,
home_player_11
from
(select h8.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
home_player_6,
age_player_6,
height_player_6,
weight_player_6,
home_player_7,
age_player_7,
height_player_7,
weight_player_7,
home_player_8,
age_player_8,
height_player_8,
weight_player_8,
player_name  as home_player_9,
h8.date - birthday as age_player_9,
height as height_player_9,
weight as weight_player_9,
home_player_10,
home_player_11
from
(select h7.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
home_player_6,
age_player_6,
height_player_6,
weight_player_6,
home_player_7,
age_player_7,
height_player_7,
weight_player_7,
player_name  as home_player_8,
h7.date - birthday as age_player_8,
height as height_player_8,
weight as weight_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h6.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
home_player_6,
age_player_6,
height_player_6,
weight_player_6,
player_name  as home_player_7,
h6.date - birthday as age_player_7,
height as height_player_7,
weight as weight_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h5.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
home_player_5,
age_player_5,
height_player_5,
weight_player_5,
player_name  as home_player_6,
h5.date - birthday as age_player_6,
height as height_player_6,
weight as weight_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h4.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
home_player_4,
age_player_4,
height_player_4,
weight_player_4,
player_name  as home_player_5,
h4.date - birthday as age_player_5,
height as height_player_5,
weight as weight_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h3.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
home_player_3,
age_player_3,
height_player_3,
weight_player_3,
player_name  as home_player_4,
h3.date - birthday as age_player_4,
height as height_player_4,
weight as weight_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h2.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_2,
age_player_2,
height_player_2,
weight_player_2,
player_name  as home_player_3,
h2.date - birthday as age_player_3,
height as height_player_3,
weight as weight_player_3,
home_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select h1.date,home_team_api_id, away_team_api_id,match_api_id,
player_1,
age_player_1,
height_player_1,
weight_player_1,
player_name as player_2,
h1.date - birthday as age_player_2,
height as height_player_2,
weight as weight_player_2,
home_player_3,
home_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from
(select prep_match_footballers_4.date, home_team_api_id, away_team_api_id, match_api_id,
player_name as player_1,
prep_match_footballers_4.date - birthday as age_player_1,
height as height_player_1,
weight as weight_player_1,
home_player_2,
home_player_3,
home_player_4,
home_player_5,
home_player_6,
home_player_7,
home_player_8,
home_player_9,
home_player_10,
home_player_11
from prep_match_footballers_4
join players_all on
prep_match_footballers_4.home_player_1 = players_all.player_api_id)h1
join players_all on
h1.home_player_2 = players_all.player_api_id)h2
join players_all on
h2.home_player_3 = players_all.player_api_id)h3
join players_all on
h3.home_player_4 = players_all.player_api_id)h4
join players_all on
h4.home_player_5 = players_all.player_api_id)h5
join players_all on
h5.home_player_6 = players_all.player_api_id)h6
join players_all on
h6.home_player_7 = players_all.player_api_id)h7
join players_all on
h7.home_player_8 = players_all.player_api_id)h8
join players_all on
h8.home_player_9 = players_all.player_api_id)h9
join players_all on
h9.home_player_10 = players_all.player_api_id)h10
join players_all on
h10.home_player_11 = players_all.player_api_id);


create table table_away_for_analysis_2 as
select * from
(select home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a,
home_player_7_a,
age_player_7_a,
height_player_7_a,
weight_player_7_a,
home_player_8_a,
age_player_8_a,
height_player_8_a,
weight_player_8_a,
home_player_9_a,
age_player_9_a,
height_player_9_a,
weight_player_9_a,
home_player_10_a,
age_player_10_a,
height_player_10_a,
weight_player_10_a,
player_name  as home_player_11_a,
a10.date - birthday as age_player_11_a,
height as height_player_11_a,
weight as weight_player_11_a
from
(select a9.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a,
home_player_7_a,
age_player_7_a,
height_player_7_a,
weight_player_7_a,
home_player_8_a,
age_player_8_a,
height_player_8_a,
weight_player_8_a,
home_player_9_a,
age_player_9_a,
height_player_9_a,
weight_player_9_a,
player_name  as home_player_10_a,
a9.date - birthday as age_player_10_a,
height as height_player_10_a,
weight as weight_player_10_a,
away_player_11
from
(select a8.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a,
home_player_7_a,
age_player_7_a,
height_player_7_a,
weight_player_7_a,
home_player_8_a,
age_player_8_a,
height_player_8_a,
weight_player_8_a,
player_name  as home_player_9_a,
a8.date - birthday as age_player_9_a,
height as height_player_9_a,
weight as weight_player_9_a,
away_player_10,
away_player_11
from
(select a7.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a,
home_player_7_a,
age_player_7_a,
height_player_7_a,
weight_player_7_a,
player_name  as home_player_8_a,
a7.date - birthday as age_player_8_a,
height as height_player_8_a,
weight as weight_player_8_a,
away_player_9,
away_player_10,
away_player_11
from
(select a6.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a,
player_name  as home_player_7_a,
a6.date - birthday as age_player_7_a,
height as height_player_7_a,
weight as weight_player_7_a,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select a5.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a,
player_name  as home_player_6_a,
a5.date - birthday as age_player_6_a,
height as height_player_6_a,
weight as weight_player_6_a,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select a4.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a,
player_name  as home_player_5_a,
a4.date - birthday as age_player_5_a,
height as height_player_5_a,
weight as weight_player_5_a,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select a3.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a,
player_name  as home_player_4_a,
a3.date - birthday as age_player_4_a,
height as height_player_4_a,
weight as weight_player_4_a,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select a2.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a,
player_name  as home_player_3_a,
a2.date - birthday as age_player_3_a,
height as height_player_3_a,
weight as weight_player_3_a,
away_player_4,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select a1.date,home_team_api_id, away_team_api_id,match_api_id,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a,
player_name as player_2_a,
a1.date - birthday as age_player_2_a,
height as height_player_2_a,
weight as weight_player_2_a,
away_player_3,
away_player_4,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from
(select prep_match_footballers_4.date, home_team_api_id, away_team_api_id, match_api_id,
player_name as player_1_a,
prep_match_footballers_4.date - birthday as age_player_1_a,
height as height_player_1_a,
weight as weight_player_1_a,
away_player_2,
away_player_3,
away_player_4,
away_player_5,
away_player_6,
away_player_7,
away_player_8,
away_player_9,
away_player_10,
away_player_11
from prep_match_footballers_4
join players_all on
prep_match_footballers_4.away_player_1 = players_all.player_api_id)a1
join players_all on
a1.away_player_2 = players_all.player_api_id)a2
join players_all on
a2.away_player_3 = players_all.player_api_id)a3
join players_all on
a3.away_player_4 = players_all.player_api_id)a4
join players_all on
a4.away_player_5 = players_all.player_api_id)a5
join players_all on
a5.away_player_6 = players_all.player_api_id)a6
join players_all on
a6.away_player_7 = players_all.player_api_id)a7
join players_all on
a7.away_player_8 = players_all.player_api_id)a8
join players_all on
a8.away_player_9 = players_all.player_api_id)a9
join players_all on
a9.away_player_10= players_all.player_api_id)a10
join players_all on
a10.away_player_11 = players_all.player_api_id);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- for table creation selected the best bookmakers base on bookmakers analysis - percentage of proper predicted + uncertantity
-- important information: stan james is currently unibet / bluesquare is currently betfair
-- in general data related to bets in my country there is no possibility to review all selected bookmakers - so for futher analysis for prediction will be considered only William Hill and Unibet
-- for table creation considered now all leagues (but bookmakers selection was done on most popular English Premier League) - it was done like that to increase datase and have better model, but
-- for proper analysis and upgrades there is option to prepare bookamkers analysis separetely for each league and then join to english dataset
-- gamebookers and blu square removed due to too many NULLS

create table match_analysis_6 as
select match_api_id,home_team_api_id,away_team_api_id,
league, season, stage, home_team, away_team,
home_team_goal, away_team_goal, whh, whd, wha, sjh, sjd, sja,
buildupplayspeed_h, buildupplayspeed_a, buildupplayspeedclass_h, buildupplayspeedclass_a,
buildupplaydribbling_h, buildupplaydribbling_a, buildupplaypassing_h, buildupplaypassing_a,
buildupplaypassingclass_h, buildupplaypassingclass_a, buildupplaypositioningclass_h, buildupplaypositioningclass_a,
chancecreationpassing_h, chancecreationpassing_a,chancecreationpassingclass_h, chancecreationpassingclass_a,
chancecreationcrossing_h, chancecreationcrossing_a, chancecreationcrossingclass_h, chancecreationcrossingclass_a,
chancecreationshooting_h, chancecreationshooting_a, chancecreationshootingclass_h, chancecreationshootingclass_a,
chancecreationpositioningclass_h, chancecreationpositioningclass_a, defencepressure_h, defencepressure_a,
defencepressureclass_h, defencepressureclass_a, defenceaggression_h, defenceaggression_a, 
defenceaggressionclass_h, defenceaggressionclass_a, defenceteamwidth_h, defenceteamwidth_a,
defenceteamwidthclass_h, defenceteamwidthclass_a, defencedefenderlineclass_h, defencedefenderlineclass_a
from
(select match_api_id, home_team_api_id,away_team_api_id,
league, season, stage, home_team, away_team,
home_team_goal, away_team_goal, whh, whd, wha, sjh, sjd, sja,
buildupplayspeed_h, buildupplayspeed_a, buildupplayspeedclass_h, buildupplayspeedclass_a,
buildupplaydribbling_h, buildupplaydribbling_a, buildupplaypassing_h, buildupplaypassing_a,
buildupplaypassingclass_h, buildupplaypassingclass_a, buildupplaypositioningclass_h, buildupplaypositioningclass_a,
chancecreationpassing_h, chancecreationpassing_a,chancecreationpassingclass_h, chancecreationpassingclass_a,
chancecreationcrossing_h, chancecreationcrossing_a, chancecreationcrossingclass_h, chancecreationcrossingclass_a,
chancecreationshooting_h, chancecreationshooting_a, chancecreationshootingclass_h, chancecreationshootingclass_a,
chancecreationpositioningclass_h, chancecreationpositioningclass_a, defencepressure_h, defencepressure_a,
defencepressureclass_h, defencepressureclass_a, defenceaggression_h, defenceaggression_a, 
defenceaggressionclass_h, defenceaggressionclass_a, defenceteamwidth_h, defenceteamwidth_a,
defenceteamwidthclass_h, defenceteamwidthclass_a, defencedefenderlineclass_h, defencedefenderlineclass_a
from
(select match_api_id,league_id, season, stage, match_api_id, home_team_api_id, home_team,  away_team_api_id, team_long_name as away_team, home_team_goal, away_team_goal, whh, whd, wha, sjh,sjd,sja, gbh, gbd, gba, bsh, bsd, bsa, tau.team_api_id, 
buildupplayspeed_h, buildupplayspeed as buildupplayspeed_a, buildupplayspeedclass_h,buildupplayspeedclass as buildupplayspeedclass_a,
buildupplaydribbling_h,buildupplaydribbling as buildupplaydribbling_a, buildupplaypassing_h,buildupplaypassing as buildupplaypassing_a,
buildupplaypassingclass_h,buildupplaypassingclass as buildupplaypassingclass_a, buildupplaypositioningclass_h,buildupplaypositioningclass as buildupplaypositioningclass_a,
chancecreationpassing_h,chancecreationpassing as chancecreationpassing_a, chancecreationpassingclass_h, chancecreationpassingclass as chancecreationpassingclass_a,
chancecreationcrossing_h,chancecreationcrossing as chancecreationcrossing_a, chancecreationcrossingclass_h, chancecreationcrossingclass as chancecreationcrossingclass_a,
chancecreationshooting_h, chancecreationshooting as chancecreationshooting_a, chancecreationshootingclass_h, chancecreationshootingclass as chancecreationshootingclass_a,
chancecreationpositioningclass_h, chancecreationpositioningclass as chancecreationpositioningclass_a, defencepressure_h, defencepressure as defencepressure_a,
defencepressureclass_h, defencepressureclass as defencepressureclass_a,  defenceaggression_h, defenceaggression as defenceaggression_a,
defenceaggressionclass_h, defenceaggressionclass as defenceaggressionclass_a, defenceteamwidth_h, defenceteamwidth as defenceteamwidth_a,
defenceteamwidthclass_h, defenceteamwidthclass as defenceteamwidthclass_a,  defencedefenderlineclass_h, defencedefenderlineclass as defencedefenderlineclass_a
from
(select match_api_id, league_id, season, stage, md.date as date, match_api_id, home_team_api_id, team_long_name as home_team, away_team_api_id, home_team_goal, away_team_goal, whh, whd, wha, sjh,sjd,sja, gbh, gbd, gba, bsh, bsd, bsa, tau.team_api_id, 
buildupplayspeed as buildupplayspeed_h , buildupplayspeedclass as buildupplayspeedclass_h, buildupplaydribbling as buildupplaydribbling_h, 
buildupplaypassing as buildupplaypassing_h, buildupplaypassingclass as buildupplaypassingclass_h, buildupplaypositioningclass as buildupplaypositioningclass_h, 
chancecreationpassing as chancecreationpassing_h, chancecreationpassingclass as chancecreationpassingclass_h,
chancecreationcrossing as chancecreationcrossing_h, chancecreationcrossingclass as chancecreationcrossingclass_h,
chancecreationshooting as chancecreationshooting_h, chancecreationshootingclass as chancecreationshootingclass_h, 
chancecreationpositioningclass as chancecreationpositioningclass_h, defencepressure as defencepressure_h, defencepressureclass as defencepressureclass_h, defenceaggression as defenceaggression_h,
defenceaggressionclass as defenceaggressionclass_h, defenceteamwidth as defenceteamwidth_h, defenceteamwidthclass as defenceteamwidthclass_h, defencedefenderlineclass as defencedefenderlineclass_h
from match_details md
join teams_all_upgr tau
on md.home_team_api_id = tau.team_api_id)a
join teams_all_upgr tau
on a.away_team_api_id = tau.team_api_id)b
join leagues l 
on b.league_id = l.id
where whh is NOT NULL 
and whd is NOT NULL 
and wha is NOT NULL 
and sjh is NOT NULL 
and sjd is NOT NULL 
and sja is NOT NULL) ;



select count(*)
from match_analysis_6
-- we have 3712 data for analysis



create table match_analysis_7 as
select *
from match_analysis_6 ma6
join table_home_for_analysis_3 thfa3
on ma6.match_api_id = thfa3.match_api_id
join table_away_for_analysis_2 tafa2
on ma6.match_api_id = tafa2.match_api_id


select league, season, stage, home_team, away_team,
home_team_goal, away_team_goal, 
case when home_team_goal > away_team_goal then 'home win'
when home_team_goal = away_team_goal then 'draw'
when home_team_goal < away_team_goal then 'away win'
end as result,
whh, whd, wha, sjh, sjd, sja, round(100/((whh+sjh)/2),2) as home_bet_avg_prct, round(100/((whd+sjd)/2),2) as draw_bet_avg_prct, round(100/((wha+sja)/2),2) as away_bet_avg_prct,
case when (100/whh) > ((100/whd) + (100/wha)) then 'home'
when (100/whd) > ((100/whh) + (100/wha)) then 'draw'
when (100/wha) > ((100/whh) + (100/whd)) then 'away'
else 'no prediction'
end as wh_prediction,
case when (100/sjh) > ((100/sjd) + (100/sja)) then 'home'
when (100/sjd) > ((100/sjh) + (100/sja)) then 'draw'
when (100/sja) > ((100/sjh) + (100/sjd)) then 'away'
else 'no prediction'
end as sj_prediction,
buildupplayspeed_h, buildupplayspeed_a, buildupplayspeedclass_h, buildupplayspeedclass_a,
buildupplaydribbling_h, buildupplaydribbling_a, buildupplaypassing_h, buildupplaypassing_a,
buildupplaypassingclass_h, buildupplaypassingclass_a, buildupplaypositioningclass_h, buildupplaypositioningclass_a,
chancecreationpassing_h, chancecreationpassing_a,chancecreationpassingclass_h, chancecreationpassingclass_a,
chancecreationcrossing_h, chancecreationcrossing_a, chancecreationcrossingclass_h, chancecreationcrossingclass_a,
chancecreationshooting_h, chancecreationshooting_a, chancecreationshootingclass_h, chancecreationshootingclass_a,
chancecreationpositioningclass_h, chancecreationpositioningclass_a, defencepressure_h, defencepressure_a,
defencepressureclass_h, defencepressureclass_a, defenceaggression_h, defenceaggression_a, 
defenceaggressionclass_h, defenceaggressionclass_a, defenceteamwidth_h, defenceteamwidth_a,
defenceteamwidthclass_h, defenceteamwidthclass_a, defencedefenderlineclass_h, defencedefenderlineclass_a,
player_1,
age_player_1,
height_player_1,
weight_player_1*0.45,
player_2,
age_player_2,
height_player_2,
weight_player_2*0.45,
home_player_3,
age_player_3,
height_player_3,
weight_player_3*0.45,
home_player_4,
age_player_4,
height_player_4,
weight_player_4*0.45,
home_player_5,
age_player_5,
height_player_5,
weight_player_5*0.45,
home_player_6,
age_player_6,
height_player_6,
weight_player_6*0.45,
home_player_7,
age_player_7,
height_player_7,
weight_player_7*0.45,
home_player_8,
age_player_8,
height_player_8,
weight_player_8*0.45,
home_player_9,
age_player_9,
height_player_9,
weight_player_9*0.45,
home_player_10,
age_player_10,
height_player_10,
weight_player_10*0.45,
home_player_11,
age_player_11,
height_player_11,
weight_player_11*0.45,
player_1_a,
age_player_1_a,
height_player_1_a,
weight_player_1_a*0.45,
player_2_a,
age_player_2_a,
height_player_2_a,
weight_player_2_a*0.45,
home_player_3_a,
age_player_3_a,
height_player_3_a,
weight_player_3_a*0.45,
home_player_4_a,
age_player_4_a,
height_player_4_a,
weight_player_4_a*0.45,
home_player_5_a,
age_player_5_a,
height_player_5_a,
weight_player_5_a*0.45,
home_player_6_a,
age_player_6_a,
height_player_6_a,
weight_player_6_a*0.45,
home_player_7_a,
age_player_7_a,
height_player_7_a,
weight_player_7_a*0.45,
home_player_8_a,
age_player_8_a,
height_player_8_a,
weight_player_8_a*0.45,
home_player_9_a,
age_player_9_a,
height_player_9_a,
weight_player_9_a*0.45,
home_player_10_a,
age_player_10_a,
height_player_10_a,
weight_player_10_a*0.45,
home_player_11_a,
age_player_11_a,
height_player_11_a,
weight_player_11_a*0.45
from match_analysis_7
order by league, season, stage




--------








