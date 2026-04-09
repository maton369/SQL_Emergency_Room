-- ============================================
-- ファイル名: 01_create_warehouse.sql
-- 目的:
--   倉庫情報を格納する Warehouse テーブルを作成し、
--   サンプルデータを投入する。
--
-- このファイルは、後続の SELECT 文を試すための
-- 事前準備として実行する。
-- ============================================

-- 念のため、すでに同名テーブルが存在する環境では
-- 先に削除したい場合がある。
-- 使用DBによっては DROP TABLE IF EXISTS が使える。
-- 必要なら以下を有効化する。
-- DROP TABLE IF EXISTS Warehouse;

-- Warehouse テーブルを作成する。
CREATE TABLE Warehouse
(
    -- 倉庫を一意に識別するID。
    -- NOT NULL かつ PRIMARY KEY なので、
    -- NULL は許されず、重複も許されない。
    warehouse_id INTEGER NOT NULL PRIMARY KEY,

    -- 倉庫が属する地域を表す列。
    -- CHAR(32) は固定長文字列である。
    -- 今回は 'East Coast' や 'West Coast' を格納する。
    region CHAR(32) NOT NULL
);

-- サンプルデータを投入する。
-- warehouse_id と region の対応を登録する。
INSERT INTO Warehouse VALUES (1, 'East Coast');
INSERT INTO Warehouse VALUES (2, 'East Coast');
INSERT INTO Warehouse VALUES (3, 'West Coast');
INSERT INTO Warehouse VALUES (4, 'West Coast');
INSERT INTO Warehouse VALUES (5, 'West Coast');

-- 確認用:
-- SELECT * FROM Warehouse;
