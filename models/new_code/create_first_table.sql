select Id as Id,
SepalLengthCm as SepalLengthCm
from
{{source ('staging1','my_first_table1')}}