create view v_buck_en as 
select distinct * from buck 
where name ='England'
order by season, name, stage asc


select * from v_scoring vs 

create table result_bookm as
select vs.season, vs.stage, home_team, away_team, result, 
avg(b365h) as avg_b365h, avg(b365d) as avg_b365d, avg(b365a) as avg_b365a,
avg(bwh) as avg_bwh, avg(bwd) as avg_bwd, avg(bwa) as avg_bwa,
avg(iwh) as avg_iwh, avg(iwd) as avg_iwd, avg(iwa) as avg_iwa,
avg(lbh) as avg_lbh, avg(lbd) as avg_lbd, avg(lba) as avg_lba,
avg(psh) as avg_psh, avg(psd) as avg_psd, avg(psa) as avg_psa, 
avg(whh) as avg_whh, avg(whd) as avg_whd, avg(wha) as avg_wha, 
avg(sjh) as avg_sjh, avg(sjd) as avg_sjd, avg(sja) as avg_sja, 
avg(vch) as avg_vch, avg(vcd) as avg_vcd, avg(vca) as avg_vca, 
avg(gbh) as avg_gbh, avg(gbd) as avg_gbd, avg(gba) as avg_gba,
avg(bsh) as avg_bsh, avg(bsd) as avg_bsd, avg(bsa) as avg_bsa
from v_buck_en 
join v_scoring vs 
on vs.home_team = v_buck_en.team_long_name
group by home_team, away_team
order by vs.season, vs.stage

create table bookm_prctg as
select season, home_team, away_team, result, round(100/avg_b365h,2) as prct_b365h, round(100/avg_b365d, 2) as prct_b365d, round(100/avg_b365a , 2)as prct_b365a , 
round(100/avg_bwh, 2) as prct_bwh , round(100/avg_bwd, 2) as prct_bwd, round(100/avg_bwa, 2) as prct_bwa,
round(100/avg_iwh, 2) as prct_iwh, round(100/avg_iwd, 2) as prct_iwd, round(100/avg_iwa, 2) as prct_iwa, 
round(100/avg_lbh, 2) as prct_lbh, round(100/avg_lbd, 2) as prct_ibd, round(100/avg_lba, 2) as prct_iba, 
round(100/avg_psh, 2) as prct_psh, round(100/avg_psd, 2) as prct_psd, round(100/avg_psa, 2) as prct_psa, 
round(100/avg_whh, 2) as prct_wwh, round(100/avg_whd, 2) as prct_whd, round(100/avg_wha, 2) as prct_wha, 
round(100/avg_sjh, 2) as prct_sjh, round(100/avg_sjd, 2) as prct_sjd, round(100/avg_sja, 2) as prct_sja, 
round(100/avg_vch, 2) as prct_vch, round(100/avg_vcd, 2) as prct_vcd, round(100/avg_vca, 2) as prct_vca, 
round(100/avg_gbh, 2) as prct_gbh, round(100/avg_gbd, 2) as prct_gbd, round(100/avg_gba, 2) as prct_gba,
round(100/avg_bsh, 2) as prct_bsh, round(100/avg_bsd, 2) as prct_bsd, round(100/avg_bsa, 2) as prct_bsa
from result_bookm

-------
/*analysis for bet365 bookmaker */

create view v_b365_ as
select season, home_team, away_team, result, prct_b365h, prct_b365d, prct_b365a, 100-(prct_b365h + prct_b365d +prct_b365a) as uncertainty
from bookm_prctg

/* assumption: if h,d or a is > sum of two others then that prct is valid in other case rest of results is taken to consideration. The best is to use data with low
 * uncertainty.
 * 
 * example: 61.88 >  20.24 + 11.93 and uncertainty = 5.95% then predicted is that home team will win with uncertainty 5.95%. In that case we should compare
 * if result was home win. If so - then we have match */

create view v_b365_matched as
select season, 
sum(match) * 100 / count(match) as prct_match_b365
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away win'
else 'no prediction results'
end as prediction
from v_b365_))
group by season

create table overall_b365_predicted as
select distinct
result, prct_b365h, prct_b365d, prct_b365a, uncertainty, prediction
from
(select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away win'
else 'no prediction results'
end as prediction
from v_b365_
where result = prediction
order by prct_b365h desc)

/*always when b365 predicted result, it was home win*/

select * from overall_b365_predicted 

/*analysis for bwin bookmaker */

create view v_bwin_ as
select season, home_team, away_team, result, prct_bwh, prct_bwd, prct_bwa, 100-(prct_bwh + prct_bwd +prct_bwa) as uncertainty
from bookm_prctg

create view v_bwin_matched as
select season, 
sum(match) * 100 / count(match) as prct_match_bwin
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_bwh > (prct_bwd + prct_bwa) then 'home win'
when prct_bwd > (prct_bwh + prct_bwa) then 'draw'
when prct_bwa > (prct_bwh + prct_bwd) then 'away win'
else 'no prediction results'
end as prediction
from v_bwin_))
group by season

create table overall_bwin_predicted as
select distinct
result, prct_bwh, prct_bwd, prct_bwa, uncertainty, prediction
from
(select *,
case when prct_bwh > (prct_bwd + prct_bwa) then 'home win'
when prct_bwd > (prct_bwh + prct_bwa) then 'draw'
when prct_bwa > (prct_bwh + prct_bwd) then 'away win'
else 'no prediction results'
end as prediction
from v_bwin_
where result = prediction
order by prct_bwh desc)

/*always when bwin predicted result, it was home win*/

select * from overall_bwin_predicted

/* analysis for interwetten */

create view v_interwetten as
select season, home_team, away_team, result, prct_iwh, prct_iwd, prct_iwa, 100-(prct_iwh + prct_iwd +prct_iwa) as uncertainty
from bookm_prctg

create view v_interwetten_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_b365
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_iwh > (prct_iwd + prct_iwa) then 'home win'
when prct_iwd > (prct_iwh + prct_iwa) then 'draw'
when prct_iwa > (prct_iwh + prct_iwd) then 'away win'
else 'no prediction results'
end as prediction
from v_interwetten))
group by season

create table overall_interwetten_predicted as
select distinct
result, prct_iwh, prct_iwd, prct_iwa, uncertainty, prediction
from
(select *,
case when prct_iwh > (prct_iwd + prct_iwa) then 'home win'
when prct_iwd > (prct_iwh + prct_iwa) then 'draw'
when prct_iwa > (prct_iwh + prct_iwd) then 'away win'
else 'no prediction results'
end as prediction
from v_interwetten
where result = prediction
order by prct_iwh desc)


/*here is observed revaluation - it will not be considered later on */


select * from overall_interwetten_predicted


/* ladbrokers analysis */

/*lbd = ibd and lba = iba */

create view v_ladbrokers_ as
select season, home_team, away_team, result, prct_lbh, prct_ibd, prct_iba, 100-(prct_lbh + prct_ibd +prct_iba) as uncertainty
from bookm_prctg


create view v_ladbrokers_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_b365
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_lbh > (prct_ibd + prct_iba) then 'home win'
when prct_ibd > (prct_lbh + prct_iba) then 'draw'
when prct_iba > (prct_lbh + prct_ibd) then 'away win'
else 'no prediction results'
end as prediction
from v_ladbrokers_ ))
group by season


create table overall_ladbrokers_predicted as
select distinct
result, prct_lbh, prct_ibd, prct_iba, uncertainty, prediction
from
(select *,
case when prct_lbh > (prct_ibd + prct_iba) then 'home win'
when prct_ibd > (prct_lbh + prct_iba) then 'draw'
when prct_iba > (prct_lbh + prct_ibd) then 'away win'
else 'no prediction results'
end as prediction
from v_ladbrokers_ 
where result = prediction
order by prct_lbh desc)


select * from overall_ladbrokers_predicted


/*analysis for pinnacle bookmaker */

create view v_pinnacle_ as
select season, home_team, away_team, result, prct_psh, prct_psd, prct_psa, 100-(prct_psh + prct_psd +prct_psa) as uncertainty
from bookm_prctg

create view v_pinnacle_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_pinnacle
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_psh > (prct_psd + prct_psa) then 'home win'
when prct_psd > (prct_psh + prct_psa) then 'draw'
when prct_psa > (prct_psh + prct_psd) then 'away win'
else 'no prediction results'
end as prediction
from v_pinnacle_ ))
group by season


create table overall_pinnacle_predicted as
select distinct
result, prct_psh, prct_psd, prct_psa, uncertainty, prediction
from
(select *,
case when prct_psh > (prct_psd + prct_psa) then 'home win'
when prct_psd > (prct_psh + prct_psa) then 'draw'
when prct_psa > (prct_psh + prct_psd) then 'away win'
else 'no prediction results'
end as prediction
from v_pinnacle_ 
where result = prediction
order by prct_psh desc)


select * from overall_pinnacle_predicted


/*analysis for William Hill bookmaker */

/* wwh = whh */

create view v_williamhill_ as
select season, home_team, away_team, result, prct_wwh, prct_whd, prct_wha, 100-(prct_wwh + prct_whd +prct_wha) as uncertainty
from bookm_prctg

create view v_williamhill_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_williamhill
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_wwh > (prct_whd + prct_wha) then 'home win'
when prct_whd > (prct_wwh + prct_wha) then 'draw'
when prct_wha > (prct_wwh + prct_whd) then 'away win'
else 'no prediction results'
end as prediction
from v_williamhill_ ))
group by season


create table overall_willaimhill_predicted as
select distinct
result, prct_wwh, prct_whd, prct_wha, uncertainty, prediction
from
(select *,
case when prct_wwh > (prct_whd + prct_wha) then 'home win'
when prct_whd > (prct_wwh + prct_wha) then 'draw'
when prct_wha > (prct_wwh + prct_whd) then 'away win'
else 'no prediction results'
end as prediction
from v_williamhill_ 
where result = prediction
order by prct_wwh desc)


select * from overall_willaimhill_predicted

/*analysis for Stan James bookmaker */

create view v_stanjames_ as
select season, home_team, away_team, result, prct_sjh, prct_sjd, prct_sja, 100-(prct_sjh + prct_sjd +prct_sja) as uncertainty
from bookm_prctg

create view v_stanjames_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_stanjames
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_sjh > (prct_sjd + prct_sja) then 'home win'
when prct_sjd > (prct_sjh + prct_sja) then 'draw'
when prct_sja > (prct_sjh + prct_sjd) then 'away win'
else 'no prediction results'
end as prediction
from v_stanjames_ ))
group by season


create table overall_stanjames_predicted as
select distinct
result, prct_sjh, prct_sjd, prct_sja, uncertainty, prediction
from
(select *,
case when prct_sjh > (prct_sjd + prct_sja) then 'home win'
when prct_sjd > (prct_sjh + prct_sja) then 'draw'
when prct_sja > (prct_sjh + prct_sjd) then 'away win'
else 'no prediction results'
end as prediction
from v_stanjames_ 
where result = prediction
order by prct_sjh desc)


select * from overall_stanjames_predicted

/*analysis for vcbet bookmaker */

create view v_vcbet_ as
select season, home_team, away_team, result, prct_vch, prct_vcd, prct_vca, 100-(prct_vch + prct_vcd +prct_vca) as uncertainty
from bookm_prctg

create view v_vcbet_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_vcbet
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_vch > (prct_vcd + prct_vca) then 'home win'
when prct_vcd > (prct_vch + prct_vca) then 'draw'
when prct_vca > (prct_vch + prct_vcd) then 'away win'
else 'no prediction results'
end as prediction
from v_vcbet_ ))
group by season


create table overall_vcbet_predicted as
select distinct
result, prct_vch, prct_vcd, prct_vca, uncertainty, prediction
from
(select *,
case when prct_vch > (prct_vcd + prct_vca) then 'home win'
when prct_vcd > (prct_vch + prct_vca) then 'draw'
when prct_vca > (prct_vch + prct_vcd) then 'away win'
else 'no prediction results'
end as prediction
from v_vcbet_ 
where result = prediction
order by prct_vch desc)


select * from overall_vcbet_predicted


/*analysis for Gamebookers bookmaker */

create view v_gamebookers_ as
select season, home_team, away_team, result, prct_gbh, prct_gbd, prct_gba, 100-(prct_gbh + prct_gbd +prct_gba) as uncertainty
from bookm_prctg

create view v_gamebookers_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_gamebookers
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_gbh > (prct_gbd + prct_gba) then 'home win'
when prct_gbd > (prct_gbh + prct_gba) then 'draw'
when prct_gba > (prct_gbh + prct_gbd) then 'away win'
else 'no prediction results'
end as prediction
from v_gamebookers_ ))
group by season


create table overall_gamebookers_predicted as
select distinct
result, prct_gbh, prct_gbd, prct_gba, uncertainty, prediction
from
(select *,
case when prct_gbh > (prct_gbd + prct_gba) then 'home win'
when prct_gbd > (prct_gbh + prct_gba) then 'draw'
when prct_gba > (prct_gbh + prct_gbd) then 'away win'
else 'no prediction results'
end as prediction
from v_gamebookers_ 
where result = prediction
order by prct_gbh desc)


select * from overall_gamebookers_predicted


/*analysis for bluesquare bookmaker */

create view v_bluesquare_ as
select season, home_team, away_team, result, prct_bsh, prct_bsd, prct_bsa, 100-(prct_bsh + prct_bsd +prct_bsa) as uncertainty
from bookm_prctg

create view v_bluesquare_match_ as
select season, 
sum(match) * 100 / count(match) as prct_match_bluesquare
from
(select *,
case when result = prediction then 1
else 0
end as match
from
(select *,
case when prct_bsh > (prct_bsd + prct_bsa) then 'home win'
when prct_bsd > (prct_bsh + prct_bsa) then 'draw'
when prct_bsa > (prct_bsh + prct_bsd) then 'away win'
else 'no prediction results'
end as prediction
from v_bluesquare_ ))
group by season


create table overall_bluesquare_predicted as
select distinct
result, prct_bsh, prct_bsd, prct_bsa, uncertainty, prediction
from
(select *,
case when prct_bsh > (prct_bsd + prct_bsa) then 'home win'
when prct_bsd > (prct_bsh + prct_bsa) then 'draw'
when prct_bsa > (prct_bsh + prct_bsd) then 'away win'
else 'no prediction results'
end as prediction
from v_bluesquare_ 
where result = prediction
order by prct_bsh desc)


select * from overall_bluesquare_predicted


-----
create table b365_proper_predict as
select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away win'
else 'no prediction results'
end as prediction
from v_b365_
where result = prediction

create table bwin_proper_predict as
select *,
case when prct_bwh > (prct_bwd + prct_bwa) then 'home win'
when prct_bwd > (prct_bwh + prct_bwa) then 'draw'
when prct_bwa > (prct_bwh + prct_bwd) then 'away win'
else 'no prediction results'
end as prediction
from v_bwin_
where result = prediction

create table interwetten_proper_predict as
select *,
case when prct_iwh > (prct_iwd + prct_iwa) then 'home win'
when prct_iwd > (prct_iwh + prct_iwa) then 'draw'
when prct_iwa > (prct_iwh + prct_iwd) then 'away win'
else 'no prediction results'
end as prediction
from v_interwetten
where result = prediction


create table loadbrokers_proper_predict as
select *,
case when prct_lbh > (prct_ibd + prct_iba) then 'home win'
when prct_ibd > (prct_lbh + prct_iba) then 'draw'
when prct_iba > (prct_lbh + prct_ibd) then 'away win'
else 'no prediction results'
end as prediction
from v_ladbrokers_ 
where result = prediction


create table pinnacle_proper_predict as
select *,
case when prct_psh > (prct_psd + prct_psa) then 'home win'
when prct_psd > (prct_psh + prct_psa) then 'draw'
when prct_psa > (prct_psh + prct_psd) then 'away win'
else 'no prediction results'
end as prediction
from v_pinnacle_ 
where result = prediction

create table williamhill_proper_predict as
select *,
case when prct_wwh > (prct_whd + prct_wha) then 'home win'
when prct_whd > (prct_wwh + prct_wha) then 'draw'
when prct_wha > (prct_wwh + prct_whd) then 'away win'
else 'no prediction results'
end as prediction
from v_williamhill_ 
where result = prediction

create table stanjames_proper_predict as
select *,
case when prct_sjh > (prct_sjd + prct_sja) then 'home win'
when prct_sjd > (prct_sjh + prct_sja) then 'draw'
when prct_sja > (prct_sjh + prct_sjd) then 'away win'
else 'no prediction results'
end as prediction
from v_stanjames_ 
where result = prediction

create table vcbet_proper_predict as
select *,
case when prct_vch > (prct_vcd + prct_vca) then 'home win'
when prct_vcd > (prct_vch + prct_vca) then 'draw'
when prct_vca > (prct_vch + prct_vcd) then 'away win'
else 'no prediction results'
end as prediction
from v_vcbet_ 
where result = prediction

select *,
case when prct_gbh > (prct_gbd + prct_gba) then 'home win'
when prct_gbd > (prct_gbh + prct_gba) then 'draw'
when prct_gba > (prct_gbh + prct_gbd) then 'away win'
else 'no prediction results'
end as prediction
from v_gamebookers_ 
where result = prediction


create table bluesquare_proper_predict as
select *,
case when prct_bsh > (prct_bsd + prct_bsa) then 'home win'
when prct_bsd > (prct_bsh + prct_bsa) then 'draw'
when prct_bsa > (prct_bsh + prct_bsd) then 'away win'
else 'no prediction results'
end as prediction
from v_bluesquare_ 
where result = prediction





