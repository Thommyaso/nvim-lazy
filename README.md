# Neovim config

My personal Neovim setup.

This uses **lazy.nvim** as a package manager. It's NOT LazyVim (the preconfigured distribution).

## What's in here

- LSP setup for language servers
- Telescope for file/text searching
- Treesitter for syntax highlighting
- Git stuff (fugitive, lazygit, gitsigns)
- Undotree for undo history
- Auto tag closing
- Surround motions
- TMUX navigation integration
- Custom snippets for JavaScript/React Native

## Structure

```
lua/
├── config/         # general vim settings and lazy.nvim bootstrap
├── plugins/        # plugin configurations (auto-loaded by lazy)
└── custom/         # custom snippets and other stuff

after/plugin/       # plugin-specific keybindings and setup
```

Leader key is space.
