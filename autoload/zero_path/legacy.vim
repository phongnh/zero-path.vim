" autoload/zero_path/legacy.vim - Core functionality (legacy Vimscript version)
" Maintainer:   Phong Nguyen
" Version:      1.0.0

" ============================================================================
" Helper Functions
" ============================================================================

function! s:copy(path) abort
    let @" = a:path
    if has('clipboard')
        let [@*, @+] = [@", @"]
    endif
    echo 'Copied:' @"
endfunction

function! s:expand_path(path, line_number) abort
    let l:result = expand(a:path)
    if a:line_number
        let l:result .= ':' . line('.')
    endif
    return l:result
endfunction

function! s:copy_path(path, line_number) abort
    call s:copy(s:expand_path(a:path, a:line_number))
endfunction

function! s:copy_dir_path(path) abort
    let l:result = s:expand_path(a:path, 0)
    if l:result == '.'
        let l:result = fnamemodify(getcwd(), ':t')
    endif
    call s:copy(l:result)
endfunction

" ============================================================================
" Public Functions
" ============================================================================

function! zero_path#legacy#copy_path(line_number) abort
    call s:copy_path('%:~:.', a:line_number)
endfunction

function! zero_path#legacy#copy_full_path(line_number) abort
    call s:copy_path('%:p:~', a:line_number)
endfunction

function! zero_path#legacy#copy_absolute_path(line_number) abort
    call s:copy_path('%:p', a:line_number)
endfunction

function! zero_path#legacy#copy_dir_path() abort
    call s:copy_dir_path('%:p:.:h')
endfunction

function! zero_path#legacy#copy_full_dir_path() abort
    call s:copy_dir_path('%:p:~:h')
endfunction

function! zero_path#legacy#copy_absolute_dir_path() abort
    call s:copy_dir_path('%:p:h')
endfunction
