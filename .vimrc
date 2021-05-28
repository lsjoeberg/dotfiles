" ====== General Options ================================================
set clipboard=unnamedplus          " copy/paste
set timeoutlen=1000 ttimeoutlen=0  " remove fdelay on ESC key

set nocompatible
set number             " show line numbers
set hidden             " hide buffers instead of closing when opening new one
set noshowmode         " let lightline handle showing current mode
set laststatus=2       " (2=always) show statusline
set visualbell         " no sounds
set autoread           " reload files changed outside vim
set encoding=utf-8

" viminfo
set viminfo='100,f1
"           |    |
"           |    +----- save global marks (don't save with `f0`)
"           +---------- save marks for up to 100 files


" ===== VimPlug-Bundles ================================================

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
" powerline
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" nerd-tree
Plug 'preservim/nerdtree'
" vimwiki: personal wiki and note taking
Plug 'vimwiki/vimwiki'
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'SidOfc/mkdx'
" show marks in the gutter
Plug 'kshenoy/vim-signature'
" python
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
" latex
Plug 'lervag/vimtex'
" indent guides
Plug 'Yggdroot/indentLine'
call plug#end()


" ===== Colours and UI =================================================

syntax on              " turn on syntax highlighting
set background=dark

" Configure and Load Nord Colourscheme
let g:nord_italic = 1
let g:nord_underline = 1
colorscheme nord

set cursorline         " highlight current line
set showmatch          " highlight matching brackets
set conceallevel=2     " conceal 
set concealcursor=n    " conceal on cursor line in normal mode

" override vim italic codes
set t_ZH=[3m
set t_ZR=[23m

" ----- Spelling -------------------------------------------------------

" setlocal spell
set spelllang=en_gb

" ===== Indentation ====================================================

set autoindent         " always set autoindent on
set smartindent        " hanging indent after 'new block' (e.g. new function)
set smarttab           " insert tabs on start of line according to shiftwidth
set shiftwidth=4       " nbr spaces to use for each step of autoindent
set tabstop=4          " visual spaces per TAB
set softtabstop=4      " number of spaces in tab when editing
set expandtab          " tabs are spaces

filetype plugin on     " enable filetype-specific plugins
filetype indent on     " load filetype-specific indent files

" Display trailing spaces visually
" set list
set listchars=tab:»\ ,trail:·,eol:¬

set nowrap             " don't soft-wrap lines at window border
set linebreak          " hard-wrap lines at convinient points
set textwidth=80
set wrapmargin=2
set colorcolumn=+1


" ===== Folds ==========================================================

set foldmethod=indent  " fold based on indent
set foldnestmax=3      " fold maximum three levels
set nofoldenable       " don't fold by defalt


" ===== Completion =====================================================

set wildmenu           " visual autocomplete for command menu


" ===== Scrolling ======================================================

set scrolloff=8        " scroll when 8 lines away from margin
set sidescrolloff=15
set sidescroll=1


" ===== Search =========================================================

set incsearch          " search when typing phrase
set hlsearch           " highlight matches
set ignorecase         " ignore case when searching
set smartcase          " ... unless we start with a capital latter


" ===== Mappings and Macros ============================================

language time en_GB.utf-8  " use english time for datestamps

" Insert current datestamp; normal and inset modes
nnoremap <F5> "strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" Switch panes more effortlessly with CTRL-KEY instead of prefixing with CTRL-w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ===== Autocommands ===================================================
" autocmd event pattern command

" map capslock to esc
" autocmd VimEnter * silent! !xmodmap -e 'clear lock' -e 'keycode 0x42 = Escape'
" autocmd VimLeave * silent! !xmodmap -e 'clear lock' -e 'keycode 0x42 = Caps_Lock'

" ===== Plugin Settings ================================================

" ----- Lightline ------------------------------------------------------
let g:lightline = {
    \ 'colorscheme' : 'nord',
    \ 'separator': {'left': "", 'right': ""},
    \ 'subseparator': {'left': "", 'right': ""},
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['gitbranch', 'readonly', 'filename', 'modified']]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
let g:Powerline_symbols = 'fancy'

" ----- Tmuxline -------------------------------------------------------
let g:tmuxline_preset = 'full' " sets the layout of the status line


" ----- Syntastic ------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_quiet_messages = {
"     \ 'regex': [
"         \ 'missing-module-docstring',
"         \ 'missing-function-docstring',
"         \ 'invalid-name',
"     \ ],
"     \ }

" ----- IndentLine -----------------------------------------------------
let g:indentLine_char = '¦'  " ┆
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_conceallevel = 2
let g:indentLine_concealcursor = 'n'
let g:indentLine_fileTypeExclude = ['markdown']

" ----- VimTex ---------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'

" ----- VimWiki --------------------------------------------------------
let g:vimwiki_global_ext = 0

" ----- Markdown -------------------------------------------------------
let g:markdown_folding = 1
let g:vim_markdown_new_list_item_indent = 2


