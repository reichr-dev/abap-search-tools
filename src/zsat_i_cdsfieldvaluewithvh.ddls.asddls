/*
    Provides all views that have field annotations that
    can be used as value helps
*/
@AbapCatalog.sqlViewName: 'ZSATICFVWVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View fields with assigned Value H.'

define view ZSAT_I_CDSFieldValueWithVH
  as select from ddfieldanno
{
  key strucobjn                       as Entity,
  key lfieldname                      as FieldName,
      value                           as AssociationNameRaw,
      upper(replace(value, '''', '')) as AssociationName
}
where
     name = 'OBJECTMODEL.FOREIGNKEY.ASSOCIATION'
  or name = 'CONSUMPTION.VALUEHELP'
