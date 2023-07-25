#!/bin/env bash
#example for run './.local/bin/run-imports.sh web/www/vamvidnee.ru/'

DIR=$1

/usr/bin/php /usr/local/bin/wp surge flush --path=$DIR