" Convert ruby hashes to 1.9 style -------------------------------------------------------------{{{
  " map <F4> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>
  let vimrubocop_config='~/.vim/rubocop.yml'

  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd BufNewFile,BufRead *.json set ft=javascript

  autocmd FileType haml                   setlocal foldmethod=indent
  autocmd FileType eruby,yaml,ruby        setlocal ai et sta sw=2 sts=2
  autocmd FileType ruby,eruby             let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby             let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby,eruby             let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby             let g:rubycomplete_include_object = 1
  autocmd FileType ruby,eruby             let g:rubycomplete_include_objectspace = 1
  autocmd FileType ruby let b:dispatch = 'spec %'


"}}}
