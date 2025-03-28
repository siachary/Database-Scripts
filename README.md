# Database-Scripts
Handy Scripts for Database data gathering

### Connection Manager Powershell
Read ssis packages *dtsx from a folder and save the </DTS:connection Manager> and </DTS:ObjectData> from XML tree.

Sample Output:
## Connection Managers

| File Name   | Connection Name | Connection String |
|------------|----------------|------------------------------------------------|
| file1.dtsx | a              | Data Source=sql;Initial Catalog=dblicense;... |
| file1.dtsx | b              | Data Source=intsql;Initial Catalog=dblicense; |

