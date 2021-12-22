-- drop, create and connect to ODMDC@
echo *******************************************************@
echo the following command may fail because the database did@
echo NOT previously exist, this is an acceptable error@
echo *******************************************************@
drop database ODMDC  @
create database ODMDC   @
connect to ODMDC   @

catalog system odbc data source ODMDC  @

-- create the schema
CREATE SCHEMA IIBADMIN  @


commit @