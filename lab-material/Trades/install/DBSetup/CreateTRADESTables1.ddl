-- Connect to TRADES@
connect to TRADES @

DROP TABLE IIBADMIN.WMB_MSGS   @
DROP TABLE IIBADMIN.WMB_EVENT_TYPES  @
DROP TABLE IIBADMIN.WMB_EVENT_FIELDS   @
DROP TABLE IIBADMIN.WMB_BINARY_DATA  @

CREATE TABLE IIBADMIN.WMB_MSGS  
 (WMB_MSGKEY        VARCHAR(100) NOT NULL,	  
                                    
  HAS_BITSTREAM     CHARACTER(1),	
  HAS_EXCEPTION     CHARACTER(1),	
  HAS_USERDATA      CHARACTER(1),	
                                    
  EVENT_TYPE        VARCHAR(100),	                                  
                                    
  EVENT_NAME        VARCHAR(100),   
  EVENT_SRCADDR     VARCHAR(100),   
                                    
  BROKER_NAME       VARCHAR(100),   
  BROKER_UUID       VARCHAR(100),   
  EXGRP_NAME        VARCHAR(100),   
  EXGRP_UUID        VARCHAR(100),   
  MSGFLOW_NAME      VARCHAR(100),   
  MSGFLOW_UUID      VARCHAR(100),   
  APPL_NAME         VARCHAR(100),   
  APPL_UUID         VARCHAR(100),   
  LIBRARY_NAME      VARCHAR(100),   
  LIBRARY_UUID      VARCHAR(100),   
  NODE_NAME         VARCHAR(100),   
  NODE_TYPE         VARCHAR(100),
  DETAIL            VARCHAR(100),   
  TERMINAL_NAME     VARCHAR(100),   
                                    
  KEY_FLD_1_NM      VARCHAR(100),	                                  	
  KEY_FLD_2_NM      VARCHAR(100),	
  KEY_FLD_3_NM      VARCHAR(100),	                                  	
  KEY_FLD_4_NM      VARCHAR(100),	                                  	
  KEY_FLD_5_NM      VARCHAR(100),	                                  	
                                    
  EVENT_TIMESTAMP   VARCHAR(100),   
                                                
  LOCAL_TRANSACTION_ID   VARCHAR(100),          
  PARENT_TRANSACTION_ID  VARCHAR(100),          
  GLOBAL_TRANSACTION_ID  VARCHAR(100)           
 )                                              
DATA CAPTURE NONE  @

CREATE TABLE IIBADMIN.WMB_EVENT_TYPES                    
 (                                              
  EVENT_TYPE_ID     INTEGER   NOT NULL,         
  EVENT_NAME        VARCHAR(100),               
  EVENT_DESCRIPTION VARCHAR(100)                
 )                                              
 DATA CAPTURE NONE   @
                                                
CREATE TABLE IIBADMIN.WMB_EVENT_FIELDS                   
 (                                              
  EVENT_TYPE_ID     INTEGER NOT NULL,           
  KEY_FLD_ID        INTEGER NOT NULL,           
  KEY_FLD_NAME      VARCHAR(100),               
  KEY_FLD_DESC      VARCHAR(100),               
  KEY_FLD_PATH      VARCHAR(200)                
 )                                               
  DATA CAPTURE NONE    @                   
                                                
CREATE TABLE IIBADMIN.WMB_BINARY_DATA                    
 (                                              
  WMB_MSGKEY    VARCHAR(100) NOT NULL,          
  DATA_TYPE     INTEGER      NOT NULL,          
  ENCODING      VARCHAR(50)  NOT NULL,          
  DATA          CLOB(5242880)                
 )                                              
DATA CAPTURE NONE   @
                                                
ALTER TABLE WMB_MSGS ADD CONSTRAINT WMB_MSGS_PK PRIMARY KEY (WMB_MSGKEY)    @
ALTER TABLE WMB_EVENT_TYPES ADD CONSTRAINT WMB_EVENT_TYPES_PK PRIMARY KEY (EVENT_TYPE_ID)    @
ALTER TABLE WMB_EVENT_FIELDS ADD CONSTRAINT WMB_EVENT_FIELDS_PK PRIMARY KEY (EVENT_TYPE_ID)   @
ALTER TABLE WMB_BINARY_DATA ADD CONSTRAINT WMB_BINARY_DATA_PK PRIMARY KEY (WMB_MSGKEY, DATA_TYPE)   @
commit  @