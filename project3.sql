create database project3; -- creation of database
use project3;
select * from manu;
select count(*) from manu;
describe manu;

-- 1. Manufactured Quantity 
select sum(Manufactured_Qty) as Manufactured_qty from manu;

-- 2.  Rejected Quantity
select sum(rejected_qty) as Rejected_qty from manu;
-- 3. Processed Quantity
select sum(processed_qty) from manu;

-- 4 Wastage Percentage
SELECT concat(round( (SUM(Rejected_Qty) / SUM(Manufactured_Qty)) * 100 ,2),"%") AS Wastage_Percentage FROM manu;
-- 5. Employeewise rejected quantity 
select emp_name, sum(rejected_qty) from manu group by emp_name order by sum(rejected_qty) desc limit 10;
-- 6. Machinewise rejected quantity 
select machine_name ,sum(rejected_qty) from manu group by machine_name order by sum(rejected_qty) desc limit 10;
-- 7. Production comparision trend 
SELECT Fiscal_date , SUM(produced_qty) AS produced_Qty, SUM(Rejected_Qty) 
AS Rejected_Qty FROM manu GROUP BY fiscal_date;
select department_name , sum(produced_qty) as produced_qty, sum(rejected_qty) as Rejected_qty from manu group by department_name order by produced_qty,
 rejected_qty ;
select operation_name , sum(produced_qty) as produced_qty, sum(rejected_qty) as Rejected_qty from manu group by operation_name order by produced_qty  desc;

-- 8. Departmentwise manufacture vs Rejected Quantity
SELECT Department_Name, SUM(Manufactured_Qty) AS Total_Manufactured_Qty,
SUM(Rejected_Qty) AS Total_Rejected_Qty FROM  manu GROUP BY Department_Name;
-- 9. Employee wise rejected quantity
SELECT EMP_Code, Emp_Name, SUM(Rejected_Qty) AS Employee_Rejected_Qty FROM manu
GROUP BY EMP_Code, Emp_Name;

    

  
    
       