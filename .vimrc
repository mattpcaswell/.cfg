" vim:foldmethod=marker:foldlevel=0

"Plugins {{{
call plug#begin('~/vimfiles/bundle')

Plug 'vim-airline/vim-airline'              " airline
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'                       " control p
Plug 'scrooloose/nerdtree'                  " nerd tree
Plug 'tpope/vim-commentary'                 " commenting stuff (gc)
Plug 'tpope/vim-surround'                   " surround. jesus tim pope is good
Plug 'morhetz/gruvbox'                      " Gruvbox theme
Plug 'raimondi/delimitmate'                 " auto close brackets, parentheses, ect...
Plug 'vhda/verilog_systemverilog.vim'       " SystemVerilog support

Plug 'fcpg/vim-osc52'                       " Fix copy paste in ssh -> tmux -> vim

call plug#end()
" }}}
"Colors and Fonts {{{

syntax on     " Enable syntax hilighting
colorscheme gruvbox
set background=dark

" Enable cursor line position tracking:
set cursorline
" Remove the underline from enabling cursorline:
" highlight clear CursorLine
" }}}
"UI config {{{
" Change cursor shape between insert and normal mode in iTerm2
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set noerrorbells visualbell t_vb=     " no annoying sounds or flashing
autocmd GUIEnter * set visualbell t_vb=

set noshowmode " stop showing mode in the bottom bar. airline does that

set hidden   " Make it less anoying about saving when switching windows
set autoread " Make it less anoying about files changing while open

set wildmenu " Better command line completion

set showcmd  " Show partial commands in the last line of the screen

set lazyredraw  " dont redraw during macros (makes it go faster)

set mouse=a       " Enable use of the mouse for all modes
set ttymouse=sgr  " Fix tmux screen too wide issue

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

set splitright   "split below and right by defualt
set splitbelow

set scrolloff=5     "start scrolling up and down earlier
set sidescroll=1    "stop scrolling half the god damn screen sideways
set sidescrolloff=2

set ruler     " Show line and column number in bottom ruler

set number    " Show line numbers

set nowrap   " Stop wrapping text

set laststatus=2     "always show the status bar

set showmatch    " show matching parens
set mat=2        " but shorter. less annoying like this

set modelines=1  " the first line can set vim settings (lets the indenting work in .vimrc)
" }}}
"Spaces, Tabs, and Indentation {{{
set autoindent  "smarter indenting
" set smartindent
filetype indent on
filetype plugin on

set tabstop=4        " show existing tab with 4 spaces width
set shiftwidth=4     " when indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set softtabstop=4    " when hitting backspace pretend like tab is removed even if spaces
set autoindent       " auto indent but also read it from the file
set copyindent
set smarttab
" }}}
"Searching {{{
"
" Highlight searches (use <C-o> to temporarily turn off highlighting; see the
" mapping of <C-o> below)
set hlsearch

set ignorecase   " Use case insensitive search, except when using capital letters
set smartcase
set incsearch    " Search scrolls to match automatically

let g:NERDTreeRespectWildIgnore = 1         " nerdtree respect wildignore
" }}}
"Folding {{{
set foldenable   " enable folding
" }}}
"Custom Keymaps {{{
"
"set the leader
let mapleader = "\<Space>"

noremap <leader>y :call SendViaOSC52(getreg('"'))<cr>

"leader f - alternate fold
noremap <leader>f za

"leader e v - Edit Vim.rc in a new vsplit
noremap <leader>ev :vs $MYVIMRC<cr>
"leader r v - Source Vim.rc
noremap <leader>rv :so $MYVIMRC<cr> :AirlineRefresh<cr>

"leader s e - sc edit this file
noremap <leader>se :!sc edit <C-R>%<cr>

"leader s d - sc diff this file
noremap <leader>sd :!sc diff <C-R>%<cr>

"leader b b - Buffer Back
noremap <leader>bb :bp<cr>
"leader b n - Buffer Next
noremap <leader>bn :bn<cr>
"leader b d - Buffer Delete
noremap <leader>bd :bd<cr>
"leader b f - Buffer Find
noremap <leader>bf :CtrlPBuffer<cr>

"leader == - Fix whole file indentation
noremap <leader>== gg=G''

"leader ap - Add Parameter to next function on the line
noremap <leader>ap f)i,

"insert mode control u - upper case word
inoremap <C-u> <esc>viwUea

"insert mode control space - suggestions
imap <C-Space> <C-X><C-O>

"insert mode jk - escape
inoremap jk <esc>

" Scroll with control-hjkl
noremap <C-l> 10zl
noremap <C-h> 10zh
" noremap <C-j> 5<C-y>
" noremap <C-k> 5<C-u>

" Map <C-o> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-o> :nohl<CR><C-L>

" switch from light theme to dark theme
map <F8> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" nerd tree keybinding
nmap <C-b> :NERDTreeToggle<CR>

" better window control
noremap <leader>w <C-w>
" }}}
"Backups {{{
set nobackup     " Stop doing all the backup stuff. Its gross
set noswapfile
set nowb
" }}}
" Misc {{{
set ttyfast "faster redraw

set backspace=indent,eol,start   " Allow backspacing over autoindent, line breaks and start of insert action

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" }}}
"Airline {{{

set encoding=utf-8

" let g:airline_powerline_fonts = 1

let g:airline_theme='gruvbox'

let g:airline_section_z='%p%%  %l: %c'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections = 1

" Tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#buffer_idx_mode = 1

"}}}
"Ctrl P {{{
" add a keymap for leader p
noremap <leader>p :CtrlP<cr>

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden -g ""'

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" let g:ctrlp_regexp = 1
"}}}
"Delimate {{{
let g:delimitMate_expand_cr = 1
"}}}

"Ag {{{
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"}}}
