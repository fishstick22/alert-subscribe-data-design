-- <ScriptOptions statementTerminator=";" />
DROP TABLE ECCM.TMCI_CMM_IFC_POF;
CREATE TABLE ECCM.TMCI_CMM_IFC_POF ( -- Member Communication Interface Profile
    MCI_MCP_CMM_PGM_ID SMALLINT NOT NULL, 
    MCI_SEQ_NB INTEGER NOT NULL, 
    MCI_EFF_DT DATE NOT NULL, 
    MCI_EXP_DT DATE NOT NULL, 
    MCI_DSY_ORD_NB SMALLINT NOT NULL, 
    MCI_DFL_TIN_IN CHAR(1) NOT NULL, 
    MCI_UI_VSB_CD CHAR(1) NOT NULL, 
    MCI_EMA_DSY_IN CHAR(1) NOT NULL, 
    MCI_CLR_DSY_IN CHAR(1) NOT NULL, 
    MCI_TX_DSY_IN CHAR(1) NOT NULL, 
    MCI_SCT_DSY_IN CHAR(1) NOT NULL,
    MCI_HSC_TRN_CD SMALLINT NOT NULL, 
    MCI_HSC_SRC_CD SMALLINT NOT NULL, 
    MCI_HSC_USR_ID CHAR(8) NOT NULL, 
    MCI_HSC_TS TIMESTAMP NOT NULL, 
    MCI_HSU_TRN_CD SMALLINT NOT NULL, 
    MCI_HSU_SRC_CD SMALLINT NOT NULL, 
    MCI_HSU_USR_ID CHAR(8) NOT NULL, 
    MCI_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCI_MCP_CMM_PGM_ID, MCI_SEQ_NB ) );
    
ALTER TABLE ECCM.TMCI_CMM_IFC_POF ADD CONSTRAINT "FK_MCI_PGM_ID" FOREIGN KEY
	(MCI_MCP_CMM_PGM_ID)
	REFERENCES ECCM.TMCP_MMR_CMM_PGM 
	(MCP_MMR_CMM_PGM_ID);
	
DELETE FROM ECCM.TMCI_CMM_IFC_POF;
INSERT INTO ECCM.TMCI_CMM_IFC_POF (
      MCI_MCP_CMM_PGM_ID, -- Program ID
           MCI_SEQ_NB, -- Sequence Num
              MCI_DSY_ORD_NB, -- UI Display Order
                 MCI_DFL_TIN_IN,  -- Opt In by Default (Y/N)
                      MCI_UI_VSB_CD, -- UI Visibility (Y/N/P)
                           MCI_EMA_DSY_IN, -- Email Chan Opt Display
                                MCI_CLR_DSY_IN, -- Call(IVR) Chan Opt Display 
                                     MCI_TX_DSY_IN, -- Text(SMS) Chan Opt Display 
                                          MCI_SCT_DSY_IN, -- Secure Inbox Opt Display 
                                               MCI_EFF_DT,   MCI_EXP_DT,  
                                                                            MCI_HSC_TRN_CD, MCI_HSC_SRC_CD, MCI_HSC_USR_ID, MCI_HSC_TS, 
                                                                            MCI_HSU_TRN_CD, MCI_HSU_SRC_CD, MCI_HSU_USR_ID, MCI_HSU_TS
      ) VALUES
     (101, 1, 1, 'N', 'P', 'Y', 'N', 'N', 'N', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (102, 1, 2, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (103, 1, 3, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (104, 1, 4, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (105, 1, 5, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (106, 1, 6, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (107, 1, 7, 'Y', 'N', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP),
     (108, 1, 8, 'Y', 'N', 'Y', 'Y', 'Y', 'Y', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);

SELECT * FROM ECCM.TMCI_CMM_IFC_POF;
SELECT MCP.MCP_CMM_PGM_NM, MCI.*
    FROM ECCM.TMCP_MMR_CMM_PGM MCP, ECCM.TMCI_CMM_IFC_POF MCI
    WHERE MCI.MCI_MCP_CMM_PGM_ID = MCP.MCP_MMR_CMM_PGM_ID;