" vim:fdm=marker:fmr={{{,}}}:fdl=4:ts=2:sw=2:sts=2
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
set t_Co=256

set mousehide                                       "hide when characters are typed
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
set hidden                                          "allow buffer switching without saving
set autoread                                        "auto reload if file saved externally
set fileformats+=mac                                "add mac to auto-detection of file format line endings
set nrformats-=octal                                "always assume decimal numbers
set showcmd
set tags=./tags;/
set showfulltag
set keywordprg=":help"                              "remap K to vim help
set modeline
set modelines=5
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
set list listchars=trail:_                           "highlight whitespace
set shiftround

set scrolloff=1                                     "always show content after scroll
set scrolljump=5                                    "minimum number of lines to scroll
set display+=lastline

" disable sounds
set noerrorbells
set novisualbell
set noeb vb t_vb=
"}}}

" Searching ------------------------------------------------------------------------------------{{{
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter


" This rewires n and N to do the highlighing...  and auto center it {{{
function! HLNext (blinktime)
  execute 'normal! zMzv'
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 100) . 'm'
  set invcursorline
  redraw
endfunction

nnoremap <silent> n   nzz:call HLNext(0.3)<cr>
nnoremap <silent> N   Nzz:call HLNext(0.3)<cr>
nnoremap <silent> *   *zz:call HLNext(0.3)<cr>
nnoremap <silent> #   #zz:call HLNext(0.3)<cr>
nnoremap <silent> g*  g*zz:call HLNext(0.3)<cr>
nnoremap <silent> g#  g#zz:call HLNext(0.3)<cr>
nnoremap <silent> <C-o> <C-o>zz:call HLNext(0.3)<cr>
nnoremap <silent> <C-i> <C-i>zz:call HLNext(0.3)<cr>
"}}}


nnoremap <leader><space> :noh<cr>
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
endfunction "}}}

call EnsureExists('~/.vim/.cache')
call EnsureExists(&directory)
"}}}

" UI configuration -----------------------------------------------------------------------------{{{
set ruler                  " Show line and column number
set lazyredraw
set laststatus=2
set noshowmode             " Hide the default mode text (e.g. -- INSERT -- below the status line)
set number

set foldenable             " folding text into clusters (+) according to {{{ }}} or comments for example.
set foldmethod=manual      " default options, we create fold manually.
set foldlevelstart=1

" Open and Close fold by space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=250
set colorcolumn=100
set nocursorline
map <F2> :set cursorline!<CR>
"}}}

" plugin/mapping configuration -----------------------------------------------------------------{{{
filetype plugin indent on     " Turn on filetype plugins (:help filetype-plugin)
runtime macros/matchit.vim    " ruby indent object dependency

" Frontend  plugins ----------------------------------------------------------------------------{{{
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
  set comments+=n:--,n:==
"}}}

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
NeoBundle 'scrooloose/syntastic'
NeoBundle 'AndrewRadev/switch.vim'
  nnoremap - :Switch<cr>

" Ruby plugins ---------------------------------------------------------------------------------{{{
" NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'GutenYe/gem.vim'
NeoBundle 'dbext.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'gavinbeatty/dragvisuals.vim'
  let g:DVB_TrimWS = 1
  vmap  <expr>  <M-D-h>  DVB_Drag('left')
  vmap  <expr>  <M-D-l>  DVB_Drag('right')
  vmap  <expr>  <M-D-j>  DVB_Drag('down')
  vmap  <expr>  <M-D-k>  DVB_Drag('up')
  vmap  <expr>  <D-D>    DVB_Duplicate()
"}}}

" Git pluggins ---------------------------------------------------------------------------------{{{
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
"}}}

NeoBundle 'rking/ag.vim'
NeoBundle 'Valloric/YouCompleteMe', '', 'same', {'gui' : 1}
NeoBundle 'Trevoke/ultisnips-rspec'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'evindor/vim-rusmode'
NeoBundle 'AndrewRadev/splitjoin.vim'

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
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


NeoBundle 'kien/ctrlp.vim', {'depends': [
      \ 'tacahiroy/ctrlp-funky',
      \ 'iurifq/ctrlp-rails.vim',
      \ 'sgur/ctrlp-extensions.vim',
      \ 'jasoncodes/ctrlp-modified.vim',
      \ 'ivalkeen/vim-ctrlp-tjump'
      \ ]}

NeoBundle 'bling/vim-airline'
NeoBundle 'Yggdroot/indentLine'

" Color schemes --------------------------------------------------------------------------------{{{
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
  set background=dark
  colorscheme hybrid
"}}}

" vundle rtp load sequence requires the filetypes to be loaded after all bundles are loaded
filetype off
filetype plugin indent on
syntax enable

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
"}}}

" Encoding && Spell Checker --------------------------------------------------------------------{{{
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
:set spellsuggest=20
"}}}

" autocmd {{{
" go back to previous position of cursor if any
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != 'qf' |
      \  exe 'normal! g`"zvzz' |
      \ endif

" That way whatever folds you set won't get lost when you quit
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif

autocmd FileType vim,diff let b:noStripWhitespace = 1

" OR ELSE use the filetype mechanism to select automatically...
augroup PatchDiffHighlight
  autocmd!
  autocmd FileType  diff   syntax enable
augroup END

"remove whitespace
autocmd BufWritePre * :Fix
autocmd FileType make setlocal noexpandtab
"}}}

map <leader>ev :e $MYVIMRC<cr>
map <leader>eg :e $MYGVIMRC<cr>
map <leader>q  :q <CR>
"}}}

for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

if has('gui_running')
  set regexpengine=2
endif

augroup myvimrc
  au!
  au BufWritePost .vimrc,vimrc,.gvimrc,*.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

NeoBundleCheck
