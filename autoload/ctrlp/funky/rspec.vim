" Language: Ruby (rspec)
" Author: pasela
" License: The MIT License

" ctrlp-funky-rspec provides filters for RSpec. It only provides 'describe'
" block by default. You can enable more blocks by options.
"
"
" g:ctrlp_funky_rspec_examples (default: 0)
"
"   Include/Exclude examples such as 'it', 'its', 'specify', ...
"
" g:ctrlp_funky_rspec_shared_examples (default: 0)
"
"   Include/Exclude shared examples such as 'shared_examples', 'include_examples', ...
"
" g:ctrlp_funky_rspec_contexts (default: 0)
"
"   Include/Exclude 'context'.
"
" g:ctrlp_funky_rspec_shared_contexts (default: 0)
"
"   Include/Exclude shared contexts such as 'shared_context' and 'include_context'.
"
" g:ctrlp_funky_rspec_hooks (default: 0)
"
"   Include/Exclude hooks such as 'before', 'after' and 'around'.
"
" g:ctrlp_funky_rspec_let_subject (default: 0)
"
"   Include/Exclude 'let' and 'subject'.
"
" g:ctrlp_funky_rspec_capybara (default: 0)
"
"   Include/Exclude capybara keywords such as 'feature', 'scenario', ...
"
" g:ctrlp_funky_rspec_custom_keywords (default: [])
"
"   Include custom keywords such as user defined aliases.

" RSpec describe "{{{
let s:rspec_describes = [
      \ 'describe',
\ ] "}}}

" RSpec examples "{{{
let s:rspec_examples = [
      \ 'it',
      \ 'its',
      \ 'xit',
      \ 'specify',
      \ 'xspecify',
      \ 'example',
      \ 'xexample',
\ ] "}}}

" RSpec example groups "{{{
let s:rspec_shared_examples = [
      \ 'shared_examples',
      \ 'include_examples',
      \ 'it_behaves_like',
      \ 'it_should_behave_like',
\ ] "}}}

" RSpec contexts "{{{
let s:rspec_contexts = [
      \ 'context',
\ ] "}}}

" RSpec shared contexts "{{{
let s:rspec_shared_contexts = [
      \ 'shared_context',
      \ 'include_context',
\ ] "}}}

" RSpec hooks "{{{
let s:rspec_hooks = [
      \ 'before',
      \ 'after',
      \ 'around',
\ ] "}}}

" RSpec let and subject "{{{
let s:rspec_let_subject = [
      \ 'let',
      \ 'let!',
      \ 'subject',
\ ] "}}}

" RSpec capybara "{{{
let s:rspec_capybara = [
      \ 'feature',
      \ 'scenario',
      \ 'xscenario',
      \ 'background',
      \ 'given',
      \ 'given!',
\ ] "}}}

let s:keywords = copy(s:rspec_describes)

if get(g:, 'ctrlp_funky_rspec_examples', 0)
  call extend(s:keywords, s:rspec_examples)
endif

if get(g:, 'ctrlp_funky_rspec_shared_examples', 0)
  call extend(s:keywords, s:rspec_shared_examples)
endif

if get(g:, 'ctrlp_funky_rspec_contexts', 0)
  call extend(s:keywords, s:rspec_contexts)
endif

if get(g:, 'ctrlp_funky_rspec_shared_contexts', 0)
  call extend(s:keywords, s:rspec_shared_contexts)
endif

if get(g:, 'ctrlp_funky_rspec_hooks', 0)
  call extend(s:keywords, s:rspec_hooks)
endif

if get(g:, 'ctrlp_funky_rspec_let_subject', 0)
  call extend(s:keywords, s:rspec_let_subject)
endif

if get(g:, 'ctrlp_funky_rspec_capybara', 0)
  call extend(s:keywords, s:rspec_capybara)
endif

" custome keywords
call extend(s:keywords, get(g:, 'ctrlp_funky_rspec_custom_keywords', []))

let s:filter = [{ 'pattern': '\m\C^[\t ]*\('.join(s:keywords, '\|').'\)\(([^)]*)\)\?[\t ]\+\S\+',
                \ 'filter': ['\m\C^[\t ]*', '', 'g']}]

function! ctrlp#funky#rspec#apply_filter(bufnr)
  return ctrlp#funky#abstract(a:bufnr, s:filter)
endfunction

function! ctrlp#funky#rspec#get_filter()
  return s:filter
endfunction

" vim: fdm=marker
