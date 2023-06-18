use  air ;
select  *  from  ticket_details;
#aggregate functions(min,max,count,avg,sum)

select sum(bi)as price_total from ticket_details;

select max(bi)as price_total from ticket_details;

select count(bi)as price_total from ticket_details;

select avg(bi)as price_total from ticket_details;
select min(bi)as price_total, class_id from ticket_details
 group by class_id   
 having price_total>100
 order by price_total desc
 limit 1,2;
 


##finding the max values of the  group  by  agge

#window (rank,dense_rank,lead,lag,first_value,last_value,nth,ntile,percent_rank ,cume_dist)
select max(bi) as price ,class_id from  ticket_details group by class_id order by price ;


select *,max(bi)  over (partition by class_id ) as masx_price from ticket_details  order by masx_price ; 

select  * , dense_rank() over (partition by class_id order by bi  desc )as min_pricde from  ticket_details where bi > 300;

select *, lead (bi) over (partition  by  class_id order by  bi desc) as lead_price   from   ticket_details;

select *, first_value(brand) over(partition  by  class_id order by  bi  desc)as fisrt from ticket_details;
select  * ,last_value(bi) over (partition by class_id order by  bi desc) as las from ticket_details;

select  *, nth_value(bi,2) over w as 3th from ticket_details
window w as (partition by class_id order by bi desc range between unbounded preceding and unbounded following );

select  *, ntile(3) over  (order by bi  desc) as ntle from ticket_details  where class_id = 'Bussiness';
select cum ,class_id from (
select  *,round(cume_dist() over (order by bi )*100  ,4) as cum from ticket_details )as cum where cum  <50;

select per,class_id from(
select  *, round( percent_rank() over (order by bi )*100,2) as per from ticket_details)as per where  per <10;