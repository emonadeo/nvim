![so yeah vim is like this different paradigm where your entire experience changes depending on the mode this is called modal editing and did you know that people actually spend the most time editing and navigating files instead of writing new code it's like painting where you have to prepare your brushes and palettes and canvas and shit and vim lets you do that but with text and you can totally customize it and](https://i.imgflip.com/85nqea.jpg)

<!-- TODO: Add markdown formatter -->
<!-- TODO: Add flake -->
<!-- TODO: Proper documentation -->

## Keymap

The keymap is losely based on [Zed's Vim Mode](https://zed.dev/docs/vim) and
[`echasnovski/nvim`](https://github.com/echasnovski/nvim).

### Language server

| Command               | Shortcut                     | Plugin                                                                                  |
| --------------------- | ---------------------------- | --------------------------------------------------------------------------------------- |
| Hover symbol          | <kbd>K</kbd>                 |                                                                                         |
| Show code actions     | <kbd>gra</kbd>               |                                                                                         |
| Go to implementation  | <kbd>gri</kbd>               |                                                                                         |
| Rename                | <kbd>grn</kbd>               |                                                                                         |
| Go to references      | <kbd>grr</kbd>               |                                                                                         |
| Go to type definition | <kbd>grt</kbd>               |                                                                                         |
| Signature help        | <kbd>Ctrl</kbd>+<kbd>S</kbd> |                                                                                         |
| Next Reference        | <kbd>]</kbd><kbd>]</kbd>     | [`snacks.words`](https://github.com/folke/snacks.nvim)                                  |
| Previous Reference    | <kbd>[</kbd><kbd>[</kbd>     | [`snacks.words`](https://github.com/folke/snacks.nvim)                                  |
| Jump to context       | <kbd>[</kbd><kbd>c</kbd>     | [`nvim-treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context) |

### Completion

| Command                                   | Shortcut                         | Plugin                                             |
| ----------------------------------------- | -------------------------------- | -------------------------------------------------- |
| Trigger completion / Toggle documentation | <kbd>Ctrl</kbd>+<kbd>Space</kbd> | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Hide                                      | <kbd>Ctrl</kbd>+<kbd>h</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Previous                                  | <kbd>Ctrl</kbd>+<kbd>j</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Next                                      | <kbd>Ctrl</kbd>+<kbd>k</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Accept                                    | <kbd>Ctrl</kbd>+<kbd>l</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Scroll documation up                      | <kbd>Ctrl</kbd>+<kbd>u</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Scroll documation down                    | <kbd>Ctrl</kbd>+<kbd>d</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |
| Toggle signature                          | <kbd>Ctrl</kbd>+<kbd>s</kbd>     | [`blink.cmp`](https://github.com/Saghen/blink.cmp) |

### Operators

| Command                           | Shortcut      | Plugin                                                         |
| --------------------------------- | ------------- | -------------------------------------------------------------- |
| Replace text region with register | <kbd>cr</kbd> | [`mini.operator`](https://github.com/nvim-mini/mini.operators) |
| Exchange text regions             | <kbd>cx</kbd> | [`mini.operator`](https://github.com/nvim-mini/mini.operators) |
| Multiply text regions             | <kbd>gm</kbd> | [`mini.operator`](https://github.com/nvim-mini/mini.operators) |
| Sort text region                  | <kbd>gs</kbd> | [`mini.operator`](https://github.com/nvim-mini/mini.operators) |
| Evaluate text region              | <kbd>g=</kbd> | [`mini.operator`](https://github.com/nvim-mini/mini.operators) |

<!-- TODO: Resolve conflict between `gs` mappings -->

### Diagnostics

| Command                   | Shortcut                                 | Plugin                                                        |
| ------------------------- | ---------------------------------------- | ------------------------------------------------------------- |
| Go to next diagnostic     | <kbd>]d</kbd>                            |                                                               |
| Go to previous diagnostic | <kbd>[d</kbd>                            |                                                               |
| Hover diagnostic          | <kbd>gh</kbd>                            |                                                               |
| Open diagnostics          | <kbd>SPACE</kbd><kbd>e</kbd><kbd>d</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open buffer diagnostics   | <kbd>SPACE</kbd><kbd>e</kbd><kbd>D</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |

### Git

| Command             | Shortcut      | Plugin                                                |
| ------------------- | ------------- | ----------------------------------------------------- |
| Go to next hunk     | <kbd>]h</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to last hunk     | <kbd>]H</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to previous hunk | <kbd>[h</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Go to first hunk    | <kbd>[H</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |
| Reset hunk          | <kbd>gH</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |

| Text Objects | Shortcut      | Plugin                                                |
| ------------ | ------------- | ----------------------------------------------------- |
| Hunk         | <kbd>gh</kbd> | [`mini.diff`](https://github.com/nvim-mini/mini.diff) |

### Explore

| Command                 | Shortcut                                 | Plugin                                                        |
| ----------------------- | ---------------------------------------- | ------------------------------------------------------------- |
| Open directory          | <kbd>SPACE</kbd><kbd>e</kbd><kbd>e</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)       |
| Open file directory     | <kbd>SPACE</kbd><kbd>e</kbd><kbd>f</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)       |
| Open config directory   | <kbd>SPACE</kbd><kbd>e</kbd><kbd>c</kbd> | [`mini.files`](https://github.com/nvim-mini/mini.files)       |
| Open diagnostics        | <kbd>SPACE</kbd><kbd>e</kbd><kbd>d</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open buffer diagnostics | <kbd>SPACE</kbd><kbd>e</kbd><kbd>D</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
| Open symbols            | <kbd>SPACE</kbd><kbd>e</kbd><kbd>s</kbd> | [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim) |
