--------------------------------------------------------
--  �ļ��Ѵ��� - ������-����-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence APPEAL_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."APPEAL_ID_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 8 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence APPEAL_IMG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."APPEAL_IMG_SEQ"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence COMMENT_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."COMMENT_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence COMMODITY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."COMMODITY_ID_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence IND_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."IND_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence NTC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."NTC_ID_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TMP_IMAGE_KEY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."TMP_IMAGE_KEY_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 441 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USERIDSEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."USERIDSEQUENCE"  MINVALUE 1000000 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000060 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RELEASE"."USER_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ADMINISTRATOR
--------------------------------------------------------

  CREATE TABLE "RELEASE"."ADMINISTRATOR" 
   (	"ADMIN_ID" NUMBER(10,0), 
	"ADMIN_ACCNUMBER" VARCHAR2(20 BYTE), 
	"ADMIN_PASSWORD" VARCHAR2(20 BYTE), 
	"ADMIN_STATE" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."ADMINISTRATOR"."ADMIN_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."ADMINISTRATOR"."ADMIN_PASSWORD" IS 'The table stores the MD5 value of the actual password';
   COMMENT ON COLUMN "RELEASE"."ADMINISTRATOR"."ADMIN_STATE" IS '0: Not logged in/1: Logged in';
--------------------------------------------------------
--  DDL for Table APPEAL
--------------------------------------------------------

  CREATE TABLE "RELEASE"."APPEAL" 
   (	"APP_ID" NUMBER(10,0), 
	"APP_MATTERS" NUMBER(1,0), 
	"APP_CONTENT" VARCHAR2(2000 BYTE), 
	"USER_ID" NUMBER(10,0), 
	"COM_ID" NUMBER(10,0), 
	"CMT_ID" NUMBER(10,0), 
	"APP_USERID" NUMBER(10,0), 
	"APP_TIME" DATE
   ) ;

   COMMENT ON COLUMN "RELEASE"."APPEAL"."APP_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."APPEAL"."APP_MATTERS" IS '1:Inaccurate product information/2: food safety issues/3:Incomplete merchant qualifications/4:Malicious comments/5:Multiple refund swipes/6:multiple malicious comments';
   COMMENT ON COLUMN "RELEASE"."APPEAL"."USER_ID" IS 'FK, nullable, referenced from the user table';
   COMMENT ON COLUMN "RELEASE"."APPEAL"."COM_ID" IS 'FK, nullable, referenced from the community table';
   COMMENT ON COLUMN "RELEASE"."APPEAL"."CMT_ID" IS 'FK, nullable, referenced from comment table';
   COMMENT ON COLUMN "RELEASE"."APPEAL"."APP_USERID" IS 'FK, referenced from the user table';
--------------------------------------------------------
--  DDL for Table BROWSE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."BROWSE" 
   (	"BRO_TIME_START" TIMESTAMP (6), 
	"BRO_TIME_END" TIMESTAMP (6), 
	"COM_ID" NUMBER(38,0), 
	"BROWSER_ID" NUMBER(10,0), 
	"WHETHER_BUY" NUMBER(1,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."BROWSE"."BRO_TIME_START" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."BROWSE"."COM_ID" IS 'PK,FK,"Referencing the com_ID attribute in the commodity table';
   COMMENT ON COLUMN "RELEASE"."BROWSE"."BROWSER_ID" IS 'PK,FK,Referencing the cus_ID attribute in the customer table';
   COMMENT ON COLUMN "RELEASE"."BROWSE"."WHETHER_BUY" IS '0:havn''t purchase/1:purchase';
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "RELEASE"."CHAT" 
   (	"CHAT_TIME" TIMESTAMP (6), 
	"CUS_ID" NUMBER(10,0), 
	"STORE_ID" NUMBER(10,0), 
	"CHAT_CONTENT" VARCHAR2(2000 BYTE), 
	"CHAT_SENDER" NUMBER(1,0), 
	"CHAT_TYPE" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."CHAT"."CHAT_TIME" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."CHAT"."CUS_ID" IS 'PK,FK,Referencing the cus_ID attribute in the customer table';
   COMMENT ON COLUMN "RELEASE"."CHAT"."STORE_ID" IS 'PK,FK,Referencing the store_ID attribute in the store table';
   COMMENT ON COLUMN "RELEASE"."CHAT"."CHAT_SENDER" IS '0:customer/1:store';
   COMMENT ON COLUMN "RELEASE"."CHAT"."CHAT_TYPE" IS '0:text/1:image';
--------------------------------------------------------
--  DDL for Table COMMODITIES_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITIES_CATEGORIES" 
   (	"COM_CATEGORY" VARCHAR2(20 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITIES_CATEGORIES"."COM_CATEGORY" IS 'The category of a commodity being available in value 	PK';
--------------------------------------------------------
--  DDL for Table COMMODITY
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITY" 
   (	"COM_ID" NUMBER(38,0), 
	"COM_NAME" VARCHAR2(200 BYTE), 
	"COM_INTRODUCTION" VARCHAR2(2000 BYTE), 
	"COM_EXPIRATIONDATE" DATE, 
	"COM_UPLOADDATE" DATE, 
	"COM_LEFT" NUMBER(*,0), 
	"COM_RATING" NUMBER(5,3), 
	"STO_ID" NUMBER(10,0), 
	"COM_ORIPRICE" NUMBER(10,2), 
	"COM_STATUS" NUMBER(2,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_ID" IS 'commodity ID,PK';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_NAME" IS 'Commodity name administrator can be modified, the administrator remarks content fusion here';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_INTRODUCTION" IS 'Merchants, administrators can be modified';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_EXPIRATIONDATE" IS 'due date';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_UPLOADDATE" IS 'On the shelf time';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_LEFT" IS 'Commodity allowance';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_RATING" IS 'Product score';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."STO_ID" IS 'Merchant ID, FK, quoted from the store table';
   COMMENT ON COLUMN "RELEASE"."COMMODITY"."COM_STATUS" IS '-1 for bad,0 for empty,1 for on sale';
--------------------------------------------------------
--  DDL for Table COMMODITY_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITY_CATEGORIES" 
   (	"COM_ID" NUMBER(38,0), 
	"COM_CATEGORY" VARCHAR2(20 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITY_CATEGORIES"."COM_ID" IS 'PK, FK, referenced from store table
';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_CATEGORIES"."COM_CATEGORY" IS 'FK, referenced from commodities_categories table

';
--------------------------------------------------------
--  DDL for Table COMMODITY_COMMENT
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITY_COMMENT" 
   (	"CMT_ID" NUMBER(10,0), 
	"CMT_FATHER" NUMBER(10,0), 
	"CMT_CONTENT" VARCHAR2(2000 BYTE), 
	"CMT_TIME" DATE, 
	"COM_ID" NUMBER(38,0), 
	"USER_ID" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITY_COMMENT"."CMT_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_COMMENT"."CMT_FATHER" IS '0: no parent comment/non-zero: parent comment ID*';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_COMMENT"."COM_ID" IS 'FK, referenced from commodity table';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_COMMENT"."USER_ID" IS 'FK, referenced from the user table';
--------------------------------------------------------
--  DDL for Table COMMODITY_IMAGE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITY_IMAGE" 
   (	"COM_ID" NUMBER(38,0), 
	"COM_IMAGE" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITY_IMAGE"."COM_ID" IS 'Commodity ID,PK';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_IMAGE"."COM_IMAGE" IS 'Commodity Image, PK,store using relative path';
--------------------------------------------------------
--  DDL for Table COMMODITY_PRICE_CURVE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."COMMODITY_PRICE_CURVE" 
   (	"COM_PC_TIME" DATE, 
	"COM_PC_PRICE" NUMBER(10,2), 
	"COM_ID" NUMBER(38,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."COMMODITY_PRICE_CURVE"."COM_PC_TIME" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."COMMODITY_PRICE_CURVE"."COM_ID" IS 'PK,FK, foreign keys depend on the com_ID of the commidity';
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "RELEASE"."CUSTOMER" 
   (	"CUS_ID" NUMBER(10,0), 
	"CUS_NICKNAME" VARCHAR2(20 BYTE), 
	"CUS_NOTES" VARCHAR2(2000 BYTE), 
	"CUS_PAYPASSWORD" VARCHAR2(20 BYTE), 
	"CUS_STATE" NUMBER(1,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."CUSTOMER"."CUS_ID" IS 'Customer ID / PK, FK, the same as the corresponding user_ID';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER"."CUS_NICKNAME" IS 'nickname';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER"."CUS_NOTES" IS 'Personal notes can be set up personally or modified by the administrator';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER"."CUS_PAYPASSWORD" IS 'Storage in the payment password table is the md 5 value of the actual password';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER"."CUS_STATE" IS 'Account status 0: closed / 1: normal';
--------------------------------------------------------
--  DDL for Table CUSTOMER_LOVE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."CUSTOMER_LOVE" 
   (	"CUS_ID" NUMBER(10,0), 
	"COM_CATEGORY" VARCHAR2(20 BYTE), 
	"CUS_LOVE_WEIGHT" NUMBER(15,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."CUSTOMER_LOVE"."CUS_ID" IS 'Customer ID,PK, FK, is the same as the cus_ID in customer';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER_LOVE"."COM_CATEGORY" IS 'Commodity category, PK, FK, is the same as com_category in the commodities_categories table';
   COMMENT ON COLUMN "RELEASE"."CUSTOMER_LOVE"."CUS_LOVE_WEIGHT" IS 'Favor label weight, recommendation algorithm to determine';
--------------------------------------------------------
--  DDL for Table FAVORITE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."FAVORITE" 
   (	"COM_ID" NUMBER(38,0), 
	"CUS_ID" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."FAVORITE"."COM_ID" IS 'PK,FK,Referencing the com_ID attribute in the commodity table';
   COMMENT ON COLUMN "RELEASE"."FAVORITE"."CUS_ID" IS 'PK,FK,Referencing the cus_ID attribute in the customer table';
--------------------------------------------------------
--  DDL for Table INDENT
--------------------------------------------------------

  CREATE TABLE "RELEASE"."INDENT" 
   (	"IND_ID" NUMBER(10,0), 
	"IND_QUANTITY" NUMBER(*,0), 
	"IND_CREATIONTIME" DATE, 
	"IND_VERIFICATIONCODE" VARCHAR2(50 BYTE), 
	"IND_NOTES" VARCHAR2(2000 BYTE), 
	"IND_STATE" NUMBER(1,0), 
	"CUS_ID" NUMBER(10,0), 
	"COM_ID" NUMBER(38,0), 
	"IND_RTIME" DATE, 
	"IND_RNOTES" VARCHAR2(2000 BYTE), 
	"IND_MONEY" NUMBER(15,2), 
	"IND_RMONEY" NUMBER(15,2), 
	"IND_RATING" NUMBER(15,1)
   ) ;

   COMMENT ON COLUMN "RELEASE"."INDENT"."IND_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."INDENT"."IND_STATE" IS '0: To be verified/1: Completed/2: Refunded';
   COMMENT ON COLUMN "RELEASE"."INDENT"."CUS_ID" IS 'FK, referenced from customer table';
   COMMENT ON COLUMN "RELEASE"."INDENT"."COM_ID" IS 'FK, referenced from the community table';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."NOTICE" 
   (	"NTC_ID" NUMBER(10,0), 
	"NTC_TIME" DATE, 
	"NTC_CONTENT" VARCHAR2(2000 BYTE), 
	"NTC_STATE" NUMBER(1,0), 
	"STO_ID" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."NOTICE"."NTC_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."NOTICE"."NTC_STATE" IS '0: Not displayed/1: Displayed';
   COMMENT ON COLUMN "RELEASE"."NOTICE"."STO_ID" IS 'FK, referenced from store table';
--------------------------------------------------------
--  DDL for Table SCREENSHOT
--------------------------------------------------------

  CREATE TABLE "RELEASE"."SCREENSHOT" 
   (	"APP_ID" NUMBER(10,0), 
	"SCT_IMAGE" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."SCREENSHOT"."APP_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."SCREENSHOT"."SCT_IMAGE" IS 'PK,store using relative path';
--------------------------------------------------------
--  DDL for Table STORE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."STORE" 
   (	"STO_ID" NUMBER(10,0), 
	"STO_NAME" VARCHAR2(20 BYTE), 
	"STO_INTRODUCTION" VARCHAR2(2000 BYTE), 
	"STO_LICENSEIMG" VARCHAR2(200 BYTE), 
	"STO_STATE" NUMBER(1,0)
   ) ;

   COMMENT ON COLUMN "RELEASE"."STORE"."STO_ID" IS 'Merchant ID, PK, FK, is the same as the corresponding user_ID';
   COMMENT ON COLUMN "RELEASE"."STORE"."STO_NAME" IS 'Merchant name';
   COMMENT ON COLUMN "RELEASE"."STORE"."STO_INTRODUCTION" IS 'Business profile, can be set by the businesses themselves, can also be modified by the administrator';
   COMMENT ON COLUMN "RELEASE"."STORE"."STO_LICENSEIMG" IS 'Business executive, according to the image table stored in the image relative path';
   COMMENT ON COLUMN "RELEASE"."STORE"."STO_STATE" IS '0: Closed / 1: Normal / 2: to be reviewed';
--------------------------------------------------------
--  DDL for Table STOREIMAGE
--------------------------------------------------------

  CREATE TABLE "RELEASE"."STOREIMAGE" 
   (	"STO_ID" NUMBER(10,0), 
	"STO_IMAGE" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."STOREIMAGE"."STO_ID" IS 'PK';
   COMMENT ON COLUMN "RELEASE"."STOREIMAGE"."STO_IMAGE" IS 'PK, stored as a relative path';
--------------------------------------------------------
--  DDL for Table STORE_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "RELEASE"."STORE_CATEGORIES" 
   (	"STORE_ID" NUMBER(10,0), 
	"COM_CATEGORY" VARCHAR2(20 BYTE)
   ) ;

   COMMENT ON COLUMN "RELEASE"."STORE_CATEGORIES"."STORE_ID" IS 'Merchant IDPK, FK, quoted from the store table';
   COMMENT ON COLUMN "RELEASE"."STORE_CATEGORIES"."COM_CATEGORY" IS 'Product category FK, quoted from table commodities_categories';
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "RELEASE"."USERS" 
   (	"USER_PHONE" VARCHAR2(20 BYTE), 
	"USER_PASSWORD" VARCHAR2(20 BYTE), 
	"USER_ADDRESS" VARCHAR2(100 BYTE), 
	"USER_STATE" NUMBER(1,0), 
	"USER_REGTIME" DATE, 
	"USER_TYPE" NUMBER(1,0), 
	"USER_ID" NUMBER(10,0), 
	"USER_BALANCE" NUMBER(15,2)
   ) ;

   COMMENT ON COLUMN "RELEASE"."USERS"."USER_PHONE" IS 'Phone number, not repeatable, unique';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_PASSWORD" IS 'Login password, the table stores the md 5 value of the actual password';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_ADDRESS" IS 'Geographic location, separating strings of geographic information by semicolons, and processing with functions for queries and operation';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_STATE" IS 'Login status, 0: Not login / 1: Login';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_REGTIME" IS 'registration time';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_TYPE" IS 'User type, 0: Customer / 1: merchant';
   COMMENT ON COLUMN "RELEASE"."USERS"."USER_ID" IS 'PK';
--------------------------------------------------------
--  DDL for View INDENT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "RELEASE"."INDENT_VIEW" ("IND_ID", "IND_QUANTITY", "IND_CREATIONTIME", "IND_VERIFICATIONCODE", "IND_NOTES", "IND_STATE", "CUS_ID", "COM_ID", "IND_RTIME", "IND_RNOTES", "IND_MONEY", "IND_RMONEY", "IND_RATING") AS 
  SELECT "IND_ID","IND_QUANTITY","IND_CREATIONTIME","IND_VERIFICATIONCODE","IND_NOTES","IND_STATE","CUS_ID","COM_ID","IND_RTIME","IND_RNOTES","IND_MONEY","IND_RMONEY","IND_RATING" FROM RELEASE.INDENT
;
REM INSERTING into RELEASE.ADMINISTRATOR
SET DEFINE OFF;
Insert into RELEASE.ADMINISTRATOR (ADMIN_ID,ADMIN_ACCNUMBER,ADMIN_PASSWORD,ADMIN_STATE) values (1,null,'123456','1');
REM INSERTING into RELEASE.APPEAL
SET DEFINE OFF;
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (6,5,'�����˿�',1000017,null,null,1000004,to_date('07-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (7,4,'���û��ƺ���������',null,82,24,1000017,to_date('07-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (1,5,'�����˿�',1000017,null,null,1000004,to_date('04-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (2,2,'��������',null,10,null,1000018,to_date('05-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (3,2,'����������',null,10,null,1000018,to_date('05-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (4,1,'��˫��������',null,10,null,1000018,to_date('05-9�� -23','DD-MON-RR'));
Insert into RELEASE.APPEAL (APP_ID,APP_MATTERS,APP_CONTENT,USER_ID,COM_ID,CMT_ID,APP_USERID,APP_TIME) values (5,5,'�����˿��������',1000017,null,null,1000004,to_date('05-9�� -23','DD-MON-RR'));
REM INSERTING into RELEASE.BROWSE
SET DEFINE OFF;
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.50.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.56.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.57.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.57.33.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.57.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.57.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.57.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.57.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.57.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.58.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),83,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.58.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.58.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.58.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.58.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),145,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.55.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 06.00.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 06.05.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 06.05.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),108,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 06.06.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 06.06.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 06.09.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 06.09.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),142,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.13.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.17.36.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.17.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.17.53.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.35.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.35.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.37.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.39.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.39.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.39.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.39.29.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.39.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.39.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),148,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 07.56.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 07.56.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),148,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.04.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.04.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.05.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.05.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),143,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.05.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.05.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.05.34.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.05.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),143,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.06.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.06.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),108,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.36.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.36.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.36.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.36.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.36.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.36.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.36.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.36.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.37.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.38.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.46.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.46.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.48.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.48.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),98,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.54.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.54.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),38,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.54.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.55.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.55.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.56.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.56.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.56.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.56.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.56.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.56.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.57.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.57.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.57.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.57.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.58.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 08.58.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 08.58.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 02.37.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 02.37.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),148,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.15.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.15.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),108,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.15.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.15.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),169,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.15.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.16.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),169,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.16.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.16.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),169,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.16.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.16.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),105,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.16.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.16.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),105,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.16.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.16.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),61,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 03.27.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 03.28.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('09-9�� -23 04.09.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-9�� -23 04.09.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),154,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 07.53.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 07.53.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),52,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 07.53.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 07.54.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),4,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 07.54.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 07.54.34.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),49,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 07.55.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 07.56.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),49,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 07.57.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 07.57.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),8,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 08.00.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 08.00.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),8,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.19.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.19.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),7,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.30.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.30.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.31.03.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.31.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.31.14.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.31.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.32.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.32.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.32.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.32.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.32.34.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.32.36.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.26.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.29.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),36,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.40.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.41.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),36,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.33.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.33.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.34.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.34.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.34.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.34.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.35.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.35.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),10,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.35.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.35.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),30,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.35.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.37.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),30,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.37.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.38.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),30,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.40.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.40.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.40.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.40.29.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.42.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.42.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.42.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.42.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.47.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.47.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),10,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 02.00.53.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 02.00.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 02.00.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 02.00.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 02.01.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 02.01.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 02.01.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 02.01.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),94,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 04.24.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 04.25.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 04.25.41.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 04.25.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 04.25.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 04.25.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 04.27.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 04.28.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 04.28.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 04.28.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 05.41.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 05.41.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 06.33.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 06.34.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),94,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 06.36.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 06.36.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),94,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 06.37.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 06.39.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),94,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.22.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 07.24.36.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),94,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.25.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 07.25.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.40.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 07.40.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.44.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 07.53.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.53.53.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 07.54.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 07.55.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.00.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.01.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.01.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.01.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.01.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.05.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.05.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),26,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.06.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.06.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),26,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.09.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.09.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),26,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.10.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.10.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.11.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.11.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 08.11.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 08.56.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 09.19.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 09.19.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 09.27.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 09.28.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 09.28.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.08.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),41,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.11.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.11.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.14.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.14.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.14.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.15.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.15.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.16.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),101,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.16.34.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.16.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),36,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 10.16.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 10.16.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),26,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.08.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.08.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.09.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.09.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.13.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.13.40.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.13.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.13.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.14.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.14.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.16.03.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.16.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('07-9�� -23 01.16.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-9�� -23 01.16.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.39.36.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.39.40.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.39.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.40.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.40.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.40.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.44.33.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.48.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.49.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.49.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 10.50.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 10.51.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.16.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.18.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),4,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.24.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.24.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),11,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.24.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),11,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.24.53.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.24.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.24.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.25.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),12,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.25.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.25.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.28.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.28.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),23,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.46.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.47.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('04-9�� -23 11.49.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-9�� -23 11.49.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.10.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.10.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.10.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.11.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.11.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.11.41.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),25,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.11.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.12.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.40.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.40.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),23,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 12.46.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 12.47.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),10,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.06.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.06.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),7,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.06.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.07.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),8,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.07.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.07.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.08.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.08.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.08.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.08.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.09.26.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.09.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),4,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.11.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.11.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),63,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.11.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.11.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.17.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.17.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.20.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.20.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),50,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 01.25.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 01.26.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),50,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.17.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.17.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),52,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.17.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.18.03.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.24.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.24.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),14,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.33.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.33.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),40,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.39.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.39.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),42,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.49.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.49.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.50.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.50.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),63,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.50.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.51.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),63,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.51.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.51.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),38,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('05-9�� -23 11.57.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-9�� -23 11.58.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.00.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.01.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),6,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.01.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.01.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),38,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.06.36.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.06.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),12,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.24.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.24.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),92,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.26.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.26.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.27.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.27.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.27.40.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.33.12.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.33.33.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.33.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),19,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.51.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.51.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000019,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.56.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.56.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),41,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 12.56.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 12.56.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 11.22.08.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 11.22.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),86,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 02.23.13.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 02.23.14.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),75,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 02.23.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 02.23.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),22,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 02.23.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 02.23.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),41,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 02.23.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 02.23.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),41,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('06-9�� -23 02.29.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-9�� -23 02.29.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),82,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 01.50.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 01.50.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 02.19.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 02.20.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),59,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 02.30.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 02.30.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),144,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.16.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.16.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),43,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.37.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.37.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.37.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.37.29.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.37.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.37.32.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.37.33.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.37.38.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),108,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.37.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.37.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),143,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 03.59.07.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 03.59.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.11.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.11.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),15,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.11.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.12.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),151,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.12.20.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.13.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),108,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.14.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.14.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),154,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.26.41.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.26.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.26.51.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.26.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.26.57.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.26.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.27.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.27.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.57.29.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.57.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.57.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.57.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),9,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.57.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 04.57.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),142,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 04.58.41.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.02.50.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),150,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.03.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.03.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),10,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.06.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.07.15.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.07.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.07.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.10.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.10.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.10.53.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.10.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.11.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.12.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),154,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.12.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.13.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.13.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.13.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.13.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.13.52.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),142,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.13.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.21.28.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.21.37.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.21.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.22.45.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.22.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),46,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.22.56.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.23.01.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.25.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.25.44.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),5,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.29.49.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.31.27.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.35.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.35.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),143,1000008,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.35.55.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.35.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.44.18.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.44.21.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),152,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.47.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.47.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),65,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.47.06.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.47.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),35,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.47.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.48.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),62,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.48.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.48.30.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.48.39.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.48.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000017,0);
Insert into RELEASE.BROWSE (BRO_TIME_START,BRO_TIME_END,COM_ID,BROWSER_ID,WHETHER_BUY) values (to_timestamp('08-9�� -23 05.49.11.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('08-9�� -23 05.49.17.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),153,1000018,0);
REM INSERTING into RELEASE.CHAT
SET DEFINE OFF;
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 07.18.46.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000018,1000004,'����˵�������ǵ������ţ������������ô����',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 08.35.23.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'���������ĺó�ô����ȷ��ô��',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('07-9�� -23 04.20.04.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'hallo~',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('07-9�� -23 04.20.09.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'���~
',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('07-9�� -23 04.20.14.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'chat_image\d75fce9a-086e-487a-8fb4-2e596744a72b.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('07-9�� -23 09.55.02.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'   ',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('04-9�� -23 10.42.22.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'��⨺��ұ�����QAQ',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('04-9�� -23 10.42.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'chat_image\e7608ab8-10bb-4587-a0e1-cda99aeb989d.jpg',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('04-9�� -23 11.19.05.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'�ף�������߶������ڵ�⨺��ң���Ȼ����͸��
',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('04-9�� -23 11.19.48.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'��������Ҫ�й�����������ش����',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('04-9�� -23 11.21.10.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'����������ʦ���ֹ���',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('06-9�� -23 12.42.58.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000005,'chat_image\3a717314-23df-49f0-8179-7838cbac4cd0.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('06-9�� -23 12.42.59.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000005,'chat_image\5447976c-c329-4a1d-a79f-5239125af8ac.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('06-9�� -23 12.44.42.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000005,'chat_image\9d3e28ff-e86b-4650-b6b6-f72440f6e6dd.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('06-9�� -23 12.45.16.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000005,'chat_image\4663205a-cf06-4940-be35-f6d8f499556e.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('06-9�� -23 12.45.31.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000005,'chat_image\d0ce8762-8b43-454f-9c9e-0f77cd496fc6.png',0,1);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.29.25.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'hello
',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.29.43.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'qwq
',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.29.54.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'���~',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.30.00.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000004,'0.0',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.30.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'������������������������������������������������������������������������������������������������������������������',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.30.47.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'�ף�������߶������ڵ�⨺��ң���Ȼ����͸��',1,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 12.38.19.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000017,1000010,'���ѽ~',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 04.27.24.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000018,1000004,'�������ǵ������ţ��������ô����',0,0);
Insert into RELEASE.CHAT (CHAT_TIME,CUS_ID,STORE_ID,CHAT_CONTENT,CHAT_SENDER,CHAT_TYPE) values (to_timestamp('08-9�� -23 05.45.35.000000000 ����','DD-MON-RR HH.MI.SSXFF AM'),1000018,1000004,'�������ȥ���Һ��ӳ�',0,0);
REM INSERTING into RELEASE.COMMODITIES_CATEGORIES
SET DEFINE OFF;
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('����Ʒ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('����');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('��Ʒ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('��ʳ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('����Ʒ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('�߲�');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('����');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('��ζƷ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('��ʳ');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('���');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('Ԥ�Ʋ�');
Insert into RELEASE.COMMODITIES_CATEGORIES (COM_CATEGORY) values ('����');
REM INSERTING into RELEASE.COMMODITY
SET DEFINE OFF;
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (161,'������Ƭ','������Ƭ����ԭ��40g��ԭζ��ⷬ�Ѷ��ζ��ѡ����ʳС�԰칫��',to_date('11-9�� -23','DD-MON-RR'),to_date('08-9�� -23','DD-MON-RR'),19,0,1000004,4.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (162,'��ʦ��һ����','��ʦ��һ������ʳС������ʳƷ90��ͯ�껳��С���������������10��',to_date('13-9�� -23','DD-MON-RR'),to_date('08-9�� -23','DD-MON-RR'),7,0,1000004,9.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (163,'�����������','�����������40g*10����Ǵ��ͯ����С��ʳ������ʳƷ�����',to_date('12-9�� -23','DD-MON-RR'),to_date('08-9�� -23','DD-MON-RR'),55,0,1000004,13.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (164,'����ԭζ����','����ֲѡ�ߵ���ֲ����ԭζ����315ML10ƿ��������������������',to_date('30-9�� -23','DD-MON-RR'),to_date('08-9�� -23','DD-MON-RR'),23,0,1000004,29.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (165,'����±��78������','����±��78���������ļ�ʳ�켦���Οh�������ҹ������С����ʳƷ',to_date('18-9�� -23','DD-MON-RR'),to_date('08-9�� -23','DD-MON-RR'),1,0,1000004,2.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (166,'�����С�ڴ����','�����С�ڴ����������ͽ�����ʳˮ�����Ĳ�����˾���׵���ʳƷ',to_date('28-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),16,0,1000004,21.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (167,'â�����̸�','â����һ��Ҫ�����ۣ�â�����̸� ��Ŵ��ש ����С��ʳ ��ĭ����',to_date('14-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,8.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (168,'ͻ��˹����ʯ��','ͻ��˹����ʯ��2�����ʵ���ˮ���Ĵ�����챦ʯ����ʯ���������',to_date('14-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),17,0,1000004,6.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (169,'����ƽ�ͺ�����','����ƽ�ͺ�����������10������ˮ�����������������������Ҷ�gϪ',to_date('15-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),4,0,1000004,11.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (170,'�ɿ��������±�','�ɿ��������±���ʽ�̻�������������װ���񵰻��ָ����ʳ',to_date('24-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),14,0,1000004,29.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (171,'Ψ�綹��','����ѧ����١�������Ψ�綹�̺���ԭζ250mlӪ���������Ʒ',to_date('24-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),68,0,1000004,4.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (172,'�޷�����','�ֶ��޷������������ʹ���װӦ����ˮ����ժ�ַ��и�����������',to_date('13-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,0.01,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (173,'������','����������ɽ��������������10�ﵱ��ˮ����ժ�ַ�ѩ�����������',to_date('14-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),9,0,1000004,48.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (174,'����⨺���','����ü������⨺���5�����ʵ���ˮ�������������������������',to_date('13-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),57,0,1000004,36.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (175,'AD����','�ú���Ӫ��
�۹�������������',to_date('18-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,2.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (176,'�����','����ɽҰ���ѹ������Ӧ������ˮ���ǻ�ɫƤ�������ȴ�˳�����',to_date('12-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,15.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (177,'�������ɰ��','�������ɰ��400g�������̼���Ǻ決�ǽ���ˮϸ���ǳ�����ζ',to_date('29-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),18,0,1000004,6.6,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (178,'�й���۳�ǰһ������','�й���۳�ǰһ�����ζ12����������Ⱥô 1��װ',to_date('12-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),8,0,1000004,45,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (179,'���ڹ���С�׽��㽶','���ڹ���С�׽��㽶10������ˮ�����䵱����ƻ������Ȼ��۽�����',to_date('13-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),487,0,1000004,9.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (180,'��Ը��Ƭ','��������Ը��ƬС��װ����ը����ţ�̻ƹ�ζɢװ��ʳС������ʳƷ',to_date('24-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),76,0,1000004,5.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (181,'���','������������߲�ɳ��ʳ�İ��ʿ��Ĺ��������ͽ�����ʳ��ϸҶ����',to_date('11-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,7.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (182,'�������Ʒ','�������Ʒ�������������100ml4ƿ��ʱ������ζ�������������',to_date('27-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,13.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (183,'���ʱ�Ƥ����','��ժ�ַ����ʱ�Ƥ����С��Ƥ���������ཷʱ���߲���ժ�ַ�ũ��3/5��',to_date('14-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),6,0,1000004,4.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (184,'���η�','���η����ϼ���С��װ�տ�������ը����ƿװ����֬������ţ������',to_date('10-10��-23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000004,10.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (185,'÷�˿�����ȼ�ʳ','ʳ����÷�˿�����ȼ�ʳ���Ʒ����Ԥ�Ʋ���������ֲ��콢��',to_date('15-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),9,0,1000006,18.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (186,'ˮ�����ܲ�','���ܲ�ˮ�����ܲ����ʺ��޲��߲�2������ˮ���ʹ��𵱼�',to_date('11-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),1,0,1000006,7.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (187,'���޲�С�ײ�','����������ժũ��¶����ֲ���޲�С�ײ˻����߲˻��ʳ�ĵ����߲�3��',to_date('10-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),6,0,1000006,7.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (188,'����38�Ź�����','����38�Ź��������ʳ���ˮ����������10���Ĵ�Ӧ�������',to_date('20-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),45,0,1000006,32.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (189,'ά����ˮ','ũ��ɽȪ������ά����ˮ500mlƿ���������ؼ�ά����VC��������',to_date('27-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),153,0,1000009,6.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (190,'��˺̼��������','��˺̼������������˿���ʼ�ʳ��ʳ���챬������С�Խ�������Ƭ',to_date('21-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),17,0,1000009,25.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (191,'�����ձ�ɭ������̫����','�����ձ�ɭ������̫���Ǻ��ν����ǹ������ɿ���ţ��ϲ�Ǹ߶���ʳ10��
',to_date('25-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),18,0,1000009,16,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (192,'�ھ�ʿ���ǻ��������ɿ���','�ھ�ʿ���ǻ��������ɿ���500g����˹����ʳƷKDV�ǹ�������ʳ',to_date('26-9�� -23','DD-MON-RR'),to_date('09-9�� -23','DD-MON-RR'),19,0,1000009,21.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (6,'�������ɰ��','�������ɰ��400g�������̼���Ǻ決�ǽ���ˮϸ���ǳ�����ζ',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),8,0,1000004,6.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (7,'��ǰһ��������','�й���۳�ǰһ�����ζ12����������Ⱥô 1��װ',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),3,0,1000004,52,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (4,'��ֻ����â����','��ֻ����â����ˮ����60g�����۽�������ʳ����С��â���۽�����',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),2,0,1000004,11,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (5,'�ɿ��������±�','�ɿ��������±���ʽ�̻�������������װ���񵰻��ָ����ʳ',to_date('09-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),16,0,1000004,8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (8,'˫�����������ȳ�','�⾩�Ƽ�˫�����������ȳ��㳦������ʳС�������ĵ���ʳ270gx2��',to_date('11-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),70,0,1000004,14.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (9,'����ơ','տ�� ������0�ƾ�����ơ320ml����12��̼�����Ϲ�ζ��ˮ',to_date('10-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),0,0,1000005,26,0);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (10,'��������ͷ','��ʱ�� ��������ͷ110g/�� *3�� ������ʳ ��ʳ�·��¾Ʋ� ��ͷ����',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),5,2,1000005,21.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (11,'���Ǻ�����','��ʦ�����Ǻ�����330ml�������ʣ������ʵ',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),21,0,1000005,2.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (12,'����ר�õ�����','��������ר�õ�����1L ��ʽ���ȴ������̲�������Ʒ��ţ��',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000005,19.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (13,'������� ','ɽ��������� ����ˮ�� ����4.5�� ����ɿ� �������� ����',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000005,0.01,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (14,'����','�����������������������˽�С����������ũ��Ʒɽ���ٹ��߲˰��',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),0,0,1000006,9.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (15,'��������','������������ˮ���������������֬g��Ϫ���ֺ��⸣��ƽ������',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),36,0,1000006,17.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (16,'������','������������ˮ���������������֬g��Ϫ���ֺ��⸣��ƽ������',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000006,17.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (17,'����','��ʩС����10���������ʿ���������������߲������������������',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),3,0,1000006,11.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (18,'С����','˳��ɽ��ǧ��С����5�ﳬ��ʱ��ˮ��ʥŮ��ũ���ز�С�������߲�3��',to_date('11-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000006,20.7,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (19,'����ʱlotus���Ǳ���','����ʱlotus�����Ϳ�ʱ���Ǳ������н����������ʳ����С��װ',to_date('10-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),5,0,1000009,29.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (20,'�������յ���','�������յ������˹���ڷ�ζ����С��װ�������������ʳƷ3ö',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),57,0,1000009,7.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (21,'���ƺ�̦','���ƺ�̦����������ʳ�������ĩζ��ʳ��ͯ��˾�������ϲ�Ƭ 8��װ',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),9,0,1000009,8.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (22,'�����ɿ���','�ھ�ʿ���ǻ��������ɿ���500g����˹����ʳƷKDV�ǹ�������ʳ',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000009,21.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (23,'��˺ţ���','Դ��ׯ԰������˺ţ���500gɳ��ζ���ɹŷ�ζ̿��ţ���������ʳ',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),0,0,1000009,33,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (24,'���ڴ�ţ��','laciate¬ɭ������������ȫ֬��ţ��ѧ���߸�500ml',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),68,0,1000009,5.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (25,'⨺���','��������⨺�����������ʵ����и�ˮ�������ֺ��ҷ���������',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),3,2.5,1000010,7.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (26,'�������','���ǻ�������ײ������ִ�ţ����ţ����ī������Ƥ���տ����ʳ��',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000010,14.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (27,'�ٶ�����','����ˮ���ٶ����������������ֹ����ײ�����Ϻ��ţ����ʳ�������',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000010,44,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (28,'Ѽ��','Ѽ�ȿ�����ʳ�Οh��������ҹ���伢��ʳ��ʳС����ʳ���',to_date('09-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),57,0,1000010,5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (29,'���ȵ�','�ν��������ȵ�С��װ�Οh±����ʳ�칫�����н��С����ʳƷ����30��',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),31,0,1000010,12.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (30,'ţ��','����ţ���¾Ʋ��·���±ζ��ʳ�޺óԵ���ʳ������ʳ����С��',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),14,0,1000010,5.01,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (31,'�¶�������','��ֻ����¶���������130g*1�������ʳ����±ζ��ʳ������ʳС�� 1��װ',to_date('10-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),26,0,1000010,15.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (32,'ɽ����צ','��Ʒ����ɽ����צ50g±ζ��צ��ʳ',to_date('11-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),168,0,1000010,2,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (33,'�۹ȹ�֭��','��ƮƮmeco�۹ȹ�֭��400ml�����֭��Ʒ�ܹȲ�����',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000010,6.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (34,'����԰����','����԰���� ���۱�Я���켷ѹƿ����С��װƿ��͹ٷ��콢����Ʒ',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),4,0,1000010,17.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (35,'��ݮ����','0֬����ݮ������Խݮ���������ͿĨ���������ʳ��ͼ���˾��',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000010,12.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (36,'������','����â��������2.5���ݮ���㱬���������̲��ר�ñ���С����',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000010,18.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (37,'�������','�������ٷ��콢��ĵ�ù�װ������ʳ��ʳ��������������ʳ�·���',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),22,0,1000010,9.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (38,'�����������׷�','�����������׷����ȹ����з�������ʳʳƷ��ʳ���ȿ������',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000010,8.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (39,'�ڴ����','�����С�ڴ����������ͽ�����ʳˮ�����Ĳ�����˾���׵���ʳƷ500gԼ20��',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),4,0,1000004,22.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (40,'��������������','�������������βʺ������ޱ���˾��������������С��ʳ����ʳƷ',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),3,0,1000004,3.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (41,'�����ݵ�����','�����ݵ�����55��ʳ����С������伢���ʳƷ��ͳ��ʽ���',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1345,0,1000004,2.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (42,'����õ���','�����ũ��Ժ�ʻ��������ز�õ�廨������������ʳС������ʳƷ10öװ',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000004,12.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (43,'AD����','���޹����ٷ���AD��������ţ����Ʒ220gƿ����װ�����۹���',to_date('08-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),62,3,1000004,2.4,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (44,'�������','��ʦ���������300ml��������Сƿװ��������ļ������Ʒ',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),7,0,1000004,1.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (45,'������','�������Ʒ�������������100mlƿ��ʱ������ζ�������������',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),8,0,1000004,5.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (46,'���涹��','����ѧ����١�������Ψ�綹�̺���ԭζ250mlӪ���������Ʒ',to_date('09-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),12,0,1000004,4.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (47,'���η�','���η����ϼ���С��װ�տ�������ը����ƿװ����֬������ţ������',to_date('06-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),3,0,1000004,9.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (48,'ɳ����','���ɳ��֭����֥���ζ�߲�ˮ��ɳ��֭��˾����ɫ�����ʹ�֭',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),8,0,1000004,12.1,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (49,'��Ը��Ƭ','��������Ը��ƬС��װ����ը����ţ�̻ƹ�ζɢװ��ʳС������ʳƷ',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),75,0,1000004,3.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (50,'С�ƹ�','������ժˮ��С�ƹ�ɽ�����ƹ������и��߲˴������1������',to_date('04-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),8,0,1000006,7.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (51,'����','�������ʰ���������ع���������3��ɽ�����������߲�ũ������',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),6,0,1000006,9.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (52,'ˮ�����ܲ�','���ܲ�ˮ�����ܲ����ʺ��޲��߲�2������ˮ���ʹ��𵱼�',to_date('05-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000006,8.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (53,'������','����38�Ź��������ʳ���ˮ����������10���Ĵ�Ӧ������� ',to_date('09-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),1,0,1000006,13.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (54,'�������Ʒ','��������Ʒ����Ʒ�����������Ʒ�ҳ���Ԥ�Ʋ˼��ý�������Ƭ',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),4,0,1000006,7.7,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (55,'��Ѭ���㳦','������ѡ��Ƥ���⳦���ȳ���ʳ250g�ں������������ʳ��Ѭ���㳦',to_date('11-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),98,0,1000006,28.7,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (56,'���С��','���С�����Ų˺����ز�ľͰ��Ԥ�Ʋ˰��Ʒ����С�����·�������',to_date('12-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),23,0,1000006,11.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (57,'��ଽ�ͷԤ�Ʋ�','��С�ଷ���ţ���·���ͷ��ʳ����ҹ������ʳƷԤ�Ʋ������',to_date('09-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),34,0,1000006,10,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (58,'÷�˿���','ʳ����÷�˿�����ȼ�ʳ���Ʒ����Ԥ�Ʋ���������ֲ��콢��',to_date('07-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),6,0,1000006,18,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (59,'���������⸬','�����ݾ�˾�����⸬200g��˺�⸬�ߵ����ִ����̾������⸬��ʳ',to_date('12-9�� -23','DD-MON-RR'),to_date('04-9�� -23','DD-MON-RR'),17,0,1000006,22,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (141,'����Ѽצ','����Ѽצ�ݽ�Ѽ���ѹ�ȥ�Ǽ�ʳ�����ʳ����ʳƷ�伢Ѽ��ɢװ',to_date('10-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),48,0,1000004,5.4,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (142,'â�����̸�','â����һ��Ҫ�����ۣ�â�����̸� ��Ŵ��ש ����С��ʳ ��ĭ����',to_date('09-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),19,0,1000004,19.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (143,'������','�Ϻ��ز���������������ֺŸ�������ɫС�԰�������ʳ��ʳ',to_date('08-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),6,0,1000004,39.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (144,'��������������','�������������βʺ������ޱ���˾��������������С��ʳ����ʳƷ',to_date('11-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),64,4,1000004,3.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (145,'�����ʻ���','��һ�������Ͼ��ز������ʻ�����ʽ�����ɫ���İ������������',to_date('09-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),3,0,1000004,6.7,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (146,'����ʱ����������','����ʱ����������ÿ�ռ��������ʳ��С��װ�и�ԭζͰ��װ���
',to_date('13-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),3,0,1000004,188,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (147,'��ʱ�����ţ���','��ʱ�����ţ���500g�������ɹ��ز���˺С��ʳ��װ��ʳ���',to_date('20-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),1,0,1000004,119,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (148,'������','��99������΢��ɽ������ֶ�����װ��ʳ̨����칫�Ұ�����',to_date('09-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),7,0,1000004,85,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (149,'��ɽ�ձ�','���ڰ����ز���ɽ�ձ�÷�ɲ˿����ֱ���͸���ı���������ʳС��6ö',to_date('10-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),13,0,1000004,24.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (150,'ϲ�����г�','ϲ�����г�������ȳ��㳦��ʳ������ʳ��������⳦��������',to_date('14-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),1,0,1000004,7.7,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (151,'Ũ����÷֭','���軨԰��÷֭�ٷ��콢��Ũ����÷��ʳ��ά�����и����˶�ͯ����500ml',to_date('17-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),1,0,1000004,88.88,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (152,'Ԫ���մ�ˮ','Ԫ���մ�ˮ���������и�����Сƿװ������������ζ����ˮ260ml',to_date('09-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),1,0,1000004,2.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (153,'�ʵ�������ζţ��','�ʵ�����������ڲ�ݮ�㽶�ɿ���3��ζţ��200ml�����ͯ��ζ��',to_date('15-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),688,3.5,1000004,5.6,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (154,'���ɹ�����֭����','�������Ѳ�ݮ���ҹ��������֭����310ml*6������֭������Ʒ����',to_date('16-9�� -23','DD-MON-RR'),to_date('07-9�� -23','DD-MON-RR'),34,0,1000004,26.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (61,'С�׽��㽶','���ڹ���С�׽��㽶10������ˮ�����䵱����ƻ������Ȼ��۽�����',to_date('09-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),0,0,1000004,8.8,0);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (62,'�ڲ���','��ժ�ڲ���1�����Ӵ��ˮ������ڽ�տ������и�Ӧ����3�������',to_date('09-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),13,0,1000004,5.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (63,'ţ�͹�','ī�������ţ�͹�2������ˮ������������ʴ����ʳ������͸��ʳ',to_date('05-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),1,0,1000004,9.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (64,'��������','�ֻ�����õ����������ˮ��5���������������ӡ���ᵱ�������״�',to_date('07-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),7,0,1000005,23.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (65,'â��','�ֻ�������ɫ�ﶫ����â�����������е��������ȴ��и�ˮ������1��',to_date('10-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),9,0,1000005,8.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (66,'ɽ������','����ɽ��������10����ˮ��9��������ժ�ַ����������������5��',to_date('08-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),1,0,1000005,7.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (67,'������','���ֱ���������������ţ���������֬��ͽ���0������������װ',to_date('12-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),39,0,1000005,3.3,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (68,'�������ݮζ','��ţminiС�������ݮζ125mlѧ������Ӫ�������ţ������',to_date('08-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),1345,0,1000005,2.2,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (69,'������ţ��','��������ţ��125ml���װѧ����Ͱ��º������϶�ͯ����������',to_date('05-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),17,0,1000005,2.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (70,'������','��֭Դ������300m ��֭/֭֭���ҹ�֭������Ʒ����',to_date('06-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),79,0,1000005,2.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (71,'����԰��ţ��','����԰��ţ��ԭζ225ml*20ƿ����ѧ������̶�ͯ�������ʺ�������',to_date('07-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),9,0,1000005,2.7,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (72,'�����մ�ţ��','��ţ�����մ�ţ��250mlx12/16ԭ���߸�ȫ֬���������',to_date('08-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),13,0,1000005,3.4,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (73,'Lindt���ɿ���','��ʿ����������ţ�̺��ɿ���ɢװ����ϲ������������ʳ�ǹ�',to_date('07-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),17,0,1000009,39.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (74,'����˿','��˺̼������������˿���ʼ�ʳ��ʳ���챬������С�Խ�������Ƭ',to_date('09-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),7,0,1000009,12.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (75,'�������ɿ�����������','�������ɿ��������������Ĩ��֥ʿ����115�˰칫��������ʳС��',to_date('10-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),56,0,1000009,6.6,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (76,'mix�����','̩������VFOODS 30g��������Ϻ��mix�������ʳС����������ʳƷ',to_date('07-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),17,0,1000009,4.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (77,'pockyĨ��ζ����','�ձ���������Ĩ��ζ�����y���ɿ���������pocky�ٴ��������',to_date('06-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),1,0,1000009,7.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (78,'���㳦','�����ݽ��ڳ����㳦105g��ʳ����ʳƷС��Ӫ��С��ʳ��������',to_date('08-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),17,0,1000009,8.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (79,'ݮ������ݮ֭','ݮ����100%��ݮԭ֭��Ũ����ݮԭ������������',to_date('05-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),13,0,1000009,6.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (80,'Ҭ����Ҭ֭','Ҭ����Ҭ֭��եҬ��֭��������245g/ƿ',to_date('07-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),26,0,1000009,3.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (81,'ά����','ũ��ɽȪ������ά����ˮ500mlƿ���������ؼ�ά����VC��������',to_date('09-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),87,0,1000009,4.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (82,'ũ��������','ũ�������溫ʽ���ײ˷�����ũ�������װ��������������ʳ�콢��5��',to_date('11-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),34,0,1000009,25.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (83,'��ʽ�������Ƭ','��������SI������������������ʳ�ִ��������ζ��ʽ�������Ƭ',to_date('12-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),18,0,1000009,7.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (84,'ɭ������̫����','�����ձ�ɭ������̫���Ǻ��ν����ǹ������ɿ���ţ��ϲ�Ǹ߶���ʳ10��',to_date('06-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),16,0,1000009,16.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (85,'�����','����VEGTOMETO/ά�������ڽ����â������ζӦ��ۻ���ٽ���Ѿ�',to_date('11-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),65,0,1000009,9.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (86,'�������Ƭ','��������SI������������������ʳ�ִ��������ζ��ʽ�������Ƭ',to_date('05-9�� -23','DD-MON-RR'),to_date('05-9�� -23','DD-MON-RR'),17,0,1000009,9.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (87,'�����ٹ�֭ԭ��','�����ڿ�����ԭҺNFC��֭ԭ��1L���Ǿ�VCάC����֭100%����1961',to_date('06-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),2,0,1000005,28,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (88,'�ٲ�ζ��Ƥ��צ','�ٲ�ζ��Ƥ��צ160g��צ����������ʳ��ʳ�óԵ�±ζ������ʳ',to_date('06-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),34,0,1000005,11.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (89,'ţ����Ѽ��','ţ����Ѽ��ʳ����±ζ��ʳҹ���伢��ʳ����ʳƷС�Դ����10��',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000005,7.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (90,'ţ����Ѽ��','ţ����Ѽ��10����ʳ����±ζ��ʳҹ���伢��ʳ����ʳƷС�Դ����',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000005,7.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (91,'��������','�óԵ�����������ʳ��ʳ������������������ʳƷ��ȫ���챬��С��
',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),53,0,1000005,13.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (92,'±ζ��źƬ','±ζ��źƬ�������С��ʳ��������ʳƷ��ζС����������Ƭ�·���10��',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),34,0,1000005,6.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (93,'�ϳ�Ѽ��','�ϳ�Ѽ���������±��֭����С��װ�������ʳ±ζ��ʳ׷������ʳ
',to_date('10-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),8,0,1000005,4.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (94,'���������±��','����±�����������±���Οh�����ݽ���±ζ��Ʒ��ʳ������ʳС��',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),0,0,1000005,2.3,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (95,'�񵺺���ţ���ͷ','�񵺺���ţ���ͷ��ʳţ����淽����ʳ����Ʒ�·���Ӧ������ʳƷ',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),26,0,1000005,22.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (96,'�Οh����','�Οh�����ӿͼ���ɫС�Լ���������Լ�����ʳ�¾Ʋ���ʳ��ʳ��ʳ',to_date('06-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),5,0,1000005,18.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (97,'ţ����','֪��԰ţ���輦�����迪����ʳ������С����ʳ�����֬����ʳ300g',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),7,0,1000005,9.2,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (98,'�����','�������ʳ��ʳ������ʳ�¾Ʋ�С�����Ͻ��������ʳ��������',to_date('12-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),985,0,1000005,1,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (99,'�����','����ɽҰ���ѹ������Ӧ������ˮ���ǻ�ɫƤ�������ȴ�',to_date('10-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),17,0,1000004,10,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (100,'ͻ��˹����ʯ��','ͻ��˹����ʯ��5��ˮ���������䵱���и�����챦ʯ����ʯ�����',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),15,0,1000004,15,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (101,'��������⨺���','��������⨺�������ˮ��������������������и����15ö',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),7,0,1000004,15,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (102,'�ƽ�����','�ƽ����һ���Ӧ���ƽ������и�ʱ��������Ҵ������ˮ������5��',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),24,0,1000004,58,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (103,'èɽ������','�в�ʿèɽ�����������������ǽ���D197Һ���䶳ˮ������',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000004,160,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (104,'������ͨ��ƻ��','������ͨ��ƻ��������ƻ��ˮ�����ʴ���10��츻ʿ�����������',to_date('10-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),22,0,1000004,16.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (105,'�ֽ��޷�����','�ֽ��޷�������������ˮ��������½��Ӧ��1��',to_date('10-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),57,0,1000004,17,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (106,'��������������','����������������1����������ˮ��������ժ�����ַ��������',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),85,0,1000004,12.6,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (107,'�䶳ˮ����','�䶳ˮ���ҿ�1kg֥֥�����ӹ������ϵ����ٶ�����ˮ���޺�ȥƤ2��',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),33,0,1000004,24,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (108,'������','�����Ѽα��������ժ���ʸ߶�ˮ���и�ˮ��ϡ�溱��1��',to_date('13-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),5,5,1000004,88,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (109,'meito������','����meito�ձ�������ʳ����ϲ��ˮ�����ǹ�Ӳ������������
',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),33,0,1000009,14.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (110,'meito��ζ̼����','����meito�ձ�������ʳ����ϲ��ˮ�����ǹ�Ӳ������������',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),17,0,1000009,39,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (111,'���ͼ�����','�����ز����Ž��ڸ߶���ʳ����ֹ����ͼ�������ɰ���������',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000009,53,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (112,'�����ﱡ����','������������������¬��������������±����ǹ���ɤ�ӽ�ʦ������',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),6,0,1000009,88,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (113,'goahead���̼��ı���','ŷ�޽���goahead�������̼��ı��ɸ߶˼��칫�Һ���ʳƷ����С��',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000009,19.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (114,'����������֭����','����������֭����0֬��500g��޳�֭���ѹ�ζ������Ʒ',to_date('12-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),178,0,1000009,5.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (115,'��ֻ����_����ţ��','��ֻ����_����ţ��_����ţ����ʳ��ʳ���н����Ӱţ��ɼ�ʳţ��',to_date('06-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),7,0,1000010,6.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (116,'��Ʒ�������⸬','��Ʒ�������⸬�ɾ�����������ʳ��ʳ ׷�����в輸��ʳ200g',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),42,0,1000010,22.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (117,'���編ʽ�콴���','���編ʽ�콴�������ζ±ζ��ʳС�Զ���С��װ������ʳ28g',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1496,0,1000010,3.5,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (118,'��������ţ���','��������ţ��ʳ����ζӪ��С��ʳţ���С������ʳƷ������ʳ3��',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),16,0,1000010,9.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (119,'��צ���ͷ��ʳ','��צ���ͷ��ʳ����С������ʳ��ͷ�ȱ���������������¾Ʒ���',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000010,16.9,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (120,'ţ������ˬѼ��','ţ������ˬѼ������Ѽ��±ζ��ζѼ����ʳ��ʳ��ʳС������ʳƷ10��',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),1,0,1000010,14.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (121,'�ȱ��޼�ʳ����','�ȱ��޼�ʳ���ż�������±ζ��ʳҹ���伢��ʳС�Ի����м�ʳƷ',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),9,0,1000010,16,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (122,'�Ĵ������������','�Ĵ��������������ʳ��ʳ������������ʳ±ζ��צ�¾�׷���ز�',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),65,0,1000010,32,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (123,'СѼ��','СѼ�ȼ���±ζС�ȿ�����ʳ�伢ҹ��Ѽ���������ʳ������ʳ����',to_date('06-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),136,0,1000010,7.7,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (124,'�������','������������߲�ɳ��ʳ�İ��ʿ��Ĺ��������ͽ�����ʳ��ϸҶ����',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),5,0,1000006,14.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (125,'���Ϲ�','���Ϲ�������ժ��ɽԲ�Ϲ���С�Ϲ�ũ�ҵ����߲�5�����������������֭ˮ��ӯ�����߲�������ժ',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),6,0,1000006,19.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (126,'��������','�ձ�ũ�����ִ��ǻ���������Ŵ������������Ŵ���װ��߲˰�����ժ1��',to_date('11-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),68,0,1000006,6.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (127,'ˮ��������','ɽ��������˹ˮ��������������ժɳȿ����ũ����Ȼ���и������߲�1��',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),3,0,1000006,7.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (128,'���޲�С�ײ�','����������ժũ��¶����ֲ���޲�С�ײ˻����߲˻��ʳ�ĵ����߲�3��',to_date('09-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),6,0,1000006,16.8,1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (129,'����ͷ','����Եɽ���������ͷ����5��װ��Ƥ���ʶ��ũ��',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),17,0,1000006,6.5,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (130,'��Ů�ƹ�','��Ů�ƹ�1��װӦ��ˮ���и������߲���ժĴָ����С�ƹ����',to_date('07-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),39,0,1000006,5.9,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (131,'����ţ����ͷ','����ţ��ë��ͷ����1��С���󵱼��߲˷�Ŵ��ܵũ��',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),39,0,1000006,6.8,-1);
Insert into RELEASE.COMMODITY (COM_ID,COM_NAME,COM_INTRODUCTION,COM_EXPIRATIONDATE,COM_UPLOADDATE,COM_LEFT,COM_RATING,STO_ID,COM_ORIPRICE,COM_STATUS) values (132,'������ݫ��','���Ĵ�����ݫ��2023��������ݫ��ũ�����������β�����߲����',to_date('08-9�� -23','DD-MON-RR'),to_date('06-9�� -23','DD-MON-RR'),15,0,1000006,8.8,-1);
REM INSERTING into RELEASE.COMMODITY_CATEGORIES
SET DEFINE OFF;
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (4,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (4,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (5,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (5,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (6,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (7,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (8,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (9,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (10,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (10,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (11,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (12,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (13,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (14,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (15,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (16,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (17,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (18,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (19,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (19,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (20,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (21,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (22,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (23,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (24,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (25,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (26,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (26,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (27,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (28,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (28,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (29,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (29,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (30,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (30,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (30,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (31,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (31,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (31,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (32,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (32,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (32,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (33,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (34,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (35,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (35,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (36,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (36,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (37,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (37,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (38,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (39,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (40,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (40,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (41,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (41,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (42,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (42,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (43,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (43,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (44,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (45,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (45,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (46,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (46,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (47,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (48,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (49,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (50,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (51,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (52,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (53,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (54,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (54,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (55,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (55,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (55,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (56,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (57,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (58,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (58,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (59,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (59,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (59,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (61,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (62,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (63,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (64,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (65,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (66,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (67,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (68,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (68,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (69,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (69,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (70,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (70,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (71,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (71,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (72,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (73,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (74,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (74,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (74,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (75,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (75,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (76,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (76,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (77,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (77,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (78,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (78,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (78,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (79,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (79,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (80,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (80,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (81,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (82,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (82,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (82,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (83,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (83,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (84,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (84,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (85,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (85,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (86,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (86,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (87,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (87,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (88,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (88,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (88,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (89,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (89,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (89,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (90,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (90,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (90,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (91,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (91,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (91,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (92,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (92,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (92,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (93,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (93,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (94,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (94,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (94,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (95,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (95,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (95,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (96,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (96,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (96,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (97,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (97,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (97,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (98,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (98,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (98,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (99,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (100,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (101,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (102,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (103,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (104,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (105,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (106,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (107,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (108,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (109,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (110,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (111,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (111,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (112,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (112,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (113,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (113,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (114,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (114,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (115,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (115,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (115,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (116,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (116,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (116,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (117,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (117,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (117,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (117,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (118,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (118,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (118,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (119,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (119,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (119,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (120,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (120,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (120,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (121,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (121,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (121,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (122,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (122,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (122,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (123,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (123,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (123,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (123,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (124,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (125,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (126,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (126,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (127,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (127,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (128,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (128,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (129,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (130,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (131,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (132,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (141,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (141,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (141,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (142,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (142,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (142,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (143,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (143,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (143,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (144,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (144,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (144,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (145,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (145,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (146,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (146,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (147,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (147,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (147,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (148,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (148,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (148,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (149,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (149,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (150,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (150,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (150,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (150,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (151,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (151,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (152,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (152,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (153,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (153,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (154,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (154,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (161,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (161,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (162,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (162,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (163,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (164,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (165,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (165,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (165,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (166,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (167,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (168,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (169,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (170,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (170,'���');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (171,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (172,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (173,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (174,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (175,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (175,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (176,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (177,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (178,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (178,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (179,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (180,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (181,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (182,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (182,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (183,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (184,'��ζƷ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (185,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (185,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (186,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (187,'�߲�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (188,'��Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (189,'����');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (190,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (190,'����Ʒ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (190,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (190,'Ԥ�Ʋ�');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (191,'��ʳ');
Insert into RELEASE.COMMODITY_CATEGORIES (COM_ID,COM_CATEGORY) values (192,'��ʳ');
REM INSERTING into RELEASE.COMMODITY_COMMENT
SET DEFINE OFF;
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (48,0,'�ǳ�����',to_date('08-9�� -23','DD-MON-RR'),108,1000008);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (49,23,'ȷʵ',to_date('08-9�� -23','DD-MON-RR'),82,1000009);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (50,23,'��������',to_date('08-9�� -23','DD-MON-RR'),82,1000009);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (51,0,'������~',to_date('08-9�� -23','DD-MON-RR'),144,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (52,0,'������~',to_date('08-9�� -23','DD-MON-RR'),144,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (53,51,'��л����**��֧��
',to_date('08-9�� -23','DD-MON-RR'),144,1000004);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (54,52,'��л����**��֧��',to_date('08-9�� -23','DD-MON-RR'),144,1000004);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (55,53,'����л~~',to_date('08-9�� -23','DD-MON-RR'),144,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (56,53,'����л~~',to_date('08-9�� -23','DD-MON-RR'),144,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (21,0,'�úú�',to_date('07-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (22,0,'�������ζ�������´λ�����',to_date('07-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (23,0,'����ܺóԣ�',to_date('07-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (24,0,'һ��Ҳ���óԣ�����',to_date('07-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (25,24,'������ѽ',to_date('07-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (26,0,'���⨺��Ҳ���',to_date('07-9�� -23','DD-MON-RR'),25,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (27,26,'лл�佱����',to_date('07-9�� -23','DD-MON-RR'),25,1000010);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (1,0,'������~',to_date('04-9�� -23','DD-MON-RR'),43,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (2,1,'��л����֧��~',to_date('04-9�� -23','DD-MON-RR'),43,1000004);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (3,0,'�����ˣ�����������AWA',to_date('04-9�� -23','DD-MON-RR'),25,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (4,0,'����������',to_date('04-9�� -23','DD-MON-RR'),25,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (5,0,'����~',to_date('05-9�� -23','DD-MON-RR'),43,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (6,0,'����������',to_date('05-9�� -23','DD-MON-RR'),43,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (7,0,'����~',to_date('05-9�� -23','DD-MON-RR'),10,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (8,0,'����~',to_date('05-9�� -23','DD-MON-RR'),10,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (9,0,'������~',to_date('05-9�� -23','DD-MON-RR'),82,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (41,1,'��л����֧��~',to_date('08-9�� -23','DD-MON-RR'),43,1000004);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (42,0,'ζ������',to_date('08-9�� -23','DD-MON-RR'),10,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (43,0,'���ú�',to_date('08-9�� -23','DD-MON-RR'),153,1000017);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (44,0,'�ú�~',to_date('08-9�� -23','DD-MON-RR'),153,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (45,43,'�Ҿ��û��а�',to_date('08-9�� -23','DD-MON-RR'),153,1000018);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (46,6,'Ϊʲô',to_date('08-9�� -23','DD-MON-RR'),43,1000008);
Insert into RELEASE.COMMODITY_COMMENT (CMT_ID,CMT_FATHER,CMT_CONTENT,CMT_TIME,COM_ID,USER_ID) values (47,45,'****',to_date('08-9�� -23','DD-MON-RR'),153,1000017);
REM INSERTING into RELEASE.COMMODITY_IMAGE
SET DEFINE OFF;
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (4,'.\wwwroot\commodity_image\4\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (4,'.\wwwroot\commodity_image\4\com_image_1.jpg');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (5,'.\wwwroot\commodity_image\5\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (6,'.\wwwroot\commodity_image\6\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (7,'.\wwwroot\commodity_image\7\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (7,'.\wwwroot\commodity_image\7\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (8,'.\wwwroot\commodity_image\8\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (8,'.\wwwroot\commodity_image\8\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (9,'.\wwwroot\commodity_image\9\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (10,'.\wwwroot\commodity_image\10\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (11,'.\wwwroot\commodity_image\11\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (11,'.\wwwroot\commodity_image\11\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (12,'.\wwwroot\commodity_image\12\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (13,'.\wwwroot\commodity_image\13\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (14,'.\wwwroot\commodity_image\14\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (15,'.\wwwroot\commodity_image\15\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (15,'.\wwwroot\commodity_image\15\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (16,'.\wwwroot\commodity_image\16\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (17,'.\wwwroot\commodity_image\17\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (18,'.\wwwroot\commodity_image\18\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (19,'.\wwwroot\commodity_image\19\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (20,'.\wwwroot\commodity_image\20\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (20,'.\wwwroot\commodity_image\20\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (21,'.\wwwroot\commodity_image\21\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (22,'.\wwwroot\commodity_image\22\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (22,'.\wwwroot\commodity_image\22\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (22,'.\wwwroot\commodity_image\22\com_image_2.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (23,'.\wwwroot\commodity_image\23\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (24,'.\wwwroot\commodity_image\24\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (25,'.\wwwroot\commodity_image\25\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (26,'.\wwwroot\commodity_image\26\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (27,'.\wwwroot\commodity_image\27\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (28,'.\wwwroot\commodity_image\28\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (29,'.\wwwroot\commodity_image\29\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (29,'.\wwwroot\commodity_image\29\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (30,'.\wwwroot\commodity_image\30\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (31,'.\wwwroot\commodity_image\31\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (32,'.\wwwroot\commodity_image\32\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (33,'.\wwwroot\commodity_image\33\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (34,'.\wwwroot\commodity_image\34\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (35,'.\wwwroot\commodity_image\35\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (36,'.\wwwroot\commodity_image\36\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (37,'.\wwwroot\commodity_image\37\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (38,'.\wwwroot\commodity_image\38\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (39,'.\wwwroot\commodity_image\39\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (40,'.\wwwroot\commodity_image\40\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (41,'.\wwwroot\commodity_image\41\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (42,'.\wwwroot\commodity_image\42\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (43,'.\wwwroot\commodity_image\43\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (44,'.\wwwroot\commodity_image\44\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (45,'.\wwwroot\commodity_image\45\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (46,'.\wwwroot\commodity_image\46\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (46,'.\wwwroot\commodity_image\46\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (47,'.\wwwroot\commodity_image\47\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (48,'.\wwwroot\commodity_image\48\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (49,'.\wwwroot\commodity_image\49\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (50,'.\wwwroot\commodity_image\50\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (51,'.\wwwroot\commodity_image\51\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (52,'.\wwwroot\commodity_image\52\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (53,'.\wwwroot\commodity_image\53\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (54,'.\wwwroot\commodity_image\54\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (55,'.\wwwroot\commodity_image\55\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (56,'.\wwwroot\commodity_image\56\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (57,'.\wwwroot\commodity_image\57\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (58,'.\wwwroot\commodity_image\58\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (59,'.\wwwroot\commodity_image\59\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (61,'.\wwwroot\commodity_image\61\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (62,'.\wwwroot\commodity_image\62\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (63,'.\wwwroot\commodity_image\63\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (64,'.\wwwroot\commodity_image\64\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (65,'.\wwwroot\commodity_image\65\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (66,'.\wwwroot\commodity_image\66\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (67,'.\wwwroot\commodity_image\67\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (68,'.\wwwroot\commodity_image\68\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (69,'.\wwwroot\commodity_image\69\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (70,'.\wwwroot\commodity_image\70\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (71,'.\wwwroot\commodity_image\71\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (72,'.\wwwroot\commodity_image\72\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (73,'.\wwwroot\commodity_image\73\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (74,'.\wwwroot\commodity_image\74\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (75,'.\wwwroot\commodity_image\75\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (75,'.\wwwroot\commodity_image\75\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (76,'.\wwwroot\commodity_image\76\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (77,'.\wwwroot\commodity_image\77\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (78,'.\wwwroot\commodity_image\78\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (79,'.\wwwroot\commodity_image\79\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (80,'.\wwwroot\commodity_image\80\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (81,'.\wwwroot\commodity_image\81\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (82,'.\wwwroot\commodity_image\82\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (83,'.\wwwroot\commodity_image\83\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (84,'.\wwwroot\commodity_image\84\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (85,'.\wwwroot\commodity_image\85\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (86,'.\wwwroot\commodity_image\86\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (87,'.\wwwroot\commodity_image\87\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (88,'.\wwwroot\commodity_image\88\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (89,'.\wwwroot\commodity_image\89\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (90,'.\wwwroot\commodity_image\90\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (91,'.\wwwroot\commodity_image\91\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (92,'.\wwwroot\commodity_image\92\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (93,'.\wwwroot\commodity_image\93\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (94,'.\wwwroot\commodity_image\94\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (95,'.\wwwroot\commodity_image\95\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (96,'.\wwwroot\commodity_image\96\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (97,'.\wwwroot\commodity_image\97\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (98,'.\wwwroot\commodity_image\98\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (99,'.\wwwroot\commodity_image\99\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (100,'.\wwwroot\commodity_image\100\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (101,'.\wwwroot\commodity_image\101\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (102,'.\wwwroot\commodity_image\102\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (103,'.\wwwroot\commodity_image\103\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (104,'.\wwwroot\commodity_image\104\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (105,'.\wwwroot\commodity_image\105\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (106,'.\wwwroot\commodity_image\106\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (107,'.\wwwroot\commodity_image\107\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (108,'.\wwwroot\commodity_image\108\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (109,'.\wwwroot\commodity_image\109\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (110,'.\wwwroot\commodity_image\110\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (111,'.\wwwroot\commodity_image\111\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (112,'.\wwwroot\commodity_image\112\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (113,'.\wwwroot\commodity_image\113\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (114,'.\wwwroot\commodity_image\114\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (115,'.\wwwroot\commodity_image\115\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (116,'.\wwwroot\commodity_image\116\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (117,'.\wwwroot\commodity_image\117\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (118,'.\wwwroot\commodity_image\118\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (119,'.\wwwroot\commodity_image\119\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (120,'.\wwwroot\commodity_image\120\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (121,'.\wwwroot\commodity_image\121\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (122,'.\wwwroot\commodity_image\122\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (123,'.\wwwroot\commodity_image\123\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (124,'.\wwwroot\commodity_image\124\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (125,'.\wwwroot\commodity_image\125\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (126,'.\wwwroot\commodity_image\126\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (127,'.\wwwroot\commodity_image\127\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (128,'.\wwwroot\commodity_image\128\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (129,'.\wwwroot\commodity_image\129\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (130,'.\wwwroot\commodity_image\130\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (131,'.\wwwroot\commodity_image\131\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (132,'.\wwwroot\commodity_image\132\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (141,'.\wwwroot\commodity_image\141\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (142,'.\wwwroot\commodity_image\142\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (143,'.\wwwroot\commodity_image\143\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (144,'.\wwwroot\commodity_image\144\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (145,'.\wwwroot\commodity_image\145\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (146,'.\wwwroot\commodity_image\146\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (147,'.\wwwroot\commodity_image\147\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (148,'.\wwwroot\commodity_image\148\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (149,'.\wwwroot\commodity_image\149\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (150,'.\wwwroot\commodity_image\150\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (151,'.\wwwroot\commodity_image\151\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (152,'.\wwwroot\commodity_image\152\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (153,'.\wwwroot\commodity_image\153\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (154,'.\wwwroot\commodity_image\154\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (161,'.\wwwroot\commodity_image\161\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (162,'.\wwwroot\commodity_image\162\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (163,'.\wwwroot\commodity_image\163\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (164,'.\wwwroot\commodity_image\164\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (165,'.\wwwroot\commodity_image\165\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (166,'.\wwwroot\commodity_image\166\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (167,'.\wwwroot\commodity_image\167\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (168,'.\wwwroot\commodity_image\168\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (169,'.\wwwroot\commodity_image\169\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (170,'.\wwwroot\commodity_image\170\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (171,'.\wwwroot\commodity_image\171\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (171,'.\wwwroot\commodity_image\171\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (172,'.\wwwroot\commodity_image\172\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (173,'.\wwwroot\commodity_image\173\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (174,'.\wwwroot\commodity_image\174\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (174,'.\wwwroot\commodity_image\174\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (175,'.\wwwroot\commodity_image\175\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (176,'.\wwwroot\commodity_image\176\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (177,'.\wwwroot\commodity_image\177\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (178,'.\wwwroot\commodity_image\178\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (179,'.\wwwroot\commodity_image\179\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (180,'.\wwwroot\commodity_image\180\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (181,'.\wwwroot\commodity_image\181\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (182,'.\wwwroot\commodity_image\182\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (183,'.\wwwroot\commodity_image\183\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (184,'.\wwwroot\commodity_image\184\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (185,'.\wwwroot\commodity_image\185\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (186,'.\wwwroot\commodity_image\186\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (187,'.\wwwroot\commodity_image\187\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (188,'.\wwwroot\commodity_image\188\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (189,'.\wwwroot\commodity_image\189\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (190,'.\wwwroot\commodity_image\190\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (191,'.\wwwroot\commodity_image\191\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (192,'.\wwwroot\commodity_image\192\com_image_0.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (192,'.\wwwroot\commodity_image\192\com_image_1.png');
Insert into RELEASE.COMMODITY_IMAGE (COM_ID,COM_IMAGE) values (192,'.\wwwroot\commodity_image\192\com_image_2.png');
REM INSERTING into RELEASE.COMMODITY_PRICE_CURVE
SET DEFINE OFF;
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),3.96,161);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.25,161);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),1.8,161);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),1.35,161);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),6.53,162);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),3.27,162);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),2.18,162);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),1.09,162);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),12.42,163);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),11.04,163);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),9.66,163);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),8.28,163);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),6.9,163);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),26.82,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),23.84,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),20.86,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('20-9�� -23','DD-MON-RR'),17.88,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('24-9�� -23','DD-MON-RR'),14.9,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('28-9�� -23','DD-MON-RR'),7.45,164);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.9,165);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),1.37,165);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),0.73,165);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.8,5);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4,5);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.6,5);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.2,5);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.7,46);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),2.48,46);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.03,46);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.58,46);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.13,46);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),14.17,166);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),11.77,166);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),10.46,166);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),8.72,166);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('20-9�� -23','DD-MON-RR'),7.19,166);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),4.4,167);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.1,168);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),3.4,168);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),1.7,168);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),9.09,169);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),7.79,169);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),5.19,169);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),25.33,170);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),20.86,170);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),16.39,170);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('22-9�� -23','DD-MON-RR'),11.92,170);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),3.6,171);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),3.15,171);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),2.7,171);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('17-9�� -23','DD-MON-RR'),2.25,171);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('23-9�� -23','DD-MON-RR'),1.13,171);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),0.01,172);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),0.01,172);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),0.01,172);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),0.01,172);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),42.94,173);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),32.21,173);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),26.84,173);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),23.73,174);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),20.08,174);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),2,175);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),1.5,175);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),1,175);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('18-9�� -23','DD-MON-RR'),0.5,175);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),10.9,176);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),9.32,176);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),7.74,176);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.94,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),5.28,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),4.95,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),4.62,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('19-9�� -23','DD-MON-RR'),3.3,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('24-9�� -23','DD-MON-RR'),1.65,177);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),24.75,178);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),7.35,179);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),6.76,179);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),3.23,179);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.66,180);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),5.31,180);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),4.72,180);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('18-9�� -23','DD-MON-RR'),4.13,180);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('21-9�� -23','DD-MON-RR'),2.95,180);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),4.95,181);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),3.3,181);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),13.37,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),11.88,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),10.4,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),7.97,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('19-9�� -23','DD-MON-RR'),6.75,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('22-9�� -23','DD-MON-RR'),6.08,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('26-9�� -23','DD-MON-RR'),5.4,182);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),3.72,183);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),5.4,184);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('30-9�� -23','DD-MON-RR'),2.7,184);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),16.54,185);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),10.34,185);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),8.27,185);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),5.18,186);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),4.35,186);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),5.46,187);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),25.33,188);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),21.71,188);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),18.1,188);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),14.81,188);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('19-9�� -23','DD-MON-RR'),8.23,188);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.72,189);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),4.36,189);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('19-9�� -23','DD-MON-RR'),2.21,189);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('26-9�� -23','DD-MON-RR'),0.98,189);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),22.96,190);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),20.38,190);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),17.8,190);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('20-9�� -23','DD-MON-RR'),12.9,190);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),14.24,191);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('18-9�� -23','DD-MON-RR'),12.16,191);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('21-9�� -23','DD-MON-RR'),8.48,191);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),19.35,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),18.28,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),17.2,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),16.13,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),10.75,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('21-9�� -23','DD-MON-RR'),7.1,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('25-9�� -23','DD-MON-RR'),2.37,192);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),8.8,4);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.4,4);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3.3,6);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.65,6);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),36.4,7);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),20.8,7);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.2,7);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),7.45,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.71,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.96,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.47,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.98,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.24,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),1.49,8);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),10.4,9);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),7.8,9);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.2,9);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.6,9);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),10.8,10);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.32,10);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),0.5,11);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),6.57,12);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.38,12);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),0.01,13);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),0.01,13);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.93,14);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.96,14);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.75,15);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),8.01,15);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.15,16);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),7.43,17);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),5.66,17);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.66,17);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),19.67,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),18.63,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),17.6,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),16.56,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),12.42,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),8.28,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),4.14,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),2.07,18);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),21.78,23);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),14.52,23);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),4.68,20);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.9,20);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.9,21);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),10.75,22);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.38,22);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),14.95,19);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5.98,19);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.2,24);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.65,24);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.1,24);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),0.55,24);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.92,141);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.92,26);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),9.69,26);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),7.45,26);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),10.32,29);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),13.2,27);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),2.75,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.5,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.5,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),0.5,28);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),13.41,26);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),9.93,29);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),9.42,29);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),9.03,29);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5.16,29);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.51,30);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.25,30);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),12.72,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.93,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),11.13,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),10.34,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),9.54,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),8.75,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),7.95,31);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),1.5,32);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1,32);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3.25,33);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.63,33);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),10.56,34);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.28,34);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.4,35);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.2,35);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),15.04,36);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.28,36);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),7.52,36);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.94,37);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.95,37);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.97,37);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.72,38);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.96,38);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),11.4,39);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),1.16,40);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),1.85,41);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.54,41);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),0.92,41);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),9.03,42);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),1.68,43);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.56,43);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.44,43);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),0.99,44);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),2.61,45);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.45,47);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.27,47);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.81,48);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.72,48);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3.08,49);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),2.7,49);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.75,49);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.3,49);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3.23,50);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),7.55,51);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.86,51);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),6.37,51);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.9,51);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),5.98,52);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.05,52);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),13.21,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.4,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),9.87,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),8.06,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),6.26,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.56,53);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.62,54);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2.31,54);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),17.22,55);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),11.48,55);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),8.61,55);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),6.96,56);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.66,56);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),4.96,56);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),9.5,57);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),9,57);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.5,57);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),9,58);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),15.4,59);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),13.2,59);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),11,59);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),5.5,59);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.73,141);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.43,141);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),1.89,141);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),15.02,142);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),10.73,142);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),6.44,142);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),17.56,143);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.72,144);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.37,144);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),1.02,144);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),0.7,144);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.56,145);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),3.62,145);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.88,145);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),94,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),90.24,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),84.6,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),78.96,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),75.2,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),37.6,146);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),89.25,147);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),71.4,147);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),59.5,147);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('18-9�� -23','DD-MON-RR'),29.75,147);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('20-9�� -23','DD-MON-RR'),11.9,147);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),80.75,148);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),38.25,148);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),19.17,149);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),17.43,149);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),15.69,149);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),12.45,149);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.85,150);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),3.08,150);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),2.31,150);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),1.54,150);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),71.1,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),66.66,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),57.77,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),44.44,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('14-9�� -23','DD-MON-RR'),31.11,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),17.78,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('17-9�� -23','DD-MON-RR'),8.89,151);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2,152);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),1.5,152);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.04,153);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),4.48,153);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),3.92,153);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),2.8,153);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('15-9�� -23','DD-MON-RR'),1.4,153);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),22.87,154);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),20.18,154);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),13.45,154);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),8.07,154);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('16-9�� -23','DD-MON-RR'),2.69,154);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.16,61);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.28,61);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.4,61);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.64,62);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.35,62);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.06,62);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),3.48,62);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.9,62);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),5.28,63);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),15.47,64);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),12.38,64);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),9.52,64);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('04-9�� -23','DD-MON-RR'),3.12,25);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.16,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.28,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.4,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),3.52,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.64,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),2.2,65);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.25,66);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.65,66);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),4.13,66);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.14,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.84,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2.54,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.28,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),1.65,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),1.16,67);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),0.99,68);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),0.77,68);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.5,69);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),2.16,70);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.23,70);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.81,71);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.87,72);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),0.75,72);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),25.94,73);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),11.01,74);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),7.94,74);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.12,74);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),5.87,75);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.02,75);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.3,75);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),1.65,75);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.47,76);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.48,76);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.49,76);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.51,77);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.12,77);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.72,78);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.53,78);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.7,78);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),1.93,79);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),2.65,80);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.15,80);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.7,81);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2.25,81);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.8,81);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),1.35,81);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),17.8,82);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),13.93,82);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),10.84,82);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),5.68,82);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),3.43,83);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.57,83);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),0.78,83);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),7.47,84);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.81,84);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),6.73,85);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.25,85);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),4.16,85);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),3.07,85);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),1.49,85);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('05-9�� -23','DD-MON-RR'),4.8,86);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),12.32,87);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.47,88);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),6,89);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.3,90);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),4.45,90);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.73,90);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),9.52,91);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5.38,91);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.98,92);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.24,92);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),4.49,92);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),3.4,92);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),1.7,92);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.47,93);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.93,93);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),1.53,93);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.08,94);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),10.8,95);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),9.45,95);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),6.53,95);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),6.96,96);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.15,97);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.96,97);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),0.56,98);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),0.32,98);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),0.25,98);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),7.5,99);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5,99);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),2.5,99);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),13.35,100);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),12.75,100);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),12,100);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),7.5,100);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.95,101);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),37.7,102);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),30.74,102);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),17.4,102);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),80,103);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),48,103);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),11.59,104);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),9.41,104);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),8.74,104);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),16.66,105);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),12.75,105);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),8.33,105);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),4.25,105);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),8.57,106);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.8,106);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),16.08,107);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),10.8,107);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),7.92,107);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),60.72,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),56.32,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),52.8,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),48.4,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),44,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),39.6,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),30.8,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('13-9�� -23','DD-MON-RR'),17.6,108);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),7.4,109);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),25.35,110);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),14.04,110);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),36.57,111);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),29.15,111);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),25.97,111);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),19.08,111);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),61.6,112);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),52.8,112);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),39.6,112);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.58,113);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),3.8,114);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),2.37,114);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('12-9�� -23','DD-MON-RR'),0.99,114);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),2.48,115);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),12.77,116);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),9.58,116);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),1.96,117);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),1.61,117);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),1.26,117);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),0.91,117);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),6.44,118);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),13.01,119);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),9.3,119);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),7.44,119);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.81,120);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),10.08,121);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),7.68,121);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5.12,121);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),22.08,122);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),11.84,122);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),9.28,122);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.31,123);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),10.21,124);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),17.62,125);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),13.66,125);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),9.7,125);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),6.46,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),6.12,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),5.78,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('09-9�� -23','DD-MON-RR'),5.44,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('10-9�� -23','DD-MON-RR'),5.1,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('11-9�� -23','DD-MON-RR'),3.4,126);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.58,127);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),11.59,128);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),9.74,128);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),7.73,128);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.29,129);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),2.15,129);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),4.07,130);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.54,130);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),5.24,131);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),3.74,131);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),2.24,131);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('06-9�� -23','DD-MON-RR'),6.6,132);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('07-9�� -23','DD-MON-RR'),5.98,132);
Insert into RELEASE.COMMODITY_PRICE_CURVE (COM_PC_TIME,COM_PC_PRICE,COM_ID) values (to_date('08-9�� -23','DD-MON-RR'),4.4,132);
REM INSERTING into RELEASE.CUSTOMER
SET DEFINE OFF;
Insert into RELEASE.CUSTOMER (CUS_ID,CUS_NICKNAME,CUS_NOTES,CUS_PAYPASSWORD,CUS_STATE) values (1000012,'11','11','123',0);
Insert into RELEASE.CUSTOMER (CUS_ID,CUS_NICKNAME,CUS_NOTES,CUS_PAYPASSWORD,CUS_STATE) values (1000017,'�����','��У�����X�mһö QAQ','123456',1);
Insert into RELEASE.CUSTOMER (CUS_ID,CUS_NICKNAME,CUS_NOTES,CUS_PAYPASSWORD,CUS_STATE) values (1000008,'��ʫ��','�������ʳ','123456',1);
Insert into RELEASE.CUSTOMER (CUS_ID,CUS_NICKNAME,CUS_NOTES,CUS_PAYPASSWORD,CUS_STATE) values (1000018,'����','�ԳԳԣ�����','123456',1);
Insert into RELEASE.CUSTOMER (CUS_ID,CUS_NICKNAME,CUS_NOTES,CUS_PAYPASSWORD,CUS_STATE) values (1000019,'qwq','qwqqqq','123456',1);
REM INSERTING into RELEASE.CUSTOMER_LOVE
SET DEFINE OFF;
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000012,'����',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000012,'��ʳ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000008,'��Ʒ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000008,'��ʳ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000012,'����Ʒ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000012,'����',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000017,'����',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000017,'���',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000017,'��ʳ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000018,'��Ʒ',1);
Insert into RELEASE.CUSTOMER_LOVE (CUS_ID,COM_CATEGORY,CUS_LOVE_WEIGHT) values (1000019,'��Ʒ',1);
REM INSERTING into RELEASE.FAVORITE
SET DEFINE OFF;
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (4,1000018);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (6,1000017);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (7,1000008);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (25,1000018);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (38,1000017);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (59,1000008);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (63,1000017);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (94,1000017);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (145,1000008);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (150,1000018);
Insert into RELEASE.FAVORITE (COM_ID,CUS_ID) values (154,1000018);
REM INSERTING into RELEASE.INDENT
SET DEFINE OFF;
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (67,1,to_date('08-9�� -23','DD-MON-RR'),'fec71b27-0f84-40ea-be05-a7868aa22341',' ',0,1000018,43,to_date('01-1�� -01','DD-MON-RR'),'0',1.44,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (68,3,to_date('08-9�� -23','DD-MON-RR'),'6b20132f-7b59-4d17-b06a-c994269b7017','���챸��~',1,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',4.11,-1,4);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (69,1,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,61,to_date('01-1�� -01','DD-MON-RR'),'0',4.4,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (70,2,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,105,to_date('01-1�� -01','DD-MON-RR'),'0',16.66,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (71,3,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,169,to_date('01-1�� -01','DD-MON-RR'),'0',27.27,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (1,1,to_date('04-9�� -23','DD-MON-RR'),'3d81b55e-4597-4bdc-9853-fa75498732e2','Ҫ���ʵ�',0,1000008,52,to_date('01-1�� -01','DD-MON-RR'),'0',5.98,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (2,5,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,4,to_date('01-1�� -01','DD-MON-RR'),'0',44,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (3,10,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,8,to_date('01-1�� -01','DD-MON-RR'),'0',74.5,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (4,3,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,49,to_date('01-1�� -01','DD-MON-RR'),'0',9.24,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (41,4,to_date('07-9�� -23','DD-MON-RR'),'14f8a6c2-bd24-4d1a-aa8c-f7a2df4a171f','����9.12ȡ��������',0,1000017,94,to_date('01-1�� -01','DD-MON-RR'),'0',4.32,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (42,1,to_date('07-9�� -23','DD-MON-RR'),'8d37e469-77e9-4d6c-8360-ca7ccc20b173',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'����Ҫ��',7.45,7.45,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (43,1,to_date('07-9�� -23','DD-MON-RR'),'3ccae5fd-812c-41b0-9b0d-cc2d8d728028',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'������',7.45,7.45,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (44,1,to_date('07-9�� -23','DD-MON-RR'),'b60c63ad-7e3d-4198-b630-1a7b641e345b',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'�����',7.45,7.45,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (45,1,to_date('07-9�� -23','DD-MON-RR'),'f985aef7-ea52-4144-a78e-1cd61854f847',' ',0,1000017,26,to_date('01-1�� -01','DD-MON-RR'),'0',7.45,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (46,5,to_date('07-9�� -23','DD-MON-RR'),'914a0270-878e-4cf5-9b3f-7e76a44e2275','������',0,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',8.6,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (47,3,to_date('07-9�� -23','DD-MON-RR'),'c44b9203-de7b-4fb7-b05a-72abd42f75de',' ',0,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',5.16,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (5,10,to_date('04-9�� -23','DD-MON-RR'),'c1aa2a7a-ae83-490c-a222-9c9c8fe107d1','ϣ�����췢��',1,1000017,43,to_date('01-1�� -01','DD-MON-RR'),'0',16.8,-1,5);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (6,12,to_date('04-9�� -23','DD-MON-RR'),'bc503a78-df0c-4876-ab80-baf9660bbd9c','����â������췢��~',0,1000018,4,to_date('01-1�� -01','DD-MON-RR'),'0',105.6,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (7,2,to_date('04-9�� -23','DD-MON-RR'),'85a905f5-844c-4b3e-8fd9-9c9f77f89666',' ',0,1000017,9,to_date('01-1�� -01','DD-MON-RR'),'0',20.8,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (8,4,to_date('04-9�� -23','DD-MON-RR'),'c292f352-6150-492c-9ef2-9e7be67de620',' ',2,1000017,46,to_date('04-9�� -23','DD-MON-RR'),'����Ҫ��',10.8,10.8,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (9,2,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',2,1000017,12,to_date('06-9�� -23','DD-MON-RR'),'����Ҫ��',13.14,8.76,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (10,3,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',0,1000017,11,to_date('01-1�� -01','DD-MON-RR'),'0',1.5,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (11,2,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',0,1000017,9,to_date('01-1�� -01','DD-MON-RR'),'0',20.8,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (12,5,to_date('04-9�� -23','DD-MON-RR'),'872abf97-b3cc-4581-a59b-0c2dfbc644d5','���~',0,1000017,23,to_date('01-1�� -01','DD-MON-RR'),'0',108.9,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (13,5,to_date('04-9�� -23','DD-MON-RR'),'09802f75-d544-47ab-bcb7-cbf802b9fd2b','�ڴ���~',1,1000018,25,to_date('01-1�� -01','DD-MON-RR'),'0',15.6,-1,1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (14,2,to_date('04-9�� -23','DD-MON-RR'),'9e27e506-90f3-4e56-a958-e4c63fb4b7fb','�ڴ�~',1,1000017,25,to_date('01-1�� -01','DD-MON-RR'),'0',6.24,-1,4);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (15,2,to_date('05-9�� -23','DD-MON-RR'),'9932ef1e-ba02-4707-8ae3-db2f37a14fdf',' ',1,1000017,43,to_date('01-1�� -01','DD-MON-RR'),'0',3.36,-1,1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (16,1,to_date('05-9�� -23','DD-MON-RR'),'5a687ec8-ac9f-40c1-a455-261cf1e314bb',' ',1,1000018,10,to_date('01-1�� -01','DD-MON-RR'),'0',10.8,-1,2);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (17,1,to_date('05-9�� -23','DD-MON-RR'),'f6b9595b-b7c8-427d-bb7f-eafd8bad66a2',' ',0,1000017,7,to_date('01-1�� -01','DD-MON-RR'),'0',36.4,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (18,3,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,5,to_date('01-1�� -01','DD-MON-RR'),'0',14.4,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (19,2,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,6,to_date('01-1�� -01','DD-MON-RR'),'0',3.3,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (20,2,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,8,to_date('01-1�� -01','DD-MON-RR'),'0',13.42,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (21,1,to_date('05-9�� -23','DD-MON-RR'),'fe98429d-854a-4b16-8828-384204c37fcf',' ',2,1000017,4,to_date('05-9�� -23','DD-MON-RR'),'����Ҫ��',8.8,4.4,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (22,5,to_date('05-9�� -23','DD-MON-RR'),'ab5fb53b-6cae-4435-b668-f30b8866228a',' ',0,1000017,25,to_date('01-1�� -01','DD-MON-RR'),'0',0,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (23,5,to_date('05-9�� -23','DD-MON-RR'),'30836d96-6ecc-4a54-b87d-8116a3ae5ad2','������������׺�',0,1000008,43,to_date('01-1�� -01','DD-MON-RR'),'0',7.8,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (24,3,to_date('05-9�� -23','DD-MON-RR'),'ff746520-ed75-46bc-86ce-3d4e59d37162','��������������',0,1000008,14,to_date('01-1�� -01','DD-MON-RR'),'0',20.79,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (25,2,to_date('05-9�� -23','DD-MON-RR'),'f36b4ad9-a7a7-4a92-b83b-cddbeb02a602','��Ҫ��~',1,1000017,82,to_date('01-1�� -01','DD-MON-RR'),'0',35.6,-1,0);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (26,1,to_date('05-9�� -23','DD-MON-RR'),'890617cc-b01d-4d43-a83b-e67949092bcb',' ',0,1000017,38,to_date('01-1�� -01','DD-MON-RR'),'0',3.96,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (27,1,to_date('05-9�� -23','DD-MON-RR'),'9dcd6e78-c87e-4127-a212-2f63ce0d521d',' ',0,1000017,6,to_date('01-1�� -01','DD-MON-RR'),'0',1.65,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (28,1,to_date('06-9�� -23','DD-MON-RR'),'8e0d6166-9506-4c1f-ae07-1f53e2090e5e',' ',0,1000017,92,to_date('01-1�� -01','DD-MON-RR'),'0',5.98,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (29,5,to_date('06-9�� -23','DD-MON-RR'),'7e3e1a78-3028-4a4b-afd1-fd0d9992abce',' ',2,1000017,19,to_date('07-9�� -23','DD-MON-RR'),'�����',74.75,74.75,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (30,1,to_date('06-9�� -23','DD-MON-RR'),'5a619c6d-f0e1-485b-be5b-2e1b87ccbcec',' ',2,1000017,19,to_date('06-9�� -23','DD-MON-RR'),null,14.95,14.95,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (31,2,to_date('06-9�� -23','DD-MON-RR'),'be032e34-1285-46ea-8425-d5cf4d5e5a51',' ',2,1000017,5,to_date('06-9�� -23','DD-MON-RR'),'����Ҫ',9.6,8,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (61,2,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,5,to_date('01-1�� -01','DD-MON-RR'),'0',6.4,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (62,1,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,108,to_date('01-1�� -01','DD-MON-RR'),'0',52.8,-1,5);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (63,1,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,143,to_date('01-1�� -01','DD-MON-RR'),'0',17.56,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (64,3,to_date('08-9�� -23','DD-MON-RR'),'3d7b3bfe-4f35-40dd-9a0f-79e80d3e0390','�뾡�챸��',0,1000018,108,to_date('01-1�� -01','DD-MON-RR'),'0',158.4,-1,-1);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (65,5,to_date('08-9�� -23','DD-MON-RR'),'45de43c3-1689-4e3f-830d-144375640d84',' ',1,1000018,153,to_date('01-1�� -01','DD-MON-RR'),'0',22.4,-1,5);
Insert into RELEASE.INDENT (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (66,1,to_date('08-9�� -23','DD-MON-RR'),'1e29340f-4e02-4a05-a1ef-61b8d1b95b41',' ',1,1000017,153,to_date('01-1�� -01','DD-MON-RR'),'0',4.48,-1,2);
REM INSERTING into RELEASE.NOTICE
SET DEFINE OFF;
Insert into RELEASE.NOTICE (NTC_ID,NTC_TIME,NTC_CONTENT,NTC_STATE,STO_ID) values (1,to_date('06-9�� -23','DD-MON-RR'),'�������̵����۷����̣������׹����ĵײ��߼��ǡ�����������',1,1000005);
REM INSERTING into RELEASE.SCREENSHOT
SET DEFINE OFF;
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (1,'appeal_image\appeal_img_1.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (2,'appeal_image\appeal_img_2.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (3,'appeal_image\appeal_img_3.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (4,'appeal_image\appeal_img_4.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (5,'appeal_image\appeal_img_5.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (6,'appeal_image\appeal_img_6.jpg');
Insert into RELEASE.SCREENSHOT (APP_ID,SCT_IMAGE) values (7,'appeal_image\appeal_img_7.jpg');
REM INSERTING into RELEASE.STORE
SET DEFINE OFF;
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000010,'��������','�������й��׼������ݺͼ���������������ƽ̨��ͨ���ع����۲�ҵ ���ˡ����������������ˡ�������������������X��Ա�ꡱ���������������ҵ̬�����������������߶�����������������ÿƼ��ʹ���������ǧ��ͥ�ġ��ʡ����������','licenses\1000010_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000011,'���󷢳���','���󷢣���̨����̩������1996�괴����1997��3�¼���̨����԰������һ����ȫ���й���������ƹ滮Ӫ�˹���Ĵ����ִ������У��̳��ں��˴�ͳ�г������ʣ������ı��˼��ٻ���˾�����ʱ�������ֱ������ķ�ʽΪ�˿ͷ���  ���󷢣���1998��7�����й���½�����һ�Ҵ��ͳ��У��ǻ�Ա�ƴ��������ۺϳ��С�����Ͷ�ʣ��й������޹�˾���С����󷢡��̱�ĺϷ�Ȩ�����ǡ����󷢡��й������ܲ����й���½�����ġ����󷢡��ŵ��Ϊ����Ͷ��(�й�)���޹�˾��Ͷ��������','licenses\1000011_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000004,'��è����','��è���� �ǰ���Ͱͼ��Ŵ����һ�����ϳ��С�. ��è���� �������۽�������Ʒ���ṩ�ֿ��������ͣ�������Ʒ����ͳһ����Ʒ��װ��','licenses\1000004_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000005,'�����׹�','�����׹����Źɷ����޹�˾���й����ȵ��ǻ����۷�����,�ڻ���������ʱ��,���������ƽ��ǻ����ۡ���������ս��,ȫƷ����չ,ȫ��������,ȫ��Ⱥ�ںϡ�','licenses\1000005_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000006,'����','���󷢣���̨����̩������1996�괴����1997��3�¼���̨����԰������һ����ȫ���й���������ƹ滮Ӫ�˹���Ĵ����ִ������У��̳��ں��˴�ͳ�г������ʣ������ı��˼��ٻ���˾�����ʱ�������ֱ������ķ�ʽΪ�˿ͷ���','licenses\1000006_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000009,'Walmart','�ֶ���ٻ����޹�˾����һ��������������������ҵ����Ӫҵ�����Ϊȫ�����Ĺ�˾������7�����������Ƹ�����־����500ǿ��ҵ�о���λ���ֶ��깫˾��8500���ŵ꣬�ֲ���ȫ��15�����ҡ��ֶ���������50���ݺͲ��������Ӫ���ֶ�����Ҫ���ֶ��깺��㳡��ɽķ��Ա�ꡢ�ֶ����̵ꡢ�ֶ��������������Ӫҵ��ʽ��','licenses\1000009_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000013,'��è����','��è���У�Tmall Mart���ǰ���Ͱͼ������µ����ϳ��У��Ǽ��ɹ����ִ������ۡ�������һ��ı������ƽ̨����2011��4������[1][2]��  ��è�����ṩ�ḻ�ͱ��ػ�����Ʒ��Ӧ����������ʳƷ��ʳƷ���ϡ����͸�ʳ������ϴ�����Ҿ���Ʒ����ͥ��ࡢĸӤ��Ʒ���������Ʒ������רҵ�ִ��������ṩ��1Сʱ��������մ�������մ�����ͷ��񣬲�����Ʒͳһ��֡�ͳһ���','licenses\1000013_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000014,'���󷢳���','������Ҫ��Ӫ����ʳƷ������ʳƷ��������Ʒ�����÷�֯�����ҵ硢�Ļ�������Ʒ����������������Ʒ������Ϊ���ṩ���ʡ����ˡ����ʡ������ķ���','licenses\1000014_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000015,'��è����','��è��������ԭ����è����ҵ���Լ��������̬�ڵĴ����������еȺ��������ܺ����������ƽ���������һ�廯���ʹˣ���������è����+���³����������ĳ���������ģʽ���Ρ���è����ҵ����2007�����ߣ�Ŀǰ����ȫ������ƷƷ�ອ��ʳƷ���͡�������ӡ�����ĸӤ���������ճ���������ķ������棬�������ߴ����˷����ݵ����ϳ��й�������','licenses\1000015_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000016,'��è����','��è�����ǰ���Ͱͼ���ȫ����������ϳ��С�  ��è�����ṩ����ʳƷ��ʳƷ���ϡ����͸�ʳ������ϴ�����Ҿ���Ʒ����ͥ��ࡢĸӤ��Ʒ�������������Ʒ���ṩ�ķ��������  һ����Ʒ����  ��è���������Ա�ǿ��ĵ����������ϵͳ����ϵͳƽ̨���ɹ����ִ������͡��Ϳͻ���ϵ����ȷ������Ͷ�룬��ȷ������Ʒ����Ʒ�ܹ�ͨ���Ա����糬����һƽ̨���조�����������ִ����ĵ��˿ͼ��С�����һ���ɱ���͡��ٶ���졢Ч����ߵ���ͨ��·��  ������������  ��è�������Ϻ����ϲִ���Դ������������Դ������ͳһ����Ʒ��װ���Ѿ�ʵ�ִ����ʹ����½��ʵ��ÿ�����䣬ָ��ʱ���ʹָ�������ʹ�����ͷ���  ����һվʽ���룬ͳһ�ʼ�  ��è����ʵ����Ʒͳһ��֣�ͳһרҵ�����','licenses\1000016_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000021,'�ֶ���','�ֶ�����1996������й�,�����ڿ����˵�һ���ֶ����ŵ��ɽķ��Ա�̵�.��Ϊһ��ȫ��������������ҵ,�ֶ����й�����˿�����,�ں�ʵ���ŵ�Ͷ����������','licenses\1000021_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000022,'�����׹�','�����׹����й����ȵ��ǻ����۷����̣��ڻ���������ʱ�������������ƽ��ǻ����ۡ���������ս�ԣ�ȫƷ����չ��ȫ�������ߣ�ȫ��Ⱥ�ںϣ���ͨ�����Ź�Ӧ�ơ��û��ơ������ơ������ơ�Ӫ���ƣ�ʵ�ִ����ϵ����£��ӳ��е����򣬴ӹ������ĵ�����ȫ���ǣ�Ϊ�������ṩ�޴����ڵ�1Сʱ��������Ȧ���������ȫ��λ���������ߵ��������衣2020�꣬�����׹��ٴ�λ�С��Ƹ���ȫ��500ǿ��������2020�꡶�й�500��߼�ֵƷ�ơ��У���2968.15��Ԫ��Ʒ�Ƽ�ֵ�Ⱦ�����ҵ��һλ��','licenses\1000022_license.jpg',1);
Insert into RELEASE.STORE (STO_ID,STO_NAME,STO_INTRODUCTION,STO_LICENSEIMG,STO_STATE) values (1000023,'�����׹�','����2020��6�£�ȫ���������׹��������縲��ȫ����ӵ�������㳡���������ָ��������ġ������ٻ������������ơ�������������캢�ӵȡ�һ����С��ר�����ഴ�»������ŵ꣬�Ⱦӹ�����������ǰ�У������׹�����ͨ����Ӫ�����źͿ�ƽ̨��Ӫ�������й�B2C��ҵǰ�У���˾���ۻ�Ա������6.02�ڡ�','licenses\1000023_license.jpg',1);
REM INSERTING into RELEASE.STOREIMAGE
SET DEFINE OFF;
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000004,'store_image\1000004_picture_ca0fc326-5728-4698-9b84-6aa3905a9e7e.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000005,'store_image\1000005_picture_f0850614-2c28-4c78-a26a-7721fc8a78d8.jpg');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000006,'store_image\1000006_picture_60481544-ff27-428f-9ff4-ecc69126eb76.jpg');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000009,'store_image\1000009_picture_ae859242-b2c1-45ad-9141-27310c45def6.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000010,'store_image\1000010_picture_d58cdd94-96da-491c-b003-23891914988b.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000011,'store_image\1000011_picture_b1e56c9f-8ca7-4a54-b38b-e423076acd72.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000013,'store_image\1000013_picture_e9a6edf3-13a0-4343-8f97-347798f309d7.jpg');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000014,'store_image\1000014_picture_80a29653-56f2-47a5-b4d4-2acd7ebfdbb7.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000015,'store_image\1000015_picture_02d5f6ee-ee0d-4f33-bbe6-3dab1d28ea23.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000016,'store_image\1000016_picture_ddc11795-8837-4a52-aa13-005ec3e768d2.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000021,'store_image\1000021_picture_19875f11-0912-4d23-9607-9bb306c15ebd.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000022,'store_image\1000022_picture_911d7c12-1472-41d1-92b9-4ac71f3ce671.png');
Insert into RELEASE.STOREIMAGE (STO_ID,STO_IMAGE) values (1000023,'store_image\1000023_picture_9cc26472-17ed-4e7e-963a-5c1557382021.png');
REM INSERTING into RELEASE.STORE_CATEGORIES
SET DEFINE OFF;
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000004,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000004,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000004,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000004,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000004,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000005,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000005,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000006,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000006,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000006,'Ԥ�Ʋ�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000009,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'��ζƷ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000010,'Ԥ�Ʋ�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000011,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000011,'����Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000011,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000013,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000013,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000013,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000014,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000014,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000014,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000014,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000015,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000015,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000015,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000015,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000015,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000016,'����Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000016,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000016,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000016,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'��Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'����Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'�߲�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'���');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000021,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000022,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000022,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000022,'��ʳ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000022,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000023,'����Ʒ');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000023,'����');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000023,'Ԥ�Ʋ�');
Insert into RELEASE.STORE_CATEGORIES (STORE_ID,COM_CATEGORY) values (1000023,'����');
REM INSERTING into RELEASE.USERS
SET DEFINE OFF;
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547111','123456','�Ϻ����Ϻ��мζ�������·',1,to_date('04-9�� -23','DD-MON-RR'),1,1000004,636.95);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547112','123456','�Ϻ����Ϻ��мζ����ܰ���·4800��',1,to_date('04-9�� -23','DD-MON-RR'),1,1000005,45.63);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547114','123456','�Ϻ����Ϻ��мζ���',1,to_date('04-9�� -23','DD-MON-RR'),1,1000009,234.2);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547115','123456','�Ϻ����Ϻ��мζ�������·',1,to_date('04-9�� -23','DD-MON-RR'),1,1000010,55.6);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547113','123456','�Ϻ����Ϻ��мζ����ζ�·',1,to_date('04-9�� -23','DD-MON-RR'),1,1000006,-81.13);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547119','123456','�Ϻ����Ϻ��к��������·586Ū-1��',1,to_date('04-9�� -23','DD-MON-RR'),1,1000011,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('17879680000','123456','�Ϻ����Ϻ��мζ�������·',1,to_date('04-9�� -23','DD-MON-RR'),0,1000008,263.93);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18158836180','123','�����б�����ʯ��ɽ����Ȫ·16��Ժ',1,to_date('04-9�� -23','DD-MON-RR'),0,1000012,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547118','123456','�Ϻ����Ϻ������������ɶ�·1252��',0,to_date('04-9�� -23','DD-MON-RR'),1,1000013,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547117','123456','�Ϻ����Ϻ�������������·200��',0,to_date('04-9�� -23','DD-MON-RR'),1,1000014,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547116','123456','�Ϻ����Ϻ����ֶ���������·',0,to_date('04-9�� -23','DD-MON-RR'),1,1000015,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15380547121','123456','�Ϻ����Ϻ��л�����������200��-1321��',1,to_date('04-9�� -23','DD-MON-RR'),1,1000016,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18736901275','422563809','�Ϻ����Ϻ��мζ����ܰ���·4800��',1,to_date('04-9�� -23','DD-MON-RR'),0,1000017,884.39);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18739979276','123456','�Ϻ����Ϻ��мζ����ζ�·',1,to_date('04-9�� -23','DD-MON-RR'),0,1000018,637.43);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18352099879','123456','�Ϻ����Ϻ��г�������ϼ·31��',1,to_date('06-9�� -23','DD-MON-RR'),0,1000019,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18158836181','123','�����б����ж����������Ŵ��',0,to_date('06-9�� -23','DD-MON-RR'),0,1000020,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('16380547111','123456','�Ϻ����Ϻ��б�ɽ������·612Ū-318��-��',0,to_date('06-9�� -23','DD-MON-RR'),1,1000021,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('15390547111','123456','�Ϻ����Ϻ�������������ƽ��·2750',0,to_date('06-9�� -23','DD-MON-RR'),1,1000022,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('17380547111','123456','�Ϻ����Ϻ����ֶ���������·61Ū-58-��',0,to_date('06-9�� -23','DD-MON-RR'),1,1000023,0);
Insert into RELEASE.USERS (USER_PHONE,USER_PASSWORD,USER_ADDRESS,USER_STATE,USER_REGTIME,USER_TYPE,USER_ID,USER_BALANCE) values ('18736901271','422563809','�����б����ж������찲�Ŷ�ͨ��',0,to_date('08-9�� -23','DD-MON-RR'),1,1000040,0);
REM INSERTING into RELEASE.INDENT_VIEW
SET DEFINE OFF;
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (67,1,to_date('08-9�� -23','DD-MON-RR'),'fec71b27-0f84-40ea-be05-a7868aa22341',' ',0,1000018,43,to_date('01-1�� -01','DD-MON-RR'),'0',1.44,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (68,3,to_date('08-9�� -23','DD-MON-RR'),'6b20132f-7b59-4d17-b06a-c994269b7017','���챸��~',1,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',4.11,-1,4);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (69,1,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,61,to_date('01-1�� -01','DD-MON-RR'),'0',4.4,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (70,2,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,105,to_date('01-1�� -01','DD-MON-RR'),'0',16.66,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (71,3,to_date('09-9�� -23','DD-MON-RR'),'a3a983a1-616b-4fea-baf3-dd76283df655','���÷��ſ�',1,1000018,169,to_date('01-1�� -01','DD-MON-RR'),'0',27.27,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (1,1,to_date('04-9�� -23','DD-MON-RR'),'3d81b55e-4597-4bdc-9853-fa75498732e2','Ҫ���ʵ�',0,1000008,52,to_date('01-1�� -01','DD-MON-RR'),'0',5.98,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (2,5,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,4,to_date('01-1�� -01','DD-MON-RR'),'0',44,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (3,10,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,8,to_date('01-1�� -01','DD-MON-RR'),'0',74.5,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (4,3,to_date('04-9�� -23','DD-MON-RR'),'0f6a3f32-2a7a-4754-8584-a1b09b63782c','�ŵ��ſ����Լ���',0,1000008,49,to_date('01-1�� -01','DD-MON-RR'),'0',9.24,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (41,4,to_date('07-9�� -23','DD-MON-RR'),'14f8a6c2-bd24-4d1a-aa8c-f7a2df4a171f','����9.12ȡ��������',0,1000017,94,to_date('01-1�� -01','DD-MON-RR'),'0',4.32,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (42,1,to_date('07-9�� -23','DD-MON-RR'),'8d37e469-77e9-4d6c-8360-ca7ccc20b173',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'����Ҫ��',7.45,7.45,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (43,1,to_date('07-9�� -23','DD-MON-RR'),'3ccae5fd-812c-41b0-9b0d-cc2d8d728028',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'������',7.45,7.45,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (44,1,to_date('07-9�� -23','DD-MON-RR'),'b60c63ad-7e3d-4198-b630-1a7b641e345b',' ',2,1000017,26,to_date('07-9�� -23','DD-MON-RR'),'�����',7.45,7.45,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (45,1,to_date('07-9�� -23','DD-MON-RR'),'f985aef7-ea52-4144-a78e-1cd61854f847',' ',0,1000017,26,to_date('01-1�� -01','DD-MON-RR'),'0',7.45,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (46,5,to_date('07-9�� -23','DD-MON-RR'),'914a0270-878e-4cf5-9b3f-7e76a44e2275','������',0,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',8.6,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (47,3,to_date('07-9�� -23','DD-MON-RR'),'c44b9203-de7b-4fb7-b05a-72abd42f75de',' ',0,1000017,144,to_date('01-1�� -01','DD-MON-RR'),'0',5.16,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (5,10,to_date('04-9�� -23','DD-MON-RR'),'c1aa2a7a-ae83-490c-a222-9c9c8fe107d1','ϣ�����췢��',1,1000017,43,to_date('01-1�� -01','DD-MON-RR'),'0',16.8,-1,5);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (6,12,to_date('04-9�� -23','DD-MON-RR'),'bc503a78-df0c-4876-ab80-baf9660bbd9c','����â������췢��~',0,1000018,4,to_date('01-1�� -01','DD-MON-RR'),'0',105.6,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (7,2,to_date('04-9�� -23','DD-MON-RR'),'85a905f5-844c-4b3e-8fd9-9c9f77f89666',' ',0,1000017,9,to_date('01-1�� -01','DD-MON-RR'),'0',20.8,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (8,4,to_date('04-9�� -23','DD-MON-RR'),'c292f352-6150-492c-9ef2-9e7be67de620',' ',2,1000017,46,to_date('04-9�� -23','DD-MON-RR'),'����Ҫ��',10.8,10.8,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (9,2,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',2,1000017,12,to_date('06-9�� -23','DD-MON-RR'),'����Ҫ��',13.14,8.76,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (10,3,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',0,1000017,11,to_date('01-1�� -01','DD-MON-RR'),'0',1.5,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (11,2,to_date('04-9�� -23','DD-MON-RR'),'ef362203-3853-42bf-8dd4-f4a5fa725452',' ',0,1000017,9,to_date('01-1�� -01','DD-MON-RR'),'0',20.8,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (12,5,to_date('04-9�� -23','DD-MON-RR'),'872abf97-b3cc-4581-a59b-0c2dfbc644d5','���~',0,1000017,23,to_date('01-1�� -01','DD-MON-RR'),'0',108.9,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (13,5,to_date('04-9�� -23','DD-MON-RR'),'09802f75-d544-47ab-bcb7-cbf802b9fd2b','�ڴ���~',1,1000018,25,to_date('01-1�� -01','DD-MON-RR'),'0',15.6,-1,1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (14,2,to_date('04-9�� -23','DD-MON-RR'),'9e27e506-90f3-4e56-a958-e4c63fb4b7fb','�ڴ�~',1,1000017,25,to_date('01-1�� -01','DD-MON-RR'),'0',6.24,-1,4);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (15,2,to_date('05-9�� -23','DD-MON-RR'),'9932ef1e-ba02-4707-8ae3-db2f37a14fdf',' ',1,1000017,43,to_date('01-1�� -01','DD-MON-RR'),'0',3.36,-1,1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (16,1,to_date('05-9�� -23','DD-MON-RR'),'5a687ec8-ac9f-40c1-a455-261cf1e314bb',' ',1,1000018,10,to_date('01-1�� -01','DD-MON-RR'),'0',10.8,-1,2);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (17,1,to_date('05-9�� -23','DD-MON-RR'),'f6b9595b-b7c8-427d-bb7f-eafd8bad66a2',' ',0,1000017,7,to_date('01-1�� -01','DD-MON-RR'),'0',36.4,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (18,3,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,5,to_date('01-1�� -01','DD-MON-RR'),'0',14.4,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (19,2,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,6,to_date('01-1�� -01','DD-MON-RR'),'0',3.3,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (20,2,to_date('05-9�� -23','DD-MON-RR'),'77bd1d13-8ece-4a65-89f3-13dccd24050f',' ',1,1000017,8,to_date('01-1�� -01','DD-MON-RR'),'0',13.42,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (21,1,to_date('05-9�� -23','DD-MON-RR'),'fe98429d-854a-4b16-8828-384204c37fcf',' ',2,1000017,4,to_date('05-9�� -23','DD-MON-RR'),'����Ҫ��',8.8,4.4,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (22,5,to_date('05-9�� -23','DD-MON-RR'),'ab5fb53b-6cae-4435-b668-f30b8866228a',' ',0,1000017,25,to_date('01-1�� -01','DD-MON-RR'),'0',0,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (23,5,to_date('05-9�� -23','DD-MON-RR'),'30836d96-6ecc-4a54-b87d-8116a3ae5ad2','������������׺�',0,1000008,43,to_date('01-1�� -01','DD-MON-RR'),'0',7.8,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (24,3,to_date('05-9�� -23','DD-MON-RR'),'ff746520-ed75-46bc-86ce-3d4e59d37162','��������������',0,1000008,14,to_date('01-1�� -01','DD-MON-RR'),'0',20.79,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (25,2,to_date('05-9�� -23','DD-MON-RR'),'f36b4ad9-a7a7-4a92-b83b-cddbeb02a602','��Ҫ��~',1,1000017,82,to_date('01-1�� -01','DD-MON-RR'),'0',35.6,-1,0);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (26,1,to_date('05-9�� -23','DD-MON-RR'),'890617cc-b01d-4d43-a83b-e67949092bcb',' ',0,1000017,38,to_date('01-1�� -01','DD-MON-RR'),'0',3.96,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (27,1,to_date('05-9�� -23','DD-MON-RR'),'9dcd6e78-c87e-4127-a212-2f63ce0d521d',' ',0,1000017,6,to_date('01-1�� -01','DD-MON-RR'),'0',1.65,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (28,1,to_date('06-9�� -23','DD-MON-RR'),'8e0d6166-9506-4c1f-ae07-1f53e2090e5e',' ',0,1000017,92,to_date('01-1�� -01','DD-MON-RR'),'0',5.98,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (29,5,to_date('06-9�� -23','DD-MON-RR'),'7e3e1a78-3028-4a4b-afd1-fd0d9992abce',' ',2,1000017,19,to_date('07-9�� -23','DD-MON-RR'),'�����',74.75,74.75,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (30,1,to_date('06-9�� -23','DD-MON-RR'),'5a619c6d-f0e1-485b-be5b-2e1b87ccbcec',' ',2,1000017,19,to_date('06-9�� -23','DD-MON-RR'),null,14.95,14.95,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (31,2,to_date('06-9�� -23','DD-MON-RR'),'be032e34-1285-46ea-8425-d5cf4d5e5a51',' ',2,1000017,5,to_date('06-9�� -23','DD-MON-RR'),'����Ҫ',9.6,8,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (61,2,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,5,to_date('01-1�� -01','DD-MON-RR'),'0',6.4,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (62,1,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,108,to_date('01-1�� -01','DD-MON-RR'),'0',52.8,-1,5);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (63,1,to_date('08-9�� -23','DD-MON-RR'),'c3f42ab1-871f-4145-a264-dff0142d1713',' ',1,1000008,143,to_date('01-1�� -01','DD-MON-RR'),'0',17.56,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (64,3,to_date('08-9�� -23','DD-MON-RR'),'3d7b3bfe-4f35-40dd-9a0f-79e80d3e0390','�뾡�챸��',0,1000018,108,to_date('01-1�� -01','DD-MON-RR'),'0',158.4,-1,-1);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (65,5,to_date('08-9�� -23','DD-MON-RR'),'45de43c3-1689-4e3f-830d-144375640d84',' ',1,1000018,153,to_date('01-1�� -01','DD-MON-RR'),'0',22.4,-1,5);
Insert into RELEASE.INDENT_VIEW (IND_ID,IND_QUANTITY,IND_CREATIONTIME,IND_VERIFICATIONCODE,IND_NOTES,IND_STATE,CUS_ID,COM_ID,IND_RTIME,IND_RNOTES,IND_MONEY,IND_RMONEY,IND_RATING) values (66,1,to_date('08-9�� -23','DD-MON-RR'),'1e29340f-4e02-4a05-a1ef-61b8d1b95b41',' ',1,1000017,153,to_date('01-1�� -01','DD-MON-RR'),'0',4.48,-1,2);
--------------------------------------------------------
--  DDL for Index ADMINISTRATOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."ADMINISTRATOR_PK" ON "RELEASE"."ADMINISTRATOR" ("ADMIN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index APPEAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."APPEAL_PK" ON "RELEASE"."APPEAL" ("APP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BROWSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."BROWSE_PK" ON "RELEASE"."BROWSE" ("BRO_TIME_START", "COM_ID", "BROWSER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CHAT_PK" ON "RELEASE"."CHAT" ("CHAT_TIME", "CUS_ID", "STORE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITIES_CATEGORIES$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITIES_CATEGORIES$_PK" ON "RELEASE"."COMMODITIES_CATEGORIES" ("COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_IMAGE_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_IMAGE_PK1" ON "RELEASE"."COMMODITY_IMAGE" ("COM_ID", "COM_IMAGE") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_PK" ON "RELEASE"."COMMODITY" ("COM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_PRICE_CURVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_PRICE_CURVE_PK" ON "RELEASE"."COMMODITY_PRICE_CURVE" ("COM_PC_TIME", "COM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_LOVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CUSTOMER_LOVE_PK" ON "RELEASE"."CUSTOMER_LOVE" ("CUS_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CUSTOMER_PK" ON "RELEASE"."CUSTOMER" ("CUS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FAVORITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."FAVORITE_PK" ON "RELEASE"."FAVORITE" ("COM_ID", "CUS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."INDENT_PK" ON "RELEASE"."INDENT" ("IND_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."NOTICE_PK" ON "RELEASE"."NOTICE" ("NTC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_COMMODITY_CATEGORIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."PK_COMMODITY_CATEGORIES" ON "RELEASE"."COMMODITY_CATEGORIES" ("COM_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index SCREENSHOT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."SCREENSHOT_PK" ON "RELEASE"."SCREENSHOT" ("APP_ID", "SCT_IMAGE") 
  ;
--------------------------------------------------------
--  DDL for Index STOREIMAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STOREIMAGE_PK" ON "RELEASE"."STOREIMAGE" ("STO_IMAGE", "STO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_CATEGORIES_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STORE_CATEGORIES_PK1" ON "RELEASE"."STORE_CATEGORIES" ("STORE_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STORE_PK" ON "RELEASE"."STORE" ("STO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008665
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."SYS_C008665" ON "RELEASE"."COMMODITY_COMMENT" ("CMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."USERS_PK" ON "RELEASE"."USERS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."USERS_UK1" ON "RELEASE"."USERS" ("USER_PHONE") 
  ;
--------------------------------------------------------
--  DDL for Index ADMINISTRATOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."ADMINISTRATOR_PK" ON "RELEASE"."ADMINISTRATOR" ("ADMIN_ID") 
  ;
--------------------------------------------------------
--  DDL for Index APPEAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."APPEAL_PK" ON "RELEASE"."APPEAL" ("APP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index BROWSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."BROWSE_PK" ON "RELEASE"."BROWSE" ("BRO_TIME_START", "COM_ID", "BROWSER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CHAT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CHAT_PK" ON "RELEASE"."CHAT" ("CHAT_TIME", "CUS_ID", "STORE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITIES_CATEGORIES$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITIES_CATEGORIES$_PK" ON "RELEASE"."COMMODITIES_CATEGORIES" ("COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_PK" ON "RELEASE"."COMMODITY" ("COM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_COMMODITY_CATEGORIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."PK_COMMODITY_CATEGORIES" ON "RELEASE"."COMMODITY_CATEGORIES" ("COM_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C008665
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."SYS_C008665" ON "RELEASE"."COMMODITY_COMMENT" ("CMT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_IMAGE_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_IMAGE_PK1" ON "RELEASE"."COMMODITY_IMAGE" ("COM_ID", "COM_IMAGE") 
  ;
--------------------------------------------------------
--  DDL for Index COMMODITY_PRICE_CURVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."COMMODITY_PRICE_CURVE_PK" ON "RELEASE"."COMMODITY_PRICE_CURVE" ("COM_PC_TIME", "COM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CUSTOMER_PK" ON "RELEASE"."CUSTOMER" ("CUS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_LOVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."CUSTOMER_LOVE_PK" ON "RELEASE"."CUSTOMER_LOVE" ("CUS_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index FAVORITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."FAVORITE_PK" ON "RELEASE"."FAVORITE" ("COM_ID", "CUS_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."INDENT_PK" ON "RELEASE"."INDENT" ("IND_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."NOTICE_PK" ON "RELEASE"."NOTICE" ("NTC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SCREENSHOT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."SCREENSHOT_PK" ON "RELEASE"."SCREENSHOT" ("APP_ID", "SCT_IMAGE") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STORE_PK" ON "RELEASE"."STORE" ("STO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STOREIMAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STOREIMAGE_PK" ON "RELEASE"."STOREIMAGE" ("STO_IMAGE", "STO_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_CATEGORIES_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."STORE_CATEGORIES_PK1" ON "RELEASE"."STORE_CATEGORIES" ("STORE_ID", "COM_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."USERS_PK" ON "RELEASE"."USERS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RELEASE"."USERS_UK1" ON "RELEASE"."USERS" ("USER_PHONE") 
  ;
--------------------------------------------------------
--  DDL for Trigger SET_COM_RATING
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_RATING" 
INSTEAD OF UPDATE ON INDENT_VIEW
FOR EACH ROW
BEGIN
    -- ????????INDENT??
    UPDATE INDENT
    SET 
        IND_ID = :NEW.IND_ID,
        IND_QUANTITY = :NEW.IND_QUANTITY,
        IND_MONEY = :NEW.IND_MONEY,
        IND_CREATIONTIME = :NEW.IND_CREATIONTIME,
        IND_VERIFICATIONCODE = :NEW.IND_VERIFICATIONCODE,
        IND_NOTES = :NEW.IND_NOTES,
        IND_STATE = :NEW.IND_STATE,
        IND_RATING = :NEW.IND_RATING,
        CUS_ID = :NEW.CUS_ID,
        COM_ID = :NEW.COM_ID,
        IND_RTIME = :NEW.IND_RTIME,
        IND_RNOTES = :NEW.IND_RNOTES,
        IND_RMONEY = :NEW.IND_RMONEY
    WHERE 
        IND_ID = :OLD.IND_ID; 

    -- ????COMMODITY??
    UPDATE RELEASE.COMMODITY
    SET COM_RATING = (
        SELECT AVG(IND_RATING)
        FROM RELEASE.INDENT
        WHERE COM_ID = :NEW.COM_ID AND IND_RATING!=-1

        GROUP BY COM_ID
    )
    WHERE COM_ID = :NEW.COM_ID;
END;


/
ALTER TRIGGER "RELEASE"."SET_COM_RATING" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_BEFORE_INSERT" 
BEFORE INSERT ON COMMODITY
FOR EACH ROW
BEGIN
    :NEW.COM_STATUS := 1;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_WHEN_ADD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_ADD" 
BEFORE UPDATE OF COM_LEFT ON COMMODITY
FOR EACH ROW
BEGIN
    IF :OLD.COM_LEFT = 0 AND :NEW.COM_LEFT > 0 THEN
        :NEW.COM_STATUS := 1;
    END IF;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_ADD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_WHEN_EMPTY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_EMPTY" 
BEFORE UPDATE OF COM_LEFT ON COMMODITY
FOR EACH ROW
BEGIN
    IF :NEW.COM_LEFT = 0 THEN
        :NEW.COM_STATUS := 0;
    END IF;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_EMPTY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_WHEN_ADD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_ADD" 
BEFORE UPDATE OF COM_LEFT ON COMMODITY
FOR EACH ROW
BEGIN
    IF :OLD.COM_LEFT = 0 AND :NEW.COM_LEFT > 0 THEN
        :NEW.COM_STATUS := 1;
    END IF;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_ADD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_WHEN_EMPTY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_EMPTY" 
BEFORE UPDATE OF COM_LEFT ON COMMODITY
FOR EACH ROW
BEGIN
    IF :NEW.COM_LEFT = 0 THEN
        :NEW.COM_STATUS := 0;
    END IF;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_WHEN_EMPTY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_COM_STATUS_BEFORE_INSERT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "RELEASE"."SET_COM_STATUS_BEFORE_INSERT" 
BEFORE INSERT ON COMMODITY
FOR EACH ROW
BEGIN
    :NEW.COM_STATUS := 1;
END;




/
ALTER TRIGGER "RELEASE"."SET_COM_STATUS_BEFORE_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Procedure CALCULATE_ITEM_PREFERENCE_PROCEDURE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RELEASE"."CALCULATE_ITEM_PREFERENCE_PROCEDURE" (
    p_userID IN INT,
    p_comID IN INT,
    p_w1 IN NUMBER,
    p_w2 IN NUMBER,
    p_w3 IN NUMBER,
    p_w4 IN NUMBER,
    p_w5 IN NUMBER,
    p_preference OUT NUMBER
) AS
    v_purchaseCount INT;
    v_browseCount INT;
    v_rating NUMBER;
    v_categoryMatch INT;
    v_isFavorite INT;
    p_fifteenDaysAgo DATE := SYSDATE - 15;
BEGIN
    -- ��ȡ�������
    SELECT NVL(SUM(CASE WHEN IND_STATE = 1 THEN 1 ELSE 0 END), 0)
    INTO v_purchaseCount
    FROM INDENT
    WHERE CUS_ID = p_userID AND COM_ID = p_comID;

    -- ��ȡ��15���������
    SELECT NVL(COUNT(*), 0)
    INTO v_browseCount
    FROM BROWSE
    WHERE com_ID = p_comID AND browser_ID = p_userID AND bro_time_start >= p_fifteenDaysAgo;

    -- ��ȡƽ����Ʒ���֣��ų�����Ϊ��1�������
   SELECT NVL(AVG(CASE WHEN IND_RATING <> -1 THEN IND_RATING ELSE NULL END), 0)
   INTO v_rating
   FROM INDENT
   WHERE CUS_ID = p_userID AND COM_ID = p_comID AND IND_RATING IS NOT NULL;

    -- �ж���Ʒ���û�ϲ���Ƿ���ͬ
    SELECT NVL(COUNT(*), 0)
    INTO v_categoryMatch
    FROM CUSTOMER_LOVE CL
    INNER JOIN COMMODITY_CATEGORIES C ON CL.COM_CATEGORY = C.COM_CATEGORY
    WHERE CL.CUS_ID = p_userID AND C.COM_ID = p_comID;

    -- �ж���Ʒ�Ƿ��û��ղ�
    SELECT NVL(COUNT(*), 0)
    INTO v_isFavorite
    FROM FAVORITE
    WHERE CUS_ID = p_userID AND COM_ID = p_comID;

    -- �����Ȩ�÷�
    p_preference := (v_purchaseCount * p_w1) + (v_browseCount * p_w2) + (v_rating * p_w3) + (v_categoryMatch * p_w4) + (v_isFavorite * p_w5);
END;



/
--------------------------------------------------------
--  DDL for Procedure CALCULATE_ITEM_SIMILARITY_PROCEDURE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RELEASE"."CALCULATE_ITEM_SIMILARITY_PROCEDURE" (
    p_itemID1 IN INT,
    p_itemID2 IN INT,
    p_w1 IN NUMBER,
    p_w2 IN NUMBER,
    p_w3 IN NUMBER,
    p_w4 IN NUMBER,
    p_w5 IN NUMBER,
    v_similarity OUT NUMBER
) 
AS
    v_dotProduct NUMBER := 0.0;
    v_norm1 NUMBER := 0.0;
    v_norm2 NUMBER := 0.0;
    v_preference1 NUMBER;
    v_preference2 NUMBER;

    -- �����α�
    CURSOR related_users_cursor IS
        SELECT DISTINCT CUS_ID 
        FROM INDENT 
        WHERE COM_ID = p_itemID1 OR COM_ID = p_itemID2
        OR EXISTS (SELECT 1 FROM BROWSE WHERE (COM_ID = p_itemID1 OR COM_ID = p_itemID2) AND BROWSER_ID = CUS_ID);
BEGIN

    -- ��������û�
    FOR rec IN related_users_cursor
    LOOP
        -- ����ϲ�ó̶�
        Calculate_Item_Preference_Procedure(
            p_userID => rec.CUS_ID,
            p_comID => p_itemID1,
            p_w1 => p_w1,
            p_w2 => p_w2,
            p_w3 => p_w3,
            p_w4 => p_w4,
            p_w5 => p_w5,
            p_preference => v_preference1
        );

        Calculate_Item_Preference_Procedure(
            p_userID => rec.CUS_ID,
            p_comID => p_itemID2,
            p_w1 => p_w1,
            p_w2 => p_w2,
            p_w3 => p_w3,
            p_w4 => p_w4,
            p_w5 => p_w5,
            p_preference => v_preference2
        );

        v_dotProduct := v_dotProduct + (v_preference1 * v_preference2);
        v_norm1 := v_norm1 + (v_preference1 * v_preference1);
        v_norm2 := v_norm2 + (v_preference2 * v_preference2);
    END LOOP;

    v_norm1 := SQRT(v_norm1);
    v_norm2 := SQRT(v_norm2);

    IF v_norm1 = 0 OR v_norm2 = 0 THEN
        v_similarity := 0.0;
    ELSE
        v_similarity := v_dotProduct / (v_norm1 * v_norm2);
    END IF;


END;



/
--------------------------------------------------------
--  DDL for Procedure GET_ALL_COM_REFERENCE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RELEASE"."GET_ALL_COM_REFERENCE" (
    cus_id IN INT, 
    result_cursor OUT SYS_REFCURSOR
)AS 

BEGIN
  OPEN result_cursor FOR
     WITH K2 AS (SELECT com_ID as com_ID
     FROM COMMODITY
     WHERE com_status = 1)
     SELECT com_ID, GET_PREFERENCE(cus_id,com_ID) as preference
     FROM K2;
END GET_ALL_COM_REFERENCE;



/
--------------------------------------------------------
--  DDL for Procedure GET_COM_SIM_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RELEASE"."GET_COM_SIM_PROC" (cus_id IN INT, result_cursor OUT SYS_REFCURSOR) IS
BEGIN
    OPEN result_cursor FOR
     WITH K1 AS(
        (
            SELECT com_ID
        FROM (
            SELECT com_ID,
                   ROW_NUMBER() OVER (PARTITION BY com_ID ORDER BY bro_time_start DESC) AS rn
            FROM BROWSE natural join commodity
            WHERE browser_id = cus_id and com_status = 1
              ORDER BY bro_time_start DESC
        ) temp
        WHERE rn = 1
        )UNION
        (
        SELECT com_ID
        FROM (
            SELECT com_ID,
                   ROW_NUMBER() OVER (PARTITION BY com_ID ORDER BY ind_creationTime DESC) AS rn
            FROM INDENT
            WHERE cus_ID = cus_id
              ORDER BY ind_creationTime DESC
        ) temp

        )
        ),
        K2 AS (SELECT com_ID as available_id
        FROM COMMODITY
        WHERE com_status = 1)
        SELECT com_ID,available_id,get_sim(com_ID,available_id) as sim
        FROM K1,K2;
END GET_COM_SIM_PROC;



/
--------------------------------------------------------
--  DDL for Procedure SET_COM_STATUS_TO_BAD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RELEASE"."SET_COM_STATUS_TO_BAD" AS
BEGIN
  UPDATE Commodity
  SET COM_STATUS = -1
  WHERE com_expirationdate <= TRUNC(SYSDATE);
  COMMIT;
END;




/
--------------------------------------------------------
--  DDL for Package TYPES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "RELEASE"."TYPES" AS
    TYPE ref_cursor IS REF CURSOR;
END types;


/
--------------------------------------------------------
--  DDL for Function GET_AVAILABLE_COMMODITIES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RELEASE"."GET_AVAILABLE_COMMODITIES" 
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
        SELECT com_ID as available_id
        FROM COMMODITY
        WHERE com_status = 1;

    RETURN result_cursor;
END GET_AVAILABLE_COMMODITIES;



/
--------------------------------------------------------
--  DDL for Function GET_COM_SIM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RELEASE"."GET_COM_SIM" (cus_id IN INT)
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;

BEGIN

        OPEN result_cursor FOR
        WITH K1 AS(
        (
            SELECT com_ID
        FROM (
            SELECT com_ID,
                   ROW_NUMBER() OVER (PARTITION BY com_ID ORDER BY bro_time_start DESC) AS rn
            FROM BROWSE
            WHERE browser_id = cus_id
              ORDER BY bro_time_start DESC
        ) temp
        WHERE rn = 1
        )UNION
        (
        SELECT com_ID
        FROM (
            SELECT com_ID,
                   ROW_NUMBER() OVER (PARTITION BY com_ID ORDER BY ind_creationTime DESC) AS rn
            FROM INDENT
            WHERE cus_ID = cus_id
              ORDER BY ind_creationTime DESC
        ) temp

        )
        ),
        K2 AS (SELECT com_ID as available_id
        FROM COMMODITY
        WHERE com_status = 1)
        SELECT com_ID,available_id,get_sim(com_ID,available_id) as sim
        FROM K1,K2;

    RETURN result_cursor;
END GET_COM_SIM;



/
--------------------------------------------------------
--  DDL for Function GET_PREFERENCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RELEASE"."GET_PREFERENCE" (
    p_userID IN INT,
    p_comID IN INT) 
RETURN NUMBER IS
result_num NUMBER;
BEGIN
  Calculate_Item_Preference_Procedure(p_userID,p_comID,10,2,2,10,8,result_num);
  return result_num;
END GET_PREFERENCE;



/
--------------------------------------------------------
--  DDL for Function GET_SIM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RELEASE"."GET_SIM" (item1 in INT,item2 in INT)
RETURN NUMBER IS
result_num NUMBER;
BEGIN
  Calculate_Item_Similarity_Procedure(item1,item2,10,2,2,10,8,result_num);
  return result_num;
END GET_SIM;



/
--------------------------------------------------------
--  DDL for Function GET_USER_COMLIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RELEASE"."GET_USER_COMLIST" (cus_id IN NUMBER)
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
   OPEN result_cursor FOR

            SELECT com_ID
        FROM (
            SELECT com_ID,
                   ROW_NUMBER() OVER (PARTITION BY com_ID ORDER BY bro_time_start DESC) AS rn
            FROM BROWSE
            WHERE browser_id = cus_id
              ORDER BY bro_time_start DESC
        ) temp
        WHERE rn = 1

       ;

    RETURN result_cursor;
END GET_USER_COMLIST;



/
--------------------------------------------------------
--  Constraints for Table ADMINISTRATOR
--------------------------------------------------------

  ALTER TABLE "RELEASE"."ADMINISTRATOR" MODIFY ("ADMIN_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."ADMINISTRATOR" ADD CONSTRAINT "ADMINISTRATOR_CHK1" CHECK ( admin_state = 0
                                              OR admin_state = 1 ) ENABLE;
  ALTER TABLE "RELEASE"."ADMINISTRATOR" ADD CONSTRAINT "ADMINISTRATOR_PK" PRIMARY KEY ("ADMIN_ID")
  USING INDEX "RELEASE"."ADMINISTRATOR_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table APPEAL
--------------------------------------------------------

  ALTER TABLE "RELEASE"."APPEAL" ADD CONSTRAINT "APPEAL_CHK1" CHECK (app_matters = 1 OR app_matters = 2 OR app_matters = 3 OR app_matters = 4 OR app_matters = 5 OR app_matters = 6) ENABLE;
  ALTER TABLE "RELEASE"."APPEAL" MODIFY ("APP_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."APPEAL" ADD CONSTRAINT "APPEAL_PK" PRIMARY KEY ("APP_ID")
  USING INDEX "RELEASE"."APPEAL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BROWSE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."BROWSE" MODIFY ("BRO_TIME_START" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."BROWSE" MODIFY ("BRO_TIME_END" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."BROWSE" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."BROWSE" MODIFY ("BROWSER_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."BROWSE" ADD CONSTRAINT "BROWSE_PK" PRIMARY KEY ("BRO_TIME_START", "COM_ID", "BROWSER_ID")
  USING INDEX "RELEASE"."BROWSE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CHAT" MODIFY ("CHAT_TIME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CHAT" MODIFY ("CUS_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CHAT" MODIFY ("STORE_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CHAT" ADD CONSTRAINT "CHAT_PK" PRIMARY KEY ("CHAT_TIME", "CUS_ID", "STORE_ID")
  USING INDEX "RELEASE"."CHAT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITIES_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITIES_CATEGORIES" MODIFY ("COM_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITIES_CATEGORIES" ADD CONSTRAINT "COMMODITIES_CATEGORIES$_PK" PRIMARY KEY ("COM_CATEGORY")
  USING INDEX "RELEASE"."COMMODITIES_CATEGORIES$_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITY
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_RATING" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_NAME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_INTRODUCTION" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_EXPIRATIONDATE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_UPLOADDATE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("COM_LEFT" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" MODIFY ("STO_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY" ADD CONSTRAINT "COMMODITYCHECK" CHECK ( com_expirationdate > com_uploaddate
                                          AND com_left > 0 ) DISABLE;
  ALTER TABLE "RELEASE"."COMMODITY" ADD CONSTRAINT "COMMODITY_PK" PRIMARY KEY ("COM_ID")
  USING INDEX "RELEASE"."COMMODITY_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITY_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_CATEGORIES" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_CATEGORIES" MODIFY ("COM_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_CATEGORIES" ADD CONSTRAINT "PK_COMMODITY_CATEGORIES" PRIMARY KEY ("COM_ID", "COM_CATEGORY")
  USING INDEX "RELEASE"."PK_COMMODITY_CATEGORIES"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITY_COMMENT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("CMT_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("CMT_FATHER" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("CMT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("CMT_TIME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" ADD PRIMARY KEY ("CMT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITY_IMAGE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_IMAGE" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_IMAGE" MODIFY ("COM_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_IMAGE" ADD CONSTRAINT "COMMODITY_IMAGE_PK1" PRIMARY KEY ("COM_ID", "COM_IMAGE")
  USING INDEX "RELEASE"."COMMODITY_IMAGE_PK1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMODITY_PRICE_CURVE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_PRICE_CURVE" MODIFY ("COM_PC_TIME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."COMMODITY_PRICE_CURVE" ADD CONSTRAINT "COMMODITY_PRICE_CURVE_PK" PRIMARY KEY ("COM_PC_TIME", "COM_ID")
  USING INDEX "RELEASE"."COMMODITY_PRICE_CURVE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CUSTOMER" MODIFY ("CUS_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER" MODIFY ("CUS_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER" MODIFY ("CUS_NOTES" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER" MODIFY ("CUS_PAYPASSWORD" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER" MODIFY ("CUS_STATE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("CUS_ID")
  USING INDEX "RELEASE"."CUSTOMER_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER_LOVE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" MODIFY ("CUS_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" MODIFY ("COM_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" MODIFY ("CUS_LOVE_WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" ADD CONSTRAINT "CUSTOMER_LOVE_PK" PRIMARY KEY ("CUS_ID", "COM_CATEGORY")
  USING INDEX "RELEASE"."CUSTOMER_LOVE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."FAVORITE" ADD CONSTRAINT "FAVORITE_PK" PRIMARY KEY ("COM_ID", "CUS_ID")
  USING INDEX "RELEASE"."FAVORITE_PK"  ENABLE;
  ALTER TABLE "RELEASE"."FAVORITE" MODIFY ("COM_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."FAVORITE" MODIFY ("CUS_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INDENT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."INDENT" MODIFY ("IND_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."INDENT" ADD CONSTRAINT "INDENT_PK" PRIMARY KEY ("IND_ID")
  USING INDEX "RELEASE"."INDENT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."NOTICE" MODIFY ("NTC_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."NOTICE" MODIFY ("STO_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."NOTICE" ADD CONSTRAINT "NOTICE_PK" PRIMARY KEY ("NTC_ID")
  USING INDEX "RELEASE"."NOTICE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCREENSHOT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."SCREENSHOT" MODIFY ("APP_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."SCREENSHOT" MODIFY ("SCT_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."SCREENSHOT" ADD CONSTRAINT "SCREENSHOT_PK" PRIMARY KEY ("APP_ID", "SCT_IMAGE")
  USING INDEX "RELEASE"."SCREENSHOT_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STORE" MODIFY ("STO_INTRODUCTION" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STORE" MODIFY ("STO_LICENSEIMG" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STORE" MODIFY ("STO_STATE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STORE" ADD CONSTRAINT "STORE_CHK1" CHECK ( sto_state = 1
                                      OR sto_state = 0
                                      OR sto_state = 2 ) ENABLE;
  ALTER TABLE "RELEASE"."STORE" ADD CONSTRAINT "STORE_PK" PRIMARY KEY ("STO_ID")
  USING INDEX "RELEASE"."STORE_PK"  ENABLE;
  ALTER TABLE "RELEASE"."STORE" MODIFY ("STO_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STORE" MODIFY ("STO_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STOREIMAGE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STOREIMAGE" MODIFY ("STO_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STOREIMAGE" MODIFY ("STO_IMAGE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STOREIMAGE" ADD CONSTRAINT "STOREIMAGE_PK" PRIMARY KEY ("STO_IMAGE", "STO_ID")
  USING INDEX "RELEASE"."STOREIMAGE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STORE_CATEGORIES" ADD CONSTRAINT "STORE_CATEGORIES_PK1" PRIMARY KEY ("STORE_ID", "COM_CATEGORY")
  USING INDEX "RELEASE"."STORE_CATEGORIES_PK1"  ENABLE;
  ALTER TABLE "RELEASE"."STORE_CATEGORIES" MODIFY ("STORE_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."STORE_CATEGORIES" MODIFY ("COM_CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_PHONE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_STATE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_REGTIME" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_TYPE" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "RELEASE"."USERS" ADD CONSTRAINT "USERS_CHK1" CHECK ( user_state = 1
                                      OR user_state = 0 ) ENABLE;
  ALTER TABLE "RELEASE"."USERS" ADD CONSTRAINT "USERS_CHK2" CHECK ( user_type = 0
                                      OR user_type = 1 ) ENABLE;
  ALTER TABLE "RELEASE"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX "RELEASE"."USERS_PK"  ENABLE;
  ALTER TABLE "RELEASE"."USERS" ADD CONSTRAINT "USERS_UK1" UNIQUE ("USER_PHONE")
  USING INDEX "RELEASE"."USERS_UK1"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APPEAL
--------------------------------------------------------

  ALTER TABLE "RELEASE"."APPEAL" ADD CONSTRAINT "APPEAL_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
  ALTER TABLE "RELEASE"."APPEAL" ADD CONSTRAINT "APPEAL_FK2" FOREIGN KEY ("APP_USERID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
  ALTER TABLE "RELEASE"."APPEAL" ADD CONSTRAINT "APPEAL_FK4" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BROWSE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."BROWSE" ADD CONSTRAINT "BROWSE_FK1" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
  ALTER TABLE "RELEASE"."BROWSE" ADD CONSTRAINT "BROWSE_FK2" FOREIGN KEY ("BROWSER_ID")
	  REFERENCES "RELEASE"."CUSTOMER" ("CUS_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CHAT" ADD CONSTRAINT "CHAT_FK1" FOREIGN KEY ("CUS_ID")
	  REFERENCES "RELEASE"."CUSTOMER" ("CUS_ID") ENABLE;
  ALTER TABLE "RELEASE"."CHAT" ADD CONSTRAINT "CHAT_FK2" FOREIGN KEY ("STORE_ID")
	  REFERENCES "RELEASE"."STORE" ("STO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMODITY
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY" ADD CONSTRAINT "COMMODITY_FK1" FOREIGN KEY ("STO_ID")
	  REFERENCES "RELEASE"."STORE" ("STO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMODITY_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_CATEGORIES" ADD CONSTRAINT "FK_COMMODITY_CATEGORIES_COM_ID" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
  ALTER TABLE "RELEASE"."COMMODITY_CATEGORIES" ADD CONSTRAINT "FK_COMMODITY_CATEGORIES_COM_CATEGORY" FOREIGN KEY ("COM_CATEGORY")
	  REFERENCES "RELEASE"."COMMODITIES_CATEGORIES" ("COM_CATEGORY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMODITY_COMMENT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" ADD CONSTRAINT "FK_COM_ID" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
  ALTER TABLE "RELEASE"."COMMODITY_COMMENT" ADD CONSTRAINT "FK_USER_ID" FOREIGN KEY ("USER_ID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMODITY_IMAGE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_IMAGE" ADD CONSTRAINT "COMMODITY_IMAGE_FK1" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMODITY_PRICE_CURVE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."COMMODITY_PRICE_CURVE" ADD CONSTRAINT "COMMODITY_PRICE_CURVE_FK" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_FK1" FOREIGN KEY ("CUS_ID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMER_LOVE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" ADD CONSTRAINT "CUSTOMER_LOVE_FK1" FOREIGN KEY ("CUS_ID")
	  REFERENCES "RELEASE"."CUSTOMER" ("CUS_ID") ENABLE;
  ALTER TABLE "RELEASE"."CUSTOMER_LOVE" ADD CONSTRAINT "CUSTOMER_LOVE_FK2" FOREIGN KEY ("COM_CATEGORY")
	  REFERENCES "RELEASE"."COMMODITIES_CATEGORIES" ("COM_CATEGORY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAVORITE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."FAVORITE" ADD CONSTRAINT "FAVORITE_FK1" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
  ALTER TABLE "RELEASE"."FAVORITE" ADD CONSTRAINT "FAVORITE_FK2" FOREIGN KEY ("CUS_ID")
	  REFERENCES "RELEASE"."CUSTOMER" ("CUS_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INDENT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."INDENT" ADD CONSTRAINT "INDENT_FK1" FOREIGN KEY ("CUS_ID")
	  REFERENCES "RELEASE"."CUSTOMER" ("CUS_ID") ENABLE;
  ALTER TABLE "RELEASE"."INDENT" ADD CONSTRAINT "INDENT_FK2" FOREIGN KEY ("COM_ID")
	  REFERENCES "RELEASE"."COMMODITY" ("COM_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."NOTICE" ADD CONSTRAINT "NOTICE_FK1" FOREIGN KEY ("STO_ID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SCREENSHOT
--------------------------------------------------------

  ALTER TABLE "RELEASE"."SCREENSHOT" ADD CONSTRAINT "SCREENSHOT_FK1" FOREIGN KEY ("APP_ID")
	  REFERENCES "RELEASE"."APPEAL" ("APP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STORE" ADD CONSTRAINT "STORE_FK1" FOREIGN KEY ("STO_ID")
	  REFERENCES "RELEASE"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STOREIMAGE
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STOREIMAGE" ADD CONSTRAINT "STOREIMAGE_FK1" FOREIGN KEY ("STO_ID")
	  REFERENCES "RELEASE"."STORE" ("STO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "RELEASE"."STORE_CATEGORIES" ADD CONSTRAINT "STORE_CATEGORIES_FK1" FOREIGN KEY ("COM_CATEGORY")
	  REFERENCES "RELEASE"."COMMODITIES_CATEGORIES" ("COM_CATEGORY") ENABLE;
