-- list of tables needed for matches analysis (we will start from football players, then teams)
-- needed to start to have comparisable table
select *
from bookm_prctg

select *
from match_team_u mtu 

select *
from home_players hp 

select *
from away_players ap 

select *
from players_all pa 

select * 
from players_details pd 

create table teams_all_upgr as
select *
from teams_all ta 
group by team_api_id 
having max(date)

create table teams_details_upgr as
select *
from teams_details td
group by team_api_id 
having max(date)

select *
from buck

select *
from match_details md

select league, season, stage, home_team, away_team,
home_team_goal, away_team_goal, whh, whd, wha, sjh, sjd, sja, gbh, gbd, gba, bsh, bsd, bsa,
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
(select league_id, season, stage, match_api_id, home_team_api_id, home_team,  away_team_api_id, team_long_name as away_team, home_team_goal, away_team_goal, whh, whd, wha, sjh,sjd,sja, gbh, gbd, gba, bsh, bsd, bsa, tau.team_api_id, 
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
(select league_id, season, stage, md.date as date, match_api_id, home_team_api_id, team_long_name as home_team, away_team_api_id, home_team_goal, away_team_goal, whh, whd, wha, sjh,sjd,sja, gbh, gbd, gba, bsh, bsd, bsa, tau.team_api_id, 
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
on b.league_id = l.id;
--------
select all_predict_b365.season, all_predict_b365.home_team , all_predict_b365.away_team , all_predict_b365.result, all_predict_b365.prediction as b365_prediction
from all_predict_b365

select *
from all_predict_b365 apb 





