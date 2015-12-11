" [ /* vundle ]
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Yggdroot/indentLine'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'maciakl/vim-neatstatus'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'xsbeats/vim-blade'
"Plugin 'othree/html5.vim'
call vundle#end()
" [ */ vundle ]

" [ /* syntax highlighting and enable filetype stuff ]
syntax enable
filetype plugin indent on
" [ */ syntax highlighting and enable filetype stuff ]

" [ /* solarized ]
set t_Co=16
set background=dark
colorscheme solarized
" [ */ solarized ]

" [ /* tabbing and indentation ]
set autoindent        " carry indent over to new lines
set shiftwidth=2      " two spaces per indent
set tabstop=2         " number of spaces per tab when viewing
set softtabstop=2     " number of spaces per tab when inserting
set expandtab         " sub spaces for tabs
set smarttab          " make tab key obey indent rules specified above
" [ */ tabbing and indentation ]

" [ /* othree/javascript-libraries-syntax.vim ]
let g:used_javascript_libs='underscore,jquery,angularjs,angularui'
" [ */ othree/javascript-libraries-syntax.vim ]

" [ /* window default ]
set lines=49 columns=85
set guifont=Monospace\ 14
" [ */ window default ]

" [ /* folding ]
set foldmethod=marker
set foldmarker=/*,*/
" [ */ folding ]

" [ /* commands and mappings ]
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

command Q q
command WQ wq
command Wq wq
command W w
" [ */ commands and mappings ]

" [ /* backup settings  ]
if has("vms")
    " Do not keep a backup file, use versions instead
    set nobackup		
else
    " Keep a backup file
    set backup		
endif

set backupdir=~/.vimtmp
set directory=~/.vimtmp
" [ */ backup settings  ]

" [ /* vim settings ]
" Keep 50 lines of command line history
set history=50

" Display line number at the side
set number
set numberwidth=1

" [ */ vim settings ]

" [ /* jsx settings  ]
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" [ */ jsx settings  ]

" .............................................

" Remove auto commenting
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"    set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
"if &t_Co > 2 || has("gui_running")
"    syntax on
"endif

" Display incomplete commands
"set showcmd

" set omni completion
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

"set encoding=utf-8
"set smartindent
"set expandtab
"set cindent
"set nohlsearch
"let html_no_rendering=1

"set incsearch		" do incremental searching
"highlight LineNr term=bold cterm=NONE ctermfg=232 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
":let loaded_matchparen = 1
