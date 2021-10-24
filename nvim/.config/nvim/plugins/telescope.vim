lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
    mmappings = {
        n = {
            ["q"] = actions.close
            },
        },
    color_devicons = true,
    }
}
EOF


nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <C-h> <cmd>Telescope live_grep<cr>
nnoremap <leader>pf :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

