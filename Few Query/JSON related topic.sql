--JSON related topic list in sql server

SELECT
   'Query-1' AS 'Query',
  JSON_QUERY(
     '{"weight": 10, "display": 24}'
   ) AS ANS;


SELECT
   'Query-2' AS 'Query',
  JSON_QUERY(
     '{"weight": 10, "display": 24,"item":"item123"}'
   ) AS ANS;

SELECT
   'Query-3' AS 'Query',
  JSON_QUERY(
     '{
     "spec":{"weight": 10, "display": 24,"item":"item123"},
     "brand":["oppo","mi","vivo"]
     }',
     '$.spec'
   ) AS ANS;

SELECT
   'Query-4' AS 'Query',
  JSON_QUERY(
     '{
     "spec":{"weight": 10, "display": 24,"item":"item123"},
     "brand":["oppo","mi","vivo"]
     }',
     '$.brand'
   ) AS ANS;

SELECT
   'Query-5' AS 'Query',
  JSON_QUERY(
     '{
     "spec":{"weight": 10, "display": 24,"item":"item123"},
     "mix":{"RAM":"8 GB","color":"white"}
     }',
     '$.mix'
   ) AS ANS;


/*
https://chatgpt.com/share/6995a7d0-ad64-8013-bfae-1c4ac0cd4490

*/