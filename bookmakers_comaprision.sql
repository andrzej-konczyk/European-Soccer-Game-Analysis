select * from overall_b365_predicted 

select avg(uncertainty) from overall_b365_predicted 

select stdev(prct_b365h) from overall_b365_predicted 

select avg(prct_b365h) from overall_b365_predicted 

/*7 different percentiges
 * avg uncertainty base on different prct is 6.76 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 46.14 % to 68.87%*
 * standard deviation of home percentige for different results is 7.81%
 * average home prediction for home winner is 58.63%*/



select * from overall_bwin_predicted

select avg(uncertainty) from overall_bwin_predicted

select stdev(prct_bwh) from overall_bwin_predicted 

select avg(prct_bwh) from overall_bwin_predicted

/*7 different percentiges
 * avg uncertainty base on different prct is 3.10 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 47.36 % to 69.29%*
 * standard deviation of home percentige for different results is 7.60%
 * average home prediction for home winner is 59.35%*/


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


select * from overall_ladbrokers_predicted

select avg(uncertainty) from overall_ladbrokers_predicted

select stdev(prct_lbh) from overall_ladbrokers_predicted 

select avg(prct_lbh) from overall_ladbrokers_predicted

/*6 different percentiges
 * avg uncertainty base on different prct is 3.25 %
 * only home wins is predicted properly
 * range prct predicted for home win is between 51.67 % to 69.17%*
 * standard deviation of home percentige for different results is 5.89%
 * average home prediction for home winner is 61.18%*/


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


select * from overall_gamebookers_predicted


select * from overall_bluesquare_predicted