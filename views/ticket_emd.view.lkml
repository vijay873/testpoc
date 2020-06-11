view: ticket_emd {
  sql_table_name: `sab-eda-01-8302.as_offer_dashboard.ticket_emd`
    ;;

  dimension: airline_code {
    type: string
    sql: ${TABLE}.AirlineCode ;;
  }

  dimension: charge_amount {
    type: number
    sql: ${TABLE}.ChargeAmount ;;
  }

  dimension: commercial_name {
    type: string
    sql: ${TABLE}.CommercialName ;;
  }

  dimension: coupon_seq_nbr {
    type: number
    sql: ${TABLE}.CouponSeqNbr ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.CurrencyCode ;;
  }

  dimension: doc_type_code {
    type: string
    sql: ${TABLE}.DocTypeCode ;;
  }

  dimension: emdreason_for_issuance {
    type: string
    sql: ${TABLE}.EMDReasonForIssuance ;;
  }

  dimension: ocgroup_code {
    type: string
    sql: ${TABLE}.OCGroupCode ;;
  }

  dimension_group: pnrcreatedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.PNRCreatedate ;;
  }

  dimension: quant_sold {
    type: number
    sql: ${TABLE}.QuantSold ;;
  }

  dimension: service_end_city {
    type: string
    sql: ${TABLE}.ServiceEndCity ;;
  }

  dimension: service_start_city {
    type: string
    sql: ${TABLE}.ServiceStartCity ;;
  }

  dimension_group: service_startdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ServiceStartdate ;;
  }

  dimension_group: vcrcreatedate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.VCRCreatedate ;;
  }

  measure: count {
    type: count
    drill_fields: [commercial_name]
  }
}
