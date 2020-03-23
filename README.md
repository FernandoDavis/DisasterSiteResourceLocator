# DisasterSiteResourceLocator_DB

To take full database backup:
pg_dump -U postgres dsrldb > DisasterSiteResourceLocator_DB\dsrldb_backup.sql

To restore database backup:
pg_dump -U postgres dsrldb < DisasterSiteResourceLocator_DB\dsrldb_backup.sql