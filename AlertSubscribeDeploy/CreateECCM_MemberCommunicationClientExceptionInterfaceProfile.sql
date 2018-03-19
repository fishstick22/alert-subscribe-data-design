-- <ScriptOptions statementTerminator=";" />
DROP TABLE ECCM.TMCT_CLT_EXN_POF;
CREATE TABLE ECCM.TMCT_CLT_EXN_POF ( -- Member Communication Client Exception Interface Profile
    MCT_MCP_CMM_PGM_ID SMALLINT NOT NULL, 
    MCT_CLT_ID INTEGER NOT NULL,
    MCT_SEQ_NB INTEGER NOT NULL, 
    MCT_EFF_DT DATE NOT NULL, 
    MCT_EXP_DT DATE NOT NULL, 
    MCT_DSY_ORD_NB SMALLINT NOT NULL, 
    MCT_DFL_TIN_IN CHAR(1) NOT NULL, 
    MCT_UI_VSB_CD CHAR(1) NOT NULL, 
    MCT_EMA_DSY_IN CHAR(1) NOT NULL, 
    MCT_CLR_DSY_IN CHAR(1) NOT NULL, 
    MCT_TX_DSY_IN CHAR(1) NOT NULL, 
    MCT_SCT_DSY_IN CHAR(1) NOT NULL,
    MCT_HSC_TRN_CD SMALLINT NOT NULL, 
    MCT_HSC_SRC_CD SMALLINT NOT NULL, 
    MCT_HSC_USR_ID CHAR(8) NOT NULL, 
    MCT_HSC_TS TIMESTAMP NOT NULL, 
    MCT_HSU_TRN_CD SMALLINT NOT NULL, 
    MCT_HSU_SRC_CD SMALLINT NOT NULL, 
    MCT_HSU_USR_ID CHAR(8) NOT NULL, 
    MCT_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCT_MCP_CMM_PGM_ID, MCT_CLT_ID, MCT_SEQ_NB ) );
    
ALTER TABLE ECCM.TMCT_CLT_EXN_POF ADD CONSTRAINT "FK_MCT_PGM_ID" FOREIGN KEY
	(MCT_MCP_CMM_PGM_ID)
	REFERENCES ECCM.TMCP_MMR_CMM_PGM 
	(MCP_MMR_CMM_PGM_ID);

ALTER TABLE ECCM.TMCT_CMM_IFC_POF ADD CONSTRAINT "FK_MCT_CLT_ID" FOREIGN KEY
	(MCT_CLT_ID)
	REFERENCES ECCM.TCLT_CLIENT 
	(CLT_ID);	

DELETE FROM ECCM.TMCT_CLT_EXN_POF;
INSERT INTO ECCM.TMCT_CLT_EXN_POF (
      MCT_MCP_CMM_PGM_ID, -- Program ID
           MCT_CLT_ID,  -- Client ID
                  MCT_SEQ_NB, -- Sequence Num
                     MCT_DSY_ORD_NB, -- UI Display Order
                        MCT_DFL_TIN_IN,  -- Opt In by Default (Y/N)
                             MCT_UI_VSB_CD, -- UI Visibility (Y/N/P)
                                  MCT_EMA_DSY_IN, -- Email Chan Opt Display
                                       MCT_CLR_DSY_IN, -- Call(IVR) Chan Opt Display 
                                            MCT_TX_DSY_IN, -- Text(SMS) Chan Opt Display 
                                                 MCT_SCT_DSY_IN, -- Secure Inbox Opt Display 
                                                      MCT_EFF_DT,   MCT_EXP_DT,  
                                                                                  MCT_HSC_TRN_CD, MCT_HSC_SRC_CD, MCT_HSC_USR_ID, MCT_HSC_TS, 
                                                                                  MCT_HSU_TRN_CD, MCT_HSU_SRC_CD, MCT_HSU_USR_ID, MCT_HSU_TS
      ) VALUES
     (102, 22912, 1, 2, 'Y', 'Y', 'Y', 'N', 'N', 'N', '2017-01-01', '9999-12-31', 0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);;

SELECT * FROM ECCM.TMCT_CLT_EXN_POF;  
SELECT MCP.MCP_CMM_PGM_NM, MCT.*
    FROM ECCM.TMCP_MMR_CMM_PGM MCP, ECCM.TMCT_CLT_EXN_POF MCT
    WHERE MCT.MCT_MCP_CMM_PGM_ID = MCP.MCP_MMR_CMM_PGM_ID;