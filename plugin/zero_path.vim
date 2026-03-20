if exists('g:loaded_zero_path')
    finish
endif
let g:loaded_zero_path = 1

command! -bang CopyPath            call zero#path#CopyPath(<bang>0)
command! -bang CopyFullPath        call zero#path#CopyFullPath(<bang>0)
command! -bang CopyAbsolutePath    call zero#path#CopyAbsolutePath(<bang>0)
command!       CopyDirPath         call zero#path#CopyDirPath()
command!       CopyFullDirPath     call zero#path#CopyFullDirPath()
command!       CopyAbsoluteDirPath call zero#path#CopyAbsoluteDirPath()

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
