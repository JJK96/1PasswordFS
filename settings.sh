#!/usr/bin/env bash
onepasswordfs_dir="$HOME/1PasswordFS"
encrypted="${onepasswordfs_dir}/encrypted"
decrypted="${onepasswordfs_dir}/decrypted"
command_fs=$(which command_fs)
op=$(which op)
plist_file="$HOME/Library/LaunchAgents/1password_fs.plist"
bin_dir="/usr/local/bin"
