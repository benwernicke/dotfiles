call plug#begin('~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/tagbar'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'vim-autoformat/vim-autoformat'

call plug#end()

"Colorscheme and Syntax Highlighting
"------------------------------------------------------------------------------
set termguicolors
syntax enable
colorscheme molokai

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "php", "phpdoc" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        },
    indent = {
        enable = true
        },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = " tv",
            node_incremental = "M",
            node_decremental = "m",
            },
        },
    }
EOF

" Lightline
let g:lightline = {
            \ 'colorscheme': 'molokai',
            \ }

"vim-autoformat
"------------------------------------------------------------------------------
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:formatterpath = ['/usr/bin/clang-format']

"Non Plugin Stuff
"------------------------------------------------------------------------------
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set nocompatible
set encoding=UTF-8

set splitright

set noerrorbells
set incsearch
set scrolloff=8

set colorcolumn=80

set relativenumber number
set clipboard=unnamedplus
set encoding=utf-8
let mapleader=" "

set textwidth=80

"Nerd Tree / Tagbar
"------------------------------------------------------------------------------
nmap <leader>mt :TagbarToggle<cr>
nmap <leader>nt :NERDTreeToggle<cr>

"Key Maps
"------------------------------------------------------------------------------
nmap <A-l> gt
nmap <A-h> gT
nmap <leader><Return> :tabnew<cr>

nmap <leader>tff :Telescope find_files<cr>
nmap <leader>tlg :Telescope live_grep<cr>


nmap tt :terminal<cr>i

nmap <leader>gg :Goyo<cr>

autocmd FileType c nmap <leader>lr :!./cbuild && ./out<cr>
autocmd FileType c nmap <leader>lR :!./cbuild && ./out
autocmd FileType c nmap <leader>lg ttgdb -tui out<cr>
autocmd FileType c nmap <leader>lc :! ./cbuild clean
autocmd FileType c nmap <leader>cf :r! sgen clang_format<cr>

autocmd FileType c nmap <leader>sg :! squirrel get
autocmd FileType c nmap <leader>su :! squirrel update
autocmd FileType c nmap <leader>ec :vs cbuild.c

autocmd FileType lisp nmap <leader>lr :! clisp %<cr>

autocmd FileType latex nmap <leader>la :r! sgen latex_article<cr>
autocmd FileType latex nmap <leader>lr :! xelatex % && pkill -HUP mupdf<cr>
autocmd FileType latex nmap <leader>ls :! mupdf $(echo % \| rev \| cut -c4- \| rev)pdf & disown<cr><cr>

nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
vmap <C-j> <C-w>j
vmap <C-k> <C-w>k
vmap <C-l> <C-w>l
vmap <C-h> <C-w>h
nmap <leader>nh :noh<cr>
nmap <leader>v :vs<cr>
