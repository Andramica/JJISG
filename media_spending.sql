SELECT country AS Market, equity AS Brand
FROM bpanorama.bpwarehouse.t_Media_Data_Direct
WHERE "Country Region"='Asia-Pacific' AND "Period (YEAR)"='2017'
GROUP BY country, equity
ORDER BY country, equity
;

SELECT TOP 100 * FROM bpanorama.bpwarehouse.t_Media_Data_Direct;

SELECT region AS Region, cluster AS Cluster, country AS Country, equity AS Brand
FROM bpanorama.bpwarehouse.t_Media_Data_Direct
WHERE region = 'APAC'
GROUP BY region, cluster, country, equity
ORDER BY region, cluster, country, equity
;

SELECT country AS Market, equity AS Brand, SUM("Net Costs US $$ Fixed Rate") AS Media_Spending,
SUM(CASE WHEN "Global Subtype"='Search' THEN "Net Costs US $$ Fixed Rate" ELSE 0 END) AS Search_Spending,
CASE WHEN SUM("Net Costs US $$ Fixed Rate")!=0 THEN SUM(CASE WHEN "Global Subtype"='Search' THEN "Net Costs US $$ Fixed Rate" ELSE 0 END)/SUM("Net Costs US $$ Fixed Rate") ELSE 0 END AS Search_Percentage
FROM bpanorama.bpwarehouse.t_Media_Data_Direct
WHERE "Country Region"='Asia-Pacific' AND "Period (YEAR)"='2017'
GROUP BY country, equity
ORDER BY country, equity
;
