![so yeah vim is like this different paradigm where your entire experience changes depending on the mode this is called modal editing and did you know that people actually spend the most time editing and navigating files instead of writing new code it's like painting where you have to prepare your brushes and palettes and canvas and shit and vim lets you do that but with text and you can totally customize it and](https://i.imgflip.com/85nqea.jpg)

## Keymap

The keymap is losely based on [Zed's Vim Mode](https://zed.dev/docs/vim) and
[`echasnovski/nvim`](https://github.com/echasnovski/nvimhttps://github.com/echasnovski/nvim).

### Language server

| Command               | Shortcut                       | Plugin                                                       |
| --------------------- | ------------------------------ | ------------------------------------------------------------ |
| Hover symbol          | <kbd>K</kbd>                   | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Go to definition      | <kbd>gd</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Go to declaration     | <kbd>gD</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Go to implementation  | <kbd>gi</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Go to type definition | <kbd>go</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Go to references      | <kbd>gr</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Signature help        | <kbd>gs</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Show code actions     | <kbd>g.</kbd>                  | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Rename                | <kbd>cd</kbd> or <kbd>F2</kbd> | [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) |
| Next Reference        | <kbd>]</kbd><kbd>]</kbd>       | [`snacks.words`](https://github.com/folke/snacks.nvim)       |
| Previous Reference    | <kbd>[</kbd><kbd>[</kbd>       | [`snacks.words`](https://github.com/folke/snacks.nvim)       |
| Format                | <kbd>F3</kbd>                  |                                                              |

### Diagnostics

| Command                   | Shortcut                                 | Plugin                                                        |
| ------------------------- | ---------------------------------------- | ------------------------------------------------------------- |
| Go to next diagnostic     | <kbd>]d</kbd>                            |                                                               |
| Go to previous diagnostic | <kbd>[d</kbd>                            |                                                               |
| Hover diagnostic          | <kbd>gh</kbd>                            |                                                               |
| Open diagnostics          | <kbd>SPACE</kbd><kbd>e</kbd><kbd>d</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open buffer diagnostics   | <kbd>SPACE</kbd><kbd>e</kbd><kbd>D</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |

### Git

| Command             | Shortcut      | Plugin                                                  |
| ------------------- | ------------- | ------------------------------------------------------- |
| Go to next hunk     | <kbd>]h</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to last hunk     | <kbd>]H</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to previous hunk | <kbd>[h</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to first hunk    | <kbd>[H</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Reset hunk          | <kbd>gH</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |

| Text Objects | Shortcut      | Plugin                                                  |
| ------------ | ------------- | ------------------------------------------------------- |
| Hunk         | <kbd>gh</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |

### Explore

| Command                 | Shortcut                                 | Plugin                                                        |
| ----------------------- | ---------------------------------------- | ------------------------------------------------------------- |
| Open directory          | <kbd>SPACE</kbd><kbd>e</kbd><kbd>e</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)     |
| Open file directory     | <kbd>SPACE</kbd><kbd>e</kbd><kbd>f</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)     |
| Open config directory   | <kbd>SPACE</kbd><kbd>e</kbd><kbd>c</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)     |
| Open diagnostics        | <kbd>SPACE</kbd><kbd>e</kbd><kbd>d</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open buffer diagnostics | <kbd>SPACE</kbd><kbd>e</kbd><kbd>D</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open symbols            | <kbd>SPACE</kbd><kbd>e</kbd><kbd>s</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
