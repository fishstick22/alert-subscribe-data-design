--<ScriptOptions statementTerminator=";"/>

ALTER TABLE "DB2ADMIN"."PROGRAM_PROFILE" DROP CONSTRAINT "FK445VNCB93ODEMN6WWVTEAAY37";

ALTER TABLE "DB2ADMIN"."PROGRAM_PROFILE" DROP CONSTRAINT "SQL180122194344120";

DROP TABLE "DB2ADMIN"."PROGRAM_PROFILE";

CREATE TABLE "DB2ADMIN"."PROGRAM_PROFILE" (
		"ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 NO CYCLE CACHE 20 NO ORDER ), 
		"DISPLAY_ORDER" INTEGER NOT NULL, 
		"DEFAULT_OPT_IN" CHAR(1 OCTETS) NOT NULL, 
		"VISIBLE_IN_UI" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_EMAIL" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_IVR" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_SMS" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_SECURE" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_MAIL" CHAR(1 OCTETS) NOT NULL, 
		"CHAN_MOBILE" CHAR(1 OCTETS) NOT NULL, 
		"EFFECTIVE" TIMESTAMP, 
		"EXPIRATION" TIMESTAMP, 
		"PROGRAM_ID" INTEGER NOT NULL, 
		"HOUSE_KPG_CREATE_TIME" TIMESTAMP, 
		"HOUSE_KPG_CREATE_TRAN_CD" INTEGER NOT NULL, 
		"HOUSE_KPG_CREATE_USER" VARCHAR(255 OCTETS), 
		"HOUSE_KPG_UPDATE_TIME" TIMESTAMP, 
		"HOUSE_KPG_UPDATE_TRAN_CD" INTEGER NOT NULL, 
		"HOUSE_KPG_UPDATE_USER" VARCHAR(255 OCTETS)
	)
	ORGANIZE BY ROW
	DATA CAPTURE NONE 
	IN "USERSPACE1"
	COMPRESS NO;

ALTER TABLE "DB2ADMIN"."PROGRAM_PROFILE" ADD CONSTRAINT "SQL180122194344120" PRIMARY KEY
	("ID");

ALTER TABLE "DB2ADMIN"."PROGRAM_PROFILE" ADD CONSTRAINT "FK445VNCB93ODEMN6WWVTEAAY37" FOREIGN KEY
	("PROGRAM_ID")
	REFERENCES "DB2ADMIN"."PROGRAM"
	("ID");
