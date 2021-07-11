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

function! s:lsGitDir()
    let files = systemlist('getfolders -f ~/.gitlabs/')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:lsCwd()
    let files = systemlist('find . -maxdepth 1 -not -path "*/\.*" -type f | sed "s/^.\///" 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
    \ { 'type': 'files',                      'header': ['   Recent files']},
    \ { 'type': function('s:lsCwd'),          'header': ['   Current Directory: ']},
    \ { 'type': 'bookmarks',                  'header': ['   Bookmarks']},
    \ { 'type': function('s:lsGitDir'),       'header': ['   Git projects']},
    \ { 'type': 'sessions',                   'header': ['   Sessions']},
    \ ]

let g:startify_bookmarks = [
    \ { 'D': '~/documents/' },
    \ { 'c': '~/.config' },
    \ { 'd': '~/downloads/' },
    \ { 'n': '~/.config/nvim/init.vim' },
    \ { 'v': '~/.vim/vimrc' },
    \ ]

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ }

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
