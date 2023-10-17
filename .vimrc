" ====== General Options ======================================================
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

" clipboard
if system('uname -s') == "Darwin\n"
    set clipboard=unnamed        " mac os
else
    set clipboard=unnamedplus    " linux
endif

" ===== VimPlug-Bundles =======================================================

call plug#begin('~/.vim/plugged')

" color schemes
Plug 'arcticicestudio/nord-vim'
" powerline
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
" fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" treesitter and orgmode
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode'
" terminal in floating window
Plug 'voldikss/vim-floaterm'
" code completion with language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" diff
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" linting
Plug 'dense-analysis/ale'
" tagbar
Plug 'majutsushi/tagbar'
" registers
Plug 'junegunn/vim-peekaboo'
" whitespace errors
Plug 'ntpeters/vim-better-whitespace'
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" rust
Plug 'rust-lang/rust.vim'
" show marks in the gutter
Plug 'kshenoy/vim-signature'
" toml
Plug 'cespare/vim-toml'
" terraform
Plug 'hashivim/vim-terraform'
" latex
Plug 'lervag/vimtex'
" indent guides
Plug 'Yggdroot/indentLine'
" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
" debugging
Plug 'dstein64/vim-startuptime'
call plug#end()


" ===== Colours and UI ========================================================

syntax on              " turn on syntax highlighting
set background=dark

" Configure and Load Nord Colorscheme
let g:nord_italic = 1
let g:nord_underline = 1
colorscheme nord

set cursorline         " highlight current line
set showmatch          " highlight matching brackets
set conceallevel=2     " conceal
set concealcursor="nc" " conceal in normal mode
" set showcmd            " show command line

" override vim italic codes
set t_ZH=[3m
set t_ZR=[23m

set t_Co=256

" ----- Spelling --------------------------------------------------------------
set spelllang=en_gb

" ===== Indentation ===========================================================

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
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:~,extends:❯,precedes:❮,

set nowrap             " don't soft-wrap lines at window border
set linebreak          " hard-wrap lines at convenient points
set textwidth=80
set wrapmargin=2
set colorcolumn=+1


" ===== Folds =================================================================

set foldmethod=indent  " fold based on indent
set foldnestmax=3      " fold maximum three levels
set nofoldenable       " don't fold by default


" ===== Completion ============================================================

set wildmenu           " visual autocomplete for command menu


" ===== Scrolling =============================================================

set scrolloff=8        " scroll when 8 lines away from margin
set sidescrolloff=15
set sidescroll=1


" ===== Search ================================================================

set incsearch          " search when typing phrase
set hlsearch           " highlight matches
set ignorecase         " ignore case when searching
set smartcase          " ... unless we start with a capital latter

" ===== Mappings and Macros ===================================================

let mapleader = ','

language time en_GB.utf-8  " use English time for datestamps

" Insert current datestamp; normal and inset modes
nnoremap <F5> "strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" Search and replace visual selection
vnoremap <Leader>zr :<c-u>%s/<c-r>*

" Switch panes more effortlessly with CTRL-KEY instead of prefixing with CTRL-w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ------ Plugin Mappings ------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Solving Git Conflicts: Fugitve
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" fzf-preview
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>

" goyo and limelight
nnoremap <Leader>gy :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" coc
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ===== Plugin Settings =======================================================

" ----- Directory Browsing: `netrw` ------------------------------------------
let g:netrw_banner = 0


" ----- Lightline -------------------------------------------------------------
let g:Powerline_symbols = 'fancy'
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

" ----- Tmuxline --------------------------------------------------------------
let g:tmuxline_preset = 'full' " sets the layout of the status line

" ----- Better Whitespace -----------------------------------------------------
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" ----- CoC -------------------------------------------------------------------
hi default CocInlayHint ctermbg=NONE ctermfg=8
" CocInlayHint   xxx ctermfg=12 ctermbg=16 guifg=#5e81ac guibg=#2e3440

" ----- Ale -------------------------------------------------------------------
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'

" ----- IndentLine ------------------------------------------------------------
let g:indentLine_char = '│'  " ┆¦
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_conceallevel = 2
let g:indentLine_concealcursor = 'nc'
let g:indentLine_fileTypeExclude = ['markdown']

" ----- VimTex ----------------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'

" ----- Markdown --------------------------------------------------------------
let g:markdown_folding = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 2

" ----- Goyo ------------------------------------------------------------------
let g:goyo_width = 88

" ----- Limelight -------------------------------------------------------------
let g:limelight_conceal_ctermfg = 8
let g:limelight_conceal_guifg = '#4C566A'
