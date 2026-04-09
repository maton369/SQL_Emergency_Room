-- ============================================
-- ファイル名: 02_decode_city.sql
-- 目的:
--   warehouse_id の値に応じて都市名を求める。
--
-- ここでは DECODE 関数を使っている。
-- DECODE は主に Oracle 系で使われる書き方であり、
-- 「値が一致したら別の値を返す」という単純な変換に向いている。
-- ============================================

SELECT
    -- DECODE の基本形は次の通りである。
    --
    --   DECODE(比較対象,
    --          値1, 戻り値1,
    --          値2, 戻り値2,
    --          ...,
    --          デフォルト値)
    --
    -- 今回は warehouse_id を比較対象にして、
    -- warehouse_id が 1 なら 'New York'、
    -- 2 なら 'New Jersey'、
    -- 3 なら 'Los Angels'、
    -- 4 なら 'Seattle'、
    -- 5 なら 'San Francisco'
    -- を返すようにしている。
    --
    -- どの値にも一致しなかった場合は、
    -- 最後に書かれている 'Non domestic' が返る。
    DECODE(
        warehouse_id,
        1, 'New York',
        2, 'New Jersey',
        3, 'Los Angels',
        4, 'Seattle',
        5, 'San Francisco',
           'Non domestic'
    ) AS city,

    -- 元の region 列も一緒に表示する。
    region
FROM Warehouse;

-- 補足:
-- DECODE は「一致判定」には便利だが、
-- 範囲条件や複雑な条件分岐には向いていない。
-- そのような場合は CASE 式の方が自然である。
