-- <ScriptOptions statementTerminator=";" />
DROP TABLE ECCM.TMCC_CLT_CMM_CFI;
CREATE TABLE ECCM.TMCC_CLT_CMM_CFI ( -- Client Communication Configuration
    MCC_CLT_ID INTEGER NOT NULL, 
    MCC_CMM_ID INTEGER NOT NULL, 
    MCC_SEQ_NB SMALLINT NOT NULL,
    MCC_EFF_DT DATE NOT NULL,
    MCC_EXP_DT DATE NOT NULL,
    MCC_EMA_CHL_PIO_NB SMALLINT NOT NULL,
    MCC_CLR_CHL_PIO_NB SMALLINT NOT NULL,
    MCC_TX_CHL_PIO_NB SMALLINT NOT NULL,
    MCC_SCT_CHL_PIO_NB SMALLINT NOT NULL,
    MCC_TIN_DFL_CHL_CD CHAR(1) NOT NULL,
    MCC_CMM_RQR_IN CHAR(1) NOT NULL,
    MCC_CMM_MAN_IN CHAR(1) NOT NULL,
    MCC_HSC_TRN_CD SMALLINT NOT NULL,
    MCC_HSC_SRC_CD SMALLINT NOT NULL,
    MCC_HSC_USR_ID CHAR(8) NOT NULL,
    MCC_HSC_TS TIMESTAMP NOT NULL,
    MCC_HSU_TRN_CD SMALLINT NOT NULL,
    MCC_HSU_SRC_CD SMALLINT NOT NULL,
    MCC_HSU_USR_ID CHAR(8) NOT NULL,
    MCC_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCC_CLT_ID, MCC_CMM_ID, MCC_SEQ_NB ) );

ALTER TABLE ECCM.TMCC_CLT_CMM_CFI ADD CONSTRAINT "FK_MCC_CLT_ID" FOREIGN KEY
	(MCC_CLT_ID)
	REFERENCES ECCM.TCLT_CLIENT 
	(CLT_ID);

ALTER TABLE ECCM.TMCC_CLT_CMM_CFI ADD CONSTRAINT "FK_MCC_PCI_CMM_ID" FOREIGN KEY
	(MCC_CMM_ID)
	REFERENCES ECCM.TPCI_PRG_COMM_TYPE
	(PCI_CMM_ID);

DELETE FROM ECCM.TMCC_CLT_CMM_CFI; 	
INSERT INTO ECCM.TMCC_CLT_CMM_CFI ( -- Member Communication Configuration
      MCC_CLT_ID, -- Client ID
             MCC_CMM_ID, -- PCI Comm ID
                   MCC_SEQ_NB, -- Sequence Num
                      MCC_EMA_CHL_PIO_NB, -- Email Priority (0-3)
                         MCC_CLR_CHL_PIO_NB, -- Call(IVR) Priority (0-3)
                            MCC_TX_CHL_PIO_NB, -- Text(SMS) Priority (0-3)
                               MCC_SCT_CHL_PIO_NB, -- Secure Inbox Priority (0-1)
                                  MCC_TIN_DFL_CHL_CD, -- Default Channel E=Email, C=Call, T=Text, L=Email/Call, N-No
                                       MCC_CMM_RQR_IN,-- Required (Y/N)
                                            MCC_CMM_MAN_IN, -- Mandatory (Y/N)
                                                 MCC_EFF_DT,   MCC_EXP_DT,
                                                                              MCC_HSC_TRN_CD, MCC_HSC_SRC_CD, MCC_HSC_USR_ID, MCC_HSC_TS, 
                                                                              MCC_HSU_TRN_CD, MCC_HSU_SRC_CD, MCC_HSU_USR_ID, MCC_HSU_TS
      ) VALUES

     (22912, 261,  1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (22912, 264,  1, 1, 3, 2, 1, 'L', 'N', 'N', '2017-01-01', '9999-12-31',  0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);
     
SELECT MCC.*
    FROM ECCM.TMCC_CLT_CMM_CFI MCC
--    WHERE MCC.MCC_MCP_CMM_PGM_ID = MCP.MCP_MMR_CMM_PGM_ID;	