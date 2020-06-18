view: ticket_emd {
  sql_table_name: `sab-eda-01-8302.as_offer_dashboard.ticket_emd`
    ;;

#     Period over period logic #

  dimension: this_year {
    hidden: yes
    type: yesno
    sql: ${service_startdate_year} = extract(year from current_date()) ;;
  }

  dimension: last_year {
    hidden: yes
    type: yesno
    sql: ${service_startdate_year} = extract(year from current_date()) - 1 ;;
  }

  dimension: this_month {
    hidden: yes
    type: yesno
    sql: ${service_startdate_month_num} = extract(month from current_date()) ;;
  }

  dimension: last_month {
    hidden: yes
    type: yesno
    sql: ${service_startdate_month_num} = extract(month from current_date()) - 1;;
  }

  dimension: year_to_date {
    hidden: yes
    type: yesno
    sql: ${service_startdate_day_of_year} <= extract(DAYOFYEAR from current_date()) ;;
  }

  dimension: airline_code {
    type: string
    sql: ${TABLE}.AirlineCode ;;
  }




  measure: this_year_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
    filters: [this_year: "yes", year_to_date: "yes"]
  }

  measure: last_year_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
    filters: [last_year: "yes", year_to_date: "yes"]
  }


  measure: year_to_date_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
    filters: [ year_to_date: "yes"]
  }

  measure: this_month_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
    filters: [ this_month: "yes"]
  }

  measure: last_month_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
    filters: [ last_month: "yes"]
  }

  measure: Total_charge_amt {
    group_label: "Charge Amount"
    type: sum
    sql: ${charge_amount} ;;
    value_format_name: usd_0
   # filters: [ year_to_date: "yes"]
  }

  dimension: charge_amount {
    type: number
    #value_format:"#.00"
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

  dimension: sales_group_by_quantity {
    label: "Sale Amount Range"
    type: string
    #drill_fields: [market,commercial_name]
#     sql: ${emdreason_for_issuance} ;;
    case: {
      when: {
        label: "1 - 50"
        sql:${charge_amount} >= 1 AND ${charge_amount}<=50 ;;
      }
      when: {
        label: "50 - 100"
        sql:${charge_amount} >= 50 AND ${charge_amount}<=100 ;;
      }
      when: {
        label: "100 - 300"
        sql:${charge_amount} >= 100 AND ${charge_amount}<=300 ;;
      }
      when: {
        label: "300 - 500"
        sql:${charge_amount} >= 300 AND ${charge_amount}<=500 ;;
      }
      when: {
        label: "500 - 800"
        sql:${charge_amount} >= 500 AND ${charge_amount}<=800 ;;
      }
      when: {
        label: "800 - 1000"
        sql:${charge_amount} >= 800 AND ${charge_amount}<=1000 ;;
      }
      when: {
        label: "1000 - 1500"
        sql:${charge_amount} >= 1000 AND ${charge_amount}<=1500 ;;
      }
      when: {
        label: "1500 - 2000"
        sql:${charge_amount} >= 1500 AND ${charge_amount}<=2000 ;;
      }
      when: {
        label: "2000 - 3000"
        sql:${charge_amount} >= 2000 AND ${charge_amount}<=3000 ;;
      }
      when: {
        label: "3000 - 4000"
        sql:${charge_amount} >= 3000 AND ${charge_amount}<=4000 ;;
      }
      when: {
        label: "4000 - 5000"
        sql:${charge_amount} >= 4000 AND ${charge_amount}<=5000 ;;
      }
      when: {
        label: "5000 - 6000"
        sql:${charge_amount} >= 5000 AND ${charge_amount}<=6000 ;;
      }
      else : "others"
      }
      }


  dimension: ocgroup_code_full {
    label: "Ancillary"
    type: string
    #drill_fields: [market,commercial_name]
#     sql: ${emdreason_for_issuance} ;;
    case: {
      when: {
        label: "Seats"
        sql:${ocgroup_code} = "SA" ;;
      }
      when: {
        label: "Bags"
        sql:${ocgroup_code} = "BG" ;;
      }
      when: {
        label: "Ground Transport"
        sql:${ocgroup_code} = "GT" ;;
      }
      when: {
        label: "Inflight Entertainment"
        sql:${ocgroup_code} = "IE" ;;
      }
      when: {
        label: "Food and Beverage"
        sql:${ocgroup_code} = "ML" ;;
      }
      when: {
        label: "Pets"
        sql:${ocgroup_code} = "PT" ;;
      }
      when: {
        label: "Store"
        sql:${ocgroup_code} = "ST" ;;
      }
      when: {
        label: "Travel Services"
        sql:${ocgroup_code} = "TS" ;;
      }
      when: {
        label: "Upgrages"
        sql:${ocgroup_code} = "UP" ;;
      }

    else: "Others"
    }
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
    #value_format:"#.00"
    sql: ${TABLE}.QuantSold ;;
  }

  dimension: service_end_city {
    type: string
    sql: ${TABLE}.ServiceEndCity ;;
  }

  dimension: service_start_city {
    type: string
    sql: ${TABLE}.ServiceStartCity;;
    drill_fields: [pnrcreatedate.date,emdreason_for_issuance]
  }

  dimension: market {
    type: string
    sql: concat(${service_start_city}, " - ",${service_end_city}) ;;
  }

  dimension_group: service_startdate {
    type: time
    timeframes: [
           raw,
      date,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      day_of_week,
      day_of_week_index,
      month,
      month_name,
      month_num,
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
