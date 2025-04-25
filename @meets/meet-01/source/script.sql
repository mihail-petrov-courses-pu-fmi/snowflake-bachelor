CREATE DATABASE DRAGON_MARKET_DB;

USE SNOWFLAKE_SAMPLE_DATA;

-- Изрично да кажа къде да се създаде обект
-- CREATE SCHEMA IF NOT EXISTS DRAGON_MARKET_DB.INIT_DATA_2;

-- ще си направи схема за всичките ни инструменти 
CREATE SCHEMA DRAGON_MARKET_DB.manager_toolset;

USE SCHEMA manager_toolset;

-- създаваме си STAGE - ПАПКА, в която да пазим файловете, от които ще четем данни.
CREATE STAGE stage_pokemon;

-- 
LIST @stage_pokemon;

--
SELECT $1, $2, $3
FROM @stage_pokemon/pokemon_stats.csv

-- Искаме да направим нова таблица в която да пазим само и единствено
-- имената на покемоните
CREATE OR REPLACE TABLE DRAGON_MARKET_DB.INIT_DATA.pokemon_titles 
AS
SELECT $1 AS title
FROM @stage_pokemon/pokemon_stats.csv;

