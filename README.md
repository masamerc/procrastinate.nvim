# procrastinate.nvim

## What is this?

`procrastinate.nvim` is a Neovim plugin that lets you effortlessly insert `TODO` comments into your code.

## Installation & Setup

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'masamerc/procrastinate.nvim'
```

Or, if you prefer [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
lazy { 'masamerc/procrastinate.nvim' }
```

### Configuration

You can customize the comment style for different file types using the `setup` method. Here’s an example:

```lua
require('procrastinate').setup({
  file_type_comment_chars_map = {
    kotlin = "//",  -- Add support for Kotlin
    ruby = "#",      -- Add support for Ruby
  }
})
```

This will override the default comment characters for the specified file types while keeping defaults for the others.

Here is the default:
```lua
file_type_comment_chars_map = {
  lua =  "--",
  rust = "//",
  python = "#",
  c = "//",
  cpp = "//",
  js = "//",
  css = "/*",
  scss = "/*",
}
```

This automatically creates a Vim command called `:InsertTodo`. Call it whenever you feel like procrastinating.

## Usage

1. **Add a TODO comment**

Simply position your cursor on any line of your code and run the following command:
```vim
:InsertTodo
```
or set up a keybinding:
```lua
vim.keymap.set('n', '<leader>t', ':InsertTodo<CR>')
```

This will automatically insert a `TODO` comment at the beginning of the current line, according to the file type’s comment style.

## Contributions

All contributions are welcome! If you'd like to support more languages, fix a bug, or just procrastinate on your actual work, feel free to submit a pull request.