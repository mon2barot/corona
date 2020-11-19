view: vw_contact_tracing_covid19 {
  sql_table_name: `coherentrxpoc.coherentrxpoc_DS.VW_CONTACT_TRACING_COVID19`
    ;;

  dimension: patient_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.PATIENT_ID ;;
  }

  dimension: cont_patient_country {
    type: string
    sql: ${TABLE}.CONT_PATIENT_COUNTRY ;;
  }

  dimension: cont_patient_county {
    type: string
    sql: ${TABLE}.CONT_PATIENT_COUNTY ;;
  }

  dimension: cont_patient_first_name {
    type: string
    sql: ${TABLE}.CONT_PATIENT_FIRST_NAME ;;
  }

  dimension: cont_patient_last_name {
    type: string
    sql: ${TABLE}.CONT_PATIENT_LAST_NAME ;;
  }

  dimension: cont_patient_state {
    type: string
    sql: ${TABLE}.CONT_PATIENT_STATE ;;
  }

  dimension: contracted_patient_id {
    type: string
    sql: ${TABLE}.CONTRACTED_PATIENT_ID ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.COUNTY ;;
  }

  dimension: covid_inspector_id {
    type: string
    sql: ${TABLE}.COVID_INSPECTOR_ID ;;
  }

  dimension: covid_inspector_name {
    type: string
    sql: ${TABLE}.COVID_INSPECTOR_NAME ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: is_contracted {
    type: string
    sql: ${TABLE}.IS_CONTRACTED ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  measure: count {
    type: count
    drill_fields: [cont_patient_first_name, last_name, first_name, cont_patient_last_name, covid_inspector_name]
  }
}
