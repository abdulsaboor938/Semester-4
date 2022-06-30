-- This is DML part of database definition
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

-- Insert rows into table
-- let there be N columns in a table
INSERT INTO tableName
values
(Column1Value,Column2Value, Column3Value,ColumnNValue), --row 1
(Column1Value,Column2Value, Column3Value,ColumnNValue), --row2
(Column1Value,Column2Value, Column3Value,ColumnNValue) -- row 3
-- Or 
INSERT INTO tableName(ColumnX,ColumnY) -- List of Columns
values
(ColumnXValue,ColumnYValue), --Row 1 list of Corrrespong column values
(ColumnXValue,ColumnYValue), --Row 2
(ColumnXValue,ColumnYValue) --Row 3
---------------------------------------------------------------------------------------------------------------
-- deleting a specific row from table
delete from tablename
where condition=true

delete from tablename -- this condition works same as truncate table by deleting all rows in a table
---------------------------------------------------------------------------------------------------------------
-- updating rows of a table by a given condition
update tablename
set column1='value1', column2='value2'
where condition=true