# procrastinate.nvim
![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white&style=for-the-badge)
> [!Note]
> **Disclaimer**: This project was created as a practice project and for fun. It’s not meant to be taken too seriously, but if it brings you joy or helps you out, that’s a bonus.

## What is this? & Motivation

`procrastinate.nvim` is a Neovim plugin that lets you effortlessly insert `TODO` comments into your code.

I created this little plugin to learn how a neovim plugin works and how to make one.

## Installation & Setup

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'masamerc/procrastinate.nvim'
```

Or, if you prefer [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
    "masamerc/procrastinate.nvim",
    config = function ()
        require('procrastinate').setup()
    end
}
```

This automatically creates a Vim command called `:InsertTodo`. Call it whenever you feel like procrastinating.

## Usage

Simply position your cursor on any line of your code and run the following command:
```vim
:InsertTodo
```
or set up a keybinding:
```lua
vim.keymap.set("n", "<leader>t", "<cmd>InsertTodo<CR>", { desc = "Insert todo" })
```

This will automatically insert a `TODO` comment at the beginning of the current line, according to the file type’s comment style.

## Contributions

All contributions are welcome! If you'd like to support more languages, fix a bug, or just procrastinate on your actual work, feel free to submit a pull request.
