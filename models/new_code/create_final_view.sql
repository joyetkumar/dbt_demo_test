select s.Id,s.sepal_multiplication,s.sepal_add,w.petal_multiplication,w.petal_add,w.species,w.curr_date
from {{ ref('create_sepal_agg') }} s INNER JOIN
{{ ref('create_petal_agg') }} w ON s.Id=w.Id
ORDER by s.Id asc