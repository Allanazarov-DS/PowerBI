SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.DueDate,
    soh.ShipDate,
    soh.SubTotal,
    soh.TaxAmt,
    soh.Freight,
    soh.TotalDue,
    
    c.CustomerID,
    c.AccountNumber,
    per.FirstName,
    per.LastName,
    per.EmailPromotion,
    
    addr.AddressLine1,
    addr.City,
    stateprov.Name AS StateProvince,
    country.Name AS CountryRegion,

    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal,
    
    p.Name AS ProductName,
    p.ProductNumber,
    p.Color,
    p.StandardCost,
    p.ListPrice,
    p.SellStartDate,

    emp.BusinessEntityID AS EmployeeID,
    emp.JobTitle,
    
    poh.PurchaseOrderID,
    poh.VendorID,
    poh.OrderDate AS PurchaseOrderDate,
    
    soh.ModifiedDate AS SalesOrderModifiedDate

FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person per ON c.PersonID = per.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress bea ON per.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.Address addr ON bea.AddressID = addr.AddressID
INNER JOIN Person.StateProvince stateprov ON addr.StateProvinceID = stateprov.StateProvinceID
INNER JOIN Person.CountryRegion country ON stateprov.CountryRegionCode = country.CountryRegionCode
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
LEFT JOIN HumanResources.Employee emp ON soh.SalesPersonID = emp.BusinessEntityID
LEFT JOIN Purchasing.PurchaseOrderHeader poh ON emp.BusinessEntityID = poh.EmployeeID;