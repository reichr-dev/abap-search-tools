INTERFACE zif_sat_c_cds_assoc_type
  PUBLIC .

  CONSTANTS abstract_entity TYPE ddtargetkind VALUE 'A' ##no_text.
  CONSTANTS custom_entity TYPE ddtargetkind VALUE 'C' ##no_text.
  CONSTANTS entity TYPE ddtargetkind VALUE 'B' ##no_text.
  CONSTANTS view_entity TYPE ddtargetkind VALUE 'W' ##no_text.
  CONSTANTS view TYPE ddtargetkind VALUE 'J' ##no_text.
  CONSTANTS table TYPE ddtargetkind VALUE 'T' ##no_text.
  CONSTANTS table_function TYPE ddtargetkind VALUE 'F' ##no_text.
  CONSTANTS projection_entity TYPE ddtargetkind VALUE 'R' ##no_text.

ENDINTERFACE.
