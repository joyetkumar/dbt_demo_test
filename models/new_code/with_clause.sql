with source_data as (
select Id as Id,
SepalLengthCm as SepalLengthCm
from
{{source ('staging1','my_first_table1')}}
)
select * from source_data