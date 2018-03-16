SELECT visitor_country AS Country, brand AS Brand, SUM(eretailer_exit_cnt) AS eRetailer_Exit
FROM bpwarehouse.adobe_page_visit_summ
WHERE visitor_region_cd='APAC'
GROUP BY visitor_country, brand
ORDER BY visitor_country, brand
;

SELECT TOP 100 * FROM bpwarehouse.adobe_page_visit_summ
WHERE visitor_region_cd = 'APAC';

SELECT visitor_region_cd AS Region, visitor_cluster AS Cluster, visitor_country AS Country, brand AS Brand
FROM bpwarehouse.adobe_page_visit_summ
WHERE visitor_region_cd = 'APAC'
GROUP BY visitor_region_cd, visitor_cluster, visitor_country, brand
ORDER BY visitor_region_cd, visitor_cluster, visitor_country, brand
;
