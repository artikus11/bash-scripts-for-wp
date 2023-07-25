#!/bin/env bash
#example path for run './.local/bin/run-imports.sh web/www/vamvidnee.ru/'

DIR=$1

importid=(37 14 18 15 34 35 43 31 46 36 45 41)

echo -n > $DIR/backup-import.log 

echo $(date +%Y-%m-%d-%H:%M:%S) "--> Run all imports" >> $DIR/backup-import.log

for i in ${importid[@]}; do

    echo $(date +%Y-%m-%d-%H:%M:%S)  "> Start import ID: $i" >> $DIR/backup-import.log

    /usr/bin/php /usr/local/bin/wp all-import run $i --path=$DIR >> $DIR/backup-import.log

    if [ $? -eq 0 ]; then

        echo $(date +%Y-%m-%d-%H:%M:%S)  "> Final import ID: $i ; Status [ ok ]" >> $DIR/backup-import.log

    else

        echo $(date +%Y-%m-%d-%H:%M:%S)  "> Final import ID: $i ; Status [ fail ]" >> $DIR/backup-import.log

    fi
done

echo $(date +%Y-%m-%d-%H:%M:%S) "--> Stop all imports" >> $DIR/backup-import.log
