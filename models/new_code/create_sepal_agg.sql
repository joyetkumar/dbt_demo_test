{{ config(materialized='table') }}
with sepal_length as (
select Id as Id,
SepalLengthCm as SepalLengthCm
from
{{source ('staging1','my_first_table1')}}
),

sepal_witdth as (
select Id as Id,
SepalWidthCm as SepalWidthCm
from
{{source ('staging1','my_first_table2')}}
),

species as (
select Id as Id,
Species as Species
from
{{source ('staging1','my_first_table4')}}
)

select l.Id, l.SepalLengthCm*w.SepalWidthCm AS sepal_multiplication,l.SepalLengthCm+w.SepalWidthCm AS sepal_add,s.Species from sepal_length l
INNER JOIN sepal_witdth w ON l.Id=w.Id
INNER JOIN species s ON w.Id=s.Id
