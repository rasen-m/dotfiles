" [ /* vundle ]
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'

" Template languages
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'

" Javascript
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" C#
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'

" General programming usage
Plugin 'Shougo/neocomplete.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'

Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()
" [ */ vundle ]

" [ /* syntax highlighting and enable filetype stuff ]
syntax enable
filetype plugin indent on
" [ */ syntax highlighting and enable filetype stuff ]

" [ /* syntastic ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1 
let g:syntastic_auto_jump = 0
let g:syntastic_javascript_checkers = ['jsl']
let b:syntastic_skip_checks = 0
" [ */ syntastic ]

" [ /* omnisharp ]
filetype plugin on
set omnifunc=syntaxcomplete#Complete

augroup omnisharp_commands
	autocmd!

	"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
	"autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	" Synchronous build (blocks Vim)
	"autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
	" Builds can also run asynchronously with vim-dispatch installed
	" autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
	" automatic syntax check on events (TextChanged requires Vim 7.4)
	" autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

	" Automatically add new cs files to the nearest project on save
	autocmd BufWritePost *.cs call OmniSharp#AddToProject()

	"show type information automatically when the cursor stops moving
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	"The following commands are contextual, based on the current cursor position.

	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
	autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
	"finds members in the current buffer
	autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
	" cursor can be anywhere on the line containing an issue
	autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
	autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
	autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
	"navigate up by method/property/field
	autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
	"navigate down by method/property/field
	autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END
" [ */ omnisharp ]

" [ /* airline]
set laststatus=2
" [ */ airline]

" [ /* rainbow_parentheses ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" [ */ rainbow_parentheses ]

" [ /* neocomplete ]
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
		\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" [ */ neocomplete ]

" [ /* solarized ]
set t_Co=16
set background=dark
colorscheme solarized
" [ */ solarized ]

" [ /* vim-indent-guides ]
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" [ */ vim-indent-guides ]

" [ /* tabbing and indentation ]
"set autoindent        " carry indent over to new lines
set cindent           " c style indent, might conflict with filetype indent
set shiftwidth=2      " two spaces per indent
set tabstop=2         " number of spaces per tab when viewing
set softtabstop=2     " number of spaces per tab when inserting
set expandtab         " sub spaces for tabs
set smarttab          " make tab key obey indent rules specified above
" [ */ tabbing and indentation ]

" [ /* nerdcommenter settings ]
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
" [ */ nerdcommenter settings ]

" [ /* othree/javascript-libraries-syntax.vim ]
let g:used_javascript_libs='underscore,jquery,angularjs,angularui,angularuirouterreact,flux,requirejs,handlebars'
" [ */ othree/javascript-libraries-syntax.vim ]

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
nnoremap y "+y
vnoremap y "+y

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" K to split line
nnoremap K i<CR><Esc>

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
set encoding=utf-8
set history=50
set hlsearch
set incsearch
set cursorline

" Font
" Terminal will handle their own fonts
set guifont=Monospace\ 14

" Stop adding end-of-file newline char
set binary

" Display line number at the side
set number
set numberwidth=1

" Remove auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Display incomplete commands
set showcmd

" Matching parenthesis
" hi MatchParen cterm=bold ctermbg=red ctermfg=white
" [ */ vim settings ]

" [ /* jsx settings  ]
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" [ */ jsx settings  ]

" [ /* auto on/off paste mode ]
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
" [ */ auto on/off paste mode ]
