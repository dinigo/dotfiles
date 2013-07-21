call pathogen#infect()
set number
set ignorecase 
set smartcase
set title
set autoindent
set smartindent
set sw=4
set scrolloff=3
set ruler
" Intuitive backspacing in insert mode
set backspace=indent,eol,start
" Highlights the current line
" only in the current window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" File-type highlighting and configuration.
" Run :filetype (without args) to see what yo sure.
syntax on
filetype on
filetype plugin on
filetype indent on

set nohlsearch		" Don't continue to highlight searched phrases.
set incsearch		" But do highlight as you type your search.
set ignorecase		" Make searches case-insensitive.
set ruler		" Always show info along bottom.
set visualbell 		"instead of audible one
set wildmode=list:longest,full " you can also toggle through the matches by tab
set confirm		" use confirm instead of aborting an action
set autochdir 		" current directory is always matching the content of the active window

" remember some stuff after quiting vim:
" marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" use console dialogs instead of popup  dialogs for simple choices
set guioptions+=c
" Hide the mouse pointer while typing
set mousehide
" Auto-backup files and .swp files don't go to pwd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" remapr leader key to ','
let mapleader = ","
" finds if/else and other clauses in many languages
runtime macros/matchit.vim
" scroll with mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
" show or hide tagbar 
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
" Gives tagbar format
let g:tagbar_indent = 3
let g:tagbar_singleclick = 1
" Error detection with Syntastic
"let g:syntastic_check_on_open=1
"let g:syntastic_python_checker="flake8"

""""""""""
" COLORS "
""""""""""
" Uses color scheme with higher contrast for dark
set background=dark
" colours for line numbers and so
highlight LineNr ctermfg=white ctermbg=234 
" colours for the current line
highlight CursorLine cterm=NONE ctermbg=233  
" Removes window separator color
set fillchars+=vert:\ 
" removes ESC key delamoves ESC key delay
set timeoutlen=1000 ttimeoutlen=0
" shows status bar
set laststatus=2
"set statusline=%<\ %f\ %{fugitive#statusline()}
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256
let g:Powerline_symbols = 'fancy'

""""""""""""
" NERDtree "
""""""""""""
" automatic opens NerdTree at start 
autocmd vimenter * if !argc() | NERDTree | endif
" changes to edit window after opening NERDtree
autocmd VimEnter * wincmd p
" closes vim if NERDtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" introduces a new mode, ESC + t pops NERDtree
function ToggleNERDTree()
    execute ":NERDTreeToggle"
endfunction
command -nargs=0 ToggleNERDTree :call ToggleNERDTree()
nmap <ESC>t :ToggleNERDTree<CR>

"""""""""""
" FOLDING "
"""""""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
