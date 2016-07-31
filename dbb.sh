#!/bin/bash
#: Title	: dbb
#: Usage	:
#: Date		: 31-07-2016
#: Author	: "Aster Anto"
#: Version	: 1.0
#: Description	: For postgresdb backup, house keeping and vaccum
#: Options	: Supposed to go in as cron
BACKUP_FOLDER="/home/backups/database/postgresql/";
PG_DUMPALL_OPTS="-c -f";

backup ()
{
	date=$(date +"%d%m%Y_%H%M%S");
	filename="${BACKUP_FOLDER}db_dumpall_${date}.sql";
	pg_dumpall ${PG_DUMPALL_OPTS} $filename;
	gzip $filename;
	echo "Backup added -> $filename";
}

delete_old_files ()
{
	find ${BACKUP_FOLDER} -mtime +30 -type f -name '*.sql.gz' -exec rm -fv {} \;
}

vacuum ()
{
	echo "Performing Vacuumdb";
	vacuumdb -a;
}

cd ${BACKUP_FOLDER};
backup;
delete_old_files;
vacuum;  
exit 0;

