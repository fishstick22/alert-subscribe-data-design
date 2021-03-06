-- <ScriptOptions statementTerminator=";" />
DROP TABLE ECCM.TMCR_CMM_PGM_SBI;
CREATE TABLE ECCM.TMCR_CMM_PGM_SBI ( -- Member Communication Program Subscription
    MCR_BNF_ID INTEGER NOT NULL,
    MCR_MCP_CMM_PGM_ID INTEGER NOT NULL,
    MCR_SEQ_NB SMALLINT NOT NULL,
    MCR_EFF_DT DATE NOT NULL,
    MCR_EXP_DT DATE NOT NULL,
    MCR_CLT_ID INTEGER NOT NULL,
    MCR_EMA_ENR_IN CHAR(1) NOT NULL,
    MCR_CLR_ENR_IN CHAR(1) NOT NULL,
    MCR_TX_ENR_IN CHAR(1) NOT NULL,
    MCR_SCT_ENR_IN CHAR(1) NOT NULL,
    MCR_HSC_TRN_CD SMALLINT NOT NULL,
    MCR_HSC_SRC_CD SMALLINT NOT NULL,
    MCR_HSC_USR_ID CHAR(8) NOT NULL,
    MCR_HSC_TS TIMESTAMP NOT NULL,
    MCR_HSU_TRN_CD SMALLINT NOT NULL,
    MCR_HSU_SRC_CD SMALLINT NOT NULL,
    MCR_HSU_USR_ID CHAR(8) NOT NULL,
    MCR_HSU_TS TIMESTAMP NOT NULL,
    PRIMARY KEY ( MCR_BNF_ID, MCR_MCP_CMM_PGM_ID, MCR_SEQ_NB ) );

ALTER TABLE ECCM.TMCR_CMM_PGM_SBI ADD CONSTRAINT "MCR_MCP_CMM_PGM_ID" FOREIGN KEY
	(MCR_MCP_CMM_PGM_ID)
	REFERENCES ECCM.TMCP_MMR_CMM_PGM 
	(MCP_MMR_CMM_PGM_ID);
	
DELETE FROM ECCM.TMCR_CMM_PGM_SBI;	
INSERT INTO ECCM.TMCR_CMM_PGM_SBI (
    MCR_BNF_ID, MCR_MCP_CMM_PGM_ID, MCR_SEQ_NB, MCR_EFF_DT, MCR_EXP_DT, MCR_CLT_ID,
    MCR_EMA_ENR_IN, MCR_CLR_ENR_IN, MCR_TX_ENR_IN, MCR_SCT_ENR_IN,
    MCR_HSC_TRN_CD, MCR_HSC_SRC_CD, MCR_HSC_USR_ID, MCR_HSC_TS,
    MCR_HSU_TRN_CD, MCR_HSU_SRC_CD, MCR_HSU_USR_ID, MCR_HSU_TS ) 
  VALUES
  ( 123456789, 101, 1, '2017-01-01', '9999-12-31', 12345, 
    'Y', 'N', 'N',  'N',
    0, 0, 'QCPI24K', CURRENT_TIMESTAMP, 0, 0, 'QCPI24K', CURRENT_TIMESTAMP);
    
SELECT * FROM ECCM.TMCR_CMM_PGM_SBI;
SELECT MCP.MCP_CMM_PGM_NM, MCR.*
    FROM ECCM.TMCP_MMR_CMM_PGM MCP, ECCM.TMCR_CMM_PGM_SBI MCR
    WHERE MCR.MCR_MCP_CMM_PGM_ID = MCP.MCP_MMR_CMM_PGM_ID;
