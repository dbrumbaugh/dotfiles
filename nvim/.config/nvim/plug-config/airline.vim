" enable tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''

" enable powerline fonts
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Always show tabs
set showtabline=2

" Display buffer number on tab line
let g:airline#extensions#tabline#buffer_nr_show = 1

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" coc-git configuration

function! s:update_git_status()
"  let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
  let g:airline_section_b = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}"

autocmd User CocGitStatusChange call s:update_git_status()
