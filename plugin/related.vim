" Open/Create related spec/file
function! s:CreateRelated()
  let related = s:GetRelatedFile(expand('%'))
  call s:Open(related)
endfunction

" Return the related filename
function! s:GetRelatedFile(file)
  if match(a:file, '_spec\.rb$') != -1
    return substitute(substitute(a:file, "_spec.rb$", ".rb", ""), '^spec/', 'app/', '')
  else
    return substitute(substitute(a:file, ".rb$", "_spec.rb", ""), '^app/', 'spec/', '')
  endif
endfunction

" Open the related file in a vsplit
function! s:Open(file)
  exec('edit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()
