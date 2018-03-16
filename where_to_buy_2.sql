SELECT country_name AS Country, brand AS Brand, SUM(retailer_impressions) AS retailer_impressions, SUM(clicks) AS clicks, SUM(lead_value) AS lead_value,
SUM(sales) AS sales
FROM bpwarehouse.v_ecomm_channeladvisor
WHERE region_name='APAC'
GROUP BY country_name, brand
ORDER BY country_name, brand
;

SELECT DISTINCT country_name FROM bpwarehouse.v_ecomm_channeladvisor;


SELECT region_name AS Region, cluster_name AS Cluster, country_name AS Country, brand AS Brand
FROM bpwarehouse.v_ecomm_channeladvisor
WHERE region_name = 'APAC'
GROUP BY region_name, cluster_name, country_name, brand
ORDER BY region_name, cluster_name, country_name, brand
;
