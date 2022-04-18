select * from overall_b365_predicted 

select avg(uncertainty) from overall_b365_predicted 

select stdev(prct_b365h) from overall_b365_predicted 

select avg(prct_b365h) from overall_b365_predicted 

select * from b365_proper_predict

select avg(uncertainty) from b365_proper_predict

select stdev(prct_b365h) from b365_proper_predict

select avg(prct_b365h)from b365_proper_predict

select * from v_b365_matched

select avg(prct_match_b365) from v_b365_matched

create table all_predict_b365 as
select *,
case when prct_b365h > (prct_b365d + prct_b365a) then 'home win'
when prct_b365d > (prct_b365h + prct_b365a) then 'draw'
when prct_b365a > (prct_b365h + prct_b365d) then 'away win'
else 'no prediction results'
end as prediction
from v_b365_

create view v_1xx2_res as
select result, prct_b365h, prct_b365d, prct_b365a, uncertainty, prediction,
case when result = 'draw' then prct_b365h + prct_b365d
end as '1X_or_X2'
from all_predict_b365
where prediction not like 'no%' and result != 'away win'

select *
from v_1xx2_res
where "1X_or_X2" NOTNULL 
order by "1X_or_X2" desc

select prct_b365h, count(prct_b365h) as no_diff_prct, uncertainty
from all_predict_b365
where result = prediction
group by prct_b365h
order by count(prct_b365h) desc


/* b365 comment*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*7 different percentiges // 126 results in 4 seasons predicted properly
 * avg uncertainty base on different prct is 6.76 % - in overall properly predicted it is 6.72 % 
 * only home wins is predicted properly
 * range prct predicted for home win is between 46.14 % to 68.87%*
 * standard deviation of home percentige for different results is 7.81 - in overall properly predicted it is 7.18 %%
 * average home prediction for home winner is 58.63% - in overall properly predicted it is 58.99%
 * season 2012/2013 - 22% results properly predicted
 * season 2013/2014 - 18% results properly predicted
 * season 2014/2015 - 12% results properly predicted
 * season 2015/2016 - 14% results properly predicted
 * average properly predicted results is 16.50%
 * for properly predicted home wins, the best approach is to select that bet, where min prct for home win is 68% in other case better is to go with '1X'
 * in case of not properly predicted home win (draw as a result), if we will take assumption that with min 71.41% certainty to 86.02% we can predict 1X result
 * for '1X' the best is to select that bet, where certaintity is min 82 %*/



select * from overall_bwin_predicted

select avg(uncertainty) from overall_bwin_predicted

select stdev(prct_bwh) from overall_bwin_predicted 

select avg(prct_bwh) from overall_bwin_predicted

select * from bwin_proper_predict

select avg(uncertainty) from bwin_proper_predict

select stdev(prct_bwh) from bwin_proper_predict

select avg(prct_bwh)from bwin_proper_predict

select * from v_bwin_matched

select avg(prct_match_bwin) from v_bwin_matched

/*7 different percentiges // 126 results in 4 seasons predicted properly
 * avg uncertainty base on different prct is 3.10 - after consideration of all properly predicted results it is 3.08% 
 * only home wins is predicted properly
 * range prct predicted for home win is between 47.36 % to 69.29%*
 * standard deviation of home percentige for different results is 7.60% - after consideration of all properly predicted results it is 6.99 %
 * average home prediction for home winner is 59.35% - after consideration of all properly predicted results it is 59.70%
 * season 2012/2013 - 22% results properly predicted
 * season 2013/2014 - 18% results properly predicted
 * season 2014/2015 - 12% results properly predicted
 * season 2015/2016 - 14% results properly predicted
 * average properly predicted results is 16.50%*/


select * from overall_interwetten_predicted

select avg(uncertainty) from
(select * from overall_interwetten_predicted
group by uncertainty 
having uncertainty > 0)

select stdev(prct_iwh) from overall_interwetten_predicted 

select avg(prct_iwh) from overall_interwetten_predicted

/*6 different percentiges
 * avg uncertainty base on different prct is 0.29%, but 2 results are overrated - without that avg uncertainty is 0.70 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 52.39 % to 69.60%*
 * standard deviation of home percentige for different results is 5.82%
 * average home prediction for home winner is 61.89%*/

/*due to many overrated prediction interwetten was not considered for futher investigations*/


select * from overall_ladbrokers_predicted

select avg(uncertainty) from overall_ladbrokers_predicted

select stdev(prct_lbh) from overall_ladbrokers_predicted 

select avg(prct_lbh) from overall_ladbrokers_predicted

select * from loadbrokers_proper_predict

select avg(uncertainty) from loadbrokers_proper_predict

select stdev(prct_lbh) from loadbrokers_proper_predict

select avg(prct_lbh)from loadbrokers_proper_predict

select * from v_ladbrokers_match_

select avg(prct_match_b365) from v_ladbrokers_match_

/*6 different percentiges // 110 overall properly predicted results
 * avg uncertainty base on different prct is 3.25 % (the same result for all matches where result was properly predicted)
 * only home wins is predicted properly
 * range prct predicted for home win is between 51.67 % to 69.17%*
 * standard deviation of home percentige for different results is 5.89 - result for all properly predicted matches is 5.42%
 * average home prediction for home winner is 61.18% and result when all data with proper prediction was considered is 61.34%
 * season 2012/2013 - 19% results properly predicted
 * season 2013/2014 - 16% results properly predicted
 * season 2014/2015 - 11% results properly predicted
 * season 2015/2016 - 13% results properly predicted
 * average properly predicted results is 14.75 %*/


select * from overall_pinnacle_predicted

select avg(uncertainty) from overall_pinnacle_predicted

select stdev(prct_psh) from overall_pinnacle_predicted 

select avg(prct_psh) from overall_pinnacle_predicted

/*7 different percentiges
 * avg uncertainty base on different prct is 7.74 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 46.25 % to 68.71%*
 * standard deviation of home percentige for different results is 7.68%
 * average home prediction for home winner is 58.40%*/


select * from overall_willaimhill_predicted

select avg(uncertainty) from overall_willaimhill_predicted

select stdev(prct_wwh) from overall_willaimhill_predicted

select avg(prct_wwh) from overall_willaimhill_predicted

/*6 different percentiges
 * avg uncertainty base on different prct is 2.72 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 50.31 % to 68.28%*
 * standard deviation of home percentige for different results is 6.02%
 * average home prediction for home winner is 60.30%*/


select * from overall_stanjames_predicted

select avg(uncertainty) from
(select * from overall_stanjames_predicted
group by uncertainty 
having uncertainty > 0)

select stdev(prct_sjh) from overall_stanjames_predicted
group by result
having prct_sjh > prct_sja

select avg(prct_sjh) from overall_stanjames_predicted
group by result
having prct_sjh > prct_sja

/*8 different percentiges
 * avg uncertainty base on different prct is 2.84, but there is one away predicted with overrating - without that result is 3.95 %
 * 7 home wins predicted and 1 away win (overrated)
 * range prct predicted for win is between 49.40 % to 71.26%*
 * standard deviation of home percentige for different results is 7.68% - here calculated without overrated result
 * average home prediction for home winner is 61.35% - here calculated without overrated result*/


select * from overall_vcbet_predicted

select avg(uncertainty) from overall_vcbet_predicted

select stdev(prct_vch) from overall_vcbet_predicted

select avg(prct_vch) from overall_vcbet_predicted

/*7 different percentiges
 * avg uncertainty base on different prct is 6.92 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 46.34 % to 68.35%*
 * standard deviation of home percentige for different results is 7.55%
 * average home prediction for home winner is 58.38 %*/


select * from overall_gamebookers_predicted

select avg(uncertainty) from overall_gamebookers_predicted

select stdev(prct_gbh) from overall_gamebookers_predicted

select avg(prct_gbh) from overall_gamebookers_predicted

/*7 different percentiges
 * avg uncertainty base on different prct is 1.93 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 50.48 % to 69.98 %*
 * standard deviation of home percentige for different results is 7.31%
 * average home prediction for home winner is 61.53 %*/


select * from overall_bluesquare_predicted

select avg(uncertainty) from overall_bluesquare_predicted

select stdev(prct_bsh) from overall_bluesquare_predicted

select avg(prct_bsh) from overall_bluesquare_predicted

/*7 different percentiges
 * avg uncertainty base on different prct is 1.54 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 51.76 % to 70.14 %*
 * standard deviation of home percentige for different results is 7.10%
 * average home prediction for home winner is 61.70 %*/



---------------------------------------------------------------------------------------------------------------------------------------------------------------------


















