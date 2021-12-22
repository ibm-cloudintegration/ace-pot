-- drop, create and connect to HRDB@
echo *******************************************************@
echo the following command may fail because the database did@
echo NOT previously exist, this is an acceptable error@
echo *******************************************************@
drop database HRDB @
create database HRDB @
connect to HRDB @

-- catalog HRDB as a odbc data source
catalog system odbc data source HRDB @


-- create the schema
CREATE SCHEMA IIBADMIN  @


commit @