# vim-run

A plugin to run the current file in a terminal split using neovim's terminal functionality.

*Requires [Neovim](https://neovim.io)*

## Install

[vim-plug](https://github.com/junegunn/vim-plug)

```vimscript
Plug 'sbdchd/vim-run'
```

## Usage

Use the command `:Run` to run the current file with the default shebang / command.

To specify a command to run the current file, pass the command and its arguments
to `:Run`. The filepath will be automatically appended.

```vimscript
:Run python3 -b -E
```

If you wish to end execution before the program has returned, simply type
`<ctrl> + c` or return to normal mode by hitting `<escape>` and then type `:q`.

If the file has a shebang, `:Run` will execute the file using that shebang.
Otherwise, `:Run` will use the default command for the filetype.

## Configuration [Optional]

You can define your own default commands for specific filetypes.

*Note:* Your command must be in the naming scheme `g:run_cmd_<FILETYPE>` and must
also include all necessary paths.

```vimscipt
let g:run_cmd_python = 'Python3' . fnameescape(expand('%:p'))
```

Enabled auto-closing of Run output window when the command exits.

```vim
let g:run_auto_close = 1
```

Choose the direction of splitting (up, down, left, right).

```vim
let g:run_split = 'down'
```
