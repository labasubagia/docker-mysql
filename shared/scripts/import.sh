#!/bin/bash 

# store start date to a variable
start_date=`date`

curr_dir=$(dirname "$0")

table_name="btw_prod"
dumpfile="/$curr_dir/../databases/btw_cat.sql"

ddl="set names utf8; "
ddl="$ddl set global net_buffer_length=1000000;"
ddl="$ddl set global max_allowed_packet=1000000000; "
ddl="$ddl SET foreign_key_checks = 0; "
ddl="$ddl SET UNIQUE_CHECKS = 0; "
ddl="$ddl SET AUTOCOMMIT = 0; "
ddl="$ddl USE $table_name; "
ddl="$ddl source $dumpfile; "
ddl="$ddl SET foreign_key_checks = 1; "
ddl="$ddl SET UNIQUE_CHECKS = 1; "
ddl="$ddl SET AUTOCOMMIT = 1; "
ddl="$ddl COMMIT ; "

echo "Import started: OK"

time mysql -h 127.0.0.1 -u root -proot -e "$ddl"

# store end date to a variable
end_date=`date`

echo "Start import:$start_date"
echo "End import:$end_date"
