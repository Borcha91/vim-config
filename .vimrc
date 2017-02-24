" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

syntax on
" and show line numbers
set number

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread         

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" no bells
set noerrorbells
set vb t_vb=
autocmd GUIEnter * set vb t_vb=

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" set our desired autocompletion
set complete=.,w,b,u

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw
" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
nmap <Leader>ev :tabedit $MYVIMRC
nmap <Leader>es :e ~/.vim/snippets/

" ---------------------- Split Manager ----------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" H K L J should move the cursor
noremap J <C-d>
noremap K <C-U>
noremap H ^
noremap L g$

" Enter to insert commands
noremap <CR> :

" Merge
noremap M J

" To be consistent with ge and gE
noremap gw b
noremap gW B

" Redo
nnoremap U <C-r>


" ---------------------- Split Manager ----------------------
" ---------------------- NERDTREE      ----------------------
nmap <leader>t :NERDTreeToggle<cr>
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end


" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>

" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set autoindent      " autoindent based on line above, works most of the time
set tabstop=4 expandtab shiftwidth=4

" no lines longer than 80 cols
set textwidth=80

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>

" if windows...
if has('win32')
    " start maximized
    autocmd GUIEnter * simalt ~x
    " also use .vim instead of vimfiles, make sure to run the following command
    " once this was copied to /Users/<user>/.vim
    "  mklink %homepath%/.vimrc %homepath%/.vim/.vimrc
    let &runtimepath.=',$HOME/.vim'
endif

" Visual
set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
highlight ColorColumn ctermbg=lightgray guibg=lightgray
syntax enable

" Enable 256 colors on gnome-terinal
set t_Co=256

" select all mapping
noremap <leader>a ggVG

" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin defintion
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'     
Plugin 'mhinz/vim-startify'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
" This plugin worked way back but now it slows the hell down vim
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'

" Autocomplete & Snippets 
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" PHP automatic doc generation
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

" -- php
Plugin 'StanAngeloff/php.vim'     
Plugin 'arnaud-lb/vim-php-namespace'     
Plugin 'joonty/vdebug'

" GO
Plugin 'fatih/vim-go'

" Syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'mattn/emmet-vim'            

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'

" end plugin definition
call vundle#end()            " required for vundle

" colorscheme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'
if has("gui_running")
    colorscheme atom-dark
endif

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" ---------------------- Plugins ----------------------
"  CTRLP
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'laravel'

" Syntastic

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd', 'phplint']
nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>se :Errors<CR>
let g:ctrlp_show_hidden = 1

" Sane ignore for ctrlp
set wildignore+=*\\build\\**,*\\docs\\**

nmap <leader>cpc :CtrlPClearCache<CR>

" Key timeout
set timeoutlen=1000 ttimeoutlen=0

" php doc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" ultisnip conf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" enable omni-completion for Ruby and PHP
    " call neocomplete#util#set_default_dictionary(
    "       \'g:neocomplete#sources#omni#input_patterns', 'ruby',
    "       \'[^. *\t]\.\h\w*\|\h\w*::\w*')
    " call neocomplete#util#set_default_dictionary(
    "       \'g:neocomplete#sources#omni#input_patterns',
    "       \'php',
    "       \'[^. \t]->\h\w*\|\h\w*::\w*')

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Remapped blade files to html
autocmd BufNewFile,BufRead *.blade.php setlocal ft=html

" Files syntax
autocmd BufNewFile,BufRead *.vue setlocal ft=vue

" Use ag with ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" Workaround multiplecursor with neocomplete
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction

