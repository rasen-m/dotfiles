" < vundle>
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xsbeats/vim-blade'

call vundle#end()
filetype plugin indent on
" </vundle>
 
" <color scheme>
syntax enable
set background=dark
colorscheme solarized
set t_Co=16
" </color scheme>

" <mapping>
nmap G Gzz
nmap } }zz
nmap { {zz
map <F5> :NERDTreeToggle<CR>

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" </mapping>

" remove auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" some indentation options
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set cindent
set nohlsearch
set encoding=utf-8
let html_no_rendering=1
set backupdir=~/.vimtmp
set directory=~/.vimtmp

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number      " display line number at the side
set numberwidth=1
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
highlight LineNr term=bold cterm=NONE ctermfg=232 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:let loaded_matchparen = 1

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

:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq       

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

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

