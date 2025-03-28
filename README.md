# Database-Scripts
Handy Scripts for Database data gathering

### Connection Manager Powershell
Read ssis packages *dtsx from a folder and save the </DTS:connection Manager> and </DTS:ObjectData> from XML tree
Sample Output:
FileName	   FilePath	          ConnectionName	   ConnectionString
file1.dtsx	C:\path\file1.dtsx	ms	Data          Source=sql;Initial Catalog=assystdblicense;...
file1.dtsx	C:\path\file1.dtsx	google	Data      Source=SQLOntheInternte;Initial Catalog=assystdblicense;
file2.dtsx	C:\path\file2.dtsx	AnotherConn	Data  Source=...
