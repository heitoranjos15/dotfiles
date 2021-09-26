lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
defaults = {
    mappings = {
        n = {
            ["q"] = actions.close
            },
        },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    prompt_prefix = " >",
    color_devicons = true,
    }
}
EOF


nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <leader>pf :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>



