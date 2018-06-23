-- <ScriptOptions statementTerminator=";" />
DROP TABLE ECCM.TMCF_MMR_CMM_CFI;
CREATE TABLE ECCM.TMCF_MMR_CMM_CFI ( -- Member Communication Configuration
    MCF_MCP_CMM_PGM_ID INTEGER NOT NULL, 
    MCF_CMM_ID INTEGER NOT NULL, 
    MCF_SEQ_NB SMALLINT NOT NULL,
    MCF_EFF_DT DATE NOT NULL,
    MCF_EXP_DT DATE NOT NULL,
    MCF_EMA_CHL_PIO_NB SMALLINT NOT NULL,
    MCF_CLR_CHL_PIO_NB SMALLINT NOT NULL,
    MCF_TX_CHL_PIO_NB SMALLINT NOT NULL,
    MCF_SCT_CHL_PIO_NB SMALLINT NOT NULL,
    MCF_TIN_DFL_CHL_CD CHAR(1) NOT NULL,
    MCF_CMM_RQR_IN CHAR(1) NOT NULL,
    MCF_CMM_MAN_IN CHAR(1) NOT NULL,
    MCF_HSC_TRN_CD SMALLINT NOT NULL,
    MCF_HSC_SRC_CD SMALLINT NOT NULL,
    MCF_HSC_USR_ID CHAR(8) NOT NULL,
    MCF_HSC_TS TIMESTAMP NOT NULL,
    MCF_HSU_TRN_CD SMALLINT NOT NULL,
    MCF_HSU_SRC_CD SMALLINT NOT NULL,
    MCF_HSU_USR_ID CHAR(8) NOT NULL,
    MCF_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCF_MCP_CMM_PGM_ID, MCF_CMM_ID, MCF_SEQ_NB ) );

ALTER TABLE ECCM.TMCF_MMR_CMM_CFI ADD CONSTRAINT "FK_MCF_MCP_PGM_ID" FOREIGN KEY
	(MCF_MCP_CMM_PGM_ID)
	REFERENCES ECCM.TMCP_MMR_CMM_PGM 
	(MCP_MMR_CMM_PGM_ID);

ALTER TABLE ECCM.TMCF_MMR_CMM_CFI ADD CONSTRAINT "FK_MCF_PCI_CMM_ID" FOREIGN KEY
	(MCF_CMM_ID)
	REFERENCES ECCM.TPCI_PRG_COMM_TYPE
	(PCI_CMM_ID);

DELETE FROM ECCM.TMCF_MMR_CMM_CFI; 	
INSERT INTO ECCM.TMCF_MMR_CMM_CFI ( -- Member Communication Configuration
      MCF_MCP_CMM_PGM_ID, -- Program ID
           MCF_CMM_ID, -- PCI Comm ID
                 MCF_SEQ_NB, -- Sequence Num
                    MCF_EMA_CHL_PIO_NB, -- Email Priority (0-3)
                       MCF_CLR_CHL_PIO_NB, -- Call(IVR) Priority (0-3)
                          MCF_TX_CHL_PIO_NB, -- Text(SMS) Priority (0-3)
                             MCF_SCT_CHL_PIO_NB, -- Secure Inbox Priority (0-1)
                                MCF_TIN_DFL_CHL_CD, -- Default Channel E=Email, C=Call, T=Text, L=Email/Call, N-No
                                     MCF_CMM_RQR_IN,-- Required (Y/N)
                                          MCF_CMM_MAN_IN, -- Mandatory (Y/N)
                                               MCF_EFF_DT,   MCF_EXP_DT,
                                                                            MCF_HSC_TRN_CD, MCF_HSC_SRC_CD, MCF_HSC_USR_ID, MCF_HSC_TS, 
                                                                            MCF_HSU_TRN_CD, MCF_HSU_SRC_CD, MCF_HSU_USR_ID, MCF_HSU_TS
      ) VALUES
     (101, 2536, 1, 1, 0, 0, 0, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 102 Mail Order Status
     (102, 261,  1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 264,  1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1343, 1, 1, 3, 2, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1344, 1, 1, 3, 2, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1859, 1, 2, 3, 1, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1861, 1, 2, 3, 1, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1907, 1, 1, 3, 2, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 2537, 1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- Auto Ship Consent is missing
     (102, 1904, 1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1905, 1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1906, 1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 103 Initial Mail Refill Reminder
     (103, 260,  1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (103, 263,  1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (103, 1229, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 104 Followup Mail Refill Reminder
     (104, 2514, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 2515, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 2516, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 2517, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 2518, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 2519, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 105 Payment Notifications
     (105, 2540, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 2541, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 2542, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 2543, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 2544, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 2545, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 106 ADT Alerts?
     (106, 2529, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (106, 2530, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (106, 2531, 1, 2, 3, 1, 1, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 107 RFM
     (107, 1230, 1, 1, 3, 2, 1, 'L', 'Y', 'Y', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (107, 1231, 1, 1, 3, 2, 1, 'L', 'Y', 'Y', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (107, 2535, 1, 2, 3, 1, 1, 'L', 'Y', 'Y', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
-- 108 Hidden program to store core ECCM system rules
     (108, 2524, 1, 0, 0, 1, 0, 'N', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);

SELECT * FROM ECCM.TMCF_MMR_CMM_CFI; 
SELECT MCP.MCP_CMM_PGM_NM, MCF.*
    FROM ECCM.TMCP_MMR_CMM_PGM MCP, ECCM.TMCF_MMR_CMM_CFI MCF
    WHERE MCF.MCF_MCP_CMM_PGM_ID = MCP.MCP_MMR_CMM_PGM_ID;	