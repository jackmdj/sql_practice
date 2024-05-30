# Jack McColm-de Jong
# Homework 9

tinyclothes_db <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")

# 1. -------------------------------------------------------------------------

  # a) Find the phone extension for all employees named BROWN.

dbGetQuery(tinyclothes_db, 'SELECT EXTENSION FROM EMPLOYEE NATURAL JOIN
                            EMPLOYEE_PHONE WHERE NAME = "BROWN"')

  # b) Find the name and phone extension of the ACCOUNTS manager.

dbGetQuery(tinyclothes_db, 'select employee.name, extension
                            from employee inner join employee_phone on
                            employee.emp_no = employee_phone.emp_no
                              inner join department on
                              employee.emp_no = department.manager
                            where department.name = "Accounts"')

  # c) Find the names and phone extension of all employees who share an office

dbGetQuery(tinyclothes_db, 'select name, extension 
                            from employee_phone inner join employee
                              on employee_phone.emp_no = employee.emp_no
                            where office in 
                              (select office from employee_phone
                              group by office having count(*) > 1)')

# 2. -------------------------------------------------------------------------

# A customer phones Tiny Clothes to complain that they have not received their 
# order. The Customer Services Department identifies the caller by their 
# CUST_NO as customer C3. The Customer Services Department does not record the 
# customer's name or address.

# Write one SQL query to find the customer's name, address, the date on which
# they placed their order, the name, color and quantities of products ordered

dbGetQuery(tinyclothes_db, 'select customer.name, customer.address,
                              sales_order.date, product.name, product.color,
                              sales_order_line.quantity
                            from 
                              customer inner join sales_order
                                on customer.cust_no = sales_order.cust_no
                              inner join sales_order_line
                                on sales_order.order_no = sales_order_line.order_no
                              inner join product
                                on product.prod_no = sales_order_line.prod_no
                            where customer.cust_no = "C3"')

# 3. -------------------------------------------------------------------------

  # a) Add the tuple 'D4, COMPLAINTS, E3' to the relation 'DEPARTMENT'.

dbSendQuery(tinyclothes_db, 'insert into department (dept_no, name, manager) 
                             values ("D4", "Complaints", "E3")')

  # b) Create a new department relation, called NEW_DEPARTMENT that includes the
  #    tuple added in a).

dbSendQuery(tinyclothes_db, 'create table NEW_DEPARTMENT as
                             select * from department
                             where dept_no = "D4"')

  # c) Check that NEW_DEPARTMENT exists in your database.

dbListTables(tinyclothes_db)

  # d) Delete NEW_DEPARTMENT.

dbSendQuery(tinyclothes_db, 'drop table NEW_DEPARTMENT')

  # e) Check that NEW_DEPARTMENT has been deleted.

dbListTables(tinyclothes_db)

# 4 - 6 on PDF

