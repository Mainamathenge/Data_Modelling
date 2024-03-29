SELECT * FROM DM_CEC.RESOLUTION_SURVEY_INFO_FACT A
INNER JOIN DW_ATOMIC.RESOLUTION_SURVEY_INFO@TO_DEDW C ON A.SURVEY_ID = B.SURVEY_ID
WHERE C.SRC_DELETE_DATE IN(
SELECT * FROM DW_ATOMIC.RESOLUTION_SURVEY_INFO@TO_DEDW
WHERE SRC_DELETE_DATE IS NOT NULL
AND DATA_SRC_ID = 'SAO'
AND CURR_REC_FLAG = 'N') B
WHERE SRC_DELETE_DATE IS NOT NULL;

SELECT * FROM DM_CEC.RESOLUTION_SURVEY_INFO_FACT A
WHERE SURVEY_ID IN(
    SELECT SURVEY_ID 
    FROM DW_ATOMIC.RESOLUTION_SURVEY_INFO @TO_EDW
    WHERE SRC_DELETE_DATE IS NOT NULL
    AND DATA_SRC_ID = 'SAO'
    AND CURR_REC_FLAG = 'N'
    ) B
A.SURVEY_ID = B.SURVEY_ID

SELECT A.*
FROM DM_CEC.RESOLUTION_SURVEY_INFO_FACT A
JOIN (
  SELECT SURVEY_ID
  FROM DW_ATOMIC.RESOLUTION_SURVEY_INFO@TO_EDW
  WHERE SRC_DELETE_DATE IS NOT NULL
    AND DATA_SRC_ID = 'SAO'
    AND CURR_REC_FLAG = 'N'
) B
ON A.SURVEY_ID = B.SURVEY_ID;

DELETE
FROM DM_CEC.RESOLUTION_SURVEY_INFO_FACT A
JOIN (
  SELECT SURVEY_ID
  FROM DW_ATOMIC.RESOLUTION_SURVEY_INFO@TO_EDW
  WHERE SRC_DELETE_DATE IS NOT NULL
    AND DATA_SRC_ID = 'SAO'
    AND CURR_REC_FLAG = 'N'
) B
ON A.SURVEY_ID = B.SURVEY_ID;
