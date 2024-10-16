{{ config(materialized='table') }}

Select 
    md.Magtype as Magnitude_type,
    Count(ef.earthquake_id) as count_magtype
FROM
{{ ref("Magnitude_Type_Dimension") }} md
inner join  {{ ref("Earthquake_fact") }} ef on md.magnitude_type_id = ef.magnitude_type_id
group by Magnitude_type