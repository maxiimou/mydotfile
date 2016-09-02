#!/bin/sh

DESTINATION=${1:-./keywords.sql}
TEMP_SQL_SCRIPT=/tmp/sync_chrome_sql_script
echo “Exporting Chrome keywords to $DESTINATION...”
cd /media/cameo/656aa972-e740-4ee5-a774-688a3641d7da/home/cameo/.config/chromium/Default/
echo .output $DESTINATION > $TEMP_SQL_SCRIPT
echo .dump keywords >> $TEMP_SQL_SCRIPT
sqlite3 -init $TEMP_SQL_SCRIPT Web\ Data .exit
rm $TEMP_SQL_SCRIPT
