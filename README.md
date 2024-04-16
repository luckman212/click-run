<img src=./icon.png width=128>

## click-run

Quick little PoC to answer https://apple.stackexchange.com/questions/471930

## install

1. clone this repo
2. copy `click_run.sh` to your `$PATH` and make sure it's executable (`chmod +x`)
3. edit your configuration file (defaults to `program.list` or whatever you want to use)
> _the format of the config file is `command_name (literal tab) command`_

## run

Execute `click_run.sh [/path/to/config]`

Since it uses [fzf](https://github.com/junegunn/fzf) you can type a command name to filter the list, select with the arrow keys, or use the mouse.

Navigate to select your command (a preview of the command will be shown at the bottom of the screen as you highlight each row)

Double click or press `[enter]` — your command will be executed!

> ⚠️ this is potentially dangerous!
> passing arbitrary strings to shell `eval` could be dangerous. Please test your commands! The program does not do any additional error-checking.
