# 1Password FS

A FUSE filesystem that automatically injects 1Password secrets into config files.
It uses [CommandFS] to do the heavy lifting.

Currently, all installation scripts are for MacOS, but it should be easy to perform similar steps on Linux, please make a PR if you have updated the install scripts to also work on Linux.

## Install

### MacOS

(Optional) edit settings.sh to set the destination directory to your liking

```
make install
```

### Other

- Install FUSE
- Install [CommandFS]
- Ensure that 1PasswordFS is started at login (e.g. using systemd)

## Usage

Put your config files in ~/1PasswordFS/encrypted, then symlink the same file from ~/1PasswordFS/decrypted to the correct location for whatever script is using it.

example:

```
$ cat ~/1PasswordFS/encrypted/config.ini
password="op://Private/something/password"
$ ln -s ~/1PasswordFS/decrypted/config.ini ~/.config/someprogram/config.ini
$ cat ~/.config/someprogram/config.ini
password="mypassword"
```

## Limitations

Currently, if you read a file while 1Password is still locked, it freezes the daemon. This is due to [a bug in 1password-cli](https://1password.community/discussion/139010/cli-hangs-when-requesting-items).
You can fix this by running `1passwordfs restart` or the `./reload.sh` script.

[CommandFS]: https://github.com/JJK96/CommandFS
