# Introduction to databases and SQL

The scripts that you can use to create databases/tables for this chapter are all contained in this folder. We will describe a few approaches to load the prepared scripts using different RDBMS and tools.

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

If you are using a Windows, you can download the ZIP file for Windows from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Install SQLite on Linux

If you are using a Linux, you can download the ZIP file for Linux from [SQLite website](https://www.sqlite.org/download.html), extract the archive, right click on the sqlite3 file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

### Load the prepared script

The script prepared for SQLite database is [`sqlite_db.sql`](./sqlite_db.sql). You can load the prepared script by:

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

## MySQL database

MySQL is a popular open-source RDBMS. We would recommend you to install MySQL in different ways depending on your operating system.

### Install MySQL on Mac

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

### Install MySQL on Windows

If you are using a Windows, you can download the ZIP file for Windows from [MySQL website](https://dev.mysql.com/downloads/mysql/), extract the archive, right click on the mysql.exe file, and click Open. The software will then open in the command line and you can execute any sql commands after that.

After installation, you may need to start the MySQL server. The process may vary slightly depending on the version you have installed, but typically you can follow these steps:

1. Open the Windows Command Prompt. You can do this by pressing the Windows key, typing "Command Prompt," and selecting the Command Prompt application from the search results.

2. Navigate to the MySQL installation directory. By default, it is usually installed in "C:\Program Files\MySQL\MySQL Server X.X" (where "X.X" represents the version number).

3. Once you're in the MySQL installation directory, run the following command to start the MySQL server:

```
mysqld --console
```

When you need to stop MySQL, you can simply press Ctrl+C in the Command Prompt window where the server is running. This will stop the server and return you to the command prompt.

### Install MySQL on Linux

You are recommended to follow the steps listed on [the MySQL official website](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-install-linux-quick.html) to install MySQL on a Linux machine.

To start MySQL, you can run the following command:

```
service mysql start
```

To stop MySQL, you can run the following command:

```
service mysql stop
```

### Load the prepared script

The script prepared for MySQL database is [`mysql_db.sql`](./mysql_db.sql). You can load the prepared script by:

1. Open the terminal
2. Navigate to the folder where you have downloaded the script
3. Run the following command, and you will be in the SQLite console:

```
    mysql -u root < mysql_db.sql
```

If you have set up a password for your MySQL server, you can run the following command instead:

```
    mysql -u root -p < mysql_db.sql
```

After that, you will be prompted to enter your password.

## PostgreSQL database

PostgreSQL is a popular open-source RDBMS. If you don't have PostgreSQL installed on your computer, you can follow the following approaches to install SQLite.

### Install PostgreSQL on Mac

The recommended approach to install MySQL on a Mac is via [Homebrew](https://brew.sh/). If you don't have Homebrew installed, you can find the latest installation instructions on [Homebrew website](https://brew.sh/), and follow the instructions to install Homebrew first.

Once you have Homebrew installed, you can run the following command to install MySQL in the terminal:

```
brew install postgresql@14
```

You may need to manually start PostgreSQL by running the following command:

```
brew services start postgresql@14
```

You can always stop PostgreSQL by running the following command:

```
brew services stop postgresql@14
```

On Windows or Linux a superuser will be set up automatically when you install PostgreSQL. The superuser is named `postgres` and its default password is empty. However, it may not be so on Mac. To make it consistent with other operating systems, you may need to locate the `createuser` on your Mac, and use it to create a superuser named `postgres` with an empty password.

The location of `createuser` may vary depending on the version of your Mac OS. Here are a few possibilities:

* `/usr/local/opt/postgresql@14/bin/createuser`
* `/usr/local/Cellar/postgresql@14/14.0/bin/createuser`
* `/opt/homebrew/bin/createuser`
* `/opt/homebrew/opt/postgresql@14/bin/createuser`

If you tried the above few options but still can't locate the `createuser` command, you can try to run the following command to locate it:

```
sudo find / -name createuser
```

When you locate the `createuser` command, you can run the following command to create a superuser named `postgres` with an empty password (you may need to replace the path with the one you found):

```
sudo /opt/homebrew/opt/postgresql@14/bin/createuser -s postgres
```

The above command assumes that you run it from the root directory `/`. If you are in the directory where you found the `createuser` command, you can simply run the following command:

```
sudo ./createuser -s postgres
```

### Install PostgreSQL on Windows

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


### Install PostgreSQL on Linux

You are recommended to follow the steps listed on [the PostgreSQL official website](https://www.postgresql.org/download/linux/) to install PostgreSQL on a Linux machine.

To start PostgreSQL, you can run the following command:

```
service postgresql start
```

To stop PostgreSQL, you can run the following command:

```
service postgresql start
```

### Load the prepared script

The script prepared for PostgreSQL database is [`postgresql_db.sql`](./postgresql_db.sql). You can load the prepared script by:

1. Open the terminal
2. Navigate to the folder where you have downloaded the script
3. Run the following command, and you will be in the SQLite console:

```
psql -U postgres -f postgresql_db.sql
```