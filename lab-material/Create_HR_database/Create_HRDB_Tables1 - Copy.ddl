-- Connect to HRDB@
connect to HRDB @

DROP TABLE "IIBUSER"."EMPLOYEE"    @

CREATE TABLE "IIBUSER"."EMPLOYEE" (
		"EMPNO" CHAR(6) NOT NULL,
		"FIRSTNME" VARCHAR(12) NOT NULL,
		"MIDINIT" CHAR(1),
		"LASTNAME" VARCHAR(15) NOT NULL,
		"WORKDEPT" CHAR(3),
		"PHONENO" CHAR(4),
		"HIREDATE" DATE,
		"JOB" CHAR(8),
		"EDLEVEL" SMALLINT NOT NULL,
		"SEX" CHAR(1),
		"BIRTHDATE" DATE,
		"SALARY" DECIMAL(9 , 2),
		"BONUS" DECIMAL(9 , 2),
		"COMM" DECIMAL(9 , 2)
	)   @

DROP TABLE "IIBUSER"."DEPARTMENT"    @

CREATE TABLE "IIBUSER"."DEPARTMENT" (
		"DEPTNO" CHAR(3) NOT NULL,
		"DEPTNAME" VARCHAR(36) NOT NULL,
		"MGRNO" CHAR(6),
		"ADMRDEPT" CHAR(3) NOT NULL,
		"LOCATION" CHAR(16)
	)    @


INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000010','CHRISTINE','I','HAAS','A00','3978','1995-01-01','PRES    ',18,'F','1963-08-24',152750.00,1000.00,4220.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000020','MICHAEL','L','THOMPSON','B01','3476','2003-10-10','MANAGER ',18,'M','1978-02-02',94250.00,800.00,3300.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000030','SALLY','A','KWAN','C01','4738','2005-04-05','MANAGER ',20,'F','1971-05-11',98250.00,800.00,3060.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000050','JOHN','B','GEYER','E01','6789','1979-08-17','MANAGER ',16,'M','1955-09-15',80175.00,800.00,3214.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000060','IRVING','F','STERN','D11','6423','2003-09-14','MANAGER ',16,'M','1975-07-07',72250.00,500.00,2580.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000070','EVA','D','PULASKI','D21','7831','2005-09-30','MANAGER ',16,'F','2003-05-26',96170.00,700.00,2893.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000090','EILEEN','W','HENDERSON','E11','5498','2000-08-15','MANAGER ',16,'F','1971-05-15',89750.00,600.00,2380.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000100','THEODORE','Q','SPENSER','E21','0972','2000-06-19','MANAGER ',14,'M','1980-12-18',86150.00,500.00,2092.00)  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000110','VINCENZO','G','LUCCHESSI','A00','3490','1988-05-16','SALESREP',19,'M','1959-11-05',66500.00,900.00,3720.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000120','SEAN',' ','O'CONNELL','A00','2167','1993-12-05','CLERK   ',14,'M','1972-10-18',49250.00,600.00,2340.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000130','DELORES','M','QUINTANA','C01','4578','2001-07-28','ANALYST ',16,'F','1955-09-15',73800.00,500.00,1904.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000140','HEATHER','A','NICHOLLS','C01','1793','2006-12-15','ANALYST ',18,'F','1976-01-19',68420.00,600.00,2274.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000150','BRUCE',' ','ADAMSON','D11','4510','2002-02-12','DESIGNER',16,'M','1977-05-17',55280.00,500.00,2022.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000160','ELIZABETH','R','PIANKA','D11','3782','2006-10-11','DESIGNER',17,'F','1980-04-12',62250.00,400.00,1780.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000170','MASATOSHI','J','YOSHIMURA','D11','2890','1999-09-15','DESIGNER',16,'M','1981-01-05',44680.00,500.00,1974.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000180','MARILYN','S','SCOUTTEN','D11','1682','2003-07-07','DESIGNER',17,'F','1979-02-21',51340.00,500.00,1707.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000190','JAMES','H','WALKER','D11','2986','2004-07-26','DESIGNER',16,'M','1982-06-25',50450.00,400.00,1636.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000200','DAVID',' ','BROWN','D11','4501','2002-03-03','DESIGNER',16,'M','1971-05-29',57740.00,600.00,2217.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000210','WILLIAM','T','JONES','D11','0942','1998-04-11','DESIGNER',17,'M','2003-02-23',68270.00,400.00,1462.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000220','JENNIFER','K','LUTZ','D11','0672','1998-08-29','DESIGNER',18,'F','1978-03-19',49840.00,600.00,2387.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000230','JAMES','J','JEFFERSON','D21','2094','1996-11-21','CLERK   ',14,'M','1980-05-30',42180.00,400.00,1774.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000240','SALVATORE','M','MARINO','D21','3780','2004-12-05','CLERK   ',17,'M','2002-03-31',48760.00,600.00,2301.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000250','DANIEL','S','SMITH','D21','0961','1999-10-30','CLERK   ',15,'M','1969-11-12',49180.00,400.00,1534.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000260','SYBIL','P','JOHNSON','D21','8953','2005-09-11','CLERK   ',16,'F','1976-10-05',47250.00,300.00,1380.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000270','MARIA','L','PEREZ','D21','9001','2006-09-30','CLERK   ',15,'F','2003-05-26',37380.00,500.00,2190.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000280','ETHEL','R','SCHNEIDER','E11','8997','1997-03-24','OPERATOR',17,'F','1976-03-28',36250.00,500.00,2100.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000290','JOHN','R','PARKER','E11','4502','2006-05-30','OPERATOR',12,'M','1985-07-09',35340.00,300.00,1227.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000300','PHILIP','X','SMITH','E11','2095','2002-06-19','OPERATOR',14,'M','1976-10-27',37750.00,400.00,1420.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000310','MAUDE','F','SETRIGHT','E11','3332','1994-09-12','OPERATOR',12,'F','1961-04-21',35900.00,300.00,1272.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000320','RAMLAL','V','MEHTA','E21','9990','1995-07-07','FIELDREP',16,'M','1962-08-11',39950.00,400.00,1596.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000330','WING',' ','LEE','E21','2103','2006-02-23','FIELDREP',14,'M','1971-07-18',45370.00,500.00,2030.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('000340','JASON','R','GOUNOT','E21','5698','1977-05-05','FIELDREP',16,'M','1956-05-17',43840.00,500.00,1907.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200010','DIAN','J','HEMMINGER','A00','3978','1995-01-01','SALESREP',18,'F','1973-08-14',46500.00,1000.00,4220.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200120','GREG',' ','ORLANDO','A00','2167','2002-05-05','CLERK   ',14,'M','1972-10-18',39250.00,600.00,2340.00 )  @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200140','KIM','N','NATZ','C01','1793','2006-12-15','ANALYST ',18,'F','1976-01-19',68420.00,600.00,2274.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200170','KIYOSHI',' ','YAMAMOTO','D11','2890','2005-09-15','DESIGNER',16,'M','1981-01-05',64680.00,500.00,1974.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200220','REBA','K','JOHN','D11','0672','2005-08-29','DESIGNER',18,'F','1978-03-19',69840.00,600.00,2387.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200240','ROBERT','M','MONTEVERDE','D21','3780','2004-12-05','CLERK   ',17,'M','1984-03-31',37760.00,600.00,2301.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200280','EILEEN','R','SCHWARTZ','E11','8997','1997-03-24','OPERATOR',17,'F','1966-03-28',46250.00,500.00,2100.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200310','MICHELLE','F','SPRINGER','E11','3332','1994-09-12','OPERATOR',12,'F','1961-04-21',35900.00,300.00,1272.00 )   @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200330','HELENA',' ','WONG','E21','2103','2006-02-23','FIELDREP',14,'F','1971-07-18',35370.00,500.00,2030.00 ) @
INSERT into EMPLOYEE (EMPNO, FIRSTNME, MIDINIT, LASTNAME, WORKDEPT, PHONENO, HIREDATE, JOB, EDLEVEL, SEX, BIRTHDATE, SALARY, BONUS, COMM) VALUES 
('200340','ROY','R','ALONZO','E21','5698','1997-07-05','FIELDREP',16,'M','1956-05-17',31840.00,500.00,1907.00 )  @


INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('A00','SPIFFY COMPUTER SERVICE DIV.','000010','A00',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('B01','PLANNING','000020','A00',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('C01','INFORMATION CENTER','000030','A00',NULL)   @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('D01','DEVELOPMENT CENTER',NULL,'A00',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('D11','MANUFACTURING SYSTEMS','000060','D01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('D21','ADMINISTRATION SYSTEMS','000070','D01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('E01','SUPPORT SERVICES','000050','A00',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('E11','OPERATIONS','000090','E01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('E21','SOFTWARE SUPPORT','000100','E01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('F22','BRANCH OFFICE F2',NULL,'E01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('G22','BRANCH OFFICE G2',NULL,'E01',NULL) @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('H22','BRANCH OFFICE H2',NULL,'E01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('I22','BRANCH OFFICE I2',NULL,'E01',NULL)  @
INSERT into DEPARTMENT (DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION) VALUES
('J22','BRANCH OFFICE J2',NULL,'E01',NULL ) @

--  commit  @