#!/usr/bin/env bash
. settings.sh
mkdir -p "$encrypted" "$decrypted"
cat 1password_fs.plist | sed \
    -e "s#\\\$COMMAND_FS\\\$#$command_fs#" \
    -e "s#\\\$ENCRYPTED\\\$#$encrypted#"  \
    -e "s#\\\$DECRYPTED\\\$#$decrypted#"  \
    -e "s#\\\$OP\\\$#$op#" > "$plist_file"

launchctl load "$plist_file"

echo "Succesfully installed and loaded service"
