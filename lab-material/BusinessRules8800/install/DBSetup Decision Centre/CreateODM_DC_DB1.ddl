-- drop, create and connect to ODMDC@
echo *******************************************************@
echo the following command may fail because the database did@
echo NOT previously exist, this is an acceptable error@
echo *******************************************************@
drop database ODMDC  @
create database ODMDC   @
connect to ODMDC   @

catalog system odbc data source ODMDC  @

CREATE BUFFERPOOL BP32K SIZE 8000 PAGESIZE 32 K   @

--Create a large tablespace (needed for the LDAPCONNECTION table in ODM 8.8)
CREATE TABLESPACE ODMDCTS PAGESIZE 32K BUFFERPOOL BP32K   @

-- create the schema
CREATE SCHEMA IIBADMIN  @


commit @