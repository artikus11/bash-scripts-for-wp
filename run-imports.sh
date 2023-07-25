#!/bin/env bash
#example for run './.local/bin/run-imports.sh web/www/vamvidnee.ru/'

DIR=$1
# shellcheck disable=SC2129
# shellcheck disable=SC2046
echo $(date +%Y-%m-%d-%H:%M:%S) " run import" >> "$DIR"/backup-import.log

# shellcheck disable=SC2086
/usr/bin/php /usr/local/bin/wp all-import run 37,14,18,15,34,35,43,31,46,36,45,41 --path="$DIR" >> $DIR/backup-import.log

# shellcheck disable=SC2046
echo $(date +%Y-%m-%d-%H:%M:%S) " stop import" >> "$DIR"/backup-import.log
