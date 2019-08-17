CREATE TABLE T_JOB
(
  ID NUMBER NOT NULL
, NAME VARCHAR2(20)
, STATUS VARCHAR2(20)
, CONSTRAINT T_JOB_PK PRIMARY KEY
  (
    ID
  )
  ENABLE
);

CREATE TABLE T_JOB_LOCK
(
  ID_JOB NUMBER NOT NULL
, DONE CHAR(1) NOT NULL
, DH TIMESTAMP NOT NULL
, CONSTRAINT T_JOB_LOCK_PK PRIMARY KEY
  (
    ID_JOB
  )
  ENABLE
);

ALTER TABLE T_JOB_LOCK
ADD CONSTRAINT T_JOB_LOCK_FK1 FOREIGN KEY
(
  ID_JOB
)
REFERENCES T_JOB
(
  ID
)
ENABLE;


-- SET SERVEROUTPUT ON;

DECLARE
   MYVAR VARCHAR2(20);
BEGIN

  SELECT DONE INTO MYVAR FROM T_JOB_LOCK WHERE ID_JOB = 1490392039138 FOR UPDATE;
  DBMS_OUTPUT.PUT_LINE(MYVAR);
  ROLLBACK;

END;