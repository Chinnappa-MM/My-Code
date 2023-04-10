-- Write a simple query to verify whether duplicates do indeed exist in the table.  -- Fresher (Easy)

    SELECT username, email, COUNT(*)
    FROM users
    GROUP BY username, email
    HAVING COUNT(*) > 1

-- List All Rows Containing Duplicates : --Freasher (Mid)

    SELECT a.*
    FROM users a
    JOIN (SELECT username, email, COUNT(*)
    FROM users 
    GROUP BY username, email
    HAVING count(*) > 1 ) b
    ON a.username = b.username
    AND a.email = b.email
    ORDER BY a.email

-- Write simple code for deleting dupe records keeping the first inseted record as original --Fresher (Mid - Hard)

    --Medium Level Example (Sub-Query)
    DELETE FROM Customer
    where ID NOT IN
    (
        SELECT MIN(ID) AS MinFRecordID
        FROM Customer
        GROUP BY Name, Email
    )

    --Note : This example is simple and considers ID column above examples can also consider id field. same code can be written in many ways.

    --High level Example (uses CTE means better performance)
    WITH CTE 
    AS
    (
        SELECT Id,Name,Email,
                RANK() OVER(PARTITION BY Name, Email ORDER BY ID) AS RankNo
        FROM Customer
    )
    DELETE FROM CTE WHERE RowNo > 1;

    --Here istead of Rank row_number() func can also be used. Also the above queryies can be achived through derived tables too.

-- How to Delete record from multiple table with primary key and foriengn key relationship.

-- What are the Situations we use normalization and denormalization.

-- State the diffrence between char & Varchar

-- State some best practises to follow to improve query performance

use cats
Select top 2  Salary from Employee group by salary order by Salary DESC

Select * from Employee

Select top 50 PERCENT * from employee