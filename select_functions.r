# Jack McColm-de Jong
# Homework 8

tinyclothes_db <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")

# 1. -------------------------------------------------------------------------

# Using the course database, suggest a suitable domain for each attribute 
# of PRODUCT

dbGetQuery(tinyclothes_db, 'SELECT * FROM PRODUCT')
# If a database is larger, getting distinct values from each attribute is better.

# domain of PRODUCT.PROD_NO = {p1, p2, p3, p4, p5, p6}
# domain of PRODUCT.NAME = {PANTS, SOCKS, SHIRTS}
# domain of PRODUCT.COLOR = {BLUE, KHAKI, GREEN, WHITE}

# 2. -------------------------------------------------------------------------

# Find the age of the oldest employee at 'Tiny Clothes'.

dbGetQuery(tinyclothes_db, 'SELECT MAX(AGE) FROM EMPLOYEE')

# 65

# 3. -------------------------------------------------------------------------

# Are there any employees under the age of 50 whose name contains the letter 
# 'R'?

dbGetQuery(tinyclothes_db, 'SELECT * FROM EMPLOYEE WHERE AGE < 50 AND NAME LIKE "%R%"')

# No

# 4. -------------------------------------------------------------------------

# Retrieve the employment number of the sales department manager.

dbGetQuery(tinyclothes_db, 'SELECT MANAGER FROM DEPARTMENT WHERE NAME = "Sales"')

# E5

# 5. -------------------------------------------------------------------------

# How many departments are there at 'Tiny Clothes' ?

dbGetQuery(tinyclothes_db, 'SELECT COUNT(*) FROM DEPARTMENT')

# 3

# 6. -------------------------------------------------------------------------

# What is Carol's customer number?

dbGetQuery(tinyclothes_db, 'SELECT CUST_NO FROM CUSTOMER WHERE NAME = "CAROL"')


# 7. -------------------------------------------------------------------------

# Who works in Department D2?

dbGetQuery(tinyclothes_db, 'SELECT * FROM EMPLOYEE WHERE DEPT_NO = "D2"')


# 8. -------------------------------------------------------------------------

# Use a LEFT JOIN to join EMPLOYEE and DEPARTMENT (in that order) on DEPT_NO.

dbGetQuery(tinyclothes_db, 'SELECT * FROM EMPLOYEE LEFT JOIN DEPARTMENT
                              ON EMPLOYEE.DEPT_NO = DEPARTMENT.DEPT_NO')

# 9. -------------------------------------------------------------------------

# Create a new relation named RETIRED and insert the details of all employees 
# who are over 50 years of age.

RETIRED <- dbGetQuery(tinyclothes_db, 'SELECT * FROM EMPLOYEE WHERE AGE > 50')

dbWriteTable(tinyclothes_db, 'RETIRED', RETIRED, overwrite = TRUE)

dbGetQuery(tinyclothes_db, 'SELECT * FROM RETIRED')

