let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_ignore = [ '.git', '.cache', '__pycache__' ]
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_follow = 0

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      { key = "s", cb = tree_cb("vsplit") },
      { key = "x", cb = tree_cb("split") },
      }
EOF
