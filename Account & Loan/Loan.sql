create database bank;
 use bank;
 
 CREATE TABLE LOAN (
LOAN_NO CHAR (5) PRIMARY KEY ,
AMOUNT DECIMAL (12 ,2) NOT NULL
) ;

INSERT INTO LOAN VALUES ('L -201 ' ,' 10000.00') ;
INSERT INTO LOAN VALUES ('L -202 ',' 20000.00') ;
INSERT INTO LOAN VALUES ('L -203 ' ,' 15000.00') ;


CREATE TABLE BORROWER (
CUSTOMER_NO CHAR (5) ,
LOAN_NO CHAR (5) ,
PRIMARY KEY ( CUSTOMER_NO , LOAN_NO ) ,
FOREIGN KEY ( CUSTOMER_NO ) REFERENCES CUSTOMER (
CUSTOMER_NO ) ,
FOREIGN KEY ( LOAN_NO ) REFERENCES LOAN ( LOAN_NO )
) ;

INSERT INTO BORROWER VALUES ('C -101 ', 'L -201 ') ;
INSERT INTO BORROWER VALUES ('C -102 ', 'L -202 ') ;
INSERT INTO BORROWER VALUES ('C -103 ', 'L -203 ') ;

SELECT C.CUSTOMER_NO, C.CUSTOMER_NAME
FROM CUSTOMER C
INNER JOIN DEPOSITOR_INFO D 
ON 
C.CUSTOMER_NO = D.C_NO
INNER JOIN BORROWER B 
ON 
C.CUSTOMER_NO = B.CUSTOMER_NO;

SELECT C.CUSTOMER_NO, C.CUSTOMER_NAME
FROM CUSTOMER C
LEFT JOIN BORROWER B 
ON 
C.CUSTOMER_NO = B.CUSTOMER_NO
INNER JOIN DEPOSITOR_INFO D 
ON 
C.CUSTOMER_NO = D.C_NO
WHERE B.CUSTOMER_NO IS NULL;

UPDATE ACCOUNT
SET BALANCE = BALANCE * 1.05
WHERE BALANCE < 10000;