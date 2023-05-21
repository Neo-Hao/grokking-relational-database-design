# Introduction to databases and SQL

The scripts that you can use to create databases/tables for this chapter are all contained in this folder. We will describe a few approaches to load the prepared scripts using different RDBMS and tools.

- [SQLite online](#sqlite-online)
- [SQLite database](#sqlite-database)
    - [Install SQLite](#install-sqlite)
    - [Load the prepared SQLite script](#load-the-prepared-sqlite-script)
- [MySQL database](#mysql-database)
    - [Install and start MySQL](#install-and-start-mysql)
    - [Load the prepared MySQL script](#load-the-prepared-mysql-script)
- [PostgreSQL database](#postgresql-database)
    - [Install and start PostgreSQL on Mac](#install-and-start-postgresql)
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

### Install SQLite

In case you jump to this chapter directly, you need to refer to [the README file](../chapter_01/README.md) in the `chapter_01` folder to install SQLite first.

### Load the prepared SQLite script

The script prepared for SQLite database is [`sqlite_db.sql`](./sqlite_db.sql). You can load the prepared script by:

1. Open the terminal, navigate into the `chapter_02` folder of this repository
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

If you see `products` and `review`, that means the script is loaded successfully. In the same SQLite console environment, you can run any SQL queries you want, including the examples covered by Chapter 2. You can always quit the SQLite console by typing `.quit` and pressing `Enter`.

## MySQL database

MySQL is a popular open-source RDBMS. We would recommend you to install MySQL in different ways depending on your operating system.

### Install and start MySQL

In case you jump to this chapter directly, you need to refer to [the README file](../chapter_01/README.md) in the `chapter_01` folder to install MySQL first.

### Load the prepared MySQL script

The script prepared for MySQL database is [`mysql_db.sql`](./mysql_db.sql). You can load the prepared script by:

1. Open the terminal, navigate into the `chapter_02` folder of this repository
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

In the MySQL console environment, you can run any SQL queries you want, including the examples covered by Chapter 2. You can always quit the MySQL console by typing `quit` and pressing `Enter`.

## PostgreSQL database

PostgreSQL is a popular open-source RDBMS. If you don't have PostgreSQL installed on your computer, you can follow the following approaches to install SQLite.

### Install and start PostgreSQL

In case you jump to this chapter directly, you need to refer to [the README file](../chapter_01/README.md) in the `chapter_01` folder to install PostgreSQL first.

### Load the prepared PostgreSQL script

Before loading the script, you will need to create a database named `onlinestore` and use this database via the PostgreSQL console environment first. Different from SQLite and MySQL, there are no easy approach to merge these two steps into the script. 

You can follow the following steps to load the prepared script:

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

In the same console environment, you can run any SQL queries you want, including the examples covered by Chapter 2. You can always quit the PostgreSQL console by typing `\q` and pressing `Enter`.