# Vim Remaps Cheatsheet

## Normal & Visual Mode
```vim
vim.keymap.set("x", "<leader>p", [["_dP]])              # `x` delete the selected text and paste it before the current line.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])        # `n` and `v` yank the selected text to the system clipboard.
vim.keymap.set("n", "<leader>Y", [["+Y]])               # `n` in normal mode to yank the current line to the system clipboard.
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])        # `n` and `v` delete the selected text.
```

## Insert Mode
```vim
vim.keymap.set("i", "<C-c>", "<Esc>")                   # `i` in insert mode to `<Esc>` for quicker escape.
```

## Misc
```vim
vim.keymap.set("n", "Q", "<nop>")                        # `Q` in normal mode to do nothing (<nop>).
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")                       # `Ctrl+f` in normal mode to open a new tmux window with a specific command.
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)     # `<leader>f` in normal mode to format the current buffer using LSP.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")         # `Ctrl+k` jump to the next error location and center the screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")         # `Ctrl+j` jump to the previous error location and center the screen.
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")     # `<leader>k` jump to the next location list error and center the screen.
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")     # `<leader>j` jump to the previous location list error and center the screen.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])                        # `<leader>s` perform a global case-insensitive search and replace using the word under the cursor.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })   # `<leader>x` make the current file executable by running a chmod command.
```
