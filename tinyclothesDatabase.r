
tinyclothes <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")

CUSTOMER <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/CUSTOMER.txt")
DEPARTMENT <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/DEPARTMENT.txt")
EMPLOYEE <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/EMPLOYEE.txt")
PRODUCT <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/PRODUCT.txt")
SALES_ORDER <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/SALES_ORDER.txt")
SALES_ORDER_LINE <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/SALES_ORDER_LINE.txt")
INVOICES <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/INVOICES.txt")
EMPLOYEE_PHONE <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/EMPLOYEE_PHONE.txt")
STOCK_TOTAL <- read.csv("C:/Users/JACKS/Desktop/PSTAT 10/tinyclothes/STOCK_TOTAL.txt")

dbWriteTable(tinyclothes, 'CUSTOMER', CUSTOMER, overwrite = TRUE)
dbWriteTable(tinyclothes, 'DEPARTMENT', DEPARTMENT, overwrite = TRUE)
dbWriteTable(tinyclothes, 'EMPLOYEE', EMPLOYEE, overwrite = TRUE)
dbWriteTable(tinyclothes, 'PRODUCT', PRODUCT, overwrite = TRUE)
dbWriteTable(tinyclothes, 'SALES_ORDER', SALES_ORDER, overwrite = TRUE)
dbWriteTable(tinyclothes, 'SALES_ORDER_LINE', SALES_ORDER_LINE, overwrite = TRUE)
dbWriteTable(tinyclothes, 'INVOICES', INVOICES, overwrite = TRUE)
dbWriteTable(tinyclothes, 'EMPLOYEE_PHONE', EMPLOYEE_PHONE, overwrite = TRUE)
dbWriteTable(tinyclothes, 'STOCK_TOTAL', STOCK_TOTAL, overwrite = TRUE)

dbListTables(tinyclothes)
dbGetQuery(tinyclothes, 'SELECT * FROM CUSTOMER')

