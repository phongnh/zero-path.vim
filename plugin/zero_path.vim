" plugin/zero_path.vim - Copy path commands (Vim9script)
" Maintainer:   Phong Nguyen

if !has('vim9script') || has('nvim') || exists('g:loaded_zero_path')
    finish
endif

vim9script

g:loaded_zero_path = 1

import autoload 'zero_path.vim' as ZeroPath

# Commands
command! -bang CopyPath            ZeroPath.CopyPath(<bang>0)
command! -bang CopyFullPath        ZeroPath.CopyFullPath(<bang>0)
command! -bang CopyAbsolutePath    ZeroPath.CopyAbsolutePath(<bang>0)
command!       CopyDirPath         ZeroPath.CopyDirPath()
command!       CopyFullDirPath     ZeroPath.CopyFullDirPath()
command!       CopyAbsoluteDirPath ZeroPath.CopyAbsoluteDirPath()

# Mappings
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
