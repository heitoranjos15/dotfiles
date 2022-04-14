if has ("nvim")
	let g:plug_home = stdpath('data') .'/plugged'
endif

call plug#begin()
"Themes
  Plug 'rktjmp/lush.nvim'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'olimorris/onedarkpro.nvim'
"Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
"Lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim'
"Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'onsails/lspkind-nvim'
"Harpoon
  Plug 'ThePrimeagen/harpoon'
"Git features
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'
"Telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim' 
"CoolStuff
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'mbbill/undotree'
  Plug 'easymotion/vim-easymotion'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'KKPMW/vim-sendtowindow'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'p00f/mdpreview.nvim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'nvim-lualine/lualine.nvim'
"Elixir
  Plug 'elixir-editors/vim-elixir'
call plug#end()

