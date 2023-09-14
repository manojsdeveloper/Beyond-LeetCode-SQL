--To create the database graphically
--1. Right Click on Databases folder in the Object explorer
--2. Select New Database
--3. In the New Database dialog box, enter the Database name and click OK.


--To Create the database using a query
Create database DatabaseName


--Whether, you create a database graphically using the designer or, using a query, the following 2 files gets generated.
-- .MDF file - Data File (Contains actual data)
-- .LDF file - Transaction Log file (Used to recover the database)


-- To alter a database, once it's created 
Alter database DatabaseName Modify Name = NewDatabaseName


-- Alternatively, you can also use system stored procedure

Execute sp_renameDB 'OldDatabaseName','NewDatabaseName'


--To Delete or Drop a database
Drop Database DatabaseThatYouWantToDrop


--Dropping a database, deletes the LDF and MDF files.


--You cannot drop a database, if it is currently in use. You get an error stating - Cannot drop database "NewDatabaseName" because it is currently in use. So, if other users are connected, you need to put the database in single user mode and then drop the database.
Alter Database DatabaseName Set SINGLE_USER With Rollback Immediate


--With Rollback Immediate option, will rollback all incomplete transactions and closes the connection to the database.
--Note: System databases cannot be dropped.
