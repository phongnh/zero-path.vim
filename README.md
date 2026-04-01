# zero-path.vim

A Vim plugin to copy file and directory paths to the clipboard.

## Features

- Copy relative, home-relative, or absolute path of the current file
- Copy relative, home-relative, or absolute path of the current file's directory
- Optionally append the current line number to the copied path
- Default key mappings for all commands
- Works with Vim and Neovim (Lua)

## Installation

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'phongnh/zero-path.vim'
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim) (Neovim)

```lua
use 'phongnh/zero-path.vim'
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Neovim)

```lua
{ 'phongnh/zero-path.vim' }
```

## Commands

All path commands support a `!` (bang) variant that **appends the current line number** to the copied path.

| Command | Mapping | Description |
|---------|---------|-------------|
| `:CopyPath[!]` | `yc` / `yC` | Copy path relative to cwd (with line number if `!`) |
| `:CopyFullPath[!]` | `yp` / `yP` | Copy path relative to home directory (with line number if `!`) |
| `:CopyAbsolutePath[!]` | `yu` / `yU` | Copy absolute path (with line number if `!`) |
| `:CopyDirPath` | `y.` | Copy directory path relative to cwd |
| `:CopyFullDirPath` | `yd` | Copy directory path relative to home directory |
| `:CopyAbsoluteDirPath` | `yD` | Copy absolute directory path |

## Configuration

### Disable default mappings

To disable the default key mappings, set this before the plugin loads:

```vim
let g:zero_path_mappings = 0
```

## Versions

The plugin ships all three implementations in a single repository and selects the right one automatically at startup — no configuration required:

| Implementation | File | Loaded when |
|---|---|---|
| Vimscript | `plugin/zero_path.vim` | Vim |
| Lua | `plugin/zero_path.lua` | Neovim |

## License

MIT License

## Credits

Created by Phong Nguyen
