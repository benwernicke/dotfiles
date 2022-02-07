call plug#begin('~/.config/nvim/plugged')
    Plug 'Chiel92/vim-autoformat'
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdcommenter'
    Plug 'tomasr/molokai'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

call plug#end()

"Colorscheme and Syntax Highlighting -------------------------------------------------------------
set termguicolors
"highlight Normal guibg=none guifg=none
"export TERM=st-256colear
syntax enable
colorscheme molokai

"Autocomplete-------------------------------------------------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

EOF

"Autoformat ----------------------------------------------------
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
au BufWrite * :Autoformat

"Airline -------------------------------------------------------------
" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_section_b = ''
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline_section_z = ''
"Non Plugin Stuff -------------------------------------------------------------
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set relativenumber number
set clipboard=unnamedplus
set encoding=utf-8
let mapleader=" "


"Key Maps
nmap <leader><Tab> gt
nmap <leader><S-Tab> gT
nmap <leader><Return> :tabnew


"nmap gd :lua vim.lsp.buf.definition()<cr>
nmap gd :lua vim.lsp.buf.definition()<cr>
nmap gD :lua vim.lsp.buf.declaration()<cr>
nmap gi :lua vim.lsp.buf.implementation()<cr>
nmap gw :lua vim.lsp.buf.document_symbol()<cr>
nmap gw :lua vim.lsp.buf.workspace_symbol()<cr>
nmap gr :lua vim.lsp.buf.references()<cr>
"nmap gt :lua vim.lsp.buf.type_definition()<cr>
nmap K  :lua vim.lsp.buf.hover()<cr>
nmap ck :lua vim.lsp.buf.signature_help()<cr>
"nmap af :lua vim.lsp.buf.code_action()<cr>
nmap rn :lua vim.lsp.buf.rename()<cr>
