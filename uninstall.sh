#!/usr/bin/env bash
. settings.sh
launchctl unload "$plist_file"
rm "$plist_file"
rm -r "$onepasswordfs_dir"

echo "Successfully uninstalled"
