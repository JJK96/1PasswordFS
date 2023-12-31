#!/usr/bin/env bash
. settings.sh
mkdir -p "$encrypted" "$decrypted"
cat 1password_fs.plist | sed \
    -e "s#\\\$COMMAND_FS\\\$#$command_fs#" \
    -e "s#\\\$ENCRYPTED\\\$#$encrypted#"  \
    -e "s#\\\$DECRYPTED\\\$#$decrypted#"  \
    -e "s#\\\$OP\\\$#$op#" > "$plist_file"

launchctl load "$plist_file"

cat settings.sh <(tail +3 1passwordfs) > "$bin_dir/1passwordfs"
chmod +x "$bin_dir/1passwordfs"

echo "Succesfully installed and loaded service"
