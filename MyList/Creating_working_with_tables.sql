--Creating & working with tables

Use [superherodb]
Go

create Table tblGender (
 ID int NOT NULL Primary Key,
 Gender nvarchar(50) NOT NULL
)

--Alter the column as ForeignKey
Alter table tblPerson add constraint tblPerson_GenderID_FK
Foreign Key (GenderId) references tblGender (ID)

--Description
--Foreign keys are use to enforce database integrity. In layman's terms, A foreign key in one table points to a primary key in another table.
--The foreign key constraint prevents invalid data form being inserted into the foreign key column. 
--The values that you enter into the foreign key column, has to be one of the values contained in the table it points to.

--ADD CONSTRAINT tblPerson_GenderID_FK: Here, you are adding a constraint to the table. Constraints are rules that help maintain data integrity in a database. 
--In this case, you are adding a foreign key constraint with the name tblPerson_GenderID_FK