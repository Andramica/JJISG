SELECT countryname AS Country, BrandName_BV AS Brand,
COUNT(CASE WHEN rating=5 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_5,
COUNT(CASE WHEN rating=4 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_4,
COUNT(CASE WHEN rating=3 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_3,
COUNT(CASE WHEN rating=2 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_2,
COUNT(CASE WHEN rating=1 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_1,
COUNT(CASE WHEN rating=0 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN rating ELSE NULL END) AS Rating_0,
COUNT(CASE WHEN LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN reviewid ELSE NULL END) AS Review_Volume,
COUNT(CASE WHEN LastPublishTime >= DATEADD(dd,-30,DATEADD(yyyy,-1,Max_LastPublishTime)) AND LastPublishTime <= DATEADD(yyyy,-1,Max_LastPublishTime)
THEN reviewid ELSE NULL END) AS Previous_Review_Volume,
COUNT(CASE WHEN rating>=4 AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
THEN reviewid ELSE NULL END) AS Positive_Review_Volume
FROM bpanorama.bpwarehouse.bazaarvoice_history
WHERE region='APAC' AND  ModerationStatus='APPROVED'
AND ((LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime))
OR (LastPublishTime >= DATEADD(dd,-30,DATEADD(yyyy,-1,Max_LastPublishTime)) AND LastPublishTime <= DATEADD(yyyy,-1,Max_LastPublishTime)))
GROUP BY countryname, BrandName_BV
ORDER BY countryname, BrandName_BV
;

SELECT countryname, BrandName_BV, rating FROM bpanorama.bpwarehouse.bazaarvoice_history
WHERE region='APAC' AND LastPublishTime <= Max_LastPublishTime AND LastPublishTime >= DATEADD(dd, -30, Max_LastPublishTime)
ORDER BY countryname, BrandName_BV;

SELECT TOP 100 * FROM bpanorama.bpwarehouse.bazaarvoice_history;

SELECT TOP 100 * FROM bpanorama.bpwarehouse.bazaarvoice_brand_product_list;

SELECT Region AS Region, Cluster AS Cluster, CountryName AS Country, BrandName AS Brand
FROM bpanorama.bpwarehouse.bazaarvoice_history
WHERE region = 'APAC'
GROUP BY Region, Cluster, CountryName, BrandName
ORDER BY Region, Cluster, CountryName, BrandName
;
