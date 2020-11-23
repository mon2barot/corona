view: vw_covid_us {
  label: "Confirmed, Recovered, Deaths"
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
    #type: string
    map_layer_name: countries
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
    #type: string
    sql: ${TABLE}.fips ;;
    map_layer_name: us_counties_fips
  }

  dimension: latitude {
    type: number
    #type:  location
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_geom {
    type: string
    #type:  location
    sql: ${TABLE}.location_geom ;;
  }

  dimension: longitude {
    type: number
    #type: location
    sql: ${TABLE}.longitude ;;
  }

  dimension: province_state {
    #type: string
    sql: ${TABLE}.province_state ;;
    map_layer_name: us_states
  }

  dimension: recovered {
    type: number
    sql: ${TABLE}.recovered ;;
  }

  dimension: person_location {
    label: "Location of Person"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    #sql: ${confirmed} ;;
  }

  #dimension: id_of_patient {
   # label: "Patient ID"
    #type: number
    #sql: ${patient_id} ;;
  #}

 # measure: count {
  #  type: count
   # drill_fields: []
  #}

  measure: confirmed_count{
    label: "Total Confirmed Cases"
    type: count_distinct
    sql: ${confirmed} ;;
  }

  measure: confirmed_avg{
    label: "Average Confirmed Cases"
    type: average
    sql: ${confirmed} ;;
  }

  measure: recovered_count{
    label: "Total Recovered Cases"
    type: count_distinct
    sql: ${recovered} ;;
  }

  measure: recovered_avg{
    label: "Average Recovered Cases"
    type: average
    sql: ${recovered} ;;
  }

  measure: death_count{
    label: "Total Deaths"
    type: count_distinct
    sql: ${deaths} ;;
  }

  measure: death_avg{
    label: "Average Deaths"
    type: average
    sql: ${deaths} ;;
  }

  measure: card_confirmed_count{
    label: "Total Confirmed Cases(K)"
    hidden: yes
    value_format: "0.0,\" K\""
    type: count_distinct
    sql: ${confirmed} ;;
  }

  measure: card_recovered_count{
    label: "Total Recovered Cases(K)"
    hidden: yes
    type: count_distinct
    value_format: "0.0,\" K\""
    sql: ${recovered} ;;
  }

  measure: card_death_count{
    label: "Total Deaths(K)"
    hidden: yes
    type: count_distinct
    value_format: "0.0,\" K\""
    sql: ${deaths} ;;
  }

}
