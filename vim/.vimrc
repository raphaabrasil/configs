"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  "Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
"Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"Bundles:
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'klen/python-mode'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'

"Required:
call neobundle#end()

"Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"--------------------------------------

"Some configs----------------------------------
syntax on
set t_Co=256

set laststatus=2
set relativenumber
set number
set noswapfile
set nowrap
set backspace=indent,eol,start
set title
set nobackup
set cursorline
set showmatch
set hlsearch

set scrolloff=3

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=8
set ttyfast

set smartcase
set incsearch

set wildmenu
set wildmode=list:longest

set history=1000
set undolevels=1000

set encoding=utf-8 
let g:Powerline_symbols = 'unicode'

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"--------------------------------------

"GUI-----------------------------------
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set guifont=Source\ Code\ Pro\ for\ Powerline
"--------------------------------------

"Keymaps-------------------------------
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

map <C-n> <Esc>:tabnext<CR>
map <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <F11> :!runctags<CR>

nnoremap <C-]> :execute 'tj' expand('<cword>')<CR>zv
"nnoremap <C-c> :call NumberToggle()<CR>
"--------------------------------------

"Set comments--------------------------
au FileType sh,make,python,ruby,puppet let comment = '#'
au FileType c,cpp,java,javascript,go let comment = '//'
au FileType vim let comment = '"'
"--------------------------------------

"Highlight chars on col > 120 -----------------
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END
"--------------------------------------

"Toggle numbers------------------------
"function! NumberToggle()
  "if(&relativenumber == 1)
    "set number
  "else
    "set relativenumber
  "endif
"endfunc
"--------------------------------------

"Ctags---------------------------------
set tags=tags
"--------------------------------------

"NerdTree------------------------------
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
"--------------------------------------

"Airline-------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
"--------------------------------------

"CtrlP---------------------------------
let g:ctrlp_custom_ignore = {
 \ 'dir': '\.git$',
 \ 'file': '\.pyc$\|\.migration$\|\.log$\|\.json$\|\.lock$\|\.jar$\|tags$'
 \ }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_reuse_window = 'netrw'
let g:ctrlp_use_caching = 1
let g:ctrlp_arg_map = 1
let g:ctrlp_extensions = ['tag']
"--------------------------------------

"ColorScheme---------------------------
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
set background=dark
hi Normal ctermbg=none
let AirlineTheme="bubblegum"
"--------------------------------------

"PythonMode----------------------------
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace();  # XXX BREAKPOINT'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Ignore some PEP8 rules
let g:pymode_lint_ignore="E501,W601"
"--------------------------------------
