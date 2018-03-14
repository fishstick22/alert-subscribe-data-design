-- <ScriptOptions statementTerminator=";" />
CREATE TABLE ECCM.TMCP_MMR_CMM_PGM ( 
    MCP_MMR_CMM_PGM_ID INTEGER NOT NULL, 
    MCP_CMM_PGM_NM VARCHAR(30) NOT NULL, 
    MCP_CMM_PGM_DSC VARCHAR(80) NOT NULL, 
    MCP_HSC_TRN_CD SMALLINT NOT NULL, 
    MCP_HSC_SRC_CD SMALLINT NOT NULL, 
    MCP_HSC_USR_ID CHAR(8) NOT NULL, 
    MCP_HSC_TS TIMESTAMP NOT NULL, 
    MCP_HSU_TRN_CD SMALLINT NOT NULL, 
    MCP_HSU_SRC_CD SMALLINT NOT NULL, 
    MCP_HSU_USR_ID CHAR(8) NOT NULL, 
    MCP_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCP_MMR_CMM_PGM_ID ) );

DELETE FROM ECCM.TMCP_MMR_CMM_PGM;    
INSERT INTO ECCM.TMCP_MMR_CMM_PGM
   (MCP_MMR_CMM_PGM_ID, MCP_CMM_PGM_NM ,MCP_CMM_PGM_DSC,
    MCP_HSC_TRN_CD, MCP_HSC_SRC_CD, MCP_HSC_USR_ID, MCP_HSC_TS,
    MCP_HSU_TRN_CD, MCP_HSU_SRC_CD, MCP_HSU_USR_ID, MCP_HSU_TS ) VALUES
   (101, 'Full Drug Name',                 'Full Drug Name Description',                 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (102, 'Mail Order Status',              'Mail Order Status Description',              0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (103, 'Initial Mail Refill Reminder',   'Initial Mail Refill Reminder Description',   0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (104, 'Followup Mail Refill Reminders', 'Followup Mail Refill Reminders Description', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (105, 'Payment Notifications',          'Payment Notifications Description',          0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (106, 'ADT Alerts?',                    'ADT Alerts? Description',                    0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
   (107, 'RFM',                            'RFM Description',                            0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);
   
SELECT * FROM ECCM.TMCP_MMR_CMM_PGM;   