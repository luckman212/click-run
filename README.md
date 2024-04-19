<img src=./icon.png width=128>

## click-run

Quick little PoC to answer https://apple.stackexchange.com/questions/471930

## install

1. clone this repo
2. copy `click_run.sh` to your `$PATH` and make sure it's executable (`chmod +x`)
3. edit your configuration file (defaults to `program.list` or whatever you want to use)
> _the format of the config file is `command_name (literal tab) command`_

## run

Execute `click_run.sh [--dry-run] [/path/to/config]`

Since it uses [fzf](https://github.com/junegunn/fzf) you can type a command name to filter the list, select with the arrow keys, or use the mouse.

Navigate to select your command (a preview of the command will be shown at the bottom of the screen as you highlight each row)

Double click or press `[enter]` — your command will be executed! (if invoked with the `--dry-run` flag, the command will only be previewed, without actually be executed).

## ⚠️ This is potentially dangerous!

Passing arbitrary strings to shell `eval` can result in unexpected (or worse) results. Test your commands with `--dry-run` if you're not sure! The program does very minimal error-checking.
