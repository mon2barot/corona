view: vw_contact_tracing_covid19 {
  sql_table_name: `coherentrxpoc.coherentrxpoc_DS.VW_CONTACT_TRACING_COVID19`;;
  label: "Patient, State & County"

  dimension: patient_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.PATIENT_ID ;;
    html:{% if vw_contact_tracing_covid19.is_contracted._value  == "Y" %}
            <font color = "red">{{value}}</font>
          {% else %}
            <font color="green">{{value}}</font>
            {% endif %};;
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
    map_layer_name: us_counties_fips
    sql: ${TABLE}.COUNTY ;;
    case: {
      when: {
        sql: ${TABLE}.county = "Kent" ;;
        label: "26081"
      }
      when: {
        sql: ${TABLE}.county = "Macomb" ;;
        label: "26099"
      }
      when: {
        sql: ${TABLE}.county="Wayne" ;;
        label: "26163"
      }
      else: "etc."
    }
  }

  dimension: county_fips {
    label: "County Fips"
    type:  string
    map_layer_name: us_counties_fips
    sql:
    CASE WHEN ${vw_contact_tracing_covid19.county} = 'Kent' THEN ${vw_contact_tracing_covid19.county} = '26081'
    WHEN ${vw_contact_tracing_covid19.county} = 'Macomb' THEN ${vw_contact_tracing_covid19.county} = '26099'
    WHEN ${vw_contact_tracing_covid19.county} = 'Wayne' THEN ${vw_contact_tracing_covid19.county} = '26163'
    ELSE null end;;
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

    map_layer_name: us_states
    sql: ${TABLE}.STATE ;;
  }

  measure: total_patient_count {
    label: "Total Patient Count"
    type: count_distinct
    sql: ${patient_id} ;;
  }

  measure: percent_of_total_patient {
    label: "Percentage of Patients"
    type: percent_of_total
    sql: ${total_patient_count} ;;
  }

}


 # measure: total_patient_count{
  #  label: "Total Patient Count"
   # type: count
    #drill_fields: [cont_patient_first_name, last_name, first_name, cont_patient_last_name, covid_inspector_name]
  #}
