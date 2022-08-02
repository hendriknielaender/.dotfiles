lua require("hndrk")

nnoremap <leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('hndrk.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>va :lua require('hndrk.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('hndrk.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('hndrk.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>td :lua require('hndrk.telescope').dev()<CR>
