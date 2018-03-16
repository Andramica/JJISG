SELECT country AS Market, brand AS Brand,
SUM(CASE WHEN www_channel='All' THEN visits ELSE 0 END) AS Visits,
SUM(CASE WHEN www_channel='All' THEN sticky_visits ELSE 0 END) AS Sticky_Visits,
SUM(CASE WHEN www_channel='cpc' THEN visits ELSE 0 END) AS Paid_Visits,
SUM(CASE WHEN www_channel='cpc' THEN sticky_visits ELSE 0 END) AS Sticky_Paid_Visits,
SUM(CASE WHEN www_channel='Organic' THEN visits ELSE 0 END) AS Natural_Visits,
SUM(CASE WHEN www_channel='Organic' THEN sticky_visits ELSE 0 END) AS Sticky_Natural_Visits
FROM bpanorama.bpwarehouse.t_GBA_www_History
WHERE region='APAC' AND date <= last_period AND date >= DATEADD(dd, -30, last_period)
GROUP BY country, brand
ORDER BY country, brand
;

SELECT TOP 100 country, brand, visits FROM bpanorama.bpwarehouse.t_GBA_www_History
WHERE region='APAC'
;

SELECT region AS Region, cluster AS Cluster, country AS Country, brand AS Brand
FROM bpanorama.bpwarehouse.t_GBA_www_History
WHERE region = 'APAC'
GROUP BY region, cluster, country, brand
ORDER BY region, cluster, country, brand
;
