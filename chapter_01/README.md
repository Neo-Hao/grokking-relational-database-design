# Introduction to databases and SQL

The scripts that you can use to create databases/tables for this chapter are all contained in this folder. We will describe a few approaches to load the prepared scripts using different RDBMS and tools.

## SQLite online

SQLite online is a web-based tool that you can use to execute SQL queries. You can access it at [SQLite online](https://sqliteonline.com/).

The script prepared for SQLite online is `sqlite_online.sql`. You can load the prepared script by:

1. Navigate to SQLite Online (https://sqliteonline.com)
2. Click *Import* and load `sqlite_online.sql`
3. Click *Okay*

Now you should see the script executed in the right sidebar. You are ready to type into the console, follow the book, and execute SQL queries.

![](./images/sqlite_online.png){width=70%}

## SQLite database

SQLite is a lightweight RDBMS that you can use on your computer. If you don't have SQLite installed on your computer, you can download it from [SQLite website](https://www.sqlite.org/download.html) in general.

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

If you are using a Windows, you can download the ZIP file for Windows from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Install SQLite on Linux

If you are using a Linux, you can download the ZIP file for Linux from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Load the prepared script

The script prepared for SQLite database is `sqlite_db.sql`. You can load the prepared script by:

1. Open the terminal
2. Navigate to the folder where you have downloaded the script
3. Run the following command, and you will be in the SQLite console:

```
    sqlite3 onlinestore.db
```
4. Run the following command to load the script: 

```
    sqlite> .read sqlite_db.sql
```

5. Check if the table is created by running the following command:

```
    sqlite> .tables
``` 

If you see `products`, that means the script is loaded successfully, and the `product` table has been created.

You can always quit the SQLite console by typing `.quit` and pressing `Enter`.

## MariaDB database

MariaDB is a popular open-source RDBMS. You can download it from [MariaDB website](https://mariadb.org/download/).

The script prepared for MariaDB database is `mariadb_db.sql`. You can load the prepared script by:

## MySQL database

MySQL is a popular open-source RDBMS. You can download it from [MySQL website](https://www.mysql.com/downloads/). 

The script prepared for MySQL database is `mysql_db.sql`. You can load the prepared script by: