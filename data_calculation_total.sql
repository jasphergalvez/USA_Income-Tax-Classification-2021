select *
from `21zpallnoagi`;

with cte as(select STATE, sum(n1) as taxpayers, sum(n2) as population, sum(n2) - sum(n1) as non_taxpayers
from `21zpallnoagi`
group by STATE
)
select *, (non_taxpayers / population) * 100 as percent_nontaxpayers
from cte
;

create table datavisual(state varchar(255), population int, taxpayers int, non_taxpayers int, percent_nontaxpayers int);

insert into datavisual
with cte as(select STATE, sum(n1) as taxpayers, sum(n2) as population, sum(n2) - sum(n1) as non_taxpayers
from `21zpallnoagi`
group by STATE
)
select *, (non_taxpayers / population) * 100 as percent_nontaxpayers
from cte
;

select *
from datavisual;

select "Total", sum(population), sum(taxpayers), sum(non_taxpayers), sum(non_taxpayers) / sum(population) * 100 as total_percent_nontax
from datavisual;

insert datavisual
select "Total", sum(population), sum(taxpayers), sum(non_taxpayers), sum(non_taxpayers) / sum(population) * 100 as total_percent_nontax
from datavisual;

