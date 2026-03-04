--Time related in sql


--part:1

DECLARE
@dt1 DATETIME = '2026-02-27 15:30:00'

SELECT
DATEADD(HOUR,1,@dt1) AS '1 hour add',
DATEADD(HOUR,5,@dt1) AS '5 hour add',
DATEADD(HOUR,20,@dt1) AS '20 hour add',

DATEADD(HOUR,-1,@dt1) AS '1 hour subtract',
DATEADD(HOUR,-5,@dt1) AS '5 hour subtract',
DATEADD(HOUR,-20,@dt1) AS '20 hour subtract',

DATEADD(MINUTE,1,@dt1) AS '1 minute add',
DATEADD(MINUTE,5,@dt1) AS '5 minute add',

DATEADD(MINUTE,-1,@dt1) AS '1 minute subtract',
DATEADD(MINUTE,-5,@dt1) AS '5 minute subtract',


DATEADD(SECOND,1,@dt1) AS '1 second add',
DATEADD(SECOND,5,@dt1) AS '5 second add',

DATEADD(SECOND,-1,@dt1) AS '1 second subtract',
DATEADD(SECOND,-5,@dt1) AS '5 second subtract'

--part:2

DECLARE
@dt1 DATETIME = '2026-02-27 15:30:00'

SELECT
DATEADD(DAY,1,@dt1) AS '1 day add',
DATEADD(DAY,5,@dt1) AS '5 day add',

DATEADD(DAY,-1,@dt1) AS '1 day subtract',
DATEADD(DAY,-5,@dt1) AS '5 day subtract',

DATEADD(MONTH,1,@dt1) AS '1 month add',
DATEADD(MONTH,5,@dt1) AS '5 month add',

DATEADD(MONTH,-1,@dt1) AS '1 month subtract',
DATEADD(MONTH,-5,@dt1) AS '5 month subtract',

DATEADD(YEAR,1,@dt1) AS '1 year add',
DATEADD(YEAR,5,@dt1) AS '5 year add',

DATEADD(YEAR,-1,@dt1) AS '1 year subtract',
DATEADD(YEAR,-5,@dt1) AS '5 year subtract'

--part:3

DECLARE
@dt1 DATETIME = '2026-02-27 15:30:00',
@dt2 DATETIME = '2026-02-28 04:30:00'

SELECT
DATEFROMPARTS(YEAR(@dt1),MONTH(@dt1),1) AS 'Current Month 1st date find',

DATEFROMPARTS(YEAR(@dt1),MONTH(@dt1),5) AS 'Current Month 5th date find',

DATEFROMPARTS(YEAR(@dt1),MONTH(@dt1),10) AS 'Current Month 10th date find',

EOMONTH(@dt1) AS 'Current Month last date',

EOMONTH(@dt1,1) AS 'Next 1 Month last date',

EOMONTH(@dt1,5) AS 'Next 5 Month last date'

--part:4

DECLARE
@dt1 DATETIME = '2026-02-27 15:30:00',
@dt2 DATETIME = '2026-02-28 04:30:00'

SELECT
FORMAT(@dt1,'dd') AS 'day number',
DAY(@dt1) AS 'day number',

FORMAT(@dt1,'MM') AS 'month number',
MONTH(@dt1) AS 'month number',

FORMAT(@dt1,'yyyy') AS 'year number',
YEAR(@dt1) AS 'year number',

FORMAT(@dt1,'ddd') AS 'day first 3 letter',
FORMAT(@dt1,'dddd') AS 'full day name',

FORMAT(@dt1,'MMM') AS 'month first 3 letter',
FORMAT(@dt1,'MMMM') AS 'month full name'

--part:5

DECLARE
@dt1 DATETIME = '2026-02-27 15:30:00',
@dt2 DATETIME = '2026-02-28 04:30:00'

SELECT
@dt1 AS 'Date and Time Dt1',
@dt2 AS 'Date and Time Dt2',
FORMAT(@dt1,'yyyy-MM-dd') AS 'Dt1 yyyy-MM-dd',
FORMAT(@dt1,'yyyy-MMM-dd') AS 'Dt1 yyyy-MMM-dd',
FORMAT(@dt1,'dd/MM/yyyy') AS 'Dt1 dd/MM/yyyy',
FORMAT(@dt1,'dd-MMM-yyyy') AS 'Dt1 dd-MMM-yyyy',
FORMAT(@dt1,'dd-MMM-yy') AS 'Dt1 dd-MMM-yy',
FORMAT(@dt1,'hh:mm:ss') AS 'Dt1 hh:mm:ss',
FORMAT(@dt1,'HH:mm:ss') AS 'Dt1 HH:mm:ss',
FORMAT(@dt1,'hh:mm:ss tt') AS 'Dt1 hh:mm:ss AM/PM ans',
FORMAT(@dt1,'hh:mm tt') AS 'Dt1 hh:mm AM/PM ans',
FORMAT(@dt2,'hh:mm tt') AS 'Dt2 hh:mm AM/PM ans'