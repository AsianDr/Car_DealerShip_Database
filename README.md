# Car Dealership Database
*A relational database system for managing car manufacturers, dealerships, vehicles, employees, customers, inventory, and sales.*

## 📖 Overview
This project demonstrates the design and implementation of a **car dealership database** using SQL. The database models the core operations of a dealership system, including car manufacturers, dealership branches, vehicle inventory, employees, customers, and completed sales.

The project includes SQL scripts for creating the database schema, inserting sample data, running useful queries, and demonstrating SQL programming features such as functions, procedures, triggers, updates, and deletes.

This project is useful for learning how relational databases are structured and how SQL can be used to manage real-world business data.

---

## 🚀 Features
- Creates a complete **CarDealership2026** database
- Defines relational tables with primary keys and foreign keys
- Stores manufacturers, dealerships, cars, employees, customers, inventory, and sales
- Tracks whether cars are **Available**, **Reserved**, or **Sold**
- Calculates final sale price using discounts
- Includes sample dealership data from multiple car brands
- Demonstrates SQL queries using:
  - `JOIN`
  - `GROUP BY`
  - `HAVING`
  - `IN`
- Includes SQL programming examples:
  - user-defined function
  - stored procedure
  - trigger
- Includes examples of table updates and deletes

---

## 📁 Project Structure

```text
Car_DealerShip_Database/
├── 16_02170DatabaseScript1_2026.sql   # Database creation, schema, and sample data
├── 16_02170DatabaseScript2_2026.sql   # Queries, function, procedure, trigger, update, and delete examples
└── README.md                          # Project documentation
```

### 📌 Key Components

**`16_02170DatabaseScript1_2026.sql`**  
Creates the main database and all core tables. It also inserts sample data for manufacturers, dealerships, cars, employees, customers, inventory, and sales.

Main tables created:
- `Manufacturer`
- `Dealership`
- `Car`
- `Employee`
- `Customer`
- `Inventory`
- `Sale`

**`16_02170DatabaseScript2_2026.sql`**  
Contains SQL examples for querying and modifying the database.

Includes:
- sales overview query using multiple joins
- average car price query using `GROUP BY` and `HAVING`
- subquery using `IN`
- function for calculating discounted prices
- procedure for showing available cars
- trigger for updating inventory after a sale
- update example for employee salaries
- delete example for reserved inventory

---

## 🛠️ Technologies Used
- SQL
- MySQL / MySQL Workbench
- Relational database design
- Stored procedures
- SQL triggers
- SQL functions

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/AsianDr/Car_DealerShip_Database.git
cd Car_DealerShip_Database
```

### 2. Open MySQL
You can use either:
- MySQL Workbench
- MySQL command line
- another MySQL-compatible database client

### 3. Run the First Script
Run this file first:

```text
16_02170DatabaseScript1_2026.sql
```

This script will:
- drop the old `CarDealership2026` database if it exists
- create a new `CarDealership2026` database
- create all required tables
- insert sample data

### 4. Run the Second Script
After the database has been created, run:

```text
16_02170DatabaseScript2_2026.sql
```

This script will:
- execute example queries
- create a SQL function
- create a stored procedure
- create a trigger
- run update and delete examples

---

## ▶️ How to Run from the Command Line

If you are using the MySQL command line, you can run the scripts like this:

```bash
mysql -u root -p < 16_02170DatabaseScript1_2026.sql
mysql -u root -p < 16_02170DatabaseScript2_2026.sql
```

Replace `root` with your MySQL username if needed.

---

## 🧩 Database Design Summary

The database is designed around a car dealership business process:

1. A **manufacturer** produces cars.
2. A **dealership** stores and sells cars.
3. A **car** belongs to a manufacturer.
4. An **employee** works at a dealership.
5. A **customer** buys a car.
6. The **inventory** table tracks car availability.
7. The **sale** table records completed car sales.

The relationships between the tables are handled using foreign keys.

---

## 🔍 Example Use Cases

This database can be used to answer questions such as:

- Which cars have been sold?
- Which cars are currently available?
- Which employee handled each sale?
- Which customer bought which car?
- What is the average price of cars by manufacturer?
- Which dealerships sold cars?
- How does a sale update the inventory status?

---

## 📊 SQL Concepts Demonstrated

### Joins
Used to combine sale, car, customer, employee, and dealership information into one result.

### Aggregation
Used to calculate average car prices by manufacturer.

### Subqueries
Used to filter cars based on sales from selected dealerships.

### Functions
Used to calculate discounted sale prices.

### Stored Procedures
Used to display all currently available cars.

### Triggers
Used to automatically update inventory after a sale is inserted.

### Updates and Deletes
Used to modify employee salaries and remove reserved inventory records.

---

## 📝 Notes
- The scripts are intended to be run in order: **Script 1 first, Script 2 second**.
- Running Script 1 will recreate the database, so existing data in `CarDealership2026` will be deleted.
- The SQL syntax is written for MySQL-style databases.
- The project is mainly for database learning, demonstration, and coursework purposes.

---

## 📌 Future Improvements
- Add an ER diagram for the database schema
- Add more realistic dealership data
- Add views for common reports
- Add indexes for performance optimization
- Add more stored procedures for sales and inventory management
- Add a small frontend or backend application connected to the database

---

## 📄 License
No license file is currently included in the repository. Add a license if this project will be shared, reused, or extended publicly.
