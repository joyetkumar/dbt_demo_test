{{ config(materialized='table') }}
with
    petal_length as (
        select id as id, petallengthcm as petallengthcm
        from {{ source("staging1", "my_first_table3") }}
    ),

    petal_witdth as (
        select id as id, petalwidthcm as petalwidthcm
        from {{ source("staging1", "my_first_table5") }}
    ),

    species as (
        select id as id, species as species
        from {{ source("staging1", "my_first_table4") }}
    )

select
    l.id,
    l.petallengthcm * w.petalwidthcm as petal_multiplication,
    l.petallengthcm + w.petalwidthcm as petal_add,
    s.species
from petal_length l
inner join petal_witdth w on l.id = w.id
inner join species s on w.id = s.id
