USE WideWorldImporters
GO
SELECT 'ALTER INDEX '  + I.name + ' on ' + S.name -- as 'Schema',
		+ '.' + T.name + ' REBUILD ' -- as 'Table',
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN sys.schemas S on T.schema_id = S.schema_id
INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
AND DDIPS.index_id = I.index_id
WHERE DDIPS.database_id = DB_ID()
and I.name is not null
AND DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent desc

--
ALTER INDEX AK_Product_Name on Production.Product REBUILD 
ALTER INDEX AK_Product_rowguid on Production.Product REBUILD 
ALTER INDEX AK_Product_ProductNumber on Production.Product REBUILD 
ALTER INDEX AK_SpecialOfferProduct_rowguid on Sales.SpecialOfferProduct REBUILD 
ALTER INDEX PK_StateProvince_StateProvinceID on Person.StateProvince REBUILD 
ALTER INDEX PK_ProductProductPhoto_ProductID_ProductPhotoID on Production.ProductProductPhoto REBUILD 
ALTER INDEX PK_ProductReview_ProductReviewID on Production.ProductReview REBUILD 
ALTER INDEX IX_Store_SalesPersonID on Sales.Store REBUILD 
ALTER INDEX IX_ProductVendor_UnitMeasureCode on Purchasing.ProductVendor REBUILD 
ALTER INDEX PK_Vendor_BusinessEntityID on Purchasing.Vendor REBUILD 
ALTER INDEX PK_CountryRegion_CountryRegionCode on Person.CountryRegion REBUILD 
ALTER INDEX AK_CountryRegion_Name on Person.CountryRegion REBUILD 
ALTER INDEX AK_Employee_NationalIDNumber on HumanResources.Employee REBUILD 
ALTER INDEX PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID on HumanResources.EmployeeDepartmentHistory REBUILD 
ALTER INDEX PK_EmployeePayHistory_BusinessEntityID_RateChangeDate on HumanResources.EmployeePayHistory REBUILD 
ALTER INDEX PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate on Sales.SalesPersonQuotaHistory REBUILD 
ALTER INDEX AK_Employee_LoginID on HumanResources.Employee REBUILD 
ALTER INDEX IX_BusinessEntityContact_PersonID on Person.BusinessEntityContact REBUILD 
ALTER INDEX IX_BusinessEntityContact_ContactTypeID on Person.BusinessEntityContact REBUILD 
ALTER INDEX IX_ProductReview_ProductID_Name on Production.ProductReview REBUILD 
ALTER INDEX PK_SpecialOfferProduct_SpecialOfferID_ProductID on Sales.SpecialOfferProduct REBUILD 
ALTER INDEX AK_Store_rowguid on Sales.Store REBUILD 
ALTER INDEX PK_ProductListPriceHistory_ProductID_StartDate on Production.ProductListPriceHistory REBUILD 
ALTER INDEX PK_ProductCostHistory_ProductID_StartDate on Production.ProductCostHistory REBUILD 
ALTER INDEX AK_ProductDescription_rowguid on Production.ProductDescription REBUILD 
ALTER INDEX PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID on Production.ProductModelProductDescriptionCulture REBUILD 
ALTER INDEX AK_BusinessEntityContact_rowguid on Person.BusinessEntityContact REBUILD 
ALTER INDEX PK_ProductVendor_ProductID_BusinessEntityID on Purchasing.ProductVendor REBUILD 
ALTER INDEX PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID on Person.BusinessEntityContact REBUILD 
ALTER INDEX IX_PurchaseOrderHeader_VendorID on Purchasing.PurchaseOrderHeader REBUILD 
ALTER INDEX IX_PurchaseOrderHeader_EmployeeID on Purchasing.PurchaseOrderHeader REBUILD 
ALTER INDEX PK_DatabaseLog_DatabaseLogID on dbo.DatabaseLog REBUILD 
ALTER INDEX PK_ProductInventory_ProductID_LocationID on Production.ProductInventory REBUILD 
ALTER INDEX PK_BillOfMaterials_BillOfMaterialsID on Production.BillOfMaterials REBUILD 
ALTER INDEX IX_BillOfMaterials_UnitMeasureCode on Production.BillOfMaterials REBUILD 
ALTER INDEX PK_JobCandidate_JobCandidateID on HumanResources.JobCandidate REBUILD 
ALTER INDEX PK_Product_ProductID on Production.Product REBUILD 
ALTER INDEX PK_Person_BusinessEntityID on Person.Person REBUILD 
ALTER INDEX AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate on Production.BillOfMaterials REBUILD 
ALTER INDEX IX_PurchaseOrderDetail_ProductID on Purchasing.PurchaseOrderDetail REBUILD 
ALTER INDEX PK_ProductPhoto_ProductPhotoID on Production.ProductPhoto REBUILD 
ALTER INDEX PK_Address_AddressID on Person.Address REBUILD 
ALTER INDEX IX_WorkOrderRouting_ProductID on Production.WorkOrderRouting REBUILD 
ALTER INDEX XMLVALUE_Person_Demographics on Person.Person REBUILD 
ALTER INDEX XMLPROPERTY_Person_Demographics on Person.Person REBUILD 
ALTER INDEX XMLPATH_Person_Demographics on Person.Person REBUILD 
ALTER INDEX PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID on Sales.SalesOrderDetail REBUILD 

-- 
-- WWI
-- 
ALTER INDEX FK_Sales_Orders_PickedByPersonID on Sales.Orders REBUILD 
ALTER INDEX IX_Sales_OrderLines_AllocatedStockItems on Sales.OrderLines REBUILD 
ALTER INDEX FK_Sales_InvoiceLines_StockItemID on Sales.InvoiceLines REBUILD 
ALTER INDEX IX_Sales_OrderLines_Perf_20160301_02 on Sales.OrderLines REBUILD 
ALTER INDEX PK_Application_People on Application.People REBUILD 
ALTER INDEX FK_Sales_Invoices_BillToCustomerID on Sales.Invoices REBUILD 
ALTER INDEX FK_Sales_Invoices_AccountsPersonID on Sales.Invoices REBUILD 
ALTER INDEX FK_Sales_Invoices_OrderID on Sales.Invoices REBUILD 
ALTER INDEX FK_Sales_Invoices_CustomerID on Sales.Invoices REBUILD 
ALTER INDEX FK_Sales_Invoices_ContactPersonID on Sales.Invoices REBUILD 
ALTER INDEX FK_Application_Cities_StateProvinceID on Application.Cities REBUILD 
ALTER INDEX FK_Sales_Invoices_PackedByPersonID on Sales.Invoices REBUILD 
ALTER INDEX FK_Sales_Orders_CustomerID on Sales.Orders REBUILD 
ALTER INDEX FK_Sales_Orders_ContactPersonID on Sales.Orders REBUILD 
ALTER INDEX FK_Sales_Invoices_SalespersonPersonID on Sales.Invoices REBUILD 
ALTER INDEX IX_Purchasing_PurchaseOrderLines_Perf_20160301_4 on Purchasing.PurchaseOrderLines REBUILD 
ALTER INDEX FK_Sales_Orders_SalespersonPersonID on Sales.Orders REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrderLines_StockItemID on Purchasing.PurchaseOrderLines REBUILD 
ALTER INDEX PK_Warehouse_StockItems on Warehouse.StockItems REBUILD 
ALTER INDEX IX_Application_People_FullName on Application.People REBUILD 
ALTER INDEX PK_Sales_Invoices on Sales.Invoices REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrders_SupplierID on Purchasing.PurchaseOrders REBUILD 
ALTER INDEX ix_People_Archive on Application.People_Archive REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrderLines_PackageTypeID on Purchasing.PurchaseOrderLines REBUILD 
ALTER INDEX UQ_Application_Countries_FormalName on Application.Countries REBUILD 
ALTER INDEX IX_Application_People_IsEmployee on Application.People REBUILD 
ALTER INDEX IX_Application_People_IsSalesperson on Application.People REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrders_DeliveryMethodID on Purchasing.PurchaseOrders REBUILD 
ALTER INDEX ix_StockItems_Archive on Warehouse.StockItems_Archive REBUILD 
ALTER INDEX IX_Sales_OrderLines_Perf_20160301_01 on Sales.OrderLines REBUILD 
ALTER INDEX PK_Warehouse_StockItemStockGroups on Warehouse.StockItemStockGroups REBUILD 
ALTER INDEX FK_Sales_Customers_CustomerCategoryID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_BuyingGroupID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_PrimaryContactPersonID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_AlternateContactPersonID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_DeliveryMethodID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_DeliveryCityID on Sales.Customers REBUILD 
ALTER INDEX FK_Sales_Customers_PostalCityID on Sales.Customers REBUILD 
ALTER INDEX IX_Sales_Customers_Perf_20160301_06 on Sales.Customers REBUILD 
ALTER INDEX PK_Warehouse_StockItemHoldings on Warehouse.StockItemHoldings REBUILD 
ALTER INDEX UQ_Warehouse_StockItems_StockItemName on Warehouse.StockItems REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_SupplierID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_SupplierID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_SupplierID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_TransactionTypeID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_TransactionTypeID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_TransactionTypeID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PurchaseOrderID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PurchaseOrderID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PurchaseOrderID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PaymentMethodID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PaymentMethodID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Purchasing_SupplierTransactions_PaymentMethodID on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX IX_Purchasing_SupplierTransactions_IsFinalized on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX IX_Purchasing_SupplierTransactions_IsFinalized on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX IX_Purchasing_SupplierTransactions_IsFinalized on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX UQ_Sales_Customers_CustomerName on Sales.Customers REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrders_ContactPersonID on Purchasing.PurchaseOrders REBUILD 
ALTER INDEX IX_Application_People_Perf_20160301_05 on Application.People REBUILD 
ALTER INDEX PK_Sales_CustomerTransactions on Sales.CustomerTransactions REBUILD 
ALTER INDEX PK_Purchasing_SupplierTransactions on Purchasing.SupplierTransactions REBUILD 
ALTER INDEX FK_Sales_OrderLines_PackageTypeID on Sales.OrderLines REBUILD 
ALTER INDEX FK_Sales_InvoiceLines_PackageTypeID on Sales.InvoiceLines REBUILD 
ALTER INDEX ix_Countries_Archive on Application.Countries_Archive REBUILD 
ALTER INDEX PK_Application_StateProvinces on Application.StateProvinces REBUILD 
ALTER INDEX PK_Warehouse_StockItemTransactions on Warehouse.StockItemTransactions REBUILD 
ALTER INDEX FK_Warehouse_StockItemTransactions_InvoiceID on Warehouse.StockItemTransactions REBUILD 
ALTER INDEX FK_Warehouse_StockItemTransactions_CustomerID on Warehouse.StockItemTransactions REBUILD 
ALTER INDEX FK_Warehouse_StockItemTransactions_StockItemID on Warehouse.StockItemTransactions REBUILD 
ALTER INDEX FK_Purchasing_PurchaseOrderLines_PurchaseOrderID on Purchasing.PurchaseOrderLines REBUILD 
ALTER INDEX PK_Purchasing_PurchaseOrders on Purchasing.PurchaseOrders REBUILD 
ALTER INDEX PK_Sales_Customers on Sales.Customers REBUILD 
ALTER INDEX PK_Application_Countries on Application.Countries REBUILD 
ALTER INDEX FK_Sales_Invoices_DeliveryMethodID on Sales.Invoices REBUILD 
ALTER INDEX PK_Purchasing_PurchaseOrderLines on Purchasing.PurchaseOrderLines REBUILD 
ALTER INDEX IX_Sales_Invoices_ConfirmedDeliveryTime on Sales.Invoices REBUILD 
ALTER INDEX PK_Sales_InvoiceLines on Sales.InvoiceLines REBUILD 
ALTER INDEX PK_Sales_OrderLines on Sales.OrderLines REBUILD 
ALTER INDEX PK_Sales_Orders on Sales.Orders REBUILD 
ALTER INDEX FK_Sales_InvoiceLines_InvoiceID on Sales.InvoiceLines REBUILD 
ALTER INDEX FK_Sales_OrderLines_OrderID on Sales.OrderLines REBUILD 
ALTER INDEX ix_ColdRoomTemperatures_Archive on Warehouse.ColdRoomTemperatures_Archive REBUILD 
ALTER INDEX PK_Application_Cities on Application.Cities REBUILD 
f