-- 1. Създайте база данни, 
CREATE DATABASE DRAGON_EX1_DIGIMON;

-- 2. Създайте стеидж в който да качите данните  - направете специална схема в която да позиционирате стеиджа
CREATE DATABASE _DRAGON_GLOBAL_TOOLS;
CREATE OR REPLACE SCHEMA internal_stages;

CREATE STAGE _DRAGON_GLOBAL_TOOLS.internal_stages.digimon_documents;

-- 3. Направете по една схема за всяка една от данните
CREATE SCHEMA DRAGON_EX1_DIGIMON.list_digimon;
CREATE SCHEMA DRAGON_EX1_DIGIMON.list_move;
CREATE SCHEMA DRAGON_EX1_DIGIMON.list_support;

-- 4. Направете таблица, във всяка една от схемите в която да налеете данните от фаиловете. 
USE WAREHOUSE DRAGON__WH;
SELECT $1 
FROM @_DRAGON_GLOBAL_TOOLS.internal_stages.digimon_documents

CREATE OR REPLACE TEMP TABLE DRAGON_EX1_DIGIMON.list_digimon.td_digimon_meta(
    id NUMBER PRIMARY KEY IDENTITY,
    name STRING 
);

INSERT INTO DRAGON_EX1_DIGIMON.list_digimon.td_digimon_meta(name)
VALUES('Agumon');

SELECT  * FROM DRAGON_EX1_DIGIMON.list_digimon.td_digimon_meta 

-- 5. Бонус задание - файловете са в CSV файл, премахнете хедърите им.

LIST @_DRAGON_GLOBAL_TOOLS.internal_stages.digimon_documents

-- Таблица от заявка
CREATE OR REPLACE TABLE td_digimon_move_set 
AS 
SELECT $1  AS move, 
        $2 AS col_2, 
        $3, 
        $4 
FROM @_DRAGON_GLOBAL_TOOLS.internal_stages.digimon_documents/DigiDB_movelist.csv
WHERE 1 = 2


SELECT * FROM td_digimon_move_set 
DELETE FROM td_digimon_move_set;



-- COPY
COPY INTO td_digimon_move_set
FROM (
    SELECT $1, $2, $3, $4 FROM      @_DRAGON_GLOBAL_TOOLS.internal_stages.digimon_documents/DigiDB_movelist.csv
)
FILE_FORMAT = (
    TYPE = CSV, SKIP_HEADER = 1
)

FORCE = TRUE