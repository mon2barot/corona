view: contact_tracing_view {
  sql_table_name: `coherentrxpoc.coherentrxpoc_DS.ContactTracingView`
    ;;

  dimension: patient_l1 {
    type: string
    sql: ${TABLE}.Patient_L1 ;;
  }

  dimension: patient_l2 {
    type: string
    sql: ${TABLE}.Patient_L2 ;;
  }

  dimension: patient_l3 {
    type: string
    sql: ${TABLE}.Patient_L3 ;;
  }

  dimension: patient_l4 {
    type: string
    sql: ${TABLE}.Patient_L4 ;;
  }

  dimension: patient_l5 {
    type: string
    sql: ${TABLE}.Patient_L5 ;;
  }

  dimension: patient_l6 {
    type: string
    sql: ${TABLE}.Patient_L6 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
