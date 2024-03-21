# new version
USE Bridge;
select bridge_structure.STRUCTURE_KIND_043A, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T
join bridge_structure using (BRIDGE_ID)
group by bridge_structure.STRUCTURE_KIND_043A;

select bridge_structure.STRUCTURE_TYPE_043B, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T
join bridge_structure using (BRIDGE_ID)
group by bridge_structure.STRUCTURE_TYPE_043B;

select S.adt, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T join 
(select BRIDGE_ID, elt(interval(ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000') as adt 
from bridge_traffic) as S using (BRIDGE_ID)
group by S.adt;

(select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T join 
(select BRIDGE_ID, elt(interval(ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000') as adt 
from bridge_traffic) as S using (BRIDGE_ID)
group by S.adt;

select BRIDGE_ID, elt(interval(ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000') as adt 
from bridge_traffic;

select S.length, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T join 
(select BRIDGE_ID, elt(interval(STRUCTURE_LEN_MT_049,0, 50, 100, 1000), '0-50', '50-100', '100-1000', '>1000') as length
from bridge_structure) as S using (BRIDGE_ID)
group by S.length;

# old version
select bridge_structure.STRUCTURE_KIND_043A,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as total_number,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 0.1 and 250 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '0~250',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 250.1 and 500 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '250~500',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 500.1 and 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '500~750',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '>750'
from bridge_maintance natural join bridge_structure
group by bridge_structure.STRUCTURE_KIND_043A;

select bridge_structure.STRUCTURE_TYPE_043B,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as total_number,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 0.1 and 250 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '0~250',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 250.1 and 500 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '250~500',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 500.1 and 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '500~750',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '>750'
from bridge_maintance natural join bridge_structure
group by bridge_structure.STRUCTURE_TYPE_043B;

select elt(interval(bridge_traffic.ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000') as ADT,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as total_number,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 0.1 and 250 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '0~250',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 250.1 and 500 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '250~500',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 500.1 and 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '500~750',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '>750'
from bridge_maintance natural join bridge_traffic 
group by elt(interval(bridge_traffic.ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000');

select elt(interval(bridge_structure.STRUCTURE_LEN_MT_049,0, 50, 100, 1000), '0-50', '50-100', '100-1000', '>1000') as Length,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as total_number,
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 0.1 and 250 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '0~250',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 250.1 and 500 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '250~500',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 between 500.1 and 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '500~750',
count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 750 then 1 end) / count(case when bridge_maintance.BRIDGE_IMP_COST_094 + bridge_maintance.ROADWAY_IMP_COST_095 > 0 then 1 end) as '>750'
from bridge_maintance natural join bridge_structure
group by elt(interval(bridge_structure.STRUCTURE_LEN_MT_049,0, 50, 100, 1000), '0-50', '50-100', '100-1000', '>1000');


# calculating gamma
drop table if exists length;
create table length as
select S.length, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T join 
(select BRIDGE_ID, elt(interval(STRUCTURE_LEN_MT_049,0, 50, 100, 1000), '0-50', '50-100', '100-1000', '>1000') as length
from bridge_structure) as S using (BRIDGE_ID)
group by S.length;

delimiter $$
drop procedure if exists gamma_length$$
create procedure gamma_length()
begin 
declare i bigint;
declare j bigint;
set i = 0;
set j = 0;
set i = i + ((select a from length where id = 1) * (select sum(b) + sum(c) + sum(d) from length where id in (2,3,4)));
set i = i + ((select a from length where id = 2) * (select sum(b) + sum(c) + sum(d) from length where id in (3,4)));
set i = i + ((select a from length where id = 3) * (select sum(b) + sum(c) + sum(d) from length where id in (4)));
set i = i + ((select b from length where id = 1) * (select sum(c) + sum(d) from length where id in (2,3,4)));
set i = i + ((select b from length where id = 2) * (select sum(c) + sum(d) from length where id in (3,4)));
set i = i + ((select c from length where id = 1) * (select sum(d) from length where id in (2,3,4)));
set j = j + ((select a from length where id = 4) * (select sum(b) + sum(c) + sum(d) from length where id in (1,2,3)));
set j = j + ((select a from length where id = 3) * (select sum(b) + sum(c) + sum(d) from length where id in (1,2)));
set j = j + ((select a from length where id = 2) * (select sum(b) + sum(c) + sum(d) from length where id in (1)));
set j = j + ((select b from length where id = 4) * (select sum(c) + sum(d) from length where id in (1,2,3)));
set j = j + ((select b from length where id = 3) * (select sum(c) + sum(d) from length where id in (1,2)));
set j = j + ((select c from length where id = 4) * (select sum(d) from length where id in (1,2,3)));
select (i-j)/(i+j);
end $$
delimiter ;
call gamma_length();

drop table if exists adt;
create table adt as
select S.adt, count(T.cost),
count(case when T.cost between 0.1 and 250 then 1 end) / count(T.cost) as '0~250',
count(case when T.cost between 250.1 and 500 then 1 end) / count(T.cost) as '250~500',
count(case when T.cost between 500.1 and 750 then 1 end) / count(T.cost) as '500~750',
count(case when T.cost > 750 then 1 end) / count(T.cost) as '>750'
from (select BRIDGE_ID, BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 as cost from bridge_maintance 
where BRIDGE_IMP_COST_094 + ROADWAY_IMP_COST_095 > 0) as T join 
(select BRIDGE_ID, elt(interval(ADT_029,0, 100, 500, 1000), '0-100', '100-500', '500-1000', '>1000') as adt 
from bridge_traffic) as S using (BRIDGE_ID)
group by S.adt;

delimiter $$
drop procedure if exists gamma_adt$$
create procedure gamma_adt()
begin 
declare i bigint;
declare j bigint;
set i = 0;
set j = 0;
set i = i + ((select a from adt where id = 1) * (select sum(b) + sum(c) + sum(d) from adt where id in (2,3,4)));
set i = i + ((select a from adt where id = 2) * (select sum(b) + sum(c) + sum(d) from adt where id in (3,4)));
set i = i + ((select a from adt where id = 3) * (select sum(b) + sum(c) + sum(d) from adt where id in (4)));
set i = i + ((select b from adt where id = 1) * (select sum(c) + sum(d) from adt where id in (2,3,4)));
set i = i + ((select b from adt where id = 2) * (select sum(c) + sum(d) from adt where id in (3,4)));
set i = i + ((select c from adt where id = 1) * (select sum(d) from adt where id in (2,3,4)));
set j = j + ((select a from adt where id = 4) * (select sum(b) + sum(c) + sum(d) from adt where id in (1,2,3)));
set j = j + ((select a from adt where id = 3) * (select sum(b) + sum(c) + sum(d) from adt where id in (1,2)));
set j = j + ((select a from adt where id = 2) * (select sum(b) + sum(c) + sum(d) from adt where id in (1)));
set j = j + ((select b from adt where id = 4) * (select sum(c) + sum(d) from adt where id in (1,2,3)));
set j = j + ((select b from adt where id = 3) * (select sum(c) + sum(d) from adt where id in (1,2)));
set j = j + ((select c from adt where id = 4) * (select sum(d) from adt where id in (1,2,3)));
select (i-j)/(i+j);
end $$
delimiter ;
call gamma_adt();