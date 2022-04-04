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

create table bookm_prct as
select season, home_team, away_team, result, round(100/avg_b365h,2) as prct_b365h, round(100/avg_b365d, 2) as prct_b365d, round(100/avg_b365a , 2)as prct_b365a , 
round(100/avg_bwh, 2) as prct_bwh , round(100/avg_bwd, 2) as prct_bwd, round(100/avg_bwa, 2) as prct_bwa,
round(100/avg_iwh, 2) as prct_iwh, round(100/avg_iwd, 2) as prct_iwd, round(100/avg_iwa, 2) as prct_iwa, 
round(100/avg_lbh, 2) as prct_ibh, round(100/avg_lbd, 2) as prct_ibd, round(100/avg_lba, 2) as prct_iba, 
round(100/avg_psh, 2) as prct_psh, round(100/avg_psd, 2) as prct_psd, round(100/avg_psa, 2) as prct_psa, 
round(100/avg_whh, 2) as prct_wwh, round(100/avg_whd, 2) as prct_whd, round(100/avg_wha, 2) as prct_wha, 
round(100/avg_sjh, 2) as prct_sjh, round(100/avg_sjd, 2) as prct_sjd, round(100/avg_sja, 2) as prct_sja, 
round(100/avg_vch, 2) as prct_vch, round(100/avg_vcd, 2) as prct_vcd, round(100/avg_vca, 2) as prct_vca, 
round(100/avg_gbh, 2) as prct_gbh, round(100/avg_gbd, 2) as prct_gbd, round(100/avg_gba, 2) as prct_gba,
round(100/avg_bsh, 2) as prct_bsh, round(100/avg_bsd, 2) as prct_bsd, round(100/avg_bsa, 2) as prct_bsa
from result_bookm

-------
/*analysis for b365 bookmaker */

create view v_b365 as
select season, home_team, away_team, result, prct_b365h, prct_b365d, prct_b365a, 100-(prct_b365h + prct_b365d +prct_b365a) as uncertainty
from bookm_prct

/* assumption: if h,d or a is > sum of two others then that prct is valid in other case rest of results is taken to consideration. The best is to use data with low
 * uncertainty.
 * 
 * example: 61.88 >  20.24 + 11.93 and uncertainty = 5.95% then predicted is that home team will win with uncertainty 5.95%. In that case we should compare
 * if result was home win. If so - then we have match */

create view v_b365_match as
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
when prct_b365a > (prct_b365h + prct_b365d) then 'away away'
else 'no prediction results'
end as prediction
from v_b365))
group by season

create table overall_b365_predict as
select distinct
result, prct_b365h, prct_b365d, prct_b365a, uncertainty, prediction
from
(select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away away'
else 'no prediction results'
end as prediction
from v_b365
where result = prediction
order by prct_b365h desc)

/*always when b365 predicted result, it was home win*/

select * from overall_b365_predict 

/*analysis for bwin bookmaker */

create view v_bwin as
select season, home_team, away_team, result, prct_bwh, prct_bwd, prct_bwa, 100-(prct_bwh + prct_bwd +prct_bwa) as uncertainty
from bookm_prct

create view v_bwin_match as
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
when prct_bwa > (prct_bwh + prct_bwd) then 'away away'
else 'no prediction results'
end as prediction
from v_bwin))
group by season

create table overall_bwin_predict as
select distinct
result, prct_bwh, prct_bwd, prct_bwa, uncertainty, prediction
from
(select *,
case when prct_bwh > (prct_bwd + prct_bwa) then 'home win'
when prct_bwd > (prct_bwh + prct_bwa) then 'draw'
when prct_bwa > (prct_bwh + prct_bwd) then 'away away'
else 'no prediction results'
end as prediction
from v_bwin
where result = prediction
order by prct_bwh desc)

/*always when b365 predicted result, it was home win*/

select * from overall_bwin_predict 



-----
select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away away'
else 'no prediction results'
end as prediction
from v_b365
where result = prediction

select *,
case when prct_bwh > (prct_bwd + prct_bwa) then 'home win'
when prct_bwd > (prct_bwh + prct_bwa) then 'draw'
when prct_bwa > (prct_bwh + prct_bwd) then 'away away'
else 'no prediction results'
end as prediction
from v_bwin
where result = prediction




