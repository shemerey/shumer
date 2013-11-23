" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
let mapleader = ","
let g:mapleader = ","

" Setup & neobundle ----------------------------------------------------------------------------{{{
 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'
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
command! -nargs=? -complete=command Cl call CleanAllHidenBuffers()

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
set relativenumber         " Show line numbers relative to current line
set number                 " Show current line real number (instead of 0) if relativenumber presents

set foldenable             " folding text into clusters (+) according to {{{ }}} or comments for example.
set foldmethod=manual      " default options, we create fold manually.
set foldlevelstart=1       " Skip first level folding

" Open and Close fold by space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=350
set colorcolumn=100

" Disable cursorline by default, because it's impact performance
set nocursorline
map <F2> :set cursorline!<CR>
"}}}

" Frontend  plugins ----------------------------------------------------------------------------{{{
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
  set comments+=n:--,n:==

NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
"}}}

" Fast code navigation and manipulation --------------------------------------------------------{{{
NeoBundle 'tpope/vim-obsession'
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
NeoBundle 'Trevoke/ultisnips-rspec'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'evindor/vim-rusmode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'AndrewRadev/splitjoin.vim'
  nnoremap K Bi<CR><ESC>
NeoBundle 'AndrewRadev/switch.vim'
  nnoremap - :Switch<cr>
NeoBundle 'gavinbeatty/dragvisuals.vim'
  let g:DVB_TrimWS = 1
  vmap  <expr>  <M-D-h>  DVB_Drag('left')
  vmap  <expr>  <M-D-l>  DVB_Drag('right')
  vmap  <expr>  <M-D-j>  DVB_Drag('down')
  vmap  <expr>  <M-D-k>  DVB_Drag('up')
  vmap  <expr>  <D-D>    DVB_Duplicate()
"}}}

" Ruby plugins && Ruby on rails plugins --------------------------------------------------------{{{
" NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'GutenYe/gem.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rvm'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-rails'
NeoBundle 'dbext.vim'

" Git pluggins ---------------------------------------------------------------------------------{{{
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
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


" Color schemes && GUI plugins -----------------------------------------------------------------{{{
NeoBundle 'bling/vim-airline'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'dahu/LearnVim'

" rtp load sequence requires the filetypes to be loaded after all bundles are loaded
filetype off
filetype plugin indent on
syntax enable
runtime macros/matchit.vim    " ruby indent object dependency

set background=dark
:colorscheme hybrid
set t_Co=256                                        "terminal color support

" Usefull mappings for General purposes --------------------------------------------------------{{{

" screen line scroll
nnoremap <silent> j gj
nnoremap <silent> k gk

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" join lines with cursor staying in  lace
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" Fast access to *vimRC files
map <leader>ev :e $MYVIMRC<cr>
map <leader>eg :e $MYGVIMRC<cr>
"}}}

" Encoding && Spell Checker --------------------------------------------------------------------{{{
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
set complete+=kspell

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

:set spellsuggest=20
"}}}

" Group of Usefull auto command for general cases ----------------------------------------------{{{

" go back to previous position of cursor if any
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != 'qf' |
      \  exe 'normal! g`"zvzz' |
      \ endif

" That way whatever folds you set won't get lost when you quit
autocmd BufWinLeave * if expand("%") != "" && &ft == 'ruby' | mkview | endif
autocmd BufWinEnter * if expand("%") != "" && &ft == 'ruby' | loadview | endif

" OR ELSE use the filetype mechanism to select automatically...
augroup PatchDiffHighlight
  autocmd!
  autocmd FileType  diff   syntax enable
augroup END

" Strip whitespace
autocmd BufWritePre * :Fix
" Don't strip whitespaces for vim, and diff files
autocmd FileType vim,diff let b:noStripWhitespace = 1
"}}}

" Load settings
for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

if has('gui_running')
  set regexpengine=2
endif

NeoBundleCheck
