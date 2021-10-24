let mapleader = " "

set path+=**

runtime ./plug.vim

if executable('rg')
    let g:rg_derive_root='true'
endif

set t_Co=256
set termguicolors

set background=dark " or light if you want light mode
colorscheme gruvbox

nnoremap <leader>u :UndotreeShow<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Terminal remap
tnoremap <Esc> <C-\><C-n>

"Netrw
nnoremap <C-n> :Explore<CR>

for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
      exe 'source' f
endfor

