" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2

let mapleader = ","
let g:mapleader = ","

" Setup & NeoBundle ----------------------------------------------------------------------------{{{
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/NeoBundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/NeoBundle.vim'
"}}}

" Base configuration ---------------------------------------------------------------------------{{{

set timeoutlen=250                                  "mapping timeout
set ttimeoutlen=50                                  "keycode timeout

set mousehide                                       "hide when characters are typed
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "Unix/windows compatibility
set hidden                                          "allow buffer switching without saving

" Custom function just for one reason, remove all buffers except current
function! CleanAllHidenBuffers()
   only | 1 b | wa | 2,2000 bd
endfunction
command! -nargs=? -complete=command Clean call CleanAllHidenBuffers()

set autoread                                        "auto reload if file saved externally
set fileformats+=mac                                "add mac to auto-detection of file format line endings
set nrformats-=octal                                "always assume decimal numbers
set showcmd                                         " show command line for last window
set tags=./tags;/                                   "Ctags file path search
set showfulltag
set modeline                                        "allow to use specific vim settings perfile file, see first line of this file
set modelines=5                                     "check 5 lines for modeline comment command
set nowrap

" whitespace
set backspace=indent,eol,start                      "allow backspacing everything in insert mode
set autoindent                                      "automatically indent to match adjacent lines
set smartindent                                     "smart indenting for additional languages
set expandtab                                       "spaces instead of tabs
set smarttab                                        "use shiftwidth to enter tabs
let s:default_indent = 2
let &tabstop=s:default_indent                       "number of spaces per tab for display
let &softtabstop=s:default_indent                   "number of spaces per tab in insert mode
let &shiftwidth=s:default_indent                    "number of spaces when indenting
set list listchars=trail:_                          "highlight whitespace
set fillchars=stl:-,stlnc:-,vert:│
set shiftround

set scrolloff=1                                     "always show content after scroll
set scrolljump=5                                    "minimum number of lines to scroll
set display+=lastline

" disable sounds and noise
set noerrorbells
set novisualbell
set noeb vb t_vb=
"}}}

" Vim file/folder management -------------------------------------------------------------------{{{
" backups
set nobackup
set nowritebackup

" swap files
set directory=~/.vim/.cache/swap
set noswapfile

function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction

call EnsureExists('~/.vim/.cache')
call EnsureExists(&directory)
"}}}

" UI configuration -----------------------------------------------------------------------------{{{
set ruler                  " Show line and column number
set lazyredraw             " Draw window only after macros execution
set laststatus=2           " Always show status line
set noshowmode             " Hide the default mode text (e.g. -- INSERT -- below the status line)

"Hybrid mode should present bought
" set relativenumber         " Show line numbers relative to current line
set number                 " Show current line real number (instead of 0) if relativenumber presents

set foldenable             " folding text into clusters (+) according to {{{ }}} or comments for example.
set foldmethod=manual      " default options, we create fold manually.
set foldlevelstart=2       " Skip first level folding

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Open and Close fold by space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Syntax coloring lines that are too long just slows down the world
set colorcolumn=100
set synmaxcol=110

" Disable cursorline by default, because it's impact performance
set nocursorline
set cursorline
map <F2> :set cursorline!<CR>
"}}}

" Frontend  plugins ----------------------------------------------------------------------------{{{
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
"}}}

" Fast code navigation and manipulation --------------------------------------------------------{{{
NeoBundle 'tpope/vim-abolish'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'Valloric/YouCompleteMe', '', 'same', {'gui' : 1}
NeoBundle 'mileszs/ack.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'evindor/vim-rusmode'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'AndrewRadev/switch.vim'
  nnoremap - :Switch<cr>

"}}}

" Ruby plugins && Ruby on rails plugins --------------------------------------------------------{{{
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'GutenYe/gem.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rvm'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-rails'
NeoBundle 'dbext.vim'
"}}}

" Git pluggins ---------------------------------------------------------------------------------{{{
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'
"}}}

" Text Object plugins---------------------------------------------------------------------------{{{
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'bootleq/vim-textobj-rubysymbol'
"}}}

" Some usfull plugins --------------------------------------------------------------------------{{{
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'kien/ctrlp.vim', {'depends': [
      \ 'tacahiroy/ctrlp-funky',
      \ 'iurifq/ctrlp-rails.vim',
      \ 'sgur/ctrlp-extensions.vim',
      \ 'jasoncodes/ctrlp-modified.vim',
      \ 'ivalkeen/vim-ctrlp-tjump'
      \ ]}
"}}}

" Color schemes && GUI plugins -----------------------------------------------------------------{{{
NeoBundle 'bling/vim-airline'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'dahu/LearnVim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'

" rtp load sequence requires the filetypes to be loaded after all bundles are loaded
filetype off
filetype plugin on
syntax enable

runtime macros/matchit.vim    " ruby indent object dependency
let g:loaded_matchparen = 1
"}}}

" Usefull mappings for General purposes --------------------------------------------------------{{{
" screen line scroll
nnoremap <silent> j gj
nnoremap <silent> k gk

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" join lines with cursor staying in  lace
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
nnoremap <silent> K bi<CR><ESC>

" Fast access to *vimRC files
map <leader>ev :e $MYVIMRC<cr>
map <leader>eg :e $MYGVIMRC<cr>
"}}}

" Encoding && Spell Checker --------------------------------------------------------------------{{{
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
set complete+=kspell

augroup Spelling
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup END

:set spellsuggest=20
"}}}

" Group of Usefull auto command for general cases ----------------------------------------------{{{
augroup UserAutoGroup
  autocmd!
  " go back to previous position of cursor if any
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != 'qf' |
        \  exe 'normal! g`"zvzz' |
        \ endif

  " Strip whitespace
  autocmd BufWritePre * :Fix

  " That way whatever folds you set won't get lost when you quit
"  autocmd BufWinLeave * if expand("%") != "" && &ft == 'ruby' | mkview | endif
"  autocmd BufWinEnter * if expand("%") != "" && &ft == 'ruby' | loadview | endif
augroup END

" OR ELSE use the filetype mechanism to select automatically...
augroup PatchDiffHighlight
  autocmd!
  autocmd FileType  diff   syntax enable
  " Don't strip whitespaces for vim, and diff files, and quickfix
  autocmd FileType vim,diff,qf let b:noStripWhitespace = 1
augroup END
"}}}

" Load settings
for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

if has('gui_running')
  set regexpengine=2
endif
set t_Co=256                                        "terminal color support
set background=dark
colorscheme hybrid

NeoBundleCheck
