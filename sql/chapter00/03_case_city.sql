-- ============================================
-- ファイル名: 03_case_city.sql
-- 目的:
--   warehouse_id の値に応じて都市名を求める。
--
-- ここでは CASE 式を使っている。
-- CASE 式は SQL における代表的な条件分岐の書き方であり、
-- 多くのDBで利用できる汎用的な方法である。
-- ============================================

SELECT
    CASE
        -- CASE 式は上から順に WHEN の条件を評価していく。
        -- 最初に真になった条件に対応する THEN の値が返される。

        WHEN warehouse_id = 1 THEN 'New York'
        -- warehouse_id が 1 の行では city に 'New York' を返す。

        WHEN warehouse_id = 2 THEN 'New Jersey'
        -- warehouse_id が 2 の行では city に 'New Jersey' を返す。

        WHEN warehouse_id = 3 THEN 'Los Angels'
        -- warehouse_id が 3 の行では city に 'Los Angels' を返す。

        WHEN warehouse_id = 4 THEN 'Seattle'
        -- warehouse_id が 4 の行では city に 'Seattle' を返す。

        WHEN warehouse_id = 5 THEN 'San Francisco'
        -- warehouse_id が 5 の行では city に 'San Francisco' を返す。

        ELSE NULL
        -- 上記のどの条件にも一致しなかった場合の戻り値である。
        -- 今回は NULL を返すようにしている。
        --
        -- たとえば warehouse_id = 6 の行が将来追加された場合、
        -- city 列の結果は NULL になる。
        --
        -- ここを 'Unknown' などの文字列に変えることもできる。

    END AS city,
    -- CASE 式全体の結果に city という列名を付けている。
    -- つまり、この CASE の計算結果が city 列として表示される。

    region
    -- 元の region 列もそのまま表示する。
FROM Warehouse;

-- ============================================
-- CASE 式についての詳しい説明
-- ============================================
--
-- 1. CASE は「条件に応じて値を返す式」である
--    IF 文のような制御構文ではなく、
--    SELECT の列として値を生成するための式である。
--
-- 2. 評価は上から順に行われる
--    WHEN は上から順番に判定され、
--    最初に条件が成立した THEN の値だけが採用される。
--    それ以降の WHEN は見られない。
--
-- 3. ELSE は「どれにも一致しなかった場合」の処理である
--    ELSE を省略した場合、
--    どの WHEN にも一致しなければ NULL が返る。
--    今回はそれを明示して ELSE NULL と書いている。
--
-- 4. CASE は DECODE より汎用的である
--    DECODE は基本的に「一致するかどうか」の変換だが、
--    CASE はもっと柔軟に条件を書ける。
--
--    たとえば次のように範囲条件も書ける。
--
--    CASE
--        WHEN warehouse_id BETWEEN 1 AND 2 THEN 'East Area'
--        WHEN warehouse_id BETWEEN 3 AND 5 THEN 'West Area'
--        ELSE 'Other'
--    END
--
-- 5. 実務では CASE の方が移植性が高いことが多い
--    DECODE はDB依存が強い場合があるが、
--    CASE はより標準的な書き方なので、
--    他のDB製品でも通用しやすい。
