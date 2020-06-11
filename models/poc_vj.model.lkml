connection: "sabre-eda-aspoc"
include: "/views/*.view"
datagroup: poc_vj_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: poc_vj_default_datagroup
