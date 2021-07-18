let mapleader = " "
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*


if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Theme
    Plug 'rakr/vim-one'
    Plug 'sheerun/vim-polyglot'
"Lightline
    Plug 'itchyny/lightline.vim'
"Git features
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
"Tree sitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
"Lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-lua/completion-nvim'
"Telescope
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
"Nvim-TreeLua
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
" Cool stuffs
    Plug 'easymotion/vim-easymotion'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'KKPMW/vim-sendtowindow'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'tpope/vim-surround'

"   I don't need now 
"   Plug 'ryanoasis/vim-devicons'
"   Plug 'scrooloose/NERDTree'
"   Plug 'mhinz/vim-startify'
"   Plug 'fisadev/vim-isort'
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


lua << EOF
  require'lspconfig'.pyright.setup{}
EOF

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

colorscheme one
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set termguicolors

let timeoutlen = "500" " Set timeout length to 500 ms
nnoremap <leader>u :UndotreeShow<CR>
"new line comand
nmap <S-Enter> O<Esc>
" python alias (,p runs python on script. ,t times python script)
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"Terminal remap
tnoremap <Esc> <C-\><C-n>

for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
      exe 'source' f
endfor
