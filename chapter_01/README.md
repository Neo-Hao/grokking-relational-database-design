# Introduction to databases and SQL

The scripts that you can use to create databases/tables for this chapter are all contained in this folder. We will describe a few approaches to load the prepared scripts using different RDBMS and tools.

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
2. Run the following command, and you will be in the SQLite console environment:

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

The script prepared for MySQL database is [`mysql_db.sql`](./mysql_db.sql). You can load the prepared script by:

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

6. You should see records on a table.

### Using the prepared MySQL script

Now you have loaded the script. To query the database and table created by the script, you will need to navigate to the MySQL console environment. You can do this by running the following command:

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

### Create the database

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