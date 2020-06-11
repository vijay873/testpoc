view: geo_service_location {
  sql_table_name: `sab-eda-01-8302.reference_data.geo_service_location`
    ;;

  dimension: active_indicator {
    type: yesno
    sql: ${TABLE}.active_indicator ;;
  }

  dimension: city_code {
    type: string
    sql: ${TABLE}.city_code ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension_group: country_effective_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.country_effective_timestamp ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: data_source_code {
    type: string
    sql: ${TABLE}.data_source_code ;;
  }

  dimension_group: discontinue_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.discontinue_timestamp ;;
  }

  dimension_group: effective_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.effective_timestamp ;;
  }

  dimension: iata_service_location_indicator {
    type: yesno
    sql: ${TABLE}.iata_service_location_indicator ;;
  }

  dimension: intracountry_subdivision_code {
    type: string
    sql: ${TABLE}.intracountry_subdivision_code ;;
  }

  dimension: intracountry_subdivision_effective_timestamp {
    type: string
    sql: ${TABLE}.intracountry_subdivision_effective_timestamp ;;
  }

  dimension: intracountry_subdivision_name {
    type: string
    sql: ${TABLE}.intracountry_subdivision_name ;;
  }

  dimension: latitude_decimal_degree_measurement {
    type: number
    sql: ${TABLE}.latitude_decimal_degree_measurement ;;
  }

  dimension: latitude_degree_measurement {
    type: number
    sql: ${TABLE}.latitude_degree_measurement ;;
  }

  dimension: latitude_degree_minute_second_direction_measurement {
    type: string
    sql: ${TABLE}.latitude_degree_minute_second_direction_measurement ;;
  }

  dimension: latitude_direction_code {
    type: string
    sql: ${TABLE}.latitude_direction_code ;;
  }

  dimension: latitude_minute_measurement {
    type: number
    sql: ${TABLE}.latitude_minute_measurement ;;
  }

  dimension: latitude_second_measurement {
    type: number
    sql: ${TABLE}.latitude_second_measurement ;;
  }

  dimension_group: load_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.load_timestamp ;;
  }

  dimension: longitude_decimal_degree_measurement {
    type: number
    sql: ${TABLE}.longitude_decimal_degree_measurement ;;
  }

  dimension: longitude_degree_measurement {
    type: number
    sql: ${TABLE}.longitude_degree_measurement ;;
  }

  dimension: longitude_degree_minute_second_direction_measurement {
    type: string
    sql: ${TABLE}.longitude_degree_minute_second_direction_measurement ;;
  }

  dimension: longitude_direction_code {
    type: string
    sql: ${TABLE}.longitude_direction_code ;;
  }

  dimension: longitude_minute_measurement {
    type: number
    sql: ${TABLE}.longitude_minute_measurement ;;
  }

  dimension: longitude_second_measurement {
    type: number
    sql: ${TABLE}.longitude_second_measurement ;;
  }

  dimension: service_location_code {
    type: string
    sql: ${TABLE}.service_location_code ;;
  }

  dimension: service_location_name {
    type: string
    sql: ${TABLE}.service_location_name ;;
  }

  dimension: service_location_type_code {
    type: string
    sql: ${TABLE}.service_location_type_code ;;
  }

  dimension: service_location_type_description {
    type: string
    sql: ${TABLE}.service_location_type_description ;;
  }

  dimension: time_zone_code {
    type: string
    sql: ${TABLE}.time_zone_code ;;
  }

  dimension_group: time_zone_effective_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time_zone_effective_timestamp ;;
  }

  dimension: time_zone_name {
    type: string
    sql: ${TABLE}.time_zone_name ;;
  }

  measure: count {
    type: count
    drill_fields: [service_location_name, city_name, country_name, time_zone_name, intracountry_subdivision_name]
  }
}
