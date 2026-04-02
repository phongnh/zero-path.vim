" plugin/zero_path.vim - Copy path commands (legacy Vimscript)
" Maintainer:   Phong Nguyen
" Version:      1.0.0

if has('nvim') || exists('g:loaded_zero_path')
    finish
endif

" Use Vim9script implementation if available, otherwise fall back to legacy
if has('vim9script')
    " Add vim9/ subdirectory to runtimepath so vim9/autoload/zero_path.vim
    " is found when the Vim9script plugin sources it via 'import autoload'
    let s:vim9dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') .. '/vim9'
    if &runtimepath !~# s:vim9dir
        execute 'set runtimepath^=' . fnameescape(s:vim9dir)
    endif
    unlet! s:vim9dir
    source <sfile>:p:h:h/vim9/plugin/zero_path.vim
    finish
endif

let g:loaded_zero_path = 1

" Save cpoptions
let s:save_cpo = &cpoptions
set cpoptions&vim

" Commands
command! -bang CopyPath            call zero_path#copy_path(<bang>0)
command! -bang CopyFullPath        call zero_path#copy_full_path(<bang>0)
command! -bang CopyAbsolutePath    call zero_path#copy_absolute_path(<bang>0)
command!       CopyDirPath         call zero_path#copy_dir_path()
command!       CopyFullDirPath     call zero_path#copy_full_dir_path()
command!       CopyAbsoluteDirPath call zero_path#copy_absolute_dir_path()

" Mappings
if get(g:, 'zero_path_mappings', 1)
    nnoremap <silent> yc :CopyPath<CR>
    nnoremap <silent> yC :CopyPath!<CR>
    nnoremap <silent> yp :CopyFullPath<CR>
    nnoremap <silent> yP :CopyFullPath!<CR>
    nnoremap <silent> yu :CopyAbsolutePath<CR>
    nnoremap <silent> yU :CopyAbsolutePath!<CR>
    nnoremap <silent> y. :CopyDirPath<CR>
    nnoremap <silent> yd :CopyFullDirPath<CR>
    nnoremap <silent> yD :CopyAbsoluteDirPath<CR>
endif

" Restore cpoptions
let &cpoptions = s:save_cpo
unlet s:save_cpo
