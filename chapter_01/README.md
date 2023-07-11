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

If you are using a Windows, you can download the ZIP file for Windows from [MySQL website](https://dev.mysql.com/downloads/mysql/), extract the archive, right click on the mysql.exe file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

After installation, you may need to start the MySQL server. The process may vary slightly depending on the version you have installed, but typically you can follow these steps:

1. Open the Windows Command Prompt. You can do this by pressing the Windows key, typing "Command Prompt," and selecting the Command Prompt application from the search results.

2. Navigate to the MySQL installation directory. By default, it is usually installed in "C:\Program Files\MySQL\MySQL Server X.X" (where "X.X" represents the version number).

3. Once you're in the MySQL installation directory, run the following command to start the MySQL server:

```
mysqld --console
```

When you need to stop MySQL, you can simply press Ctrl+C in the Command Prompt window where the server is running. This will stop the server and return you to the command prompt.

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

If you are using a Windows, you can download the ZIP file for Windows from [PostgreSQL website](https://www.postgresql.org/download/windows/), extract the archive, right click on the psql.exe file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

To start PostgreSQL, you can run the following command:

```
net start postgresql-version-number
```

To stop PostgreSQL, you can run the following command:

```
net stop postgresql-version-number
```

You will need to replace the `version-number` with the version number of your PostgreSQL installation.


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

You can follow the following steps to load the prepared script:

1. Open the terminal, and navigate into the `chapter_01` folder of this repository

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

In the same console environment, you can run any SQL queries you want, including the examples covered by Chapter 1. You can always quit the PostgreSQL console by typing `\q` and pressing `Enter`.