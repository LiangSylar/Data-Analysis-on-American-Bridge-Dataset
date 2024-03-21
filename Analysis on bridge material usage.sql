#Question 3
select YEAR_BUILT_027, rail, total, rail/total*100 as percentage from
(select YEAR_BUILT_027, count(FACILITY_CARRIED_007) as rail
from BRIDGE
force index(primary)
where SERVICE_ON_042A = 2 or 
SERVICE_UND_042B = 2
group by YEAR_BUILT_027
order by YEAR_BUILT_027) as t1
natural join
(select YEAR_BUILT_027, count(FACILITY_CARRIED_007) as total
from BRIDGE
force index(primary)
group by YEAR_BUILT_027
order by YEAR_BUILT_027) as t2;

select YEAR_BUILT_027, total, mili, mili/total*100 as percentage
from(
select YEAR_BUILT_027, count(FACILITY_CARRIED_007) as total
from BRIDGE
force index(primary)
group by YEAR_BUILT_027
order by YEAR_BUILT_027) as t1 
natural join 
(select YEAR_BUILT_027, count(FACILITY_CARRIED_007) as mili
from BRIDGE
force index(primary)
where STRAHNET_HIGHWAY_100 != 0
group by YEAR_BUILT_027
order by YEAR_BUILT_027) as t2;

select YEAR_BUILT_027, STRUCTURE_KIND_043A, count(*)
from TMP_TABLE
group by YEAR_BUILT_027, STRUCTURE_KIND_043A
order by YEAR_BUILT_027;

select YEAR_BUILT_027, APPR_KIND_044A, count(*) as cnt
from TMP_TABLE
where APPR_KIND_044A between 1 and 9
group by YEAR_BUILT_027, APPR_KIND_044A
order by YEAR_BUILT_027;

select YEAR_BUILT_027, DECK_STRUCTURE_TYPE_107, count(*)
from TMP_TABLE
where DECK_STRUCTURE_TYPE_107 != 'N'
and DECK_STRUCTURE_TYPE_107 != ''
group by YEAR_BUILT_027, DECK_STRUCTURE_TYPE_107
order by YEAR_BUILT_027, DECK_STRUCTURE_TYPE_107;
