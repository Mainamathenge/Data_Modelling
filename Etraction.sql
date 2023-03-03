SELECT 
    A.CHAT_ID,
    NVL(B.MASTER_AGENT_SEQ, -1 ) AS MASTER_AGENT_SEQ
    A.CALL_CENTER_SVC_AREA_STR,
    A.AVG_RESP_DURN ,
    A.CHAT_DURN,
    A.WAIT_DURN ,
    A.ABANDON_FLAG, 
    A.CHAT_STAT_STR, 
    A.CHAT_END_IND ,
    A.SRC_CREATE_DATE,
    A.SRC_CREATE_USER_ID,
    A.SRC_CREATE_USER_NAME_STR
FROM
    DW_ATOMIC.CHAT_TRANSCRIPT_FACT  A,
    (SELECT 
        IP.INVL_PARTY_SEQ ,
        NVL(MA.MASTER_AGENT_SEQ,-1) AS MASTER_AGENT_SEQ
    FROM
        DW_ATOMIC.INVOLVED_PARTY IP INNER JOIN DW_ATOMIC.AGENT AG ON 
        IP.CURR_REC_FLAG='Y' AND 
        IP.DATA_SRC_ID='SAO' AND
        AG.CURR_REC_FLAG='Y' AND
        AG.DATA_SRC_ID='SAO' AND
        IP.INVL_PARTY_SEQ=AG.INVL_PARTY_SEQ LEFT OUTER JOIN
        DM_CEC.MASTER_AGENT  MA ON 
        MA.CURR_REC_FLAG='Y' AND 
        AG.EMP_ID=MA.EMP_ID 
       ) B
WHERE
    A.BUS_DATE=[BUS DATE] AND  
    A.DATA_SRC_ID='SAO' AND 
    A.INVL_PARTY_SEQ=B.INVL_PARTY_SEQ(+);


DELETE FROM
SELECT *
FROM DW_ATOMIC.CHAT_TRANSCRIPT_INFO
WHERE CURR_REC_FLAG = 'N'

DELETE * 


SELECT *

FROM DW_ATOMIC.CHAT_TRANSCRIPT_INFO
WHERE CURR_REC_FLAG = 'Y'
    AND SRC_DELETE_DATE IS NOT NULL;

DELETE * FROM
(SELECT *
FROM DW_ATOMIC.CHAT_TRANSCRIPT_INFO
WHERE CURR_REC_FLAG = 'N'  AND  
AND SRC_DELETE_DATE IS NOT NULL )

DELETE * FROM 
(SELECT * 
FROM DW_ATOMIC.CALL_CENTER_SVC_AREA_STR
WHERE CURR_REC_FLAG = 'Y'
    AND SRC_DELETE_DATE IS NOT NULL)

-- ACTION ITEM INFO FACT

SELECT * 
FROM DW_ATOMIC.ACTION_ITEM WHERE 
