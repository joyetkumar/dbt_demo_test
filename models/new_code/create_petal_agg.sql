with petal_length as (
select Id as Id,
PetalLengthCm as PetalLengthCm
from
{{source ('staging1','my_first_table3')}}
),

petal_witdth as (
select Id as Id,
PetalWidthCm as PetalWidthCm
from
{{source ('staging1','my_first_table5')}}
),

species as (
select Id as Id,
Species as Species
from
{{source ('staging1','my_first_table4')}}
)

select l.Id, l.PetalLengthCm*w.PetalWidthCm AS petal_multiplication,l.PetalLengthCm+w.PetalWidthCm AS petal_add,s.Species from petal_length l
INNER JOIN petal_witdth w ON l.Id=w.Id
INNER JOIN species s ON w.Id=s.Id
