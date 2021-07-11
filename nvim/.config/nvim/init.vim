set mouse=a
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vim/vimrc

let g:startify_enable_special      = 0
let g:startify_files_number        = 10
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_delete_buffers = 1

hi! link StartifyHeader Title
hi! link StartifyFile Directory
hi! link StartifyPath LineNr
hi! link StartifySlash StartifyPath
hi! link StartifyBracket StartifyPath
hi! link StartifyNumber Title
