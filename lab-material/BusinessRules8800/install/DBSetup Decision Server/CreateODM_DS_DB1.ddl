-- drop, create and connect to ODMDS@
echo *******************************************************@
echo the following command may fail because the database did@
echo NOT previously exist, this is an acceptable error@
echo *******************************************************@
drop database ODMDS  @
create database ODMDS   @
connect to ODMDS   @

-- catalog ODMDS as a odbc data source
catalog system odbc data source ODMDS  @

-- Create a large bufferpool
create bufferpool BP32K size 8000 pagesize 32 K  @

-- create the schema
CREATE SCHEMA IIBADMIN  @


commit @