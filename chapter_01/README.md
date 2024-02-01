# Introduction to databases and SQL

The SQL code snippets covered in this chapter are all contained in this folder. The SQL code snippets covered in this chapter work perfectly with MySQL, MariaDB, SQLite, and PostgreSQL. 

If you are using SQL Server, you should refer to the SQL script contained in this folder and pay attention to the following differences that were made to make the script compatible with SQL Server:

* `NVARCHAR(MAX)` was used instead of `TEXT`: SQL Server doesn't support `TEXT` data type.
* Data insertion of string values was changed from `'...'` to `N'...'`: SQL Server requires the `N` prefix for string values, e.g., `N'Apple'`. SQL Server uses the UCS-2 encoding for string values, which is a subset of UTF-16. The `N` prefix tells SQL Server to use UTF-16 encoding for the string value.

If you are using SQLite database, you should refer to the SQL script contained in this folder and pay attention to the following differences that were made to make the script compatible with SQLite database:

* `TEXT` was used instead of `VARCHAR`: `VARCHAR` is the same as `TEXT` and has no length limit in SQLite.
* `TEXT` was used instead of `DECIMAL`: SQLite doesn't support `DECIMAL` data type. `REAL` is typically used instead of `DECIMAL` in SQLite when precision doesn't matter. When precision matters, `TEXT` is typically used in practice instead of `DECIMAL` in SQLite.

<!-- If you are using Oracle database, you should refer to the SQL script contained in this folder and pay attention to the following differences that were made to make the script compatible with Oracle database:

* `VARCHAR2` was used instead of `TEXT`: Oracle database doesn't support `TEXT` data type.
* `NUMBER` was used instead of `INT` and `DECIMAL`: Oracle database doesn't support `INT` or `DECIMAL` data types. -->

How to load the prepared scripts using different RDBMS and tools are covered in the following subsections.

- [SQLite online](#sqlite-online)
- [SQLite database](#sqlite-database)
    - [Install SQLite on Mac](#install-sqlite-on-mac)
    - [Install SQLite on Windows](#install-sqlite-on-windows)
    - [Install SQLite on Linux](#install-sqlite-on-linux)
    - [Load the prepared SQLite script](#load-the-prepared-sqlite-script)
- [MySQL database](#mysql-database)
    - [Install and start MySQL on Mac](#install-and-start-mysql-on-mac)
    - [Install and start MySQL on Windows](#install-and-start-mysql-on-windows)
    - [Install and start MySQL on Linux](#install-and-start-mysql-on-linux)
    - [Load the prepared MySQL script](#load-the-prepared-mysql-script)
- [PostgreSQL database](#postgresql-database)
    - [Install and start PostgreSQL on Mac](#install-and-start-postgresql-on-mac)
    - [Install and start PostgreSQL on Windows](#install-and-start-postgresql-on-windows)
    - [Install and start PostgreSQL on Linux](#install-and-start-postgresql-on-linux)
    - [Load the prepared PostgreSQL script](#load-the-prepared-postgresql-script)
- [SQL Server database](#sql-server)
    - [Install and start SQL server on Mac](#install-and-start-sql-server-on-mac)
    - [Install and start SQL server on Windows](#install-and-start-sql-server-on-windows)
    - [Install and start SQL server on Linux](#install-and-start-sql-server-on-linux)
    - [Load the prepared SQL server script](#load-the-prepared-sql-server-script)
- [Oracle database](#oracle-database)
    - [Install and start Oracle database on Mac or Linux](#install-and-start-oracle-database-on-mac-or-linux)
    - [Install and start Oracle database on Windows](#install-and-start-oracle-database-on-windows)
    - [Load the prepared Oracle script](#load-the-prepared-oracle-script)


## SQLite online

SQLite online is a web-based tool that you can use to execute SQL queries. You can access it at [SQLite online](https://sqliteonline.com/).

The script prepared for SQLite online is [`sqlite_online.sql`](./sqlite_online.sql). You can load the prepared script by:

1. Navigate to SQLite Online (https://sqliteonline.com)
2. Click _Import_ and load `sqlite_online.sql`
3. Click _Okay_

Now you should see the script executed in the right sidebar. You are ready to type into the console, follow the book, and execute SQL queries.

<img src="./images/sqlite_online.png" alt="sqlite online" style="width:'70%';">

## SQLite database

SQLite is a lightweight RDBMS that you can use on your computer. If you don't have SQLite installed on your computer, you can follow the following approaches to install SQLite.

### Install SQLite on Mac

If you are using a Mac, it is likely that SQLite is already installed on your computer. You can check it by running the following command in your terminal:

```
sqlite3
```

If you see the output similar to the following, it means that SQLite is already installed on your computer:

```
SQLite version ...
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

You can quit by typing `.quit` and pressing `Enter`, or press `Command + D`.

If you don't have SQLite installed, you can download the precompiled binaries for Mac OS from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. This will allow you to execute a file from an untrusted developer.

### Install SQLite on Windows

If you are using a Windows, you can download the ZIP file for Windows from [SQLite website](https://www.sqlite.org/download.html), (Look for this sqlite-tools-win32-x86-xxxxx.zip) extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Install SQLite on Linux

If you are using a Linux, you can download the ZIP file for Linux from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Load the prepared SQLite script

The script prepared for SQLite database is [`sqlite_db.sql`](./sqlite_db.sql). You can load the prepared script by:

1. Open the terminal, navigate into the `chapter_01` folder of this repository
2. Run the following command to create a new database named `onlinestore.db`, and you will be in the SQLite console environment:

```
sqlite3 onlinestore.db
```

3. In the same SQLite console environment (e.g., the line prompt starts with `sqlite>`), run the following command to load the script:

```
.read sqlite_db.sql
```

4. In the same SQLite console environment, check if the table is created by running the following command:

```
.tables
```

If you see `products`, that means the script is loaded successfully, and the `product` table has been created. In the same SQLite console environment, you can run any SQL queries you want, including the examples covered by Chapter 1. You can always quit the SQLite console by typing `.quit` and pressing `Enter`.

## MySQL database

MySQL is a popular open-source RDBMS. We would recommend you to install MySQL in different ways depending on your operating system. 

### Install and start MySQL on Mac

The recommended approach to install MySQL on a Mac is via [Homebrew](https://brew.sh/). If you don't have Homebrew installed, you can find the latest installation instructions on [Homebrew website](https://brew.sh/), and follow the instructions to install Homebrew first.

Once you have Homebrew installed, you can run the following command to install MySQL in the terminal:

```
brew install mysql
```

You may need to manually start MySQL by running the following command:

```
brew services start mysql
```

You can always stop MySQL by running the following command:

```
brew services stop mysql
```

### Install and start MySQL on Windows

If you are using a Windows, you can download the ZIP file for Windows from [MySQL website](https://dev.mysql.com/downloads/mysql/). Use the installer and download the full installer (e.g., mysql-installer-community-8.0.33.0.msi) (not the web installer). Note: You do not have to make an Oracle account, look for the "No thanks, just start my download" at the bottom of the page.

1. Double click on the installer and follow the instructions.

2. Then hit "Add" from the right hand side panel of options.

3. Proceed with installing the "Developer Default" setup type. Keep the default options in the proceeding dialogs.

4. Setup a password for the super administrator (root) of the database system.

5. Follow the steps for configuration of the products. Keep all settings as default. Enter the password that you just configured when/if asked for it.

6. Once the installation is complete, type MySQL in the Start menu in Windows and click on the "MySQL 8.0 Command Line Client"

7. When asked for a password, enter the one configured for the root user (super administrator).

### Install and start MySQL on Linux

You are recommended to follow the steps listed on [the MySQL official website](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-install-linux-quick.html) to install MySQL on a Linux machine.

To start MySQL, you can run the following command:

```
service mysql start
```

To stop MySQL, you can run the following command:

```
service mysql stop
```

### Load the prepared MySQL script

The script prepared for MySQL database is [`mysql_db.sql`](./mysql_db.sql). You can load the prepared script by following the steps below.

#### Linux and Mac

1. Open the terminal, navigate into the `chapter_01` folder of this repository
2. Run the following command:

```
    mysql -u root < mysql_db.sql
```

If you have set up a password for your MySQL server, you can run the following command instead:

```
    mysql -u root -p < mysql_db.sql
```

After that, you will be prompted to enter your password. 

#### Windows

1. Open "MySQL 8.0 Command Line Client"

2. Enter your root password. If the window closes it means that you either entered the password wrong or the database service is stopped. To start it, type taskmgr or "Task Manager" in the Start menu, then under Services look for MySQL80 and start the service if it is stopped.

3. Use the following command (replace the path to point to the location that you have downloaded the SQL files):

```
source C:\Users\user\Downloads\database-design-from-scratch\chapter_01\mysql_db.sql
```

4. If you see the following, it means that everything was been imported correctly.

```
Query OK, 1 row affected (0.00 sec)

Database changed
Query OK, 0 rows affected, 1 warning (0.01 sec)

Query OK, 0 rows affected (0.02 sec)

Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0
```

5. You can verify that the product has been imported by running the following commands:

```
USE onlinestore;
SELECT * FROM product;
```

6. You should see records on a table. Now you have loaded the script. To query the database and table created by the script, you will need to navigate to the MySQL console environment. You can do this by running the following command:

```
mysql -u root
```

In the MySQL console environment, you can run any SQL queries you want, including the examples covered by Chapter 1. You can always quit the MySQL console by typing `quit` and pressing `Enter`.

## PostgreSQL database

PostgreSQL is a popular open-source RDBMS. If you don't have PostgreSQL installed on your computer, you can follow the following approaches to install SQLite.

### Install and start PostgreSQL on Mac

The recommended approach to install MySQL on a Mac is via [Homebrew](https://brew.sh/). If you don't have Homebrew installed, you can find the latest installation instructions on [Homebrew website](https://brew.sh/), and follow the instructions to install Homebrew first.

Once you have Homebrew installed, you can run the following command to install MySQL in the terminal:

```
brew install postgresql@15
```

You may need to manually start PostgreSQL by running the following command:

```
brew services start postgresql@15
```

You can always stop PostgreSQL by running the following command:

```
brew services stop postgresql@15
```

On Windows or Linux a superuser will be set up automatically when you install PostgreSQL. The superuser is named `postgres` and its default password is empty. However, it may not be so on Mac. To make it consistent with other operating systems, you may need to locate the `createuser` on your Mac, and use it to create a superuser named `postgres` with an empty password.

The location of `createuser` may vary depending on the version of your Mac OS. Here are a few possibilities:

* `/usr/local/opt/postgresql@15/bin/createuser`
* `/usr/local/Cellar/postgresql@15/14.0/bin/createuser`
* `/opt/homebrew/bin/createuser`
* `/opt/homebrew/opt/postgresql@15/bin/createuser`

If you tried the above few options but still can't locate the `createuser` command, you can try to run the following command to locate it:

```
sudo find / -name createuser
```

When you locate the `createuser` command, you can run the following command to create a superuser named `postgres` with an empty password (you may need to replace the path with the one you found):

```
sudo /opt/homebrew/opt/postgresql@15/bin/createuser -s postgres
```

The above command assumes that you run it from the root directory `/`. If you are in the directory where you found the `createuser` command, you can simply run the following command:

```
sudo ./createuser -s postgres
```

### Install and start PostgreSQL on Windows

1. If you are using a Windows, you can download the Windows installer from [PostgreSQL website](https://www.postgresql.org/download/windows/).

2. Follow the installation instructions. When asked to setup a password make a note of it, this will be the super user (root) password for the database system.

3. At the end of the installation, you may skip installing additional tools from stack builder (they are not necessary for our purposes).

### Install and start PostgreSQL on Linux

You are recommended to follow the steps listed on [the PostgreSQL official website](https://www.postgresql.org/download/linux/) to install PostgreSQL on a Linux machine.

To start PostgreSQL, you can run the following command:

```
service postgresql start
```

To stop PostgreSQL, you can run the following command:

```
service postgresql start
```

### Load the prepared PostgreSQL script

Before loading the script, you will need to create a database named `onlinestore` and use this database via the PostgreSQL console environment first. Different from SQLite and MySQL, there are no easy approach to merge these two steps into the script. 

#### Linux and Mac

You can follow the following steps to load the prepared script:

1. Open the terminal, and navigate into the `chapter_01` folder of this repository

2. Log in to the PostgreSQL console environment by running the following command:

```
psql -U postgres
```


1. Open the terminal, and navigate into the `chapter_02` folder of this repository

2. Log in to the PostgreSQL console environment by running the following command:

```
psql -U postgres
```
3. In the console environment, create a database named `onlinestore` by running the following command:

```
CREATE DATABASE onlinestore;
```

4. In the console environment, use the database `onlinestore` by running the following command:

```
\c onlinestore
```

5. Now you are ready to load the prepared script. The script prepared for PostgreSQL database is [`postgresql_db.sql`](./postgresql_db.sql). In the console environment, run the following command:

```
\i postgresql_db.sql
```

#### Windows

1. Open the "SQL Shell (psql)" from the Start Menu.

2. Hit enter to use the default option and provide the password when asked for the default user. This is a correct interaction that leads to successful prompt:

```
Server [localhost]: 
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (15.3)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=#
```

3. In the console environment, create a database named `onlinestore` by running the following command:

```
CREATE DATABASE onlinestore;
```

4. In the console environment, use the database `onlinestore` by running the following command:

```
\c onlinestore
```

5. Now you are ready to load the prepared script. The script prepared for PostgreSQL database is [`postgresql_db.sql`](./postgresql_db.sql). In the console environment, run the following command:

```
\i postgresql_db.sql
```

OR you may provide an exact path

```
\i C:/Users/user/Downloads/database-design-from-scratch/chapter_01/postgresql_db.sql
```

Note: The slashes are not the normal ones used in Windows (\\) but the forward slash needs to be used instead (/).

A successful import should show:

```
psql:C:/Users/tsike/Desktop/database-design-from-scratch/chapter_01/postgresql_db.sql:10: NOTICE:  table "product" does not exist, skipping
DROP TABLE
CREATE TABLE
INSERT 0 10
```

In the same console environment, you can run any SQL queries you want, including the examples covered by Chapter 1. You can always quit the PostgreSQL console by typing `\q` and pressing `Enter`.

## SQL server

### Install and start SQL server on Mac

Microsoft doesn’t support running an SQL server database directly on a Mac computer. You are recommended to run a Linux/Windows virtual machine first, and then install Oracle database on the virtual machine. [You can also use a Docker to achieve this goal](https://database.guide/how-to-install-sql-server-on-a-mac/).

### Install and start SQL server on Windows

You will need either the *Express edition* or the *Developer edition* for this purpose. Both versions are free, but the Express edition is limited in features. The Developer edition is also free but for development and testing purposes only, not for production.

You can follow the steps below to install SQL server on Windows:

1. Go to https://www.microsoft.com/en-us/sql-server/sql-server-downloads to download the installer for the edition you want.
2. Run the installer. You will be presented with a few options like "Basic", "Custom", and "Download Media". The "Basic" option should be fine for most cases, which will install the default configuration of SQL Server. 
3. After installation, you may need to install SQL Server Management Studio (SSMS) depending on if you want a graphical dashboard to manage SQL server. A link to download SSMS is usually provided at the end of the SQL Server installation process, or you can download it from https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16.
4. After installation, you may need to configure SQL Server, which involves setting up user accounts, configuring network protocols, or setting database properties. All such tasks can be done through SQL Server Management Studio. When everything is wrapped up, you may need to restart your computer.

### Install and start SQL server on Linux

You are recommended to [follow these steps] (https://blog.devart.com/how-to-install-sql-server-on-linux-ubuntu.html) to install SQL server on a Linux machine. If you want a graphical interface to manage your SQL server, then dbForge Studio is a good option. The above link also provides instructions on how to install dbForge Studio on a Linux machine.

### Load the prepared SQL server script

The script prepared for MySQL database is [`sql_server_db.sql`](./sql_server_db.sql). You can load the prepared script by following the steps below.

#### Linux

You can follow the following steps to load the prepared script:

1. Open the terminal, and navigate into the `chapter_01` folder of this repository
2. You need to connect to your SQL Server instance via your terminal. If you haven't set up any users yet, you'll likely need to connect with the default sa (system administrator) user. Run the following command in your terminal. You will be prompted to enter the password for the sa user -- if you follow the above link to install and configure your SQL server, you have already set up the password for the sa user. Please use that password.
```
sqlcmd -S localhost -U SA
```

3. Once connected to the SQL Server, you can execute your script file (`sql_server_db.sql`) you can run it using the following command:
```
:r ./sql_server_db.sql
```

4. After the script has executed, you can verify that the database and tables were created successfully. Use SQL commands to check:

```
USE onlinestore;
SELECT * FROM product;
```

#### Windows

1. Open Microsoft SQL Server Management Studio (SSMS) and connect to the server. If you are using the Express edition, the server name should be `localhost\SQLEXPRESS`. If you are using the Developer edition, the server name should be `localhost`. You can use Windows Authentication to connect to the server.
2. Navigate to File -> Open -> File, and load the script [`sql_server_db.sql`](./sql_server_db.sql).
3. Click the Execute button to execute the script. You should see the following output in the Messages tab:

```
(1 row affected)
(1 row affected)
(10 rows affected)
```
4. You can verify that the product has been imported by running the following commands in a new query window (Ctrl + N):

```
USE onlinestore;
SELECT * FROM product;
```

## Oracle database

### Install and start Oracle database on Mac or Linux

Oracle doesn’t support running an Oracle database directly on a Mac computer. [You are recommended to run a virtual machine first, and then install Oracle database on the virtual machine](https://database.guide/how-to-install-oracle-on-a-mac/).

Installing Oracle on a Linux machine is complicated and doesn't serve the learning purposes. If you need to do so, you can follow the steps listed on [the Oracle database official website](https://docs.oracle.com/en/java/java-components/advanced-management-console/2.21/install-guide/oracle-database-installation-and-configuration-advanced-management-console.html#GUID-DF2557D8-C727-4243-8387-6154E5C1C36A) to install Oracle database on a Linux machine. Please note that you need to use a supported Linux distribution like Oracle Linux, Red Hat Enterprise Linux, CentOS, or SUSE Linux Enterprise Server, and will need to create an Oracle account to download the installer. 

### Install and start Oracle database on Windows

You can download the Oracle database installer from [Oracle website](https://www.oracle.com/database/technologies/oracle-database-software-downloads.html). Scroll down and download the free version of Oracle, e.g., Oracle Database 21c XE (Express Edition). If it is a zip, remember to unzip the file once downloaded.

Follow the instructions to install Oracle database on your Windows machine:

1. Run the installer (setup.msi). Setup a root password for the database and make a note of it. Then proceed with the installation instructions.
2. After installation, you may need to install Oracle SQL Developer depending on if you want a graphical dashboard to manage Oracle database. A link to download Oracle SQL Developer is usually provided at the end of the Oracle database installation process, or you can download it from https://www.oracle.com/tools/downloads/sqldev-downloads.html.
3. After installation, you may need to configure Oracle database, which involves setting up user accounts, configuring network protocols, or setting database properties. All such tasks can be done through Oracle SQL Developer. When everything is wrapped up, you may need to restart your computer.

### Load the prepared Oracle script

1. Open SQL developer and connect to the database. Look for the plus icon on the left hand side of the screen and click on it. Then select "New Database Connection". You will be presented with a window to enter the connection details.
2. You can use the following information to connect to the database. If you are using the Express edition, the hostname should be `localhost`. If you are using the Developer edition, the hostname should be `localhost`. The port should be `1521`. The SID should be `XE`. The username is `sys` with role `SYSDBA` and the password that you've set during the installation. Also make sure to name the connection.
3. After the connection opens, use File -> Open from the left hand side corner of the top menu and open the oracle_db.sql file. Then click on the green play button to execute the script ("Run Script" or use F5). You should see the following output in the Script Output tab:

```
PL/SQL procedure successfully completed.


Table PRODUCT created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.

```

4. You can verify that the product has been imported by running the following commands in a new query window ("Unshared SQL Worksheet" or Ctrl + Shift + N):

```
SELECT * FROM product;
``` 