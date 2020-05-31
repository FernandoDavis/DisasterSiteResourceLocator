# DisasterSiteResourceLocator_DB

To take full database backup:
pg_dump -U postgres dsrldb > DisasterSiteResourceLocator_DB\dsrldb_backup.backup

To restore database backup:
pg_restore --dbname=dsrldb --verbose "DisasterSiteResourceLocator_DB\dsrldb_backup.backup"  

# Team Members
Fernando Davis Rivera  
Cristian Rivera Soto  
Jose Tua Colon  

# Database Table Creation and Data Update
This file goes through every table in the data base and creates it if it doesnt exists or truncates it.
After "resetting" every table with the references and serial ids, the ten or more default inserts for each table
is executed.
[dsrldb.dataupdate.sql](https://github.com/FernandoDavis/DisasterSiteResourceLocator_DB/blob/master/dsrldb.dataupdate.sql)

# Report for Phase 1  
Report will be located in the main directory.  
Report can also be accesible through Google Docs.  
[Link here](https://docs.google.com/document/d/153xwtV8uYqAxtGP2Di6aW4pcHZcw13blUjMa0i0hdF0/edit?usp=sharing)

# Report for Phase 2  
Report will be located in the main directory.  
Report can also be accesible through Google Docs.  
[Link here](https://docs.google.com/document/d/1VeN0_9ecVGl5V3ZjH2p8qeKRRHcSKwZGHhS7hnA5kcc/edit?usp=sharing)

# Postman
Here, we will place the link for the team's logs for when requests are made.  
[Link here](https://warped-water-9605.postman.co/workspaces/b6bb794f-58e0-416a-81c5-f831a2e127fd/history)
