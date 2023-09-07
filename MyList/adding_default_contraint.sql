Select * from tblGender
Select * from tblPerson

--Altering an existing column to add a default constraint:
ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GenderId

Insert into tblPerson (ID, Name, Email, GenderId) Values (10, 'Johnny', 'j@r.com', NULL)
--If we pass a NULL value it won't consider default value 3
--If we missed the value the default value is considered

--Altering an new column, with default value, to an existing table:
ALTER TABLE {TABLE_NAME}
ADD {COLUMN_NAME} {DATA_TYPE} {NULL | NOT NULL}
CONSTRAINT {CONSTRAINT_NAME} DEFAULT {DEFAULT_VALUE}

--Dropping a constraint:
ALTER TABLE {TABLE_NAME}
DROP CONSTRAINT {CONSTRAINT_NAME}