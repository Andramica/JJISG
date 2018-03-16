SELECT v_fct_task.taskid AS taskid,
  v_fct_task.visitid AS visitid,
  v_fct_task.mastertaskid AS mastertaskid,
  v_fct_merchandising.mrchr_visitdate AS mrchr_visitdate,
  v_fct_merchandising.presence AS presence,
  v_fct_merchandising.pricepresence AS pricepresence,
  v_fct_merchandising.pricedetails AS pricedetails,
  v_fct_merchandising.promopresence AS promopresence,
  v_fct_merchandising.promopackpresence AS promopackpresence,
  v_fct_merchandising.facings AS facings,
  v_fct_merchandising.stockcount AS stockcount,
  v_fct_merchandising.outofstock AS outofstock,
  v_fct_merchandising.horizontalposition AS horizontalposition,
  v_fct_merchandising.verticalposition AS verticalposition,
  v_fct_merchandising.storeposition AS storeposition,
  v_fct_merchandising.promodetails AS promodetails,
  v_fct_merchandising.categorylength AS categorylength,
  v_fct_merchandising.categoryfacings AS categoryfacings,
  v_md_businessunit.businessunitname AS businessunitname,
  v_md_customer.customername AS customername,
  v_md_customer.country AS country,
  v_md_customer.county AS county,
  v_md_customer.district AS district,
  v_md_customer.city AS city,
  v_md_customer.postcode AS postcode,
  v_md_customer.streetname AS streetname,
  v_md_customer.streetnumber AS streetnumber,
  v_md_customer.salesgroup AS salesgroup,
  v_md_customer.distr_chan AS distr_chan,
  v_md_mastersurvey.mastersurveyname AS mastersurveyname,
  v_md_mastertask.name AS mastertaskname,
  v_md_product.productname AS productname,
  v_md_product.category AS category,
  v_md_product.brand AS brand,
  v_md_salescampaign.salescampaignname AS salescampaignname,
  v_md_salescycle.salescyclename AS salescyclename
FROM rex_bi.v_fct_task v_fct_task
  INNER JOIN rex_bi.v_fct_merchandising v_fct_merchandising ON (v_fct_task.taskid = v_fct_merchandising.taskid)
  INNER JOIN rex_bi.v_fct_salesrep_activity v_fct_salesrep_activity ON (v_fct_task.visitid = v_fct_salesrep_activity.visitid)
  INNER JOIN rex_bi.v_fct_survey v_fct_survey ON (v_fct_task.taskid = v_fct_survey.taskid)
  INNER JOIN rex_bi.v_md_businessunit v_md_businessunit ON (v_fct_task.businessunitid = v_md_businessunit.businessunitid)
  INNER JOIN rex_bi.v_md_customer v_md_customer ON (v_fct_task.customerid = v_md_customer.customerid)
  INNER JOIN rex_bi.v_md_mastersurvey v_md_mastersurvey ON (v_fct_survey.mastersurveyid = v_md_mastersurvey.mastersurveyid)
  INNER JOIN rex_bi.v_md_mastertask v_md_mastertask ON (v_fct_task.mastertaskid = v_md_mastertask.mastertaskid)
  INNER JOIN rex_bi.v_md_product v_md_product ON (v_fct_merchandising.productid = v_md_product.productid)
  INNER JOIN rex_bi.v_md_salescampaign v_md_salescampaign ON (v_fct_task.salescampaignid = v_md_salescampaign.salescampaignid)
  INNER JOIN rex_bi.v_md_salescycle v_md_salescycle ON (v_fct_salesrep_activity.salescycleid = v_md_salescycle.salescycleid) LIMIT 50;
  
SELECT v_fct_task.taskid AS taskid,
  v_fct_merchandising.mrchr_visitdate AS mrchr_visitdate,
  v_md_businessunit.businessunitname AS businessunitname,
  v_md_customer.customername AS customername,
  v_md_customer.distr_chan AS distr_chan,
  v_md_mastersurvey.mastersurveyname AS mastersurveyname,
  v_md_mastertask.name AS mastertaskname,
  v_md_product.productname AS productname,
  v_md_product.category AS category,
  v_md_product.brand AS brand,
  v_md_salescampaign.salescampaignname AS salescampaignname,
  v_md_salescycle.salescyclename AS salescyclename
FROM rex_bi.v_fct_task v_fct_task
  INNER JOIN rex_bi.v_fct_merchandising v_fct_merchandising ON (v_fct_task.taskid = v_fct_merchandising.taskid)
  INNER JOIN rex_bi.v_fct_salesrep_activity v_fct_salesrep_activity ON (v_fct_task.visitid = v_fct_salesrep_activity.visitid)
  INNER JOIN rex_bi.v_fct_survey v_fct_survey ON (v_fct_task.taskid = v_fct_survey.taskid)
  INNER JOIN rex_bi.v_md_businessunit v_md_businessunit ON (v_fct_task.businessunitid = v_md_businessunit.businessunitid)
  INNER JOIN rex_bi.v_md_customer v_md_customer ON (v_fct_task.customerid = v_md_customer.customerid)
  INNER JOIN rex_bi.v_md_mastersurvey v_md_mastersurvey ON (v_fct_survey.mastersurveyid = v_md_mastersurvey.mastersurveyid)
  INNER JOIN rex_bi.v_md_mastertask v_md_mastertask ON (v_fct_task.mastertaskid = v_md_mastertask.mastertaskid)
  INNER JOIN rex_bi.v_md_product v_md_product ON (v_fct_merchandising.productid = v_md_product.productid)
  INNER JOIN rex_bi.v_md_salescampaign v_md_salescampaign ON (v_fct_task.salescampaignid = v_md_salescampaign.salescampaignid)
  INNER JOIN rex_bi.v_md_salescycle v_md_salescycle ON (v_fct_salesrep_activity.salescycleid = v_md_salescycle.salescycleid) LIMIT 50;

SELECT v_fct_task.taskid AS taskid,
  (SELECT v_fct_merchandising.mrchr_visitdate AS mrchr_visitdate FROM rex_bi.v_fct_merchandising v_fct_merchandising WHERE v_fct_task.taskid = v_fct_merchandising.taskid),
  (SELECT v_md_businessunit.businessunitname AS businessunitname FROM rex_bi.v_md_businessunit v_md_businessunit WHERE v_fct_task.businessunitid = v_md_businessunit.businessunitid),
  (SELECT v_md_customer.customername AS customername FROM rex_bi.v_md_customer v_md_customer WHERE v_fct_task.customerid = v_md_customer.customerid),
  (SELECT v_md_customer.distr_chan AS distributionchannel FROM rex_bi.v_md_customer v_md_customer WHERE v_fct_task.customerid = v_md_customer.customerid),
  (SELECT v_md_mastersurvey.mastersurveyname AS mastersurveyname FROM rex_bi.v_md_mastersurvey v_md_mastersurvey WHERE v_fct_survey.mastersurveyid = v_md_mastersurvey.mastersurveyid),
  (SELECT v_md_mastertask.name AS mastertaskname FROM rex_bi.v_md_mastertask v_md_mastertask WHERE v_fct_task.mastertaskid = v_md_mastertask.mastertaskid),
  (SELECT v_md_product.productname AS productname FROM rex_bi.v_md_product v_md_product WHERE v_fct_merchandising.productid = v_md_product.productid),
  (SELECT v_md_product.category AS category FROM rex_bi.v_md_product v_md_product WHERE v_fct_merchandising.productid = v_md_product.productid),
  (SELECT v_md_product.brand AS brand FROM rex_bi.v_md_product v_md_product WHERE v_fct_merchandising.productid = v_md_product.productid),
  (SELECT v_md_salescampaign.salescampaignname AS salescampaignname FROM rex_bi.v_md_salescampaign v_md_salescampaign WHERE v_fct_task.salescampaignid = v_md_salescampaign.salescampaignid),
  (SELECT v_md_salescycle.salescyclename AS salescyclename FROM rex_bi.v_md_salescycle v_md_salescycle WHERE v_fct_salesrep_activity.salescycleid = v_md_salescycle.salescycleid)
FROM rex_bi.v_fct_task AS v_fct_task
  INNER JOIN (SELECT productid AS productid, taskid FROM rex_bi.v_fct_merchandising) AS v_fct_merchandising ON v_fct_task.taskid = v_fct_merchandising.taskid,
  INNER JOIN (SELECT salescycleid AS salescycleid, visitid FROM rex_bi.v_fct_salesrep_activity) AS v_fct_salesrep_activity ON v_fct_task.visitid = v_fct_salesrep_activity.visitid,
  INNER JOIN (SELECT mastersurveyid AS mastersurveyid, taskid FROM rex_bi.v_fct_survey) AS v_fct_survey ON v_fct_task.taskid = v_fct_survey.taskid;

SELECT v_fct_task.taskid AS taskid,
  (SELECT v_fct_merchandising.mrchr_visitdate AS mrchr_visitdate FROM rex_bi.v_fct_merchandising AS v_fct_merchandising WHERE v_fct_task.taskid = v_fct_merchandising.taskid),
  (SELECT v_md_businessunit.businessunitname AS businessunitname FROM rex_bi.v_md_businessunit AS v_md_businessunit WHERE v_fct_task.businessunitid = v_md_businessunit.businessunitid),
  (SELECT v_md_customer.customername AS customername FROM rex_bi.v_md_customer AS v_md_customer WHERE v_fct_task.customerid = v_md_customer.customerid),
  (SELECT v_md_customer.distr_chan AS distributionchannel FROM rex_bi.v_md_customer AS v_md_customer WHERE v_fct_task.customerid = v_md_customer.customerid),
  (SELECT v_md_salescampaign.salescampaignname AS salescampaignname FROM rex_bi.v_md_salescampaign AS v_md_salescampaign WHERE v_fct_task.salescampaignid = v_md_salescampaign.salescampaignid),
  (SELECT v_md_mastertask.name AS mastertaskname FROM rex_bi.v_md_mastertask AS v_md_mastertask WHERE v_fct_task.mastertaskid = v_md_mastertask.mastertaskid),
  (SELECT v_md_mastersurvey.mastersurveyname AS mastersurveyname FROM rex_bi.v_md_mastersurvey AS v_md_mastersurvey WHERE v_md_mastersurvey.mastersurveyid =
    (SELECT v_fct_survey.mastersurveyid AS mastersurveyid FROM rex_bi.v_fct_survey AS v_fct_survey WHERE v_fct_task.taskid = v_fct_survey.taskid)),
  (SELECT v_md_product.productname AS productname FROM rex_bi.v_md_product AS v_md_product WHERE v_md_product.productid = 
    (SELECT v_fct_merchandising.productid AS productid FROM rex_bi.v_fct_merchandising AS v_fct_merchandising WHERE v_fct_task.taskid = v_fct_merchandising.taskid)),
  (SELECT v_md_product.category AS category FROM rex_bi.v_md_product AS v_md_product WHERE v_md_product.productid = 
    (SELECT v_fct_merchandising.productid AS productid FROM rex_bi.v_fct_merchandising AS v_fct_merchandising WHERE v_fct_task.taskid = v_fct_merchandising.taskid)),
  (SELECT v_md_product.brand AS brand FROM rex_bi.v_md_product AS v_md_product WHERE v_md_product.productid = 
    (SELECT v_fct_merchandising.productid AS productid FROM rex_bi.v_fct_merchandising AS v_fct_merchandising WHERE v_fct_task.taskid = v_fct_merchandising.taskid)),
  (SELECT v_md_salescycle.salescyclename AS salescyclename FROM rex_bi.v_md_salescycle AS v_md_salescycle WHERE v_md_salescycle.salescycleid =
    (SELECT v_fct_salesrep_activity.salescycleid AS salescycleid FROM rex_bi.v_fct_salesrep_activity AS v_fct_salesrep_activity WHERE v_fct_task.visitid = v_fct_salesrep_activity.visitid))
FROM rex_bi.v_fct_task AS v_fct_task;

SELECT v_fct_task.taskid AS taskid,
v_fct_task.customerid AS customerid,
v_fct_task.salescampaignid AS salescampaignid,
v_fct_task.mastertaskid AS mastertaskid,
v_fct_merchandising.mrchr_visitdate AS mrchr_visitdate,
v_md_customer.customername AS customername,
v_md_salescampaign.salescampaignname AS salescampaignname,
v_md_mastertask.name AS mastertaskname,
v_md_product.productname AS productname,
v_md_product.brand AS brand,
v_md_product.category AS category
FROM rex_bi.v_fct_task AS v_fct_task
  INNER JOIN rex_bi.v_fct_merchandising AS v_fct_merchandising ON (v_fct_merchandising.taskid = v_fct_task.taskid)
  INNER JOIN rex_bi.v_md_customer AS v_md_customer ON (v_md_customer.customerid = v_fct_task.customerid)
  INNER JOIN rex_bi.v_md_salescampaign AS v_md_salescampaign ON (v_md_salescampaign.salescampaignid = v_fct_task.salescampaignid)
  INNER JOIN rex_bi.v_md_mastertask AS v_md_mastertask ON (v_fct_task.mastertaskid = v_md_mastertask.mastertaskid)
  INNER JOIN rex_bi.v_md_product AS v_md_product ON (v_fct_merchandising.productid = v_md_product.productid)
  ;

SELECT customerid, salescycleid FROM rex_bi.v_fct_salesrep_activity LIMIT 50;

create table rex_raw.itg_rex_salescycle as
	select 
	v_md_salescycle.salescyclename as salescyclename,
	stg_rex_salescycle.visitid as visitid
	from (
	  select 
		v_fct_salesrep_activity.salescycleid as salescycleid,
		v_fct_salesrep_activity.visitid as visitid
		from rex_bi.v_fct_salesrep_activity as v_fct_salesrep_activity
		inner join rex_bi.v_fct_task as v_fct_task on v_fct_salesrep_activity.visitid = v_fct_task.visitid) stg_rex_salescycle
	left join rex_bi.v_md_salescycle as v_md_salescycle
	on stg_rex_salescycle.salescycleid = v_md_salescycle.salescycleid;

