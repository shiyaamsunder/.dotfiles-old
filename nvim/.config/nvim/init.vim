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
    Plug 'tomtom/tcomment_vim'
    Plug 'preservim/nerdcommenter'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'jparise/vim-graphql'
    Plug 'neoclide/coc.nvim', {'branch': 'release'},
    Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" airline stuff
let g:airline_powerline_fonts = 1 
set lazyredraw

 
" colorscheme PaperColor
 
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

" basic settings

let g:vim_jsx_pretty_colorful_config = 1 " default 0

set t_Co=256
syntax on
set number
set relativenumber
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=4
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent



" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1



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
 
nnoremap <Leader>k <cmd>call nerdcommenter#Comment('n', 'toggle')<CR>
vnoremap <Leader>k <cmd>call nerdcommenter#Comment('n', 'toggle')<CR>


nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)


nmap <leader>gs :G<CR>
let home = expand('~')
exec 'source' home . '/.config/nvim/coc.vim'
