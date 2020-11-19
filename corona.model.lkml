connection: "db-contact-tracing-covid19"

include: "/views/**/vw_contact_tracing_covid19.view.lkml"
include: "/views/**/contact_tracing_view.view.lkml"

explore:corona  {
  label: "Patient, State & County"
  view_name: vw_contact_tracing_covid19
}

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
