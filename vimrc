" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:ts=2:sw=2:sts=2:nu

let mapleader = ","
let g:mapleader = ","

if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let vundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(vundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Base configuration ---------------------------------------------------------------------------{{{
set backspace=indent,eol,start                      "allow backspacing everything in insert mode
set autoindent                                      "automatically indent to match adjacent lines
set smartindent                                     "smart indenting for additional languages
set expandtab                                       "spaces instead of tabs
set smarttab                                        "use shiftwidth to enter tabs
set hidden                                          "allow to hide unsaved buffer
set nowrap                                          "disable line wrapping by default
let s:default_indent = 2
let &tabstop=s:default_indent                       "number of spaces per tab for display
let &softtabstop=s:default_indent                   "number of spaces per tab in insert mode
let &shiftwidth=s:default_indent                    "number of spaces when indenting

" disable sounds and noise
set noerrorbells
set novisualbell
set noeb vb t_vb=
set noautochdir                                     " prevent vim to change dir

" backups and swap files
set nobackup
set nowritebackup
set noswapfile

set wildmenu              " show list for autocompletion
set wildmode=longest,full " priority for tab completion
"}}}

" Split window configuration--------------------------------------------------------------------{{{
nnoremap <leader>v :vsplit<CR>

nnoremap <D-[> <C-w>hzH
nnoremap <D-]> <C-w>lzH

function! s:EqulazeWindows(force)
  if !exists('g:eql_win_size_state')
    let g:eql_win_size_state = 0
  endif

  if a:force
    if g:eql_win_size_state
      let g:eql_win_size_state = 0
    else
      let g:eql_win_size_state = 1
      execute "normal \<C-w>="
    endif
  endif

 if !g:eql_win_size_state
   execute "normal \<C-w>|"
 endif
endfunction

nnoremap <silent> <D-=> :call <SID>EqulazeWindows(1)<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
set winwidth=25
set winminwidth=25
set winheight=8
set winminheight=8
"}}}

" Fast access to *vimRC files
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>eg :e ~/.gvimrc<CR>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ee :e ~/.vim/master.vim<cr>

" Folding Settings -----------------------------------------------------------------------------{{{
set foldenable                                         " folding text into clusters (+) according to {{{ }}} or comments for example.
set foldmethod=manual                                  " default options, we create fold manually.
set foldlevelstart=2                                   " Skip first level folding
set foldopen=hor,mark,percent,quickfix,search,tag,undo " don't open fold when jump block
set viewoptions=folds,cursor

" Open and Close fold by space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"}}}

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
"---------- ALL Bundles -----------------------------------------------------------------------------{{{
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rails'
noremap \ :A<cr>
NeoBundle 'scrooloose/nerdtree'
map <D-Bslash> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore=[
      \ '\.jpg$', '\.png$', '\.gif$', '\.ttf$', '\.log$', '\.pdf$',
      \ 'log[[dir]]', 'tmp[[dir]]', 'doc[[dir]]', 'tags[[file]]', 'pdf_images[[dir]]',
      \ 'drdiffs[[dir]]'
      \]

NeoBundle 't9md/vim-smalls'
NeoBundle 't9md/vim-quickhl'
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)

" SplitJoin ------------------------------------------------------------------------------------{{{
NeoBundle 'shemerey/splitjoin.vim'
let g:splitjoin_align = 1
let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
let g:splitjoin_normalize_whitespace = 1

nnoremap <Leader>j :SplitjoinJoin<cr>
nnoremap <Leader>s :SplitjoinSplit<cr>
"}}}

" Undo Quit like google chrome do --------------------------------------------------------------{{{
NeoBundle "https://github.com/AndrewRadev/undoquit.vim"
map <leader>q :quit<CR>
map <D-T> <Esc>:Undoquit<CR>
"}}}

NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'SirVer/ultisnips'
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" JS
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'groenewege/vim-less'

" Text Objects ---------------------------------------------------------------------------------{{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'saihoooooooo/vim-textobj-space'
NeoBundle 'Julian/vim-textobj-variable-segment'
NeoBundle 'kana/vim-textobj-fold'
"}}}



" Git ------------------------------------------------------------------------------------------{{{
set diffopt+=iwhite                                    " Add ignorance of whitespace to diff
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
"}}}

" Ctrlp Fuzzy Search ---------------------------------------------------------------------------{{{
NeoBundle 'kien/ctrlp.vim', {'depends': [
      \ 'shemerey/ctrlp-rails.vim',
      \ 'mattn/ctrlp-mark',
      \ 'ivalkeen/vim-ctrlp-tjump'
      \ ]}

	" Custom settings {{{
	let g:ctrlp_map = '<D-O>'
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_reuse_window = 'startify'
	let g:ctrlp_match_window = 'top,order:ttb,min:10,max:20'
	let g:ctrlp_use_caching         = 1       " enable caching
	let g:ctrlp_clear_cache_on_exit = 0       " speed up by not removing clearing cache aver time
	let g:ctrlp_open_multiple_files = 'i'     " Open all files in a hidden buffers
	"}}}

	" Ctrlp mappings {{{
	nnoremap <C-]> :CtrlPtjump<cr>
	let g:ctrlp_tjump_only_silent = 1
	autocmd FileType ruby,eruby nnoremap <silent> <buffer> <C-]> :call ctrlp#tjump#exec(RubyCursorIdentifier())<CR>

	nnoremap <D-B> :CtrlPBuffer<cr>
	nnoremap <D-M> :CtrlPModels<cr>
	nnoremap <D-C> :CtrlPControllers<cr>
	nnoremap <D-V> :CtrlPViews<cr>
	nnoremap <D-L> :CtrlPLibs<cr>
	nnoremap <D-S> :CtrlPSpecs<cr>
	nnoremap <D-R> :CtrlPRelated<cr>
	nnoremap <D-r> :CtrlPBufTag<cr>
	"}}}

	" Ignore files from completion -------------------------------------------------------------{{{
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\.git$\|\.hg$\|\.svn$\|spec\/vcr|node_modules$\|vendor$\|.*cache$\|bin$\|db\/sphinx$\|log$',
				\ 'file': '\.exe$\|\.so$\|u.keep$\|\.dll$\|\.doc$\|tags$' }

	set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
	set wildignore+=*.png,*.jpg,*.gif,*.eof,*.ttf,*.svg,*.eot,*.woff
	set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,.keep
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/node_modules/*
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*.log
	set wildignore+=*DS_Store*,*vim/backups*,*sass-cache*
	set wildignore+=log/**,tmp/**,vendor/cache/**,vendor/rails/**,node_modules/**
	"}}}
"}}}

" Searching ------------------------------------------------------------------------------------{{{
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter

" Visual * - Search for selected text * = next # = prev
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
      \:set hls<CR>

vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
      \:set hls<CR>
" }}}

" Toggle search highlighting
nmap <leader><space> :set hlsearch!<CR>

  "{{{ Ack Search------------------------------------------------------------------------------------
  NeoBundle 'rking/ag.vim'
  let g:agprg="/usr/local/bin/ag --column --smart-case"
  let g:ag_lhandler="silent copen | only "
  let g:ag_qhandler="silent copen | only "

  function! OpenQuickFix()
    if getqflist() != []
      copen | only
      normal zz
    endif
  endfunction

  augroup AckGrepGroup
    autocmd!
    autocmd FileType qf exec "nnoremap <silent> <buffer> <CR> <CR>zz :silent only<CR>"
    autocmd FileType qf exec "nnoremap <silent> <buffer> <D-l> :e#<CR> zz"
    autocmd FileType qf setlocal cursorline
    " autocmd QuickfixCmdPost * call OpenQuickFix()
  augroup END

  nmap <script> <silent> <D-l> :call OpenQuickFix()<CR>
  nmap <D-f> :Ag!<Space>
  nmap <D-F> :AgFromSearch<Space>
  "}}}
"}}}

"----------------------------------------------------------------------------------------------------}}}
call neobundle#end()

" Smalls search --------------------------------------------------------------------------------{{{
nmap s <Plug>(smalls)
omap s <Plug>(smalls)
xmap s <Plug>(smalls)
let g:smalls_jump_keys='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let cli_table_custom = {
      \ "\<CR>": 'do_jump',
      \ }
call smalls#keyboard#cli#extend_table(cli_table_custom)
call smalls#keyboard#excursion#extend_table({";": '__UNMAP__'})
"}}}

"implement not foucessed splits shaddow color
"autocmd FocusLost * :colorscheme desert
"autocmd FocusGained * :colorscheme default

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" UI Settings ----------------------------------------------------------------------------------{{{
set guifont=Monaco\ for\ Powerline:h12  " Set Font size
colorscheme hybrid                      " Set colorscheme
set colorcolumn=110           "  Draw vertical line to avoid long line writing
set laststatus=2              "  Always show status line
set number                    "  Show line numbers
set synmaxcol=200

set t_Co=256                  "  terminal color support
set background=dark           "  Set default background

set pumheight=8               " The height of popup menu.

" Disable annoying stuff
let g:netrw_banner = 0
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let loaded_matchparen = 1         " I don't like it when the matching parens are automatically highlighted
let g:matchparen_insert_timeout=1 " potential lag fix

" Enable some useful stuff
runtime! macros/matchit.vim       " ruby dependency
runtime! ftplugin/man.vim         " Enable Man
"}}}

" Base AutoGroup -------------------------------------------------------------------------------{{{
augroup UserAutoGroup
  autocmd!
  " go back to previous position of cursor if any
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != 'qf' |
        \  exe 'normal! g`"zvzz' |
        \ endif

    " Automatically removing all trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufWritePre ruby,vim :retab

  " Rspec syntax detect
  autocmd BufReadPost *_spec.rb set filetype=rspec.ruby

  "Make Enter follow tags in helpfiles
  autocmd Filetype help nnoremap <buffer> <cr> <c-]>

  autocmd WinEnter * if (&filetype != 'exproject') | call <SID>EqulazeWindows(0) | endif

  autocmd WinEnter * silent! call matchdelete(999)
  autocmd WinLeave * silent! call matchadd("ShadeBuffer", '\_.*', 999, 999)

  " Delimate settings
  autocmd FileType html,markdown let b:delimitMate_quotes = "\" '"

  " Always start on first line of git commit message
  autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END
"}}}

" Base mappings --------------------------------------------------------------------------------{{{

" Wrap text
vmap Q gq
nmap Q gqap

"{{{ Emacs bindings for commandline and insert mode -----------------------------------------------

function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

" Jump by tags
nnoremap <BS> <C-o>
vnoremap <BS> <C-o>

nnoremap <CR> <C-]>
vnoremap <CR> <C-]>

" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <M-b> <C-o>b
imap <M-f> <C-o>e<Right>
imap <C-d> <Del>
imap <C-h> <BS>
imap <M-d> <C-o>de

inoremap <D-[> <left>
inoremap <D-]> <right>

inoremap <D-}> <C-o>w
inoremap <D-{> <C-o>b

imap <M-h> <C-w>

" command line mode
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <M-b> <S-Left>
cmap <M-f> <S-Right>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <M-d> <S-Right><C-w>
cnoremap <M-h> <C-w>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>
"}}}

map <F7> :set spell!<cr>
nnoremap <D-;> :set spell!<cr>
inoremap <D-;> :set spell!<cr>
vnoremap <D-;> :set spell!<cr>

" Toggle list characters
nnoremap <leader>L :set list!<cr>

" Toggle cursorline
set nocursorline " disable by default
nnoremap <leader>l :set cursorline!<cr>
vnoremap <leader>l :set cursorline!<cr>

noremap  <silent> <D-d> :!open dict://<cword><CR><CR>
inoremap <silent> <D-d> :!open dict://<cword><CR><CR>
vnoremap <silent> <D-d> :!open dict://<cword><CR><CR>

" Highlight Group(s)
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> [I [I:let nr = input("Item: ")<Bar>if nr != ''<Bar>exe "normal " . nr ."[\t zzzv"<Bar>endif<CR>

vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
"}}}

