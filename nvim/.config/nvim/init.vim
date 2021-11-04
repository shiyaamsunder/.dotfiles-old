" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" ignore files
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*

" load plugins

call plug#begin(stdpath('data') . '/vimplugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'leafgarland/typescript-vim'
    Plug 'yuezk/vim-js'
    
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'


    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
   

    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    Plug 'morhetz/gruvbox'
call plug#end()

set t_Co=256
syntax on
set number
set relativenumber
set ignorecase      " ignore case
set smartcase       " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch       " do incremental searching
set visualbell
set expandtab
set tabstop=4
set ruler
set shiftwidth=4
set hlsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" airline stuff
let g:airline_powerline_fonts = 1 
set lazyredraw


colorscheme gruvbox 
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-html'
    \ ] 

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


let g:vim_jsx_pretty_colorful_config = 1 " default 0

"telescope setup
lua << EOF
require('telescope').setup{
defaults = {
     vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    }
    }
}
EOF

" keymap stuff
nnoremap <silent> <C-t> <cmd>terminal<cr>
inoremap <silent> <C-x> <C-\><C-n> <CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" keymap for opening init.vim
nnoremap <leader>ce :e ~/.config/nvim/init.vim<CR>


" buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bl <cmd>Telescope buffers<cr>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>
" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>


nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

"Keeping it center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Moving text
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap <leader>j :m .+1<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>k :m .-2<CR>==
nmap <leader>gs :G<CR>
let home = expand('~')
exec 'source' home . '/.config/nvim/coc.vim'
