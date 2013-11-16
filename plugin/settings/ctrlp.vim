let g:ctrlp_map = '<D-O>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching         = 1       " enable caching
let g:ctrlp_clear_cache_on_exit = 0       " speed up by not removing clearing cache evertime
let g:ctrlp_match_window = 'top,order:ttb,min:15,max:15'

let g:ctrlp_funky_rspec_examples=1    "Include/Exclude examples such as 'it', 'its', 'specify', ...
let g:ctrlp_funky_rspec_contexts=1    "Include/Exclude 'context'.
let g:ctrlp_funky_rspec_let_subject=1 "Include/Exclude 'let' and 'subject'.

" Ignore files from complition -------------------------------------------------------------{{{
set wildmenu                                        "show list for autocomplete
set wildmode=list:longest:full                      "priority for tab completion
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.eof,*.ttf,*.svg,*.eot,*.woff
"}}}

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|vendor$\|.*cache$\|bin$\|db\/sphinx$\|log$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.doc$\|tags$' }

" \ { 'pattern': '\m\C^[\t ]*def[\t ]\+\S\+',
" \ { 'pattern': '\m\C^[\t ]*def[^(]*',
function! ctrlp#funky#ruby#filters()
  let filters = [
        \ { 'pattern': '\m\C^[\t ]*def [^(]\+',
        \   'formatter': ['\m\C^[\t ]*def', '', '']}
        \ ]
  return filters
endfunction


" Ctrlp mappings {{{
nnoremap <c-]> :CtrlPtjump<cr>
autocmd FileType ruby,eruby nnoremap <silent> <buffer> <C-]> :call ctrlp#tjump#exec(RubyCursorIdentifier())<CR>

nnoremap <D-B> :CtrlPBuffer<cr>
nnoremap <D-M> :CtrlPModels<cr>
nnoremap <D-C> :CtrlPControllers<cr>
nnoremap <D-V> :CtrlPViews<cr>
nnoremap <D-R> :CtrlPBufTag<cr>
