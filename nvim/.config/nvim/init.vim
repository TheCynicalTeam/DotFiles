set mouse=a
"Font stuff
let g:Guifont="remixicon:h10"
let g:Guifont="Source\ Code\ Pro:h10"

" General
set encoding=UTF-8
syntax on                           " show syntax highlighting
set relativenumber                  " Show line numbers
set number                          " Set line numbers
set linebreak	                    " Break lines at word (requires Wrap lines)
set showbreak=+++	                " Wrap-broken line prefix
set textwidth=0	                    " Line wrap (number of cols)
set showmatch	                    " Highlight matching brace
" set spell	                        " Enable spell-checking
set visualbell	                    " Use visual bell (no beeping)

set smartcase	                    " Enable smart-case search
set gdefault	                    " Always substitute all matches in a line
set ignorecase	                    " Always case-insensitive
set incsearch	                    " Searches for strings incrementally
set nohlsearch                      " No longer highlight searches

set autoindent	                    " Auto-indent new lines
set cindent	                        " Use 'C' style program indenting
set expandtab	                    " Use spaces instead of tabs
set shiftwidth=4	                " Number of auto-indent spaces
set smartindent	                    " Enable smart-indent
set smarttab	                    " Enable smart-tabs
set tabstop=4	                    " Number of spaces per Tab
set softtabstop=4	                " Number of spaces per Tab

" Advanced
set confirm	                        " Prompt confirmation dialogs
set ruler	                        " Show row and column ruler information
set noshowmode
set noruler
set noshowcmd
set cmdheight=1
set nowrap
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes

set undolevels=1000	                " Number of undo levels
set backspace=indent,eol,start	    " Backspace behaviour

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'name': 'dracula' }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'ap/vim-css-color'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim'
"Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mhinz/vim-startify'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call plug#end()             " required

filetype plugin indent on   " required
colorscheme dracula
set background=dark

if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0

source $VIMRUNTIME/mswin.vim
behave mswin

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


let s:header = [
      \ '                                                               ',
      \ '        _   ___     _____ __  __          ___   ____   ___     ',
      \ '       | \ | \ \   / /_ _|  \/  | __   __/ _ \ | ___| / _ \    ',
      \ '       |  \| |\ \ / / | || |\/| | \ \ / / | | ||___ \| | | |   ',
      \ '       | |\  | \ V /  | || |  | |  \ V /| |_| | ___) | |_| |   ',
      \ '       |_| \_|  \_/  |___|_|  |_|   \_/  \___(_)____(_)___/    ',
      \ '                                                               ',
      \ '              [ Think NeoVim   Author:The-Repo-Club ]          ',
      \ ]

let s:footer = [
    \ '         +-----------------------------------------------+',
    \ '         |                Think NeoVim ^_^               |',
    \ '         |       Talk is cheap Show me the code          |',
    \ '         |                                               |',
    \ '         |            Github:The-Repo-Club               |',
    \ '         +-----------------------------------------------+',
    \ ]

function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(s:header)
let g:startify_custom_footer = s:center(s:footer)

function! s:lsGitDir()
    let files = systemlist('getfolders -a ~/.gitlabs/')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:lsAurDir()
    let files = systemlist('getfolders -a ~/.aur/')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:lsCwd()
    let files = systemlist('find . -maxdepth 1 -not -path "*/\.*" -type f | sed "s/^.\///" 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
    \ { 'type': 'bookmarks',                    'header': ['   Bookmarks']},
    "\ { 'type': 'commands',                     'header': ['   Commands']},
    \ { 'type': function('s:lsCwd'),            'header': ['   Current Directory: ']},
    \ { 'type': function('s:lsGitDir'),         'header': ['   Git projects']},
    \ { 'type': function('s:lsAurDir'),         'header': ['   AUR projects']},
    \ { 'type': 'sessions',                     'header': ['   Sessions']},
    \ { 'type': 'files',                        'header': ['   Recent files']},
    \ ]

let g:startify_bookmarks = [
    "\ { 'D': '~/documents/' },
    "\ { 'd': '~/downloads/' },
    \ { 'c': '~/.config' },
    \ { 'n': '~/.config/nvim/init.vim' },
    \ { 'e': '~/.config/nvim/plugin/lualine.lua' },
    \ ]

let g:startify_commands = [
        \ {'h': 'h ref'},
        \ ]

let g:lightline = {
    \ 'colorscheme': 'dracula',
    \ }

" set the leader key
let mapleader = " "

"set keybinds
nnoremap <leader>sw <cmd>vertical resize 175<cr>
nnoremap <leader>ss <cmd>Startify<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TheRepoClub
    autocmd!
    autocmd BufEnter * if !exists('b:has_been_entered') |
                \ vertical resize 175 | endif
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
