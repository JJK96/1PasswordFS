#!/usr/bin/env bash
. settings.sh
launchctl unload "$plist_file"
launchctl load "$plist_file"
