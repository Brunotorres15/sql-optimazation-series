# ⚡ Part 1 - Using CTEs (Common Table Expressions) ⚡

### 📌 What is a CTE?
*A CTE (Common Table Expression) is a way to create a "temporary table" within an SQL query. It simplifies the reading and organization of complex queries by allowing you to define a dataset with a temporary name that can be reused multiple times within the same query. This makes queries more readable and can improve performance by avoiding repetitive calculations.*

**In this first example, let's compare two queries that fetch the top 10 customers with the highest total order value:**

1️⃣ **First Query**: Here, we use a subquery to calculate the total orders per customer and then filter the results. While this works, this approach forces the database to calculate the SUM of orders repeatedly for each customer, which can be quite inefficient, especially in large databases.

![alt text](<Query-1.png>)
___
2️⃣ **Second Query**: In this query, we use a CTE (Common Table Expression) to calculate the total orders per customer once before joining it with the customers' table. This significantly reduces the processing load, as the total is calculated only once, and the result is reused.

![alt text](<Query-2.png>)

### 🚀 Why is the second query more performant?

**Reduction of Repetitive Processing**: By calculating the total orders in advance and using a JOIN, the second query avoids recalculating the total orders for each customer.

**Early Filtering**: It applies the filter directly in the CTE, eliminating unnecessary records before the JOIN. This reduces the number of rows processed and improves efficiency.

**Better Use of Indexes**: With the CTE, the database can make better use of indexes (if they exist), making execution faster.

### 📈 Conclusion

*Using CTEs can be a powerful technique for optimizing SQL queries, particularly when dealing with complex calculations or large datasets. By reducing repetitive processing and filtering data early, CTEs not only make your queries more readable but can also significantly enhance performance. As you continue to optimize your SQL queries, consider where CTEs might help streamline your logic and boost efficiency.*