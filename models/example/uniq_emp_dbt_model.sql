{{ config(materialized="table", alise="UNIQ_EMP") }}

select *
from dbt_dev.dbt_raw.emp
qualify row_number() over (partition by emp_id, emp_name order by emp_inst desc) = 1
