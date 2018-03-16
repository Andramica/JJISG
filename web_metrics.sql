USE wom_db;

SELECT *
FROM
	speedcurve_test_results
		LEFT JOIN
	wom_db.url_inventory on speedcurve_test_results.InventoryId = url_inventory.InventoryId
		LEFT JOIN
	url_status ON URLStatusId = StatusId
		LEFT JOIN
	url_type ON URLTypeId = TypeId
		LEFT JOIN
	brand ON brand.BrandId = url_inventory.BrandId
		LEFT JOIN
	franchise ON franchise.FranchiseId = brand.FranchiseId
		LEFT JOIN
	country ON country.CountryId = url_inventory.CountryId
		LEFT JOIN
	region ON region.RegionId = country.RegionId
		LEFT JOIN
	analytics_site_xref on analytics_site_xref.InventoryId = url_inventory.InventoryId
		LEFT JOIN
	test_device on speedcurve_test_results.TestDeviceId = test_device.TestDeviceId
		LEFT JOIN
	test_cycle on speedcurve_test_results.TestCycleId = test_cycle.TestCycleId
		LEFT JOIN
	test_location_speed on speedcurve_test_results.TestLocationSpeedId = test_location_speed.TestLocationSpeedId
  ;

SELECT MAX(`TestDate`) FROM wom_db.tableau_local_performance_table;
