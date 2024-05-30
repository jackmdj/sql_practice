# Jack McColm-de Jong
# Homework 7

# 1. -------------------------------------------------------------------------

# Find the employee number and age of all employees whose age is less than 50

tinyclothes_db <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")

dbGetQuery(tinyclothes_db, 'SELECT EMP_NO, AGE FROM EMPLOYEE WHERE AGE < 50')

# 2. -------------------------------------------------------------------------

# Find the names of all the employees at 'Tiny Clothes'. (Return names only) 

dbGetQuery(tinyclothes_db, 'SELECT NAME FROM EMPLOYEE')

# 3. -------------------------------------------------------------------------

# Retrieve all the distinct employee names of employees at 'Tiny Clothes' 

dbGetQuery(tinyclothes_db, 'SELECT DISTINCT NAME FROM EMPLOYEE')

# 4. -------------------------------------------------------------------------

# Find all the employee names that begin with the letter 'B'. 

dbGetQuery(tinyclothes_db, 'SELECT NAME FROM EMPLOYEE WHERE NAME LIKE "B%"')


# 5. -------------------------------------------------------------------------

# Retrieve the names and NI numbers (NI_NO) of all employees. 

dbGetQuery(tinyclothes_db, 'SELECT NAME, NI_NO FROM EMPLOYEE')

# 6. -------------------------------------------------------------------------

# Retrieve details of employees who are between 31 years of age and 65 years 
# of age inclusive.

dbGetQuery(tinyclothes_db, 'SELECT * FROM EMPLOYEE WHERE AGE > 31 AND AGE <= 65')

# 7. -------------------------------------------------------------------------

# Have all departments been assigned a manager?

dbGetQuery(tinyclothes_db, 'SELECT DEPT_NO, MANAGER FROM DEPARTMENT')

# Yes.

# 8. -------------------------------------------------------------------------

# On what date did customer C3 place their order?

dbGetQuery(tinyclothes_db, 'SELECT DATE FROM SALES_ORDER WHERE CUST_NO == "C3"')

# On 7/9/19

# 9. -------------------------------------------------------------------------

# Which products are available in white? 

dbGetQuery(tinyclothes_db, 'SELECT * FROM PRODUCT WHERE COLOR IS "WHITE"')

# Socks and shirts are available in white.

# 10. -------------------------------------------------------------------------

# Which office does employee E2 occupy? 

dbGetQuery(tinyclothes_db, 'SELECT OFFICE FROM EMPLOYEE_PHONE WHERE EMP_NO == "E2"')

# Office R10

