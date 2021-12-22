-- drop, create and connect to BTMDB@
echo *******************************************************@
echo the following command may fail because the database did@
echo NOT previously exist, this is an acceptable error@
echo *******************************************************@
drop database BTMDB  @
create database BTMDB   @
connect to BTMDB   @

-- catalog BTMDB as a odbc data source
catalog system odbc data source BTMDB  @

-- create the schema
CREATE SCHEMA IIBADMIN  @


commit @