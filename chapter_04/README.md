# Chapter 04 - Entities and Attributes

## ch3-er-diagram.png

The file demonstrates the final state of entities as described in Chapter 4. You can use an image viewer (e.g., Windows Photos) to view the entities.

## ch3-er-diagram.sql

The file generates tables in a database based on the final state of entities as described in Chapter 4. Refer to [../chapter_01/README.md](README.md) from Chapter 01 for instructions about importing a sql file in your respective database system (e.g., MySQL).

## ch3-er-diagram.mwb

The file is a MySQL Workbench Document that allows you to edit entity relationship diagrams and generate SQL CREATE TABLE statements based on these diagrams. The current file contains all entities as described in their final state in Chapter 4.

### MySQL Workbench Installation Instructions

#### Windows

- Visit the [https://dev.mysql.com/downloads/workbench/](MySQL Workbench Download Page).
- Download the mysql-workbench-community-8.0.33-winx64.msi file from "Other Downloads" section. The Download button is to the right. Make sure to download this file since if you download the MySQL Installer it will also install MySQL on your system (which we assume you already have installed from previous chapters and do not need to on this one).
- Follow the installation instructions from the installer.
- Once installed, double-click on the file or use File -> Open Model ... from within MySQL Workbench.
- Once you see the entities you can freely double-click and evaluate them as well as make any necessary changes.

Note: MySQL Workbench is an administration tool for MySQL as much as an ER diagramming software. There are extensive tutorials for using the software but specifically for Database Design, you can use this part of the manual as a reference: [https://dev.mysql.com/doc/workbench/en/wb-data-modeling.html](Database Design and Modeling)