#!/bin/bash

while true; do
	POSTS=$(wp db query 'SELECT ID FROM wp_vm_posts WHERE post_type = 'attachment' AND post_parent = 0 AND post_date < '2022-01-01' AND post_mime_type LIKE 'image%' LIMIT 10000;' --skip-column-names | paste -s -d ' ' -)
	# shellcheck disable=SC2237
	if ! [ -z "$POSTS" ]; then
		#wp post delete $POSTS --force
		echo Yes, this image
	else
		exit 0
	fi
done