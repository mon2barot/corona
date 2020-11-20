view: vw_covid_us {
  sql_table_name: `coherentrxpoc.coherentrxpoc_DS.VW_COVID_US`
    ;;

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: admin2 {
    type: string
    sql: ${TABLE}.admin2 ;;
  }

  dimension: combined_key {
    type: string
    sql: ${TABLE}.combined_key ;;
  }

  dimension: confirmed {
    type: number
    sql: ${TABLE}.confirmed ;;
  }

  dimension: country_region {
    type: string
    sql: ${TABLE}.country_region ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: fips {
    type: string
    sql: ${TABLE}.fips ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_geom {
    type: string
    sql: ${TABLE}.location_geom ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: province_state {
    type: string
    sql: ${TABLE}.province_state ;;
  }

  dimension: recovered {
    type: number
    sql: ${TABLE}.recovered ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
