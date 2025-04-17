Create database project_6_Retail_Analaysis_new;

use project_6_Retail_Analaysis_NEW ;

create table sales_data_13022025(
    OrderID VARCHAR(50) not null,
    Product VARCHAR(255) not null,
    QuantityOrdered INT not null,
    PriceEach DECIMAL(10,2) not null,
    OrderDate DATETIME not null,
    PurchaseAddress Varchar(255) not null,
    City VARCHAR(100) not null,
    primary key (orderid , product)
);

select * from sales_data_13022025;

SELECT COUNT(*) FROM sales_data_13022025;

SELECT * FROM SALES_DATA_13022025 LIMIT 10;

TRUNCATE TABLE SALES_DATA_13022025;

select 
month(orderdate) as month,
sum(quantityordered * priceeach) as totalsales
from SALES_DATA_13022025
group by month
order by totalsales desc;

select city,
sum(quantityordered * priceeach) as totalsales
from SALES_DATA_13022025
group by city
order by totalsales desc
limit 1;

select 
hour(orderdate) as hourvalue,
count(distinct orderid) as uniqueordercount
from sales_data_13022025
where orderdate is not null
group by hour(orderdate)
order by uniqueordercount desc;

select product,
count(distinct orderid) as orders
from sales_data_13022025
group by product
order by orders desc
limit 5;

select product,
sum(quantityordered) as totalquantity
from sales_data_13022025
group by product
order by totalquantity desc
limit 1;










