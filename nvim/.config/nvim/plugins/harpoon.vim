nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap // :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>hu :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>he :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>ho :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>ha :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>ta :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>to :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>ca :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>co :lua require("harpoon.term").sendCommand(1, 2)<CR>
