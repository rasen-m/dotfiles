" [ <<< vundle ]
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xsbeats/vim-blade'
Plugin 'Yggdroot/indentLine'
call vundle#end()

filetype plugin indent on
set number
syntax enable
set background=dark
" let g:solarized_termcolors = 256
colorscheme solarized
set t_Co=16
" [ >>> vundle ]

" [ <<< window default ]
set lines=49 columns=85
set guifont=Monospace\ 14
" [ >>> window default ]

" [ <<< folding ]
set foldmethod=marker
set foldmarker=<<<,>>>
" [ >>> folding ]

" [ <<< commands and mappings ]
function! NerdTreeToggle()
    NERDTreeToggle
    wincmd p
    q
endfunction

nmap G Gzz
nmap } }zz
nmap { {zz
map <F5> :NERDTreeToggle<CR>
map <F6> :call NerdTreeToggle()<CR>

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" set autochdir
" map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

command Q q
command WQ wq
command Wq wq
command W w
" [ >>> commands and mappings ]

" [ <<< vim settings ]
" Remove auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if has("vms")
    " Do not keep a backup file, use versions instead
    set nobackup		
else
    " Keep a backup file
    set backup		
endif

set backupdir=~/.vimtmp
set directory=~/.vimtmp

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Display line number at the side
set number

set encoding=utf-8

" always display statusline :help statusline
set laststatus=2

" add full file path to existing statusline
set statusline=%F\ \ %=%l,%c\ (%p%%)
" [ >>> vim settings ]

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set cindent
set nohlsearch
let html_no_rendering=1

set numberwidth=1
set incsearch		" do incremental searching
highlight LineNr term=bold cterm=NONE ctermfg=232 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:let loaded_matchparen = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 100 characters.
        autocmd FileType text setlocal textwidth=100

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else


endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
