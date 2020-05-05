SELECT email_address_, 
       created_date_, 
       text_date, /* This is a date stored as text in the format dd-MM-yyyy*/
       To_date(text_date, 'dd-MM-yyyy') AS text_as_date, /* Converts text_date to a date field*/
       SYSDATE AS "SYSDATE", /* Returns System Date. Note this is PST*/
       Cast(From_tz(Cast(SYSDATE AS TIMESTAMP), 'US/Pacific') AT TIME zone 'Europe/London' AS DATE) AS sysdate_tz, /* Converts System Date to Europe timezone*/
       NEW_TIME(sysdate, 'PST', 'GMT' ) AS new_tz, /* Nicer timezone conversion*/
       SYSDATE - 1 AS sysdate_minus1, /* Subtract 1 day from sysdate. Includes time*/
       Trunc(SYSDATE) AS trunc_sysdate, /* Removes time from sysdate*/
       Trunc(SYSDATE - 1) AS trunc_sysdate_minus1, /* Subtract 1 day from sysdate. Does NOT include time*/
       SYSDATE + INTERVAL '20' MINUTE AS sysdate_plus_20mins, /* Adds 20 minutes to sysdate*/
       SYSDATE + INTERVAL '2' HOUR AS sysdate_plus_2hours, /* Adds 2 hours to sysdate*/
       SYSDATE + INTERVAL '1' DAY AS sysdate_plus_1day, /* Adds 1 day sysdate*/
       SYSDATE + INTERVAL '6' MONTH AS sysdate_plus_6months, /* Adds 6 months sysdate*/
       SYSDATE + INTERVAL '3' YEAR AS sysdate_plus_3years, /* Adds 3 years sysdate*/
       CASE WHEN created_date_ > SYSDATE THEN 'Y' ELSE 'N' END AS created_gt_sysdate, /* Shows if created date is AFTER system date*/
       CASE WHEN created_date_ < SYSDATE THEN 'Y' ELSE 'N' END AS created_lt_sysdate, /* Shows if created date is BEFORE system date*/
       CASE WHEN created_date_ > To_date(text_date, 'dd-MM-yyyy') THEN 'Y' ELSE 'N' END AS created_gt_text_date, /* Shows if created date is AFTER text_date*/
       CASE WHEN created_date_ < To_date(text_date, 'dd-MM-yyyy') THEN 'Y' ELSE 'N' END AS created_lt_text_date, /* Shows if created date is BEFORE text_date*/
       CASE WHEN created_date_ < To_date('01-02-2019', 'dd-MM-yyyy') THEN 'Y' ELSE 'N' END AS created_lt_text_date, /* If converitng string to date, you need to have single quotes*/
       SYSDATE - created_date_ AS sysdate_minus_created, /* days between system date and created_date*/
       created_date_ - SYSDATE AS created_minus_sysdate, /* days between created_date and system date*/
       ABS(TRUNC(created_date_) - TRUNC(SYSDATE)) AS days_difference, /* days between created_date and system date without minus*/
       ADD_MONTHS(TRUNC(SYSDATE),1) AS sysdate_plus1month, /* Add one month to system date*/
       ADD_MONTHS(TRUNC(SYSDATE),-1) AS sysdate_minus1month, /* Subtract one month to system date*/
       EXTRACT(YEAR FROM SYSDATE) AS sydate_year, /* Extract year from System Date*/
       EXTRACT(MONTH FROM SYSDATE) AS sydate_month, /* Extract month from System Date*/
       EXTRACT(DAY FROM SYSDATE) AS sydate_day, /* Extract day from System Date*/
       EXTRACT(HOUR FROM created_date_) AS created_hour, /* Extract hours from created_date. Does NOT work with System Date due to format. Does NOT autoconvert timezone*/
       EXTRACT(MINUTE FROM created_date_) AS created_minute, /* Extract minutes from created_date*/
       EXTRACT(SECOND FROM created_date_) AS created_second, /* Extract seconds from created_date*/
       LAST_DAY(TRUNC(SYSDATE)) AS last_day_of_this_month, /* Shows last day of current month*/
       ROUND(SYSDATE, 'MM') AS round_sysdate, /* Rounds up/down to Month*/
       ABS(MONTHS_BETWEEN(To_date(text_date, 'dd-MM-yyyy'),SYSDATE)) AS monthsbetween  /* Rounds up/down to Month*/
FROM   $a$ 
WHERE  email_address_ = 'anthony.j.thompson@oracle.com' 
